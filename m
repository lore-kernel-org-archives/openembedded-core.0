Return-Path: <mohammedaqdam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCE4C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 06:00:05 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.6317.1637042403847057718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 22:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IVMvA5gi;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: mohammedaqdam@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id b12so35277746wrh.4;
        Mon, 15 Nov 2021 22:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=7c2tosbyzPmlwlvmiE658ex0NkwH1uG01fAoo73adS8=;
        b=IVMvA5gix/J1GNaT+szVOZ/DNYcu553XWSKqECND3OF2k66FjjK9b/2fxECjs4vCcu
         D304FDrLfoi3KIpTneZUd2YcgHAk8lkQidK1pBcaKU1GZQKBfuGdxNhs/IQUK7R5+3g9
         nvAUbmcTUIDKM86ZFXEqcvZUECmETI5+hogqx9+n5JFsrXfpNcp34HobqgqVWxlLCgjw
         J4mkTn6JyVVhY8ALVKBiJ1lRYzNeV9EPmXTEOrhQ6Z21v7IYtDB8RqgDne6BAxwD7IEK
         i3n5+hzsEfYZC5YqG+lPaBNhBx8ImD6uK4hG1SPs67aZB0o1cIfZyfwxbZ1DLqJXclLk
         Avag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7c2tosbyzPmlwlvmiE658ex0NkwH1uG01fAoo73adS8=;
        b=E0k2FIMxoPZx7AnRGJ9wFmhARSYNcZZaqY0b8Q4KjYWXcEhMFLB+qYxJSIeIlwpnyc
         V6L/TxvtVmhRbhItYT7nm/91hNbSXFnvYC/iYU6FB45pU+neXIhhCfbuEsjxlgk75xPZ
         yiaL9VSiYItXRQmxo9NBlWnbGxu9M0e6TvS/4QNRPH6WGfFrvADKtZlkQZyldkdolhiO
         Ub90vnRIMKOLZYH0LJOq2NTOUUH537gXf0p9++8zfXIa7nCD65oW/2xHN7pGi/NlLRFl
         3dkFrDE0w3P3laLbYQ6T6VgFxbdlO4tgreRDskL8XZeRiYXka4hWz4pVQK2j3warnc2Z
         f9pA==
X-Gm-Message-State: AOAM530yid7ym9SI287AVMR17tC99vnr3jowYwuhlwmkYANyE3BdqYmt
	Q07yvrfW5P3+02WnBFlQWArkRgBMvTNVivysAs0fvDvRnwE=
X-Google-Smtp-Source: 
 ABdhPJz07G6I8EboDEG2Qvv7QwdKmj1sIUvtspFH6M7bFgLd7izUFso4AMzE5IImWbgFftJtPwESalBDdVbDl73MekU=
X-Received: by 2002:a5d:58f9:: with SMTP id f25mr6403991wrd.206.1637042401812;
 Mon, 15 Nov 2021 22:00:01 -0800 (PST)
MIME-Version: 1.0
From: mohammed aqdam <mohammedaqdam@gmail.com>
Date: Tue, 16 Nov 2021 11:29:50 +0530
Message-ID: 
 <CAGsrAHfvNdtkN9G1CQk_=+vtmEja=K48_UDJZwTtPfmqfNwG0w@mail.gmail.com>
Subject: Yocto : Need help in building latest openembedded branch code
To: openembedded-core@lists.openembedded.org,
	openembedded-core+help@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d7a6a505d0e1a280"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 06:00:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158340

--000000000000d7a6a505d0e1a280
Content-Type: text/plain; charset="UTF-8"

Hi There,

I am working on a yocto image for the imx8 board, for this I have created a
project with zeus layers for all layers(including meta-imx) using the below
manifest file.

repo init -u https://source.codeaurora.org/external/imx/imx-manifest -b
imx-linux-zeus -m imx-5.4.47-2.2.0.xml


I am trying to fetch master/honister code of openEmbedded on my
existing project(Earlier i was using Zeus branch) to use latest modules of
perl(5.34.0), chrony(4.1) & gpsd(gpsd 3.23.1
<http://layers.openembedded.org/layerindex/recipe/1120/>), by modifying
.repo/manifests/imx-5.4.47-2.2.0.xml with master/honister code for
openEmbedded(revision="refs/heads/honister"), later i ran into below error,

$ bitbake -k imx-image-full
ERROR: Unable to start bitbake server (None)
ERROR: Server log for this session
(/data/home/maqdam/imx_yocto_master/build/bitbake-cookerdaemon.log):
--- Starting bitbake server pid 6315 at 2021-11-16 10:36:44.095759 ---
ERROR: ParseError at
/data/home/maqdam/imx_yocto_master/sources/meta-openembedded/meta-oe/conf/layer.conf:106:
unparsed line: 'DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image = "
${PTESTTESTSUITE}"'


Tried updating the bitbake layer(poky) to master/honister in
similar fashion, Later seeing the below error in
meta-imx/meta-bsp/conf/layer.conf file.

$ bitbake -k imx-image-full
ERROR: Variable FSL_EULA_FILE_MD5SUMS_append contains an operation using
the old override syntax. Please convert this layer/metadata before
attempting to use with a newer bitbake.


I could not find how to use FSL_EULA_FILE_MD5SUMS_append with the latest
bitbake.
Request you to suggest how can i use this master/honister code of
openEmbedded & with which version of bitbake.

Thanks,
Aqdam

--000000000000d7a6a505d0e1a280
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif">Hi There,</sp=
an><br><font face=3D"arial, sans-serif"><br></font><span style=3D"font-fami=
ly:arial,sans-serif">I am working on a yocto image for the imx8 board, for =
this I have created a project with zeus layers for all layers(including met=
a-imx) using the below manifest file.</span><br><blockquote style=3D"margin=
:0px 0px 0px 40px;border:none;padding:0px"><font face=3D"arial, sans-serif"=
><code style=3D"border-radius:0px;background-image:none;background-position=
:initial;background-size:initial;background-repeat:initial;background-origi=
n:initial;background-clip:initial;border:0px;float:none;height:auto;line-he=
ight:20px;margin:0px;outline:0px;overflow:visible;padding:0px;vertical-alig=
n:baseline;width:auto;box-sizing:content-box;font-size:14px;min-height:inhe=
rit;white-space:nowrap;color:rgb(0,0,0)">repo init -u https:</code><code st=
yle=3D"border-radius:0px;background-image:none;background-position:initial;=
background-size:initial;background-repeat:initial;background-origin:initial=
;background-clip:initial;border:0px;float:none;height:auto;line-height:20px=
;margin:0px;outline:0px;overflow:visible;padding:0px;vertical-align:baselin=
e;width:auto;box-sizing:content-box;font-size:14px;min-height:inherit;white=
-space:nowrap;color:rgb(0,0,0)">//source</code><code style=3D"border-radius=
:0px;background-image:none;background-position:initial;background-size:init=
ial;background-repeat:initial;background-origin:initial;background-clip:ini=
tial;border:0px;float:none;height:auto;line-height:20px;margin:0px;outline:=
0px;overflow:visible;padding:0px;vertical-align:baseline;width:auto;box-siz=
ing:content-box;font-size:14px;min-height:inherit;white-space:nowrap;color:=
rgb(0,0,0)">.<a href=3D"http://codeaurora.org/" target=3D"_blank">codeauror=
a.org</a></code><code style=3D"border-radius:0px;background-image:none;back=
ground-position:initial;background-size:initial;background-repeat:initial;b=
ackground-origin:initial;background-clip:initial;border:0px;float:none;heig=
ht:auto;line-height:20px;margin:0px;outline:0px;overflow:visible;padding:0p=
x;vertical-align:baseline;width:auto;box-sizing:content-box;font-size:14px;=
min-height:inherit;white-space:nowrap;color:rgb(0,0,0)">/external/imx/imx-m=
anifest</code><span style=3D"color:rgb(51,51,51);font-size:14px;white-space=
:nowrap">=C2=A0</span><code style=3D"border-radius:0px;background-image:non=
e;background-position:initial;background-size:initial;background-repeat:ini=
tial;background-origin:initial;background-clip:initial;border:0px;float:non=
e;height:auto;line-height:20px;margin:0px;outline:0px;overflow:visible;padd=
ing:0px;vertical-align:baseline;width:auto;box-sizing:content-box;font-size=
:14px;min-height:inherit;white-space:nowrap;color:rgb(0,0,0)">-b imx-linux-=
zeus -m imx-5.4.47-2.2.0.xml</code></font></blockquote><font face=3D"arial,=
 sans-serif"><br></font><span style=3D"font-family:arial,sans-serif">I am t=
rying to fetch master/</span><span style=3D"font-family:arial,sans-serif;co=
lor:rgb(51,51,51);font-size:14px">honister</span><span style=3D"font-family=
:arial,sans-serif;color:rgb(51,51,51);font-size:14px">=C2=A0code of openEmb=
edded on my existing=C2=A0project(Earlier i was using Zeus branch) to use l=
atest modules of perl(</span><span style=3D"font-family:arial,sans-serif;co=
lor:rgb(51,51,51);font-size:14px">5.34.0)</span><span style=3D"font-family:=
arial,sans-serif;color:rgb(51,51,51);font-size:14px">,=C2=A0</span><span st=
yle=3D"font-family:arial,sans-serif;color:rgb(51,51,51);font-size:14px">chr=
ony(4.1)</span><span style=3D"font-family:arial,sans-serif;color:rgb(51,51,=
51);font-size:14px">=C2=A0&amp; gpsd(</span><a href=3D"http://layers.openem=
bedded.org/layerindex/recipe/1120/" target=3D"_blank" style=3D"color:rgb(51=
,122,183);font-family:arial,sans-serif;box-sizing:border-box;text-decoratio=
n-line:none;font-size:14px">gpsd 3.23.1</a><span style=3D"font-family:arial=
,sans-serif">)</span><font color=3D"#333333" style=3D"font-family:arial,san=
s-serif"><span style=3D"font-size:14px">, by modifying .repo/manifests/</sp=
an></font><span style=3D"font-family:arial,sans-serif;color:rgb(0,0,0);font=
-size:14px;white-space:nowrap">imx-5.4.47-2.2.0.xml</span><span style=3D"fo=
nt-family:arial,sans-serif">=C2=A0with master/</span><span style=3D"font-fa=
mily:arial,sans-serif;color:rgb(51,51,51);font-size:14px">honister code for=
=C2=A0</span><span style=3D"font-family:arial,sans-serif;color:rgb(51,51,51=
);font-size:14px">openEmbedded(</span>revision=3D&quot;refs/heads/honister&=
quot;<span style=3D"font-family:arial,sans-serif;color:rgb(51,51,51);font-s=
ize:14px">), later</span><span style=3D"font-family:arial,sans-serif">=C2=
=A0i ran into below error,</span><br><font face=3D"arial, sans-serif"><br><=
/font><blockquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px"=
><div><div><font face=3D"arial, sans-serif">$ bitbake -k imx-image-full</fo=
nt></div></div><div><div><font face=3D"arial, sans-serif">ERROR: Unable to =
start bitbake server (None)</font></div></div><div><div><font face=3D"arial=
, sans-serif">ERROR: Server log for this session (/data/home/maqdam/imx_yoc=
to_master/build/bitbake-cookerdaemon.log):</font></div></div><div><div><fon=
t face=3D"arial, sans-serif">--- Starting bitbake server pid 6315 at 2021-1=
1-16 10:36:44.095759 ---</font></div></div><div><div><font face=3D"arial, s=
ans-serif">ERROR: ParseError at /data/home/maqdam/imx_yocto_master/sources/=
meta-openembedded/meta-oe/conf/layer.conf:106: unparsed line: &#39;DEFAULT_=
TEST_SUITES:pn-meta-oe-ptest-image =3D &quot; ${PTESTTESTSUITE}&quot;&#39;<=
/font></div></div></blockquote><span style=3D"font-family:arial,sans-serif"=
>=C2=A0</span><br><span style=3D"font-family:arial,sans-serif">Tried updati=
ng the bitbake layer(poky) to master/honister in similar=C2=A0fashion, Late=
r seeing the below error in meta-imx/meta-bsp/conf/layer.conf file.</span><=
br><blockquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px"><f=
ont face=3D"arial, sans-serif">$ bitbake -k imx-image-full<br></font><font =
face=3D"arial, sans-serif">ERROR: Variable FSL_EULA_FILE_MD5SUMS_append con=
tains an operation using the old override syntax. Please convert this layer=
/metadata before attempting to use with a newer bitbake.</font></blockquote=
><font face=3D"arial, sans-serif"><br></font><span style=3D"font-family:ari=
al,sans-serif">I could not find how to use FSL_EULA_FILE_MD5SUMS_append wit=
h the latest bitbake.</span><br><span style=3D"font-family:arial,sans-serif=
">Request you to suggest how can i use this master/</span><span style=3D"fo=
nt-family:arial,sans-serif;color:rgb(51,51,51);font-size:14px">honister</sp=
an><span style=3D"font-family:arial,sans-serif;color:rgb(51,51,51);font-siz=
e:14px">=C2=A0code of openEmbedded &amp; with which version of bitbake.</sp=
an><br><font color=3D"#333333" face=3D"arial, sans-serif"><span style=3D"fo=
nt-size:14px"><br></span></font><span style=3D"font-family:arial,sans-serif=
;color:rgb(51,51,51);font-size:14px">Thanks,</span><br><span style=3D"font-=
family:arial,sans-serif;color:rgb(51,51,51);font-size:14px">Aqdam</span><br=
></div>

--000000000000d7a6a505d0e1a280--

