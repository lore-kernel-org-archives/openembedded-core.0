Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AE4D25041
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 16:31:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36783.1768235472056857387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 08:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kXZhqRbu;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 161FEC20860
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 16:30:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87DFD606FA;
	Mon, 12 Jan 2026 16:31:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED0D9103C8C00;
	Mon, 12 Jan 2026 17:31:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768235469; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EtyLylIW7nRb9jgODLPkp7orX9DEMzPZ0hXGbQzzKXw=;
	b=kXZhqRbuX+PMaos/8E3mTO7P6v3iUXQixOBhVq7o+xFeGEOH7wrCbawhDY3+jOf2cDkEMW
	6qL8VWLPrIaBv4cwqifmNG0v96ampMlrhPT06IcTkL3WEYUknUnnRFIsvYA8AETi6Ya24E
	ffcdSpRrZE05OtIIyrQGsHyYQRZ5+P9JAMY3W2g6Oz5Ve5e1tQgahWt0XWfUc/aybzwOEF
	joTq6v6QPsnMKaLKmMpQAwq4G1IYMxQi5qDsAnjzBy/rxvpZqJI6SNCAw+TxglE5rXVoog
	S0SW61xRXX3tUXw7j4coLYt34QiU14No0Nro2MmNB+yeJhOij665TCR9DW2VZA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 17:31:07 +0100
Message-Id: <DFMR5RJJUJTB.2O15UBWFQP28I@bootlin.com>
Cc: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <yoann.congal@smile.fr>
Subject: Re: [OE-core][PATCH] libarchive: upgrade 3.8.4 -> 3.8.5
References: <20260110122753.381844-1-peter.marko@siemens.com>
 <DFMQVB547HXI.37E1WAP5SSS5Q@bootlin.com>
 <CAMSfU+7zYSadRQizDqDWWVAj0rLJSgiZVhFzs=L-to0RigHQKg@mail.gmail.com>
In-Reply-To: <CAMSfU+7zYSadRQizDqDWWVAj0rLJSgiZVhFzs=L-to0RigHQKg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 16:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229217

On Mon Jan 12, 2026 at 5:23 PM CET, Yoann Congal via lists.openembedded.org=
 wrote:
> Le lun. 12 janv. 2026 =C3=A0 17:17, Antonin Godard via lists.openembedded=
.org
> <antonin.godard=3Dbootlin.com@lists.openembedded.org> a =C3=A9crit :
>
>> Hi,
>>
>
> Hello,
>
>
>> On Sat Jan 10, 2026 at 1:27 PM CET, Peter Marko via lists.openembedded.o=
rg
>> wrote:
>> > From: Peter Marko <peter.marko@siemens.com>
>> >
>> > Fixes regression of fix for CVE-2025-60753
>> >
>> > Release notes [1]:
>> > Libarchive 3.8.5 is a bugfix release.
>> > Notable bugxies:
>> > * bsdtar: fix regression from 3.8.4 zero-length pattern issue bugfix
>> (#2809)
>> > * various small bugfixes in code and documentation
>> >
>> > [1] https://github.com/libarchive/libarchive/releases/tag/v3.8.5
>> >
>> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> > ---
>> >  .../libarchive/{libarchive_3.8.4.bb =3D> libarchive_3.8.5.bb}     | 2=
 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >  rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb =3D>
>> libarchive_3.8.5.bb} (96%)
>> >
>> > diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
>> b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
>> > similarity index 96%
>> > rename from meta/recipes-extended/libarchive/libarchive_3.8.4.bb
>> > rename to meta/recipes-extended/libarchive/libarchive_3.8.5.bb
>> > index e89638f5c6..fcfaf5d231 100644
>> > --- a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
>> > +++ b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
>> > @@ -32,7 +32,7 @@ EXTRA_OECONF +=3D "--enable-largefile --without-icon=
v"
>> >  SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz=
"
>> >  UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
>> >
>> > -SRC_URI[sha256sum] =3D
>> "b2c75b132a0ec43274d2867221befcb425034cd038e465afbfad09911abb1abb"
>> > +SRC_URI[sha256sum] =3D
>> "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7eaa2102f03b7ffd"
>> >
>> >  inherit autotools update-alternatives pkgconfig
>> >
>>
>> After bisecting, I identified this patch to trigger errors on the
>> Autobuilder,
>> such as:
>>
>>   Exception: subprocess.CalledProcessError: Command 'tar
>> --exclude=3D./sysroot-only -cf - -C
>> /srv/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/all-p=
oky-linux/wayland-protocols/1.47/image
>> -p -S . | tar -xf - -C
>> /srv/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/all-p=
oky-linux/wayland-protocols/1.47/package'
>> returned non-zero exit status 2.
>>
>>   Subprocess output:
>>   got *at() syscall for unknown directory, fd 4
>>   unknown base path for fd 4, path share
>>   couldn't allocate absolute path for 'share'.
>>   tar: ./usr/share: Cannot mkdir: Bad address
>>   got *at() syscall for unknown directory, fd 4
>>   unknown base path for fd 4, path share
>>   couldn't allocate absolute path for 'share'.
>>   ...
>>
>>
>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4904276/raw_in=
line
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/93/builds/3005
>>
>> Full build:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3034
>>
>> Can you have a look?
>>
>
> FYI, that is bug 16117 =E2=80=93 AB-INT: do_package: Error executing a py=
thon
> function in exec_func_python() autogenerated
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16117
> And it is not linked to this patch (for example, I have this on whinlatte=
r
> which does not have this patch)
>
> If you retry your build on any worker but stream9-vk-1 it should not have
> this error.

Oh ok, thanks. I was told this was limited to stream9, and since some of my
builds also failed on rocky9 and alma9, I did not make the connection.

Sorry for the false alarm, Peter.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


