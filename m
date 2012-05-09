Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRwV4-0002zm-7S
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 04:19:34 +0200
Received: by eaae1 with SMTP id e1so1723953eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 19:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=9H7WuEhpRjBsXWWN2TzOWKCA1G8quxh04Q7T7B4Zdu4=;
	b=YpbNbsVSwTC/mUBX8DAOuceIrZ5n8DDSupeZJaUAJMjVdjzTbB1mQkeyysgaFBtVJK
	2860c4aG8WgUM2iNpJpv5rB1P8goeXwmzJlbkN8dgQcMnpX6RiXeeT0eIW8wVHJQIEu7
	fL3RixA4DydZz1/ZnJtwPVf6X1+a7Znc3Bt1NTLlAwiDA8FMgJS3c1LqFCOZsgVVb1/5
	D5012ARJXucj8EGD0Hr2P2m67aoOXqj+ntZFiW3WZBA2hirU1Nvhm8PtC7ug4451Ju9z
	u8IqzaSUkqSM9tl67ExImPjfdNo4JIOLp5ZLyrY4SNZuYLEGYtcWd280NxSoNmMpilTw
	DsRg==
Received: by 10.213.115.193 with SMTP id j1mr213994ebq.141.1336529382096; Tue,
	08 May 2012 19:09:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Tue, 8 May 2012 19:09:12 -0700 (PDT)
In-Reply-To: <CAF6bG8fr9fMQjd4Gxt9uukj=UKDHUxyhmptTiZOM1EPeW8qcqQ@mail.gmail.com>
References: <cover.1336524034.git.raj.khem@gmail.com>
	<fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
	<CAF6bG8f21=Pcxjt3-pPemiBiF0TqPT2e8snxry_7VQWGa5BcNw@mail.gmail.com>
	<CAMKF1so-48aBWL7VytBmtuQt8rhdp6x05r8oJT5RZ3CB8cnrNQ@mail.gmail.com>
	<CAF6bG8fr9fMQjd4Gxt9uukj=UKDHUxyhmptTiZOM1EPeW8qcqQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 May 2012 19:09:12 -0700
Message-ID: <CAMKF1sp0-We3JrGue+J-scDv0JCOHg5O44G9AZaPO3xfzNO2AQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] uclibc.inc: uclibc rtld does support GNU_HASH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 02:19:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 8, 2012 at 6:53 PM, Marko Lindqvist <cazfi74@gmail.com> wrote:
> On 9 May 2012 04:36, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, May 8, 2012 at 5:59 PM, Marko Lindqvist <cazfi74@gmail.com> wrot=
e:
>>>
>>>
>>> =C2=A0You should know that I'm just figuring out what to do with
>>> "rtld(GNU_HASH)" that already exist for eglibc. When building
>>> deb-packets based image, that results in:
>>> "reference to 'rtld': error in version: version number does not start
>>> with digit"
>>>
>>> =C2=A0I've confirmed that error message is caused by this by simply
>>> removing "(GNU_HASH)" -> eglibc build success
>>
>> yeah this is rpm brain damage actually that we are dealing with here.
>> I think rpm should be fixed for this. I am not entirely sure why this
>> would be needed on current OE-Core lets say if its needed it should then
>> be made specific when someone is using rpm for packaging.
>
> =C2=A0I've not yet figured out what all this tries to achieve, but are yo=
u
> saying that it might be acceptable solution for eglibc too to simply
> remove "(GNU_HASH)" if nobody from rpm world vetoes such patch?

yes. We need to find why this PROVIDE is needed at all in current OE


