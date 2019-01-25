Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 406CA7C20A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 12:13:53 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id s13so8319031otq.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 04:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uHdnFLHgTZkQ8WbcvK9OdZYtysAdfUMv8iCb3mdaMz0=;
	b=brwkpyJzmmomDGi/t6MmKgDZz+DsjhFGTlpPCUrx5LvueSvyiAsVDzCEVyAjDkGJGE
	seeUUUrlnYavopxTXc1j3zMoxEK28OiqR/gg2i3YD+7z+02n/LTX1xDPp6/EClMzpHWG
	49n8DLzIN+F5dGwx9BL+45/CtACIRQ/CF8ESWrpuCq04SH00SBUpiEuogR7rMh+WRg9e
	/+0Mlry6HoKoJZfP1XQ9euG5/Qb5+VRdH1CDRR7zh1d91rn1YkX57QMy5wXVwqECx1pf
	jONExWt0iL8hLyw7yzD7EIgUNBKHMqFPC72GkKtHdvhwuESWTX7JarNWcCcUBSUuAubf
	9azQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uHdnFLHgTZkQ8WbcvK9OdZYtysAdfUMv8iCb3mdaMz0=;
	b=b3ZVJ3MiFX4zBVgOX0mVbXItDPcWJpcD6ylv2CfcvXf4oC6VJ/s2rH9GEuq6J+qMON
	U9GLbpQoH03itqoQTa2xeSadzTw1xDzhyvMH8TAKtjK48Uve4JrtRqnGSS4PHLBZDlYF
	9WqsYlXu+vYbi3apBctX714f73uQ0TOIBuRV4hc4vm93FpxmAEQUY1T39FApP7PXqTfx
	FXBLK3Wg5ebw2HIVCXRJrzV3IgUePMWQqf8H5aoirrgzcG6hxJiD7XwFrobbNV7nqBQI
	prLWQW/bSRXk+aUmjo9qCeEqhGvKhnN1x9Rix/Uq/5h0reDRGsAedekWjMWMAwFahLT/
	gBqw==
X-Gm-Message-State: AJcUukcM3Fi22ZSZoEDR1TfY6htknmf8EZbHw+GaBlGr8RWLA3CB0eT4
	tkukOIV2lixGIUk38y6Y71wsE1ATpAcS0vo5qpk=
X-Google-Smtp-Source: ALg8bN5/NKsLNe7rHGHHGIg/MLXo3daqQYr5AjKPk/gs0aBBvELkRtg9yC25FGPoZlY5rONJ4ByI2K/vPCC9lgKYNGI=
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr7614130oti.367.1548418434066; 
	Fri, 25 Jan 2019 04:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
	<20190123161744.45763-4-alex.kanavin@gmail.com>
	<a7f352fbd50d0236a1623114364bb8bb4cb22eb1.camel@linuxfoundation.org>
	<CAJdd5Gbc3vb4YHioijMBXm5Y_w_aiVmi3Kz7_G6mi-BaJWLmzg@mail.gmail.com>
In-Reply-To: <CAJdd5Gbc3vb4YHioijMBXm5Y_w_aiVmi3Kz7_G6mi-BaJWLmzg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Jan 2019 13:13:42 +0100
Message-ID: <CANNYZj_3RJ5Hno-fCwMBccgYrTRSgLb6LZc6rGOovZ_9AD6FTA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] lib/oe/package_manager: turn postinst_intercept warnings into failures for nativesdk
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
X-List-Received-Date: Fri, 25 Jan 2019 12:13:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is a similar issue in multilib for target packages (a warning
because qemu usermode support is missing):
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/214/steps=
/7/logs/warnings

I'm as well not sure how to handle this:
1. Keep these two warnings as warnings so users see them in their
local builds, but
 add some kind of string pattern to AB so it excludes missing qemu
support and missing wine support warnings.

2. Turn them into notes, which means they will go to the logs only,
and users are not going to see them ever. On the other hand, the
postinsts tend to
create things like font caches and similar, which should not generally
be needed at compile time (which is what SDKs are for).

I'm leaning towards option two.

Alex

On Fri, 25 Jan 2019 at 00:18, Joshua Watt <jpewhacker@gmail.com> wrote:
>
>
>
> On Thu, Jan 24, 2019, 4:43 PM Richard Purdie <richard.purdie@linuxfoundat=
ion.org wrote:
>>
>> On Wed, 2019-01-23 at 17:17 +0100, Alexander Kanavin wrote:
>> > The few cases where they failed should be now all fixed. The only allo=
wed
>> > exception is when building mingw32 SDKs, as there is currently no supp=
ort for running
>> > postinst_intercepts through wine.
>> >
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > ---
>> >  meta/lib/oe/package_manager.py | 7 ++++++-
>> >  1 file changed, 6 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_mana=
ger.py
>> > index 1087144d47f..f26f597d03d 100644
>> > --- a/meta/lib/oe/package_manager.py
>> > +++ b/meta/lib/oe/package_manager.py
>> > @@ -439,6 +439,11 @@ class PackageManager(object, metaclass=3DABCMeta)=
:
>> >                  self._postpone_to_first_boot(script_full)
>> >                  continue
>> >
>> > +            if populate_sdk =3D=3D 'host' and self.d.getVar('SDK_OS')=
 =3D=3D 'mingw32':
>> > +                bb.warn("The postinstall intercept hook '%s' could no=
t be executed due to missing wine support, details in %s/log.do_%s"
>> > +                                % (script, self.d.getVar('T'), self.d=
.getVar('BB_CURRENTTASK')))
>> > +                continue
>> > +
>> >              bb.note("> Executing %s intercept ..." % script)
>> >
>> >              try:
>> > @@ -447,7 +452,7 @@ class PackageManager(object, metaclass=3DABCMeta):
>> >              except subprocess.CalledProcessError as e:
>> >                  bb.note("Exit code %d. Output:\n%s" % (e.returncode, =
e.output.decode("utf-8")))
>> >                  if populate_sdk =3D=3D 'host':
>> > -                    bb.warn("The postinstall intercept hook '%s' fail=
ed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('=
BB_CURRENTTASK')))
>> > +                    bb.fatal("The postinstall intercept hook '%s' fai=
led, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar(=
'BB_CURRENTTASK')))
>> >                  elif populate_sdk =3D=3D 'target':
>> >                      if "qemuwrapper: qemu usermode is not supported" =
in e.output.decode("utf-8"):
>> >                          bb.warn("The postinstall intercept hook '%s' =
could not be executed due to missing qemu usermode support, details in %s/l=
og.do_%s"
>>
>> I'm ok with this but could we change the bb.warn to something less
>> important like a note?
>>
>> The reason I say this is that I'd like to get the autobuilder to the
>> point where its warning free. This warning is the only reason meta-
>> mingw shows warnings now. Either we fix them or if we can't, they
>> probably aren't warnings.
>>
>> What should we do here?
>>
>> (also cc'd Joshua)
>
>
> I think the one that fails currently is updating the GIO module cache. I'=
m not sure if this is even necessary for mingw (my guess is no, since this =
has never worked and no one has complained). We probably just need to disab=
le it in mingw, but when I looked very briefly a while ago, I didn't see a =
straight forward way of doing that.
>
> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12962
>
>>
>> Cheers,
>>
>> Richard
>>

