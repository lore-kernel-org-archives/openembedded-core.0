Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C36CC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 20:18:32 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web08.53910.1643746711395473711
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 12:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Of2jmPyO;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id e17so15262333uad.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 12:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I10EBKgYhf9eHiAQAg1Y6OQ66IIajqvRHVPoZWAi5m8=;
        b=Of2jmPyOutXLcZcS0Je26UQHKnCufqTGQnKVlycuIAL7Xkh8xwLDuRrQoHe1J0wZG9
         bKnYnqna/jmyNbjni/aj5STIHvDjAeWQL01cCGZhWDr6QH3NxQM3DBztT71AsX81N63u
         kJixtg7parVyg1btBAdAtoUbzfbg4sHsGveZIGMUBSSyuSyVGNo7lRiQbD1CjoJmsxFl
         zOT5Adro363h9CsS6iLTtesUryFwZHCAKNEU85ZXdxx0d/L18w7nj7GuQSkzYRLAdXmI
         aNvMFMLeqTL8CkgEnjj2PtuWxUPWYe/leBL+ZRzd8NfEApMAFOPha3ETtpWSsl5AwAL6
         xx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I10EBKgYhf9eHiAQAg1Y6OQ66IIajqvRHVPoZWAi5m8=;
        b=oxnGra5UgTFihza8K1goBIfdghxtGIrb9brzdsEHd47pYnJ5Z/aV17tTzH705SShCD
         CQWEB+HaDvyLInexG4Z9JSlGvTwghNKeFHYXXS/wUcjerhNuITOtgiv7GwXEoscjPQrZ
         6AV9/mICl9w3D4vsGu5N3Y7UkKIVZfkax7pcnG3EK8e75YIaCeTpY9Zwf0fQD5xhuuXN
         rjaaPxdJEH2O3ivbpaH+7C24GpSRcc3EP8Jcs30/OR1q+DfrYpWS1vC68mjlndUQ3xEs
         /IT3beHCjMZ8yUdbe5ZAfSO82aK6NweKxBdz2ZC3HTd7FYHMiNHnruj7m7QIQrxB3DYA
         Bt+w==
X-Gm-Message-State: AOAM533S6NFi/chbiumksbpxeCHpTjk2M/vgivT5FE2Jl6Z8AmMJdGHR
	uLn+u9P5kkvCnrLYHcCL7PwfpMNOq4p6NtiKfvzLE+wvMaw=
X-Google-Smtp-Source: 
 ABdhPJxYkaTdAIkrzPXVnFiIpNucMnlpuW2Ck18v4gdSQd7/rmxyNn3Ixs7MFjTfJe3sy6SPRnFju4kzgdLLuQpwBpY=
X-Received: by 2002:a05:6102:22d1:: with SMTP id
 a17mr9208391vsh.42.1643746710379;
 Tue, 01 Feb 2022 12:18:30 -0800 (PST)
MIME-Version: 1.0
References: 
 <20220201161638.25531-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj_ju3e+JbsxurjDLue4q3WeAfKMUQJqcXSF=5R2898-VQ@mail.gmail.com>
 <37a9983d-526c-f04a-a40e-979dadf4a5f2@weidmueller.com>
In-Reply-To: <37a9983d-526c-f04a-a40e-979dadf4a5f2@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Feb 2022 21:18:18 +0100
Message-ID: 
 <CANNYZj8yh7yy=GMNmOVn8-OJ=2L-=d=7H7QKdjPLEWVLh6hSgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] cve-check: create directory before copy
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000c5e02d05d6fa9a67"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 20:18:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161167

--000000000000c5e02d05d6fa9a67
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Feb 2022 at 19:58, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> Am 01.02.2022 um 18:00 schrieb Alexander Kanavin:
> > Can you please describe the issue this is fixing in the commit message?
> > Why is this not seen by others?
>
> Isn't it best practice to create a directory before copy something into
> the directory? The patch shows that the arbitrary directory of the
> CVE_CHECK_MANIFEST variable isn't created.
>

That's right, but then the commit title should mention CVE_CHECK_MESSAGE;
"create directory before copy" is too generic.

Alex


>
> > On Tue, 1 Feb 2022 at 17:17, Stefan Herbrechtsmeier
> > <stefan.herbrechtsmeier-oss@weidmueller.com
> > <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
> >
> >     From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com
> >     <mailto:stefan.herbrechtsmeier@weidmueller.com>>
> >
> >     Signed-off-by: Stefan Herbrechtsmeier
> >     <stefan.herbrechtsmeier@weidmueller.com
> >     <mailto:stefan.herbrechtsmeier@weidmueller.com>>
> >     ---
> >
> >       meta/classes/cve-check.bbclass | 1 +
> >       1 file changed, 1 insertion(+)
> >
> >     diff --git a/meta/classes/cve-check.bbclass
> >     b/meta/classes/cve-check.bbclass
> >     index 70d1988a70..a4d735c323 100644
> >     --- a/meta/classes/cve-check.bbclass
> >     +++ b/meta/classes/cve-check.bbclass
> >     @@ -143,6 +143,7 @@ python cve_check_write_rootfs_manifest () {
> >               manifest_name = d.getVar("CVE_CHECK_MANIFEST")
> >               cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
> >
> >     +        bb.utils.mkdirhier(os.path.dirname(manifest_name))
> >               shutil.copyfile(cve_tmp_file, manifest_name)
> >
> >               if manifest_name and os.path.exists(manifest_name):
> >     --
> >     2.30.2
> >
> >
> >     -=-=-=-=-=-=-=-=-=-=-=-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#161159):
> >     https://lists.openembedded.org/g/openembedded-core/message/161159
> >     <https://lists.openembedded.org/g/openembedded-core/message/161159>
> >     Mute This Topic: https://lists.openembedded.org/mt/88836328/1686489
> >     <https://lists.openembedded.org/mt/88836328/1686489>
> >     Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-core/unsub
> >     <https://lists.openembedded.org/g/openembedded-core/unsub>
> >     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
> >     -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000c5e02d05d6fa9a67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 1 Feb 2022 at 19:58, Stefan Herbrechtsmeier &lt;<a href=3D"m=
ailto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-os=
s@weidmueller.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Am 01.02.2022 um 18:00 schrieb Alexander Kanavin:<br>
&gt; Can you please describe the issue this is fixing in the commit message=
? <br>
&gt; Why is this not seen by others?<br>
<br>
Isn&#39;t it best practice to create a directory before copy something into=
 <br>
the directory? The patch shows that the arbitrary directory of the <br>
CVE_CHECK_MANIFEST variable isn&#39;t created.<br></blockquote><div><br></d=
iv><div>That&#39;s right, but then the commit title should mention CVE_CHEC=
K_MESSAGE; &quot;create directory before copy&quot; is too generic.</div><d=
iv><br></div><div>Alex<br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
&gt; On Tue, 1 Feb 2022 at 17:17, Stefan Herbrechtsmeier <br>
&gt; &lt;<a href=3D"mailto:stefan.herbrechtsmeier-oss@weidmueller.com" targ=
et=3D"_blank">stefan.herbrechtsmeier-oss@weidmueller.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:stefan.herbrechtsmeier-oss@weidmueller.co=
m" target=3D"_blank">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt;&gt;=
 wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0From: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:=
stefan.herbrechtsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechts=
meier@weidmueller.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:stefan.herbrechtsmeier=
@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmueller.com<=
/a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Stefan Herbrechtsmeier<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:stefan.herbrechtsmeier@weidmu=
eller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmueller.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:stefan.herbrechtsmeier=
@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmueller.com<=
/a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes/cve-check.bbclass | 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes/cve-check.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/classes/cve-check.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 70d1988a70..a4d735c323 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes/cve-check.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/cve-check.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -143,6 +143,7 @@ python cve_check_write_rootfs_m=
anifest () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manifest_name =
=3D d.getVar(&quot;CVE_CHECK_MANIFEST&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cve_tmp_file =3D=
 d.getVar(&quot;CVE_CHECK_TMP_FILE&quot;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(os.=
path.dirname(manifest_name))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copyfile(=
cve_tmp_file, manifest_name)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if manifest_name=
 and os.path.exists(manifest_name):<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.30.2<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#161159):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/161159" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/message/161159</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/message/161159" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-core/message/161159</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://lists.openembed=
ded.org/mt/88836328/1686489" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/mt/88836328/1686489</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/mt/88=
836328/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/88836328/1686489</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-core%2B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/g/openembedded-core/unsub</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a> &lt;mailto:<a href=3D"mailto:alex.ka=
navin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--000000000000c5e02d05d6fa9a67--

