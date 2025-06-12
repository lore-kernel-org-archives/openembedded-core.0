Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6534C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 14:48:25 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.14990.1749739704259176401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 07:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=qNtoYeeI;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.173, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e5d953c0bso11522897b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749739703; x=1750344503; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W0Og5UIHJscaHlE+yxnc3ezdZVf7ZNCOwVBUE6e412E=;
        b=qNtoYeeIVUXOCQSuycN5hF1b1jcpF5yq1ilH0E4mq/75TpyAYTLlg5HMrw82+wQeV0
         tqZPPC2rysfGXhx4GWzCOS12awa03i2MEdkZz89uClqUJ7RUVTzZOs2tTQm3OhGkVBn0
         WuweRfwnrzqtBEeu31dmUZBG65C45+eKlQvSzU5R/FBEKPi1OmaZVTywH+qMOZ9WrJPX
         pW0HF6QwIdbt5qmdfyEaG1e8rvqdslwrYHcC1Q6XUlHrpsP0Hnp4N+wTvJKHkDn392Oj
         z21a6wOOCkiw+//jzzdgWMLFWQ4jumFRCePjnmbr7nJoVlOmoMr9gCb94+RYSw3uxpw3
         6ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739703; x=1750344503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0Og5UIHJscaHlE+yxnc3ezdZVf7ZNCOwVBUE6e412E=;
        b=empFf/z3WMft55YZEwdtXT4KAlglQuRBq3bnSCoz++wqoL/FS9LNmRPhqyLUM8Td4t
         VIxheQEoVhUivJwaRsyUadNg3jmjEj/Rb6VWG/G6BvdRot4vzxkGd0HmKS0wt+wA6jgT
         XHV7ZsfwiruazlFDFJ8hwJewFderUy5SO/MIIPec4xuZ5+tEGRN7pBUoUAt+M84ocMLg
         5jAxKt9sXBREM9cDUizNKjgTbMKUrGvdlbGZfmRaNOVylqCmIxubCtYWdNx/tIiCaZ0O
         DCJTypKb1xaPZYhVQK2TdHeqVSzaadmHw4ST7sw/pmNApXrPwGOgcAFT5Pcpgu9/ftYg
         qeUw==
X-Gm-Message-State: AOJu0Yzvrxkx4bmPazgdl2xmg6gh+mfFxYccOqzgNGHHCWywPVWwYD1B
	uA+hYFYtmpdZ9ilpNJIwN7UFcMNkSaC0d25raGiEfHresYO5caQAID4v9nAkp/Qbw6JCfV7ndRH
	yymoX1WeXdbwEPvXzmYCuWUHmWCAYHHGWSBIICEUBUQ==
X-Gm-Gg: ASbGnctbT/37F+N7TXLiLXnRt68d77vKWan7RbWDQeI4Il4VcjSvIBvZpXWrDi6dzrH
	QfeRcsuVxsnLRTTr0zaoom5V2LRWjT7lbm2BUGSkGHRQtrrMwBFo5y2l7YnxPpGiRlbL+auQMN1
	SeKPgYuKJxzAEtzUhms9ZcK9cbHZ0GusuwLWk8WxvOksJ9VL/QJp0fndru
X-Google-Smtp-Source: AGHT+IE9gAm7Gp9kY2bVfXWUu4A6XBQm1FwhvoGmhBFQsETVk+9ATwkC+KV51FbbzYYOZiK7o8v9aT74YAwSQrJ2vnA=
X-Received: by 2002:a05:690c:6212:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-7114ec6a174mr61715357b3.15.1749739703287; Thu, 12 Jun 2025
 07:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250611153319.54778-1-anibal@limonsoftware.com> <DAKJ465UQIQP.2RNSHUDVHRKO0@bootlin.com>
In-Reply-To: <DAKJ465UQIQP.2RNSHUDVHRKO0@bootlin.com>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Thu, 12 Jun 2025 08:48:12 -0600
X-Gm-Features: AX0GCFviaTycT0CNSht6k5rKl3bRL64mGS3iGsoGaKZc2NH8ZwhYz9asZ3a_YYU
Message-ID: <CAOU5ZMtO_L5jGS1bR+PKZRgePuU+G-O8nPK0R6jztukT0Z-jwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] wic: pluginbase workaround on invalid
 module filenames
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, Ross.Burton@arm.com, 
	bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="00000000000076d5ee063761054f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 14:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218527

--00000000000076d5ee063761054f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

On Thu, Jun 12, 2025 at 5:47=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Wed Jun 11, 2025 at 5:33 PM CEST, Anibal Limon wrote:
> > Apply a workaround on invalid identifiers replace '-' to '_' to load
> > the module with valid identifier.
> >
> > Let the user know (warning) about plugin doesn't has a valid module
> > identifier to encourage fix, it gives time before rename oe-core wic
> > plugins and drop workaround.
> >
> > Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> > ---
>
> Hi Anibal,
>
> Thanks for the new series.
>
> I believe we have oe oe-selftest errors on x86, while creating image:
>
> 2025-06-12 09:33:17,228 - oe-selftest - INFO -
> overlayfs.OverlayFSEtcRunTimeTests.test_lower_layer_access
> (subunit.RemotedTestCase)
> 2025-06-12 09:33:17,228 - oe-selftest - INFO -  ... FAIL
> ...
> |   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/scripts/lib/wic/plu=
gins/source/bootimg_biosplusefi.py",
> line 159, in do_configure_partition
> |     cls.__instanciateSubClasses()
> |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~^^
> |   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/scripts/lib/wic/plu=
gins/source/bootimg_biosplusefi.py",
> line 108, in __instanciateSubClasses
> |     loader.exec_module(mod)
> |     ~~~~~~~~~~~~~~~~~~^^^^^
> |   File "<frozen importlib._bootstrap_external>", line 1022, in
> exec_module
> |   File "<frozen importlib._bootstrap_external>", line 1159, in get_code
> |   File "<frozen importlib._bootstrap_external>", line 1217, in get_data
> | FileNotFoundError: [Errno 2] No such file or directory:
> '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/scripts/lib/wic/plu=
gins/source/bootimg-pcbios.py'
> | WARNING: exit code 1 from a shell command.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1750
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1689
>
> Can you have a look at this issue?
>

I saw RP is fixing the renaming issues, applying patches upon, to see if it
is possible to land the renames.
If not, only the initial two patches of the series will be applied.

Thanks!,
Anibal


>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000076d5ee063761054f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Mathieu,</div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Jun 12, 2025 at 5:47=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto=
:mathieu.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed=
 Jun 11, 2025 at 5:33 PM CEST, Anibal Limon wrote:<br>
&gt; Apply a workaround on invalid identifiers replace &#39;-&#39; to &#39;=
_&#39; to load<br>
&gt; the module with valid identifier.<br>
&gt;<br>
&gt; Let the user know (warning) about plugin doesn&#39;t has a valid modul=
e<br>
&gt; identifier to encourage fix, it gives time before rename oe-core wic<b=
r>
&gt; plugins and drop workaround.<br>
&gt;<br>
&gt; Signed-off-by: Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware=
.com" target=3D"_blank">anibal@limonsoftware.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Anibal,<br>
<br>
Thanks for the new series.<br>
<br>
I believe we have oe oe-selftest errors on x86, while creating image:<br>
<br>
2025-06-12 09:33:17,228 - oe-selftest - INFO - overlayfs.OverlayFSEtcRunTim=
eTests.test_lower_layer_access (subunit.RemotedTestCase)<br>
2025-06-12 09:33:17,228 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
...<br>
|=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/bui=
ld/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py&quot;, line 159, i=
n do_configure_partition<br>
|=C2=A0 =C2=A0 =C2=A0cls.__instanciateSubClasses()<br>
|=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~~~~~~~~~~~^^<br>
|=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/bui=
ld/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py&quot;, line 108, i=
n __instanciateSubClasses<br>
|=C2=A0 =C2=A0 =C2=A0loader.exec_module(mod)<br>
|=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~~^^^^^<br>
|=C2=A0 =C2=A0File &quot;&lt;frozen importlib._bootstrap_external&gt;&quot;=
, line 1022, in exec_module<br>
|=C2=A0 =C2=A0File &quot;&lt;frozen importlib._bootstrap_external&gt;&quot;=
, line 1159, in get_code<br>
|=C2=A0 =C2=A0File &quot;&lt;frozen importlib._bootstrap_external&gt;&quot;=
, line 1217, in get_data<br>
| FileNotFoundError: [Errno 2] No such file or directory: &#39;/srv/pokybui=
ld/yocto-worker/oe-selftest-debian/build/scripts/lib/wic/plugins/source/boo=
timg-pcbios.py&#39;<br>
| WARNING: exit code 1 from a shell command.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/1750" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/35/builds/1750</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/buil=
ds/1689" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/48/builds/1689</a><br>
<br>
Can you have a look at this issue?<br></blockquote><div><br></div><div>I sa=
w RP is fixing the renaming issues, applying patches upon, to see if it is =
possible to land the renames.</div><div>If not, only the initial two patche=
s of the series will be applied.</div><div><br></div><div>Thanks!,</div><di=
v>Anibal</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--00000000000076d5ee063761054f--

