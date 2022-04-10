Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4734C4321E
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:57 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.17192.1649596433384306971
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 06:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PHkTwa6/;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id w18so15111680edi.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QijhgP+FKClBSuRkkIfPIo2Cq2gUwjv2rCM3Zv4RywU=;
        b=PHkTwa6/x0q1Tmq1SP66z+IwI1bMIMWA3IhxBj8sYcut/8qEvxQG1CdCvAKb2E/Sbc
         gixb+QLFwH/MBGY5+cZ/NrfM40NjgJKykb7/4xE75JK3LqhZANLDqY30c6rVQTgiPcPV
         SQ1JM6Fv3j96LGWkT2SPPE1kliL7FDwEiH2ufQQU5V+rUfO0DKtWGIWGuW8meV526xqM
         utw8weiOc2kLDjBgIB52S8Fc7yWApYTdaKMjXTvXMeVieaV4g6pfa5QDST1D90DKZgJ1
         V9saWbMTDznMjxpxDW3haxjZpY6IfMTYgCvGEsSk+NUzAL7eZIV7TuggfyLhKsxrqr+M
         /mmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QijhgP+FKClBSuRkkIfPIo2Cq2gUwjv2rCM3Zv4RywU=;
        b=bzQLvEHtuIHr3KQv9IWJUyZFLk3HEx2RbK5trRN48evBsyWF6Exww71TfFBpxhyqhk
         9Gjch4RhMH6FKvqrxXCXKb/A+jjMvgVXgvl4DiaS6AdLAUKX+8Srpbp/QoskuwJPvUHE
         o8sb9WBJkVuQ2ZQYOfDcVHIgDogGnSQbVIk1A6riz15msb5IIZeb8DkAyUgwC62Lup6P
         gMFD7wZnzqVgbD/uWvVLWaOUNlg3H9V1zwKPiaAIeDD6m8HK8TXRUhb3axLsItADYvV+
         IGSvCgiJk7RpyzggG5Et6LlDnreLFGwTYhNy/88AQ1SwpiiTvaDmnIwmbyKJForj6Jvh
         QnSg==
X-Gm-Message-State: AOAM532HXL3jfWwe3vSLgzKx28hX5XbI/W57raoJ2YACQruh+mm7JA88
	oUfSJUeAntPZq71A/1O3Oz8Nzuh1B+2Ganw003+iLg==
X-Google-Smtp-Source: 
 ABdhPJz9VUiTY73U+TKs0gaVQ5MPxQ6ZpAqU/Bl2bY/PkX+kvZwXr44+VrXo5ERicYLnlkNLij2g2DETK2tB2FmQjO0=
X-Received: by 2002:a50:d48d:0:b0:41a:c9cb:8b90 with SMTP id
 s13-20020a50d48d000000b0041ac9cb8b90mr28647576edi.299.1649596431600; Sun, 10
 Apr 2022 06:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <16E4875446E67B89.16763@lists.openembedded.org>
In-Reply-To: <16E4875446E67B89.16763@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 10 Apr 2022 03:13:40 -1000
Message-ID: 
 <CAOSpxdZE=F+thzTZiWo4qmNHCAMp9E8Ti220tZuOe_stz+Ph-Q@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 10 Apr 2022
 02:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000543ac405dc4c9912"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164201

--000000000000543ac405dc4c9912
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 10, 2022, 2:02 AM Steve Sakoman via lists.openembedded.org
<steve=sakoman.com@lists.openembedded.org> wrote:

> Branch: master
>
> New this week: 4 CVEs
> CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *
>

This seems to be an error in the database due to a recent update for this
CVE entry.  I requested a fix on Friday so hopefully this will disappear
next week.

Steve

CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
> CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1056 *
> CVE-2022-26280 (CVSS3: 9.1 CRITICAL): libarchive:libarchive-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26280 *
>
> Removed this week: 1 CVEs
> CVE-2022-0943 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
>
> Full list:  Found 12 unpatched CVEs
> CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *
> CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
> CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
> CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
> CVE-2021-44647 (CVSS3: 5.5 MEDIUM): lua:lua-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
> CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
> CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
> CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
> CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1056 *
> CVE-2022-24975 (CVSS3: 7.5 HIGH): git
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
> CVE-2022-26280 (CVSS3: 9.1 CRITICAL): libarchive:libarchive-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26280 *
> CVE-2022-27191 (CVSS3: 7.5 HIGH): go
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164197):
> https://lists.openembedded.org/g/openembedded-core/message/164197
> Mute This Topic: https://lists.openembedded.org/mt/90372797/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000543ac405dc4c9912
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Apr 10, 2022, 2:02 AM Steve Sakoman via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;steve=3D=
<a href=3D"mailto:sakoman.com@lists.openembedded.org">sakoman.com@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Branch=
: master<br>
<br>
New this week: 4 CVEs<br>
CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native <a href=3D"https=
://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1010238" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2019-1010238</a> *<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">This seems to be an error in the databas=
e due to a recent update for this CVE entry.=C2=A0 I requested a fix on Fri=
day so hopefully this will disappear next week.=C2=A0</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Steve</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1050" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2022-1050</a> *<br>
CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff <a href=3D"https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2022-1056" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-=
1056</a> *<br>
CVE-2022-26280 (CVSS3: 9.1 CRITICAL): libarchive:libarchive-native <a href=
=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-26280" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2022-26280</a> *<br>
<br>
Removed this week: 1 CVEs<br>
CVE-2022-0943 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-0943" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-094=
3</a> *<br>
<br>
Full list:=C2=A0 Found 12 unpatched CVEs<br>
CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native <a href=3D"https=
://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-1010238" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2019-1010238</a> *<br>
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native <a =
href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-12067" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2019-12067</a> *<br>
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native <a href=3D"https://web.nv=
d.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-18974" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2020-18974</a> *<br>
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native <a =
href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-20255" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2021-20255</a> *<br>
CVE-2021-44647 (CVSS3: 5.5 MEDIUM): lua:lua-native <a href=3D"https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-44647" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2021-44647</a> *<br>
CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native <a href=3D"https://web.=
nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0529" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2022-0529</a> *<br>
CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native <a href=3D"https://web.=
nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0530" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=
=3DCVE-2022-0530</a> *<br>
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1050" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2022-1050</a> *<br>
CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff <a href=3D"https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2022-1056" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-=
1056</a> *<br>
CVE-2022-24975 (CVSS3: 7.5 HIGH): git <a href=3D"https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-24975" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2=
4975</a> *<br>
CVE-2022-26280 (CVSS3: 9.1 CRITICAL): libarchive:libarchive-native <a href=
=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-26280" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2022-26280</a> *<br>
CVE-2022-27191 (CVSS3: 7.5 HIGH): go <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-27191" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-27=
191</a> *<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164197): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164197" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/164197</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90372797/3620=
601" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/90372797/3620601</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.c=
om" target=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000543ac405dc4c9912--

