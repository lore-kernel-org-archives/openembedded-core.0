Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0837BC48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 10:57:07 +0000 (UTC)
Received: from 9.mo576.mail-out.ovh.net (9.mo576.mail-out.ovh.net [46.105.56.78])
 by mx.groups.io with SMTP id smtpd.web10.10225.1708599421930396080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 02:57:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 46.105.56.78, mailfrom: jonathan@joggee.fr)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.9.167])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4TgVT75syGz12Cv
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 10:56:59 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-8lkbc (unknown [10.111.174.164])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 158891FDED
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 10:56:58 +0000 (UTC)
Received: from joggee.fr ([37.59.142.109])
	by ghost-submission-6684bf9d7b-8lkbc with ESMTPSA
	id YZUXK3oo12VsXwAAXHu1FA
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 10:56:58 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-109S003d87a43ad-8b67-4ac0-a257-24d5571267a4,
                    E407E47ED49E569083FEF8E37332128B6290E831) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 209.85.161.49
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-59fe5b77c0cso850411eaf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 02:56:58 -0800 (PST)
X-Gm-Message-State: AOJu0YygENByJiYHh4iaTjbFrWjeTo3vwCZbyfXlgN6ZbMsyN9oz7OyS
	ZMJRRRDEamCKHCF2Vt+fORJrb4rUZGMpBs9D1d3A8E1jYi9fw/G6gcoRrbw/7heLAk4dSqBTh1o
	R2H5YRlwRbeoPgxKdUbJ41YenBt4=
X-Google-Smtp-Source: AGHT+IHpX/uTT2WzK/xGoDyZJ9BkId9Xq6XzHTrlYsPnzzEK4Eal+TB/JMcshsxARJCJD8tVSJmnGjmU/hLpJvqZs3Y=
X-Received: by 2002:a4a:9bde:0:b0:5a0:395a:2127 with SMTP id
 b30-20020a4a9bde000000b005a0395a2127mr51473ook.5.1708599417002; Thu, 22 Feb
 2024 02:56:57 -0800 (PST)
MIME-Version: 1.0
References: <CZ977GGGE9KN.16KHH2G2CQ1NJ@joggee.fr> <d3665f861467336a8c697f7994336de892a4192b.camel@linuxfoundation.org>
 <CAA_hxbT3dpkX0yxEiwvnvZuT3CBEZ9xQ+Q6HmeN=_YtYXq-3Kg@mail.gmail.com>
In-Reply-To: <CAA_hxbT3dpkX0yxEiwvnvZuT3CBEZ9xQ+Q6HmeN=_YtYXq-3Kg@mail.gmail.com>
From: Jonathan GUILLOT <jonathan@joggee.fr>
Date: Thu, 22 Feb 2024 11:56:47 +0100
X-Gmail-Original-Message-ID: <CAA_hxbQgEHtG1qTwTeOTRqHq8c9+zyJej3BH9Z8Bb=tw1ynL7A@mail.gmail.com>
Message-ID: <CAA_hxbQgEHtG1qTwTeOTRqHq8c9+zyJej3BH9Z8Bb=tw1ynL7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/package: fix LOCALE_PATHS scan to create
 locale packages
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/mixed; boundary="0000000000005084df0611f64d4d"
X-Ovh-Tracer-Id: 2916925187532917883
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrfeeggddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfhgjhfffkffuvfevtgesmhdtreertddtjeenucfhrhhomheplfhonhgrthhhrghnucfifgfknffnqffvuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeeggeeuvdeifeetjeeikeekgefgueeltdelgfefleejveettedttdekgfdvveefieenucffohhmrghinheprghlihgrshdrihhtnecukfhppeduvdejrddtrddtrddupddvtdelrdekhedrudeiuddrgeelpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehjohhnrghthhgrnhesjhhoghhgvggvrdhfrhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 10:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196016

--0000000000005084df0611f64d4d
Content-Type: multipart/alternative; boundary="0000000000005084de0611f64d4b"

--0000000000005084de0611f64d4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have attached a patch (as an example) recreating the same
glibc-locale-locale.alias package but it is really weird to me. Is there a
glibc locale expert to help?

Regards,
Jonathan

Le mar. 20 f=C3=A9vr. 2024 =C3=A0 10:45, Jonathan GUILLOT <jonathan@joggee.=
fr> a
=C3=A9crit :

> Without any of my modifications, it seems that glibc-locale recipe create=
s
> a glibc-locale-locale.alias package containing only the file
> /usr/share/locale/locale.alias. It looks like the same issue revealed wit=
h
> the CUPS recipe. Do you know in which package locale.alias file is expect=
ed
> to be located?
>
> Regards,
> Jonathan
>
> Le mar. 20 f=C3=A9vr. 2024 =C3=A0 08:42, Richard Purdie <
> richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
>> ERROR: glibc-locale-2.39+git-r0 do_package: QA Issue: glibc-locale:
>> Files/directories were installed but not shipped in any package:
>>   /usr/share/locale/locale.alias
>> Please set FILES such that these items are packaged. Alternatively if
>> they are unneeded, avoid installing them or delete them within do_instal=
l.
>>
>

--0000000000005084de0611f64d4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have attached a patch (as an example) recreating th=
e same=20
 glibc-locale-locale.alias package but it is really weird to me. Is there a=
 glibc locale expert to help?</div><div><br></div><div>Regards,</div><div>J=
onathan<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Le=C2=A0mar. 20 f=C3=A9vr. 2024 =C3=A0=C2=A010:45, Jonatha=
n GUILLOT &lt;<a href=3D"mailto:jonathan@joggee.fr">jonathan@joggee.fr</a>&=
gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div>Without any of my modifications, it seems tha=
t glibc-locale recipe creates a glibc-locale-locale.alias package containin=
g only the file /usr/share/locale/locale.alias. It looks like the same issu=
e revealed with the CUPS recipe. Do you know in which package locale.alias =
file is expected to be located?<br></div><div><br></div><div>Regards,</div>=
<div>Jonathan<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Le=C2=A0mar. 20 f=C3=A9vr. 2024 =C3=A0=C2=A008:42, Richard=
 Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D=
"_blank">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
ERROR: glibc-locale-2.39+git-r0 do_package: QA Issue: glibc-locale: Files/d=
irectories were installed but not shipped in any package:<br>
=C2=A0 /usr/share/locale/locale.alias<br>
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.<br>
</blockquote></div></div>
</blockquote></div>

--0000000000005084de0611f64d4b--

--0000000000005084df0611f64d4d
Content-Type: application/octet-stream; name="glibc-locale.patch"
Content-Disposition: attachment; filename="glibc-locale.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lsx3wcio0>
X-Attachment-Id: f_lsx3wcio0

ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjLWxvY2FsZS5pbmMgYi9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy1sb2NhbGUuaW5jCmluZGV4IDI4OWY1OGQ0ZGYu
LjVlN2FiYWExYzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjLWxv
Y2FsZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMtbG9jYWxlLmluYwpA
QCAtMjgsNyArMjgsNyBAQCBMT0NBTEVfR0VORVJBVElPTl9XSVRIX0NST1NTLUxPQ0FMRURFRiA9
ICIxIgogCiBQUk9WSURFUyA9ICJ2aXJ0dWFsL2xpYmMtbG9jYWxlIgogCi1QQUNLQUdFUyA9ICJs
b2NhbGVkZWYgJHtQTn0tZGJnIgorUEFDS0FHRVMgPSAibG9jYWxlZGVmICR7UE59LWRiZyAke1BO
fS1sb2NhbGUtbG9jYWxlLmFsaWFzIgogCiBQQUNLQUdFU19EWU5BTUlDID0gIl5sb2NhbGUtYmFz
ZS0uKiBcCiAgICAgICAgICAgICAgICAgICAgIF5nbGliYy1nY29udi0uKiBeZ2xpYmMtY2hhcm1h
cC0uKiBeZ2xpYmMtbG9jYWxlZGF0YS0uKiBeZ2xpYmMtYmluYXJ5LWxvY2FsZWRhdGEtLiogXApA
QCAtNjEsNiArNjEsNyBAQCBERVNDUklQVElPTjpsb2NhbGVkZWYgPSAiZ2xpYmM6IGNvbXBpbGUg
bG9jYWxlIGRlZmluaXRpb24gZmlsZXMiCiAjIEV4cGxpY2l0bHkgYWRkICR7TUxQUkVGSVh9IGZv
ciBGSUxFUzpnbGliYy1nY29udi4KIEZJTEVTOiR7TUxQUkVGSVh9Z2xpYmMtZ2NvbnYgPSAiJHts
aWJkaXJ9L2djb252LyoiCiBGSUxFUzpsb2NhbGVkZWYgPSAiJHtiaW5kaXJ9L2xvY2FsZWRlZiIK
K0ZJTEVTOiR7UE59LWxvY2FsZS1sb2NhbGUuYWxpYXMgPSAiJHtkYXRhZGlyfS9sb2NhbGUvbG9j
YWxlLmFsaWFzIgogCiBMT0NBTEVUUkVFU1JDID0gIiR7Q09NUE9ORU5UU19ESVJ9LyR7UEFDS0FH
RV9BUkNIfS9nbGliYy1zdGFzaC1sb2NhbGUiCiAK
--0000000000005084df0611f64d4d--

