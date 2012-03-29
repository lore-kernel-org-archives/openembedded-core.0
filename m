Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDHpi-0003xt-Df
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 18:04:18 +0200
Received: by qcso7 with SMTP id o7so1468621qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 08:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=NzBIPGcqz9oh9jxSPnxI3VeWBUrTCqbtxMY93aBjVR0=;
	b=lGUIeneqmvfiBmUPWb4KIC2ZS0UMYHkjBfOkIhPxQbMrODPSiRVlSi2yEwGaXtPm36
	4pj6OXmsfPQQUv1imgO3x0XS9EYBKtcM4PoLZWz3xT+IJnxhQfuhlgqlguok/jT79X1U
	WaKuI0oUc9I0IrLfaXWx5fF//rUOHGN3Uo6wkq1R4RybuvxMy0M2hJ+yU1hLO76G3Bs9
	qCpnCPTz1Z6ioDtVsPTa9V+VKemexJaVe6T/17OCTMv6zI4J2TX7I5uz5vSTZ7TmmfxP
	VJo8MoCLaIHcOzqwlhIgYPl3cm/+gvNZqW/St2aMrKuf0fooT4asA6OI14J8LOYd7hyU
	VJAg==
Received: by 10.224.205.130 with SMTP id fq2mr830642qab.53.1333036514168; Thu,
	29 Mar 2012 08:55:14 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Thu, 29 Mar 2012 08:54:53 -0700 (PDT)
In-Reply-To: <4F7481FE.3020505@windriver.com>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
	<CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
	<4F723618.6060104@windriver.com>
	<F4FE715B8B374104BDAF129362EBDD00@gmail.com>
	<4F723B78.2060308@windriver.com>
	<CABcZAN=-uE0_UkROO_abncN3m17Qxy=_kqo-Qg=L_pLNKJ99Hg@mail.gmail.com>
	<CAEsOVNc9s=t77p4iN5DU6FP5=NVe4Lr+ZV=SG2BrZZ6-AtcKng@mail.gmail.com>
	<CABcZANnyVxQsJ6ntV=DTeOtPb3R=d8=JSbny8+iOAT8XV99+UQ@mail.gmail.com>
	<4F7481FE.3020505@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 29 Mar 2012 08:54:53 -0700
X-Google-Sender-Auth: TdWz95cO_CGQqXBvJe1EH3wpEzI
Message-ID: <CABcZANn2bT0G1Z4QEhHc4RmNab4Ki7+eBV7bxZRO8W=7ucz25A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
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
X-List-Received-Date: Thu, 29 Mar 2012 16:04:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 8:38 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 3/28/12 11:54 PM, Chris Larson wrote:
>>
>> On Wed, Mar 28, 2012 at 9:47 PM, McClintock Matthew-B29882
>> <B29882@freescale.com> =C2=A0wrote:
>>>
>>> On Tue, Mar 27, 2012 at 5:16 PM, Chris Larson<clarson@kergoth.com>
>>> =C2=A0wrote:
>>>>>
>>>>> If you can explain why the override isn't overriding the default
>>>>> TUNE_PKGARCH (and it's intentional and not a bug), and we can
>>>>> consistently
>>>>> modify all of the elements... I'm happy to accept the changes to all =
of
>>>>> the
>>>>> tunings.
>>>>
>>>>
>>>> See above. It's not an override. And plenty of files already specify
>>>> TUNE_PKGARCH_tune-<tune>, so I don't see how it'd be inconsistent to
>>>> do so for the defaults, personally.
>>>
>>>
>>> If no one else has complained so far it makes me believe they are not
>>> missing any TUNE_PKGARCH_tune-<tune> =C2=A0then.
>>
>>
>> I don't understand the point you're attempting to make here.
>
>
> Just an FYI -- I've not forgotten about this.. I'm going to look into wha=
t
> is currently implemented and figure out how to get it to be consistent..
> things have definitely changed since the initial implementation, and thin=
gs
> are no longer consistent.

Understood, thanks. It's good that someone with a better grasp of the
entirety of the implementation and its goals take that on. This
particular patch isn't particularly important to me, the other two
were, but I'm very curious as to how you'll address this, since as I
mentioned before it seems that the non-override based implementation
is a problem for archs that explicitly set TUNE_PKGARCH.  Thanks for
looking into this.
--=20
Christopher Larson


