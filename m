Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26000.1795302877299035489
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 15:14:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=N6nw0iIs;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385c497bf94so4375643eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 15:14:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795302877; cv=none;
        d=google.com; s=arc-20260327;
        b=dRCwBNeQq7NDaTCZvS2PvVLVrOmZf/FDsj1FrRtk4AYnAVm3ntwrFFCRuMDVwxytvl
         xFrEC5qnl0PTsn2tcouS0DqW7ZG0vbPFVZi8TxPVSi9ZXdPcCVr5RSrzMbccAOQ8bjLs
         5Q+1v/9u1eJUWRWQDcmj8F0f2F9rf45Ykji6h9S286kCYxK8G/LerOZBrlajsU22jG51
         XGvLKcPnFCrjpAxUCQOVDR5vWJ2esEo9cVmU1THx5FOjvCzcB0RE3odAHQjzXVDS9TMt
         PwcKD0TqyQBvyUbhRaypN0hjhIfnDWUAEONalC7UAk2yGaFfUvhMKm9ZHFBejp64ttj8
         LbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tStSzrcU/y5PDaIMaSGxUFklO56Qz54kXeXS5d39mao=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=gpVHGcry0/TPdO+wXx9o8z+Yf7UUxGVUReeCqiMl8YcSmenpxoz9AvsPKX7mVmbUFq
         Q1CBzTBuqNU4yBShFAF9G0so5OiRHTBMhAimFWG2wWahD731XyLsgBcTYGXRRkNBWmAW
         0Qj+ZcMQTpydhrwooZamBWEdVshnU5Bsg+i9/xu4sSujyg/+I8akI9v47pJBnx1eaVuh
         /kwo2JzznBzDu9y85RSLgr1T4MDxnXPohKkWtzrqjv1kTeavHKPHw1nfbQqOg9oai85f
         6J2/lFY5wjIpGdCCshHTIVhLHxnWbTZy70q1PlouUkPUtRO7bdWCtVlffmzs8828FSsq
         G4lA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795302877; x=1795907677; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tStSzrcU/y5PDaIMaSGxUFklO56Qz54kXeXS5d39mao=;
        b=N6nw0iIsASlHj9pP0hxfWHliaukEkxbllIDurMC2aTopwhv7FrQojvUyrOGC+u8reV
         ZJkO08nhWQawGlSr8/u0hG+O/npU+GyRn8W7qiAlAlogaIJKUd7+dHAnLD9KUSTgER9U
         C+iuMhLowECSnLejwaYOkTXOYdH4pq0FDOGIYV3YwqD3JvLsNng2b0PctXdxlC9VlJ5i
         5OZ6QQP9RaYjbpPUvcGkCLUALQjR1PZr371j0LAz2PU2JaqOSPWGxfs8rpe5r+27xFEf
         LI1kZvgcRWC86gCtj69UXgLogXkV5d3mIWzXAqBLGNPx/1caAmxEY8SYyh9tBWG7MQNX
         d8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302877; x=1795907677;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tStSzrcU/y5PDaIMaSGxUFklO56Qz54kXeXS5d39mao=;
        b=Q78NzpHzxb96/ynzOBVD/0R5ypxNv8XtES0Ns3DcN/vaUxsk3dhawp5aoybdfD6SUb
         e5E/iF3nirRPtxXB06pfLlCfLKU4hGXxpmW7R2A+Vhwn8lpsylV156NOZizCTUBpIQJH
         d8fWWeEmir9aH7eYtrQgpPCEg1tKEGzyzeJ/CGTc8VtqfM7HrR8T1Nzdx8lYUSTcVbzu
         KvLTqYME6s8LJuetjJ7oc8Iz+K/m4e7b01ixJfam2775FZBcfDlr8FBH4tCi1kJkMtYn
         mDVNRafh+htDrdSUddgAACjvhvteJO+1W/yI7FBwGiaHFob9wrqPIS9E7bP0lNWJCUXT
         gL8Q==
X-Gm-Message-State: APuU4Z/fS8yIsqSJh0sD0LfOykPPv3L5wzxcG1CGn8KOcnOmSegJ8rx7
	pCBl8SDMuLPmjsU6evcOE1tItkOyWPsWz8NZ+Z2nRJqvmLF00QnRFntwYeMcrv85BQQoz35+u9r
	RVaP2YoB0okCttVjjBwCTwKJ+r4UubI9fyA==
X-Gm-Gg: AZFdTZeQcsU2qkc8/AlcgAJPWMnwIRp1C+Vl554aSYOZHm6aTLeuasauyLFE9F2r5PN
	Xf24dAoMFmDlk7iNaRr0jbCtn9cFtfEt0vyfP40utzc9whshW92jJAemmhE8WksoTLkSZ9CAlCG
	p6F+ykzcZw1gW/3Nrm6GRZ9La/75Yw4hfbJ7DY5o2BbWHUiXW/DOLOuHHk7N949yjHQcVXfj8iV
	kzMAT2hQONSWdPAwYHP5nGOIZJJc1osO0+1SV413BdSf1DNrMU1mPz4LIR6PPmofwO3L6FUjBsl
	IslpGyGi//KNojsl1AYGXafbo7jLS0NoYDyXxSr1PWy71w0J22gK1HGd/9fokHuRy7dQVeTNthN
	6EZ5DTrindGCkAJQax6wEWSGyByAZPIVKnnDl
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id
 5a478bee46e88-38608d2945emr9204312eec.23.1795302876535; Sat, 21 Nov 2026
 15:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20261117073849.3089566-1-ragaprasanth@gmail.com> <DN19P4D41RQC.J6VXZC0CZ5L8@smile.fr>
In-Reply-To: <DN19P4D41RQC.J6VXZC0CZ5L8@smile.fr>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Sun, 22 Nov 2026 08:14:23 +0900
X-Gm-Features: Aa3M54qaAYuFt2WchBv-FmeSEluDh-y4A3dvIHucg9i9BycMW1Q6M0u_mU2XoO4
Message-ID: <CAG7eodH5yjhYVKvY=or27qnusnmgapieqW=umRNbbK-wexnhNg@mail.gmail.com>
Subject: Re: [scarthgap][PATCH 1/2] u-boot: fix CVE-2026-29009
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003861ff0660d186ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 23:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250859

--0000000000003861ff0660d186ae
Content-Type: text/plain; charset="UTF-8"

Hi Yoann,

Understood, thanks for the update. I'll wait for the outcome of that
discussion and rebase if necessary.

Regards,
Prasanth R

On Sun, Nov 22, 2026 at 8:11 Yoann Congal <yoann.congal@smile.fr> wrote:

> On Tue Nov 17, 2026 at 8:38 AM CET, Prasanth R wrote:
> > A malicious NFS server can overflow nfs_path_buff with READLINK
> > replies. Backport the upstream fix, as done for wrynose. It applies
> > to 2024.01 unchanged.
> >
> > AI-Generated: Uses Claude
> > Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> > ---
> > Tested: built with CONFIG_CMD_NFS=y for qemux86-64. Also ran
> > nfs_readlink_reply() from the unpatched and patched 2024.01 source
> > under AddressSanitizer with two 1100-byte READLINK replies: without
> > this patch it overflows nfs_path_buff, with it the second reply is
> > dropped.
> >
> >  .../u-boot/files/CVE-2026-29009.patch         | 53 +++++++++++++++++++
> >  meta/recipes-bsp/u-boot/u-boot_2024.01.bb     |  1 +
> >  2 files changed, 54 insertions(+)
> >  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
>
> Hello,
>
> Thanks for the series, but I think we need to do the merging of sources
> between u-boot/u-boot-tools first as was discussed here:
>   [scarthgap][PATCH] u-boot-tools: use all patches from u-boot
>
> https://lore.kernel.org/all/20260923173850.21338-1-peter.marko@siemens.com/T/#u
>
> I'll hold this series until then. Beware, is the merge is accepted, you
> will have to rebase your series on top. If not, feel free to ping me to
> remind me of this series.
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--0000000000003861ff0660d186ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span class=3D"smart_draft_text">Hi Yoann,<br><br>Understood, thanks for th=
e update. I&#39;ll wait for the outcome of that discussion and rebase if ne=
cessary.<br><br>Regards,<br>Prasanth R=C2=A0<br></span><div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sun, Nov 22, 2026 at 8:11 Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">On Tue Nov 17, 2026 at 8:38 AM CET, Prasanth R wrote:<br>
&gt; A malicious NFS server can overflow nfs_path_buff with READLINK<br>
&gt; replies. Backport the upstream fix, as done for wrynose. It applies<br=
>
&gt; to 2024.01 unchanged.<br>
&gt;<br>
&gt; AI-Generated: Uses Claude<br>
&gt; Signed-off-by: Prasanth R &lt;<a href=3D"mailto:prasanth.r@lineo.co.jp=
" target=3D"_blank">prasanth.r@lineo.co.jp</a>&gt;<br>
&gt; ---<br>
&gt; Tested: built with CONFIG_CMD_NFS=3Dy for qemux86-64. Also ran<br>
&gt; nfs_readlink_reply() from the unpatched and patched 2024.01 source<br>
&gt; under AddressSanitizer with two 1100-byte READLINK replies: without<br=
>
&gt; this patch it overflows nfs_path_buff, with it the second reply is<br>
&gt; dropped.<br>
&gt;<br>
&gt;=C2=A0 .../u-boot/files/CVE-2026-29009.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 53 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2024.01.bb" rel=
=3D"noreferrer" target=3D"_blank">u-boot_2024.01.bb</a>=C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 54 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.=
patch<br>
<br>
Hello,<br>
<br>
Thanks for the series, but I think we need to do the merging of sources<br>
between u-boot/u-boot-tools first as was discussed here:<br>
=C2=A0 [scarthgap][PATCH] u-boot-tools: use all patches from u-boot<br>
=C2=A0 <a href=3D"https://lore.kernel.org/all/20260923173850.21338-1-peter.=
marko@siemens.com/T/#u" rel=3D"noreferrer" target=3D"_blank">https://lore.k=
ernel.org/all/20260923173850.21338-1-peter.marko@siemens.com/T/#u</a><br>
<br>
I&#39;ll hold this series until then. Beware, is the merge is accepted, you=
<br>
will have to rebase your series on top. If not, feel free to ping me to<br>
remind me of this series.<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div></div>

--0000000000003861ff0660d186ae--
