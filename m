Return-Path: <pespin.shar@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id A555C73CF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 15:31:40 +0000 (UTC)
Received: by lbbzr7 with SMTP id zr7so139271009lbb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=B2YOg2/je/TbrQriKC+/wrn3xVgcHv+PPA74M4JR0ak=;
	b=tBwvwZ1j3vbok06hHcl/GudxWc9hRxhwEjzLvxREr0/w3RGPBwf1YBQwA7bWp5VgCB
	wi9lVMbVs0wfHY5DOcIczVobWBueWF/axAEsZQbPwCRpxoiP3/Q/mT3h1ANcuZjvVMf6
	sXLlsuf+3PcdustrwVsbBbw1yjob0TZcNf34zhKYTnUP2O8fWQqYVZx18RON+LrndPVa
	Bn/a8XAkWmLUD2/E3MaDgH4RI2MqezzAZjZaqundEgC8SuxpWgxecZgxThWRoSrc0Rjm
	56PDUkjDw3m2DObGll6ZE30QnvjpquIJfii043iacF2wLheIc3NEJ5jsdOaEB2cf0C1V
	2FMg==
MIME-Version: 1.0
X-Received: by 10.112.52.2 with SMTP id p2mr2969754lbo.8.1437579098763; Wed,
	22 Jul 2015 08:31:38 -0700 (PDT)
Received: by 10.25.3.10 with HTTP; Wed, 22 Jul 2015 08:31:38 -0700 (PDT)
In-Reply-To: <1437072252.16819.57.camel@tkkaskin-mobl3.ger.corp.intel.com>
References: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
	<CAJTo0LbpxBHh8mv7qqKMkVmBcoQ=ckjt3+4ipahMwtqUUkZr1A@mail.gmail.com>
	<CAEGpDuYVEB0Y5T+SqybCfagCkO1rA1A66toZdYz_EMWGEc87aw@mail.gmail.com>
	<CABcZAN=z8xMuAABa54A8L2uFhC9fjRbZ36iszxSTJOpWcnFypw@mail.gmail.com>
	<CAEGpDubUdvEM=VHWzYqjBWoLz5Pz+2JP+j9oJLtdij-GSDamCg@mail.gmail.com>
	<CABcZANmfHHYLE=-9dP2-LfQ-uF8WJMxugbGOEEbR-9WQu67j=g@mail.gmail.com>
	<1437041956.16819.32.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<CABcZAN=G=izCZKV+2qL9TEBrtBqBiw74gPPZ0s=mkdmDeGY3pQ@mail.gmail.com>
	<1437070403.16819.47.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<CABcZANm3yiV98wDX0WtQdLEvpo9cV8PEqPJwjFQVLyJphFau6g@mail.gmail.com>
	<1437072252.16819.57.camel@tkkaskin-mobl3.ger.corp.intel.com>
Date: Wed, 22 Jul 2015 17:31:38 +0200
Message-ID: <CAEGpDuY97Gx0qnEHcxBQ+udQgZXdQ3uksHtERZQLtB=KxZE7Bg@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Pau Espin Pedrol <pau.espin@aweurope.be>
Subject: Re: [PATCH v2] pulseaudio: add systemd to PACKAGECONFIG if enabled in DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2015 15:31:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

2015-07-16 20:44 GMT+02:00 Tanu Kaskinen <tanu.kaskinen@linux.intel.com>:
> On Thu, 2015-07-16 at 11:21 -0700, Christopher Larson wrote:
>>
>> On Thu, Jul 16, 2015 at 11:13 AM, Tanu Kaskinen
>> <tanu.kaskinen@linux.intel.com> wrote:
>>         On Thu, 2015-07-16 at 07:56 -0700, Christopher Larson wrote:
>>         >
>>         > On Thu, Jul 16, 2015 at 3:19 AM, Tanu Kaskinen
>>         > <tanu.kaskinen@linux.intel.com> wrote:
>>         >         On Mon, 2015-07-13 at 09:22 -0700, Christopher
>>         Larson wrote:
>>         >         >
>>         >         > On Mon, Jul 13, 2015 at 9:17 AM, Pau Espin Pedrol
>>         >         > <pespin.shar@gmail.com> wrote:
>>         >
>>         >         >         So, pulseaudio is intended to be used as a
>>         systemd
>>         >         user
>>         >         >         service, not
>>         >         >         as a systemd system service, and that
>>         means it needs
>>         >         to end up
>>         >         >         in
>>         >         >         /usr/lib/systemd/user and not
>>         >         in /lib/systemd/system/.
>>         >         >
>>         >         >         All these changes are part of my efforts
>>         to improve
>>         >         systemd
>>         >         >         user
>>         >         >         service support in OE, which is kind of
>>         bad nowadays
>>         >         imho.
>>         >         >
>>         >         > Fair enough, thanks for the clarification. Given
>>         that
>>         >         systemd user
>>         >         > services require pam, and most embedded distros
>>         disable pam,
>>         >         I wonder
>>         >         > if we shouldn=E2=80=99t have an option, at least for
>>         daemons in
>>         >         recipes that
>>         >         > can handle it, to switch from user to system via a
>>         >         PACKAGECONFIG, and
>>         >         > possibly default that for the non-pam case.. Hmm.
>>         >
>>         >         Do you mean that there are many distros that have
>>         systemd but
>>         >         don't have
>>         >         pam, and that the lack of pam strongly suggests that
>>         the
>>         >         system won't
>>         >         have any regular users? If so, then your proposal
>>         sounds good.
>>         >
>>         > No, I mean that systemd user services require pam, as far as
>>         I know,
>>         > because it=E2=80=99s a systemd pam plugin which actually start=
s and
>>         stops the
>>         > user services. Without that hook, they won=E2=80=99t be run at=
 all.
>>
>>
>>         OK, then it's less clear that services should be run in system
>>         mode by
>>         default when pam isn't present. If the lack of pam doesn't
>>         imply lack of
>>         regular users, at least pulseaudio should still run as a user
>>         service by
>>         default (but not started by systemd if pam isn't enabled).
>>
>> Running it as a user service by default when it=E2=80=99ll not actually =
ever
>> be run, lacking a mechanism to run it, seems pretty pointless to me.
>> If someone installs pulseaudio, presumably they want it to actually
>> run.
>
> PulseAudio can run as a user service without being a *systemd* user
> service, and that's actually how it's commonly set up. PulseAudio is
> typically started on demand via its own autospawn feature. The autospawn
> feature will be replaced by systemd's socket activation in the future,
> but only on systems that use systemd (and pam).
>

The "autospawning without using systemd" is not affected by the
modification done in this patch afaik, because it is not enabling the
systemd user service, only installing the service file.

So, If you agree, I will create a patch for bitbake.conf to

1 - add:
export systemd_system_unitdir =3D "${nonarch_libdir}/systemd/system"
export systemd_user_unitdir =3D "${nonarch_libdir}/systemd/user"

2 - Also change systemd_unitdir to use nonarch_libdir.

3 - Then I will create v3 for this patch using systemd_user_unitdir.
Maybe also modify the recipe a bit to use systemd_system_unitdir for
the system service.


> --
> Tanu
>
>

