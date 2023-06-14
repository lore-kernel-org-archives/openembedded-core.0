Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0328CEB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 10:03:55 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.7932.1686737034146479986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 03:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=XrKG8nxN;
 spf=pass (domain: mvista.com, ip: 209.85.208.172, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b1afe57bdfso6530631fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 03:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686737032; x=1689329032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ckIEh8fTbNWCvIJPrpbwO/RIIgqwcMUtamSLK26qACE=;
        b=XrKG8nxNx06vf7kYNJjzRbx6Qpa0w9V0rMePFdepp070ZmPpbnnPq9AZvmzwZ/Cpxv
         MuKXGKT8i+AX6JVx0V1Mj+9ZSvkS6qk8uRTwX6Q5BtlG3tpvqD1464K2E1LSsmxOZb5m
         LUl4yunDf0BHzvD6uuItTnUpC9COOzhLm76tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686737032; x=1689329032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckIEh8fTbNWCvIJPrpbwO/RIIgqwcMUtamSLK26qACE=;
        b=ZthVH7hXXtwF/HWM+cRr45RWZH1+srGF/UBEyXBhTHDs9tHSsvBJgo7bPgp0VqDpGB
         dgm1UCz83JHWGEg8ps2AwVMtR0uJf8uLWBVuv9tJY7Af2F9E3/Be2Vr/G732V0TiMZ7d
         6L452+/a2NZ0OI7IlYFMbYl/6KRWpqHzFLZtOZswj/TLgB+cd93UQT90CR78tiRCdMoE
         K3aacagceWOMzCzTZ0ZBLrsJF/AWWSeg47s9KwQZOyRIXB62R3+45SxzpKQylpxBEaEG
         EhA9fQE2jTzKwC1x2Vokdesl36beZeQdL8ooEHquduODXGRZWJtWj+S0v42XNmFTG8H8
         Tqgw==
X-Gm-Message-State: AC+VfDxVt9nyotUxyoB8uip4Co42Tcgwa+c9t6RGntOvYRrkPGojrCTK
	kwCgAjxIwEy9ZOFkztC4B/rleZPgMdTTTpqBEFLxVA==
X-Google-Smtp-Source: ACHHUZ4ISAZ6so+m+x5AC4+Xxvw3uPS5VsKd+kxUQnQIvLAjl4cQxJp9ahX+31D7FjlSS+lJjJIa4IcCGp/GS/CbxBQ=
X-Received: by 2002:a2e:83d6:0:b0:2af:8635:96a1 with SMTP id
 s22-20020a2e83d6000000b002af863596a1mr5609327ljh.33.1686737032190; Wed, 14
 Jun 2023 03:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230614065426.432009-1-vanusuri@mvista.com> <SJ0PR11MB67172993F0D5A98344AC4F60DC5AA@SJ0PR11MB6717.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB67172993F0D5A98344AC4F60DC5AA@SJ0PR11MB6717.namprd11.prod.outlook.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 14 Jun 2023 15:33:38 +0530
Message-ID: <CANQUz19ywiwVQMvpJNHmfWxuftM+N6ZZRm8c95HVN-P8j_yydQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] cups: Fix CVE-2023-32324
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)" <schitrod@cisco.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a2318905fe1411dd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 10:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182802

--000000000000a2318905fe1411dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sanjaykumar,

Thanks for the info.

Thanks & Regards,
Vijay

On Wed, Jun 14, 2023 at 2:29=E2=80=AFPM Sanjaykumar kantibhai Chitroda -X (=
schitrod
- E-INFO CHIPS INC at Cisco) <schitrod@cisco.com> wrote:

> Hi Vijay,
>
> This fix is already submitted to OE-core community and added in queue for
> dunfell branch.
> Please check the status of community patches here:
> https://patchwork.yoctoproject.org/project/oe-core/list/
>
> Thanks,
> Sanjay
>
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Vijay Anusuri
> Sent: Wednesday, June 14, 2023 12:24 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Vijay Anusuri <vanusuri@mvista.com>
> Subject: [OE-core][dunfell][PATCH] cups: Fix CVE-2023-32324
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> OpenPrinting CUPS is an open source printing system. In versions 2.4.2 an=
d
> prior, a heap buffer overflow vulnerability would allow a remote attacker
> to launch a denial of service (DoS) attack. A buffer overflow vulnerabili=
ty
> in the function `format_log_line` could allow remote attackers to cause a
> DoS on the affected system. Exploitation of the vulnerability can be
> triggered when the configuration file `cupsd.conf` sets the value of
> `loglevel `to `DEBUG`. No known patches or workarounds exist at time of
> publication.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-32324
> https://security-tracker.debian.org/tracker/CVE-2023-32324
>
> Upstream Patch:
> https://github.com/OpenPrinting/cups/commit/fd8bc2d32589
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>
>

--000000000000a2318905fe1411dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Sanjaykumar,</div><div><br></div><div>Thanks for t=
he info.</div><div><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, Jun 14, 2023 at 2:29=E2=80=AFPM Sanjaykumar kantibhai Chitrod=
a -X (schitrod - E-INFO CHIPS INC at Cisco) &lt;<a href=3D"mailto:schitrod@=
cisco.com">schitrod@cisco.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hi Vijay,<br>
<br>
This fix is already submitted to OE-core community and added in queue for d=
unfell branch.<br>
Please check the status of community patches here: <a href=3D"https://patch=
work.yoctoproject.org/project/oe-core/list/" rel=3D"noreferrer" target=3D"_=
blank">https://patchwork.yoctoproject.org/project/oe-core/list/</a><br>
<br>
Thanks,<br>
Sanjay<br>
<br>
-----Original Message-----<br>
From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D=
"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto=
:openembedded-core@lists.openembedded.org" target=3D"_blank">openembedded-c=
ore@lists.openembedded.org</a>&gt; On Behalf Of Vijay Anusuri<br>
Sent: Wednesday, June 14, 2023 12:24 PM<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_=
blank">openembedded-core@lists.openembedded.org</a><br>
Cc: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=3D"_bla=
nk">vanusuri@mvista.com</a>&gt;<br>
Subject: [OE-core][dunfell][PATCH] cups: Fix CVE-2023-32324<br>
<br>
From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=3D"_b=
lank">vanusuri@mvista.com</a>&gt;<br>
<br>
OpenPrinting CUPS is an open source printing system. In versions 2.4.2 and =
prior, a heap buffer overflow vulnerability would allow a remote attacker t=
o launch a denial of service (DoS) attack. A buffer overflow vulnerability =
in the function `format_log_line` could allow remote attackers to cause a D=
oS on the affected system. Exploitation of the vulnerability can be trigger=
ed when the configuration file `cupsd.conf` sets the value of `loglevel `to=
 `DEBUG`. No known patches or workarounds exist at time of publication.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-32324" rel=3D"noreferr=
er" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2023-32324</a><b=
r>
<a href=3D"https://security-tracker.debian.org/tracker/CVE-2023-32324" rel=
=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/track=
er/CVE-2023-32324</a><br>
<br>
Upstream Patch:<br>
<a href=3D"https://github.com/OpenPrinting/cups/commit/fd8bc2d32589" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/OpenPrinting/cups/commit/=
fd8bc2d32589</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
</blockquote></div>

--000000000000a2318905fe1411dd--

