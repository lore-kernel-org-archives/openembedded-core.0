Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2145BC43334
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 16:07:30 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.16916.1655050044529776193
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jun 2022 09:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZMTB+nxf;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id o10so4401300edi.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jun 2022 09:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KDkNDkgJ1OKCLtTMU1EiU+6ikn3TfPsoSLbKhRgpFR4=;
        b=ZMTB+nxfwtNxGFfHt/0quFFsi7ACwofH5szBK0B4TFFwyTmB/xSiv7W1XgYWrIoTK7
         bJ/sHuNq0fL/mpYngxe43sfhk0r3hn0rHeSvJukW3VQl/Mf+Ts7KQLi9wdnhjNuDSynw
         qyPd5WWfNth8bmSd/kis30n511Wp9KB/JdHjGatUEXglnZgUPodDqicVma0b2i1tKypG
         kYQrCAzMHHQr6yjIAbDq2YTqcNDI01ioCeQUbYR/7TbSY2Ps99Qiic2nWph0SZLiEm4p
         lzhLK/QqyZZKFLl0zz9voQDNlaDd51yX9BDSRsPMm9/fk4BNSQ1F1hz3psN/f4xOYEGj
         QKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KDkNDkgJ1OKCLtTMU1EiU+6ikn3TfPsoSLbKhRgpFR4=;
        b=HeSvEhi7PfRQghyUwO7d3amxAv00J8J22Ua0/f0iqPkRsSvnuI7CUQEh74vm/EWMmq
         ipS5K7ij9KUor0XdgE69VqbAJCpziINZf/DY5/n03v/u7bZ1yNgBCnURXiDPkBPBJiv1
         idp1L2j93/bq5Sa8YcM7WNG/bRWzRCKzcYzUXZpxlou8tgxLRcOarI8s+Pb8XQ0KxjUu
         DWSxGVrQIfz41I7sTWIHxncu8GoviRJQSsW9sOSoOuqwe1yyvF2M3k8MXM6TxTUoCEOT
         SKXzq42iIXmXkSnne7fYIarCKiZHaos/8mBNH1Rj2MKAROZqd1wE39sX/PwZYlpEFRnh
         OjAQ==
X-Gm-Message-State: AOAM5329zxfaglujlCEy7ulQGlK1M4PUmeYGUOHamnLpG00DvSdC1IFX
	2SeZ9UCGoY/BDqL0xph9WRgFOYYbmdxqq/uQAElQiw==
X-Google-Smtp-Source: 
 ABdhPJx7DtexQ0+8b3wDarKo8H5VE48fJvPWZsGBXVaETZZCCEhzGsaG9ud6rXSIuS63dIwf9Yew6Yx1XjNJRaUlago=
X-Received: by 2002:a50:ef0f:0:b0:431:56da:74eb with SMTP id
 m15-20020a50ef0f000000b0043156da74ebmr41003340eds.418.1655050042745; Sun, 12
 Jun 2022 09:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220612130255.06F2D96054A@nuc.router0800d9.com>
 <4CDF2F5F-FCD7-4B8C-A9E7-1CB7AD7091CB@redrectangle.org>
In-Reply-To: <4CDF2F5F-FCD7-4B8C-A9E7-1CB7AD7091CB@redrectangle.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 12 Jun 2022 06:07:09 -1000
Message-ID: 
 <CAOSpxdZjfXOWS+aW6N4scth_aXPhs6NkA+=Pqgt12+YCTsBkeQ@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for kirkstone on Sun 12 Jun 2022
 03:00:01 AM HST
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e23b6f05e1425d54"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jun 2022 16:07:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166826

--000000000000e23b6f05e1425d54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 12, 2022, 5:57 AM Robert Joslyn <robert.joslyn@redrectangle.org=
>
wrote:

>
>
> > On Jun 12, 2022, at 6:02 AM, Steve Sakoman <steve@sakoman.com> wrote:
> >
> > Branch: kirkstone
> >
> > New this week: 5 CVEs
> > CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1664 *
> > CVE-2022-1927 (CVSS3: 9.8 CRITICAL): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1927 *
> > CVE-2022-1942 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1942 *
> > CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-26691 *
> > CVE-2022-27778 (CVSS3: 8.1 HIGH): curl:curl-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-27778 *
>
> CVE-2022-27778 doesn=E2=80=99t apply to the curl versions in kirkstone or=
 dunfell
> (master already has the fixed version). It looks like the NVD doesn=E2=80=
=99t quite
> have the right version ranges based on what the curl developers have
> published. I=E2=80=99ve sent an email to hopefully get the NVD updated.
>

Thanks Robert!

Steve

>

--000000000000e23b6f05e1425d54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Jun 12, 2022, 5:57 AM Robert Joslyn &lt;<a hre=
f=3D"mailto:robert.joslyn@redrectangle.org">robert.joslyn@redrectangle.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; On Jun 12, 2022, at 6:02 AM, Steve Sakoman &lt;<a href=3D"mailto:steve=
@sakoman.com" target=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>&gt=
; wrote:<br>
&gt; <br>
&gt; Branch: kirkstone<br>
&gt; <br>
&gt; New this week: 5 CVEs<br>
&gt; CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-1664" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2022-1664</a> *<br>
&gt; CVE-2022-1927 (CVSS3: 9.8 CRITICAL): vim <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-1927" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE=
-2022-1927</a> *<br>
&gt; CVE-2022-1942 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2022-1942" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-202=
2-1942</a> *<br>
&gt; CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-26691" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2022-26691</a> *<br>
&gt; CVE-2022-27778 (CVSS3: 8.1 HIGH): curl:curl-native <a href=3D"https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-27778" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?v=
ulnId=3DCVE-2022-27778</a> *<br>
<br>
CVE-2022-27778 doesn=E2=80=99t apply to the curl versions in kirkstone or d=
unfell (master already has the fixed version). It looks like the NVD doesn=
=E2=80=99t quite have the right version ranges based on what the curl devel=
opers have published. I=E2=80=99ve sent an email to hopefully get the NVD u=
pdated.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Thanks Robert!</div><div dir=3D"auto"><br></div><div dir=3D"auto">St=
eve</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
</blockquote></div></div></div>

--000000000000e23b6f05e1425d54--

