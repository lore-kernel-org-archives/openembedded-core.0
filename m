Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AB4C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 11:06:24 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web12.63193.1640862379630557912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 03:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qeV4n00Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id d189so1824672vkg.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 03:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rUD7WG9dsYVBUv9ZiZIBXL5tomVdgFjm1joCfF1IAo8=;
        b=qeV4n00Zmd+MH2Dh7h1AyihpzIryTbTrFtwXDCRsJ7CYpPGCxIZPEyOyLsfhU4CcXY
         qxyyC4DJ4175ItVmb8apF8RhO4jLHdxXw20M5EyfNs4CNh1vAMWXpI0Ym1XTq2tpNy6s
         0EppjCNJVnhkcIfaRgMmnd3fyfALfPYo7MAPxRZXUvkvjTZppeWYTtOVXIEWSy8D3ot/
         1lP/tV82ksOOwOCLjOtPH9q1h6hSy7TwnkPsEgf/lW2eaDLS+nVUn5+y3M/UFcx73WK4
         q4kvMoPKNxDEZ6AuD1694j8Fl2InZbum8UMRwaRh7nlBT6nsFQuOEMSXpFHglud/Q5wY
         zo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rUD7WG9dsYVBUv9ZiZIBXL5tomVdgFjm1joCfF1IAo8=;
        b=lQSolRu4PmikHs12hO050LsuXV9WmdAUXb7LuVhypD6zkZ1JIwmgUl0sSNvtAqK9H2
         WDPlBPm+XgYiI+EIjULR3Em9F5ybdOox6cUquzD7P4a4Nufng2YW/rwOzenA8cHu/K8C
         jI8kuHWDhxitK1xgYP4MLEC5t2MoApa0RcMmyOT/ZEyMhyrdYACmbo1vtQS3gCOlizLc
         BhWS9krJAz4iAigHupevRM45muoKAvX1V5Kjc9+yl8+VmOvFAsanoDHUAFckvNj6YzDJ
         4gq0Kl5wFK/+tsiLDQkGfD8KgfsZmsN5k+jpsfe6UeWtRVMCJH9H0I0HjrEAvW0WdUCE
         QB1w==
X-Gm-Message-State: AOAM532Aa5QcmB1/+2DqnoSPx6eM1JPUHqX/qvVvhyxqzzHUald+Txz4
	X2/Lxk7N/+J1pP4zV+CFbptT24c0trNN24TLEmc=
X-Google-Smtp-Source: 
 ABdhPJwTyw0SOQ8uQWfo8BDq0p/ONWac+viLtN9HBIHDOm6FKfmUSrHkMkMyQXgKDx21YSEU0jEs+2163m7Wzy4gtTI=
X-Received: by 2002:a05:6122:2009:: with SMTP id
 l9mr9983121vkd.4.1640862378729;
 Thu, 30 Dec 2021 03:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20211216114836.964835-1-matt@madison.systems>
 <20211216114836.964835-2-matt@madison.systems>
 <3e66c6fb-b376-a292-34b1-70abdc270f41@windriver.com>
In-Reply-To: <3e66c6fb-b376-a292-34b1-70abdc270f41@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Dec 2021 12:06:06 +0100
Message-ID: 
 <CANNYZj9ORiz6CeYBdM5fPdkvZ+RhmpuwTtB06pT7O+PbGycRyw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 1/2] qemu.bbclass: drop OLDEST_KERNEL
 reference
To: Changqing Li <changqing.li@windriver.com>
Cc: Matt Madison <matt@madison.systems>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000035aae605d45b0b81"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 11:06:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160059

--00000000000035aae605d45b0b81
Content-Type: text/plain; charset="UTF-8"

I guess you can add it back through QEMU_EXTRAOPTIONS?

Alex

On Thu, 30 Dec 2021 at 09:52, Changqing Li <changqing.li@windriver.com>
wrote:

>
> On 12/16/21 7:48 PM, Matt Madison wrote:
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> which is introducing task hash changes for some
> allarch package builds, and should no longer
> be needed with recent versions of qemu.
>
> Signed-off-by: Matt Madison <matt@madison.systems> <matt@madison.systems>
> ---
>  meta/classes/qemu.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index 01a7b86ae1..333202b7c4 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
>  # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
>  # qemu-arm default CPU supports all required architecture levels.
>
> -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> +QEMU_OPTIONS = "${@d.getVar(" <$%7B@d.getVar(>QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
>
> Hi,
>
> Latest yocto still take "CentOS 7.x" as Supported Linux Distributions.
> But centos7 have kernel version 3.10.
>
> But we have some archs, like aarch64, set OLDEST_KERNEL to 3.14. Without
> "-r ${OLDEST_KERNEL}",
>
> some recipes which will run qemu during configure or compile will failed
> with error:
>
> FATAL: kernel too old
>
> How about add it back?
>
>
> Thanks
>
> Changqing
>
>  QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
>
>  QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
> --
> 2.32.0
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160058):
> https://lists.openembedded.org/g/openembedded-core/message/160058
> Mute This Topic: https://lists.openembedded.org/mt/87765279/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000035aae605d45b0b81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I guess you can add it back through QEMU_EXTRAOPTIONS=
?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 30 Dec 2021 at 09:52, Chan=
gqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" target=3D"_blank=
">changqing.li@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">

 =20
  <div>
    <p><br>
    </p>
    <div>On 12/16/21 7:48 PM, Matt Madison
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>[Please note: This e-mail is from an EXTERNAL e-mail address]

which is introducing task hash changes for some
allarch package builds, and should no longer
be needed with recent versions of qemu.

Signed-off-by: Matt Madison <a href=3D"mailto:matt@madison.systems" target=
=3D"_blank">&lt;matt@madison.systems&gt;</a>
---
 meta/classes/qemu.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 01a7b86ae1..333202b7c4 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, since=
 the
 # qemu-arm default CPU supports all required architecture levels.

-QEMU_OPTIONS =3D &quot;-r ${OLDEST_KERNEL} ${@d.getVar(&quot;QEMU_EXTRAOPT=
IONS_%s&quot; % d.getVar(&#39;PACKAGE_ARCH&#39;)) or &quot;&quot;}&quot;
+QEMU_OPTIONS =3D <a href=3D"mailto:$%7B@d.getVar(" target=3D"_blank">&quot=
;${@d.getVar(&quot;</a>QEMU_EXTRAOPTIONS_%s&quot; % d.getVar(&#39;PACKAGE_A=
RCH&#39;)) or &quot;&quot;}&quot;</pre>
    </blockquote>
    <p>Hi,</p>
    <p>Latest yocto still take &quot;CentOS 7.x&quot; as <span></span>Suppo=
rted Linux Distributions. But
      centos7 have kernel version 3.10.</p>
    <p>But we have some archs, like aarch64, set OLDEST_KERNEL to 3.14.
      Without &quot;-r ${OLDEST_KERNEL}&quot;,</p>
    <p>some recipes which will run qemu during configure or compile will
      failed with error:</p>
    <p>FATAL: kernel too old</p>
    <p>How about add it back? <br>
    </p>
    <p><br>
    </p>
    <p>Thanks</p>
    <p>Changqing<br>
    </p>
    <blockquote type=3D"cite">
      <pre> QEMU_OPTIONS[vardeps] +=3D &quot;QEMU_EXTRAOPTIONS_${PACKAGE_AR=
CH}&quot;

 QEMU_EXTRAOPTIONS_ppce500v2 =3D &quot; -cpu e500v2&quot;
--
2.32.0

</pre>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160058): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160058" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160058</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87765279/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87765279/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000035aae605d45b0b81--

