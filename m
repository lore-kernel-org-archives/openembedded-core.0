Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SRwEz-0002dE-D4
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 04:02:57 +0200
Received: by yhjj56 with SMTP id j56so1325080yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 18:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=cCbNW/D/9RUFH4t6qsvsuXQAGagAuFeiqOGjdrCVc1Y=;
	b=EmzDfOvCgL6KBr37pGAExh6z3nOca8lxGJa0GD7S0cG5XNS0g3OhhobDXXNCvtKkus
	bQYgqAg5glk8VruQ2bYpgHGnAKm6KQOPGExJ+aQGqT8BkbJ+ViKVqlXz+YW6esMzXJXa
	iwKlAp9N0p6q3T/LzfQQ/e6c5WvVZOmnnzedJ1OtAMWFpdnmzKforucWCAldKdrilAlr
	y8pdDQSssQgiwODd2jN8Sq/XDARexde+The4fDXR2BPUDQjEpZmN+4ghidzI5yqLK606
	6xqT2Oac+0MNeNb2tRctDHw8MyiaRzkiEb38d9B+3ohVdRydm+RvHXgdV3UPXmF+Vz6q
	51lA==
MIME-Version: 1.0
Received: by 10.50.158.227 with SMTP id wx3mr470133igb.31.1336528384499; Tue,
	08 May 2012 18:53:04 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Tue, 8 May 2012 18:53:04 -0700 (PDT)
In-Reply-To: <CAMKF1so-48aBWL7VytBmtuQt8rhdp6x05r8oJT5RZ3CB8cnrNQ@mail.gmail.com>
References: <cover.1336524034.git.raj.khem@gmail.com>
	<fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
	<CAF6bG8f21=Pcxjt3-pPemiBiF0TqPT2e8snxry_7VQWGa5BcNw@mail.gmail.com>
	<CAMKF1so-48aBWL7VytBmtuQt8rhdp6x05r8oJT5RZ3CB8cnrNQ@mail.gmail.com>
Date: Wed, 9 May 2012 04:53:04 +0300
Message-ID: <CAF6bG8fr9fMQjd4Gxt9uukj=UKDHUxyhmptTiZOM1EPeW8qcqQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
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
X-List-Received-Date: Wed, 09 May 2012 02:02:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 May 2012 04:36, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 8, 2012 at 5:59 PM, Marko Lindqvist <cazfi74@gmail.com> wrote=
:
>>
>>
>> =C2=A0You should know that I'm just figuring out what to do with
>> "rtld(GNU_HASH)" that already exist for eglibc. When building
>> deb-packets based image, that results in:
>> "reference to 'rtld': error in version: version number does not start
>> with digit"
>>
>> =C2=A0I've confirmed that error message is caused by this by simply
>> removing "(GNU_HASH)" -> eglibc build success
>
> yeah this is rpm brain damage actually that we are dealing with here.
> I think rpm should be fixed for this. I am not entirely sure why this
> would be needed on current OE-Core lets say if its needed it should then
> be made specific when someone is using rpm for packaging.

 I've not yet figured out what all this tries to achieve, but are you
saying that it might be acceptable solution for eglibc too to simply
remove "(GNU_HASH)" if nobody from rpm world vetoes such patch?


 - ML


