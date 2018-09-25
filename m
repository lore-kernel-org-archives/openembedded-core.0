Return-Path: <vladzouth@gmail.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id DA90E793A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 15:38:45 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id o72-v6so6482354ita.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=yz3vcXaUArRbFcIw9wfPC6yjg1N8UAv4hhSF0GB2rnA=;
	b=Q3X4BE9OLhF7/UuIGk55Tgb3vGE7SlsY99sSelUchcdqhbtC2tcP4fvygy4zAov2dB
	RHspOpDp2egZ7r18OCJqhkqji4fSyWgcxwp3cF/UCoG8NgLm6M3difgKsKqBnJXwb1fD
	vpU2CuUm6XZIPwBsHnSzhU8+dC0VOzs3orwh4jDwihaWYif3iJ58ObRDiTse+8BY5anw
	6QKBwaPY42E8OsTqmh9gwZjEr/FqWfPvxnAu8aLMwzdRNq7d1oAFhm7t+ucd5du6Bu+5
	p44bElSYDicW2RlJgkpi60WLlOVymdm0JBmDTPkSCnVWPgdGr4pjYRmca0VB1zuXbUcC
	SmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yz3vcXaUArRbFcIw9wfPC6yjg1N8UAv4hhSF0GB2rnA=;
	b=h6YutgebludECwp7sReH4F7R/qJ1/0Kl++wNlEweKTEAyaJHb2uEM2MFmunHvcxDGv
	jrkTpmAbmDUYPg9e0ONyjuzENkN9HgG82NYC0wcCFUoapWIyCZa7+hej4iWJwcZfyyxS
	2DpsrZ9yX1cBnVRd9WS+vIZW3sn/5zuAtSlRO/zdF44x7lgujfQuLVAW+rak5ELFrEYG
	9tonWgKwsZqbuZvWW9589wo8c4BmJ/feimByEYHXLGpm7q86LIHKqblLeQGjM4s0X+pC
	SFhAlhy/RtmNv2DLHeIYUMjtz3Cio82hqKlZeob9QaACQZUXmN2hAGHLNug16fLlfZZH
	b9QQ==
X-Gm-Message-State: ABuFfoh0vwen4AdX1yK+a2erorFRfUCoXTQspx5tMBMBj4Rshy0zvttm
	+kl0zVOl+/NmWIKAPyzkaGDTGKy2e2Ke1yemdUNpznZ4
X-Google-Smtp-Source: ACcGV60vhmFOUZtPfh1LEg4yhyJBcOatOIiXkz+d1jcH+WUBA5OcpDnU1qzZzY5U2yb7QWUbLj/tjQuP+zLPDsdOYI4=
X-Received: by 2002:a02:b14a:: with SMTP id
	s10-v6mr1505537jah.38.1537889926807; 
	Tue, 25 Sep 2018 08:38:46 -0700 (PDT)
MIME-Version: 1.0
From: vlad zouth <vladzouth@gmail.com>
Date: Tue, 25 Sep 2018 17:38:35 +0200
Message-ID: <CACoJdSaps5eNgnacWstY=wzzoZWCPW7bVjGy2PbA4AfQrzYGvg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: error : QA Issue: libpqxx.pc failed sanity test (tmpdir) in path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2018 15:38:47 -0000
Content-Type: multipart/alternative; boundary="000000000000ca84410576b3e6e6"

--000000000000ca84410576b3e6e6
Content-Type: text/plain; charset="UTF-8"

hi, i would like to build libpqxx (https://github.com/jtv/libpqxx
<https://community.nxp.com/external-link.jspa?url=https%3A%2F%2Fgithub.com%2Fjtv%2Flibpqxx>)
for my karo target(TX6S-8035). i use karo BSP (
https://github.com/karo-electronics/meta-karo
<https://community.nxp.com/external-link.jspa?url=https%3A%2F%2Fgithub.com%2Fkaro-electronics%2Fmeta-karo>).
i am facing some issue( error : QA Issue: libpqxx.pc failed sanity test
(tmpdir) in path). Anyone can help me fix this. thanks in advance. Here is
my libpqxx.bb file (https://pastebin.com/LcjrM47S
<https://community.nxp.com/external-link.jspa?url=https%3A%2F%2Fpastebin.com%2FLcjrM47S>)
and my log.do_populate_sysroot file (https://pastebin.com/Ny2UT6yn
<https://community.nxp.com/external-link.jspa?url=https%3A%2F%2Fpastebin.com%2FNy2UT6yn>
)



Best Reagrds,

vladzouth

--000000000000ca84410576b3e6e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin:0px;padding:0px;border:0px;font-size:15=
px;font-family:arial,helvetica,&quot;helvetica neue&quot;,verdana,sans-seri=
f;vertical-align:baseline;color:rgb(81,98,111)">hi, i would like to build=
=C2=A0<span style=3D"margin:0px;padding:0px;border:0px;font-weight:700;font=
-style:inherit;font-family:inherit;vertical-align:baseline">libpqxx</span>=
=C2=A0(<a class=3D"gmail-jive-link-external-small" href=3D"https://communit=
y.nxp.com/external-link.jspa?url=3Dhttps%3A%2F%2Fgithub.com%2Fjtv%2Flibpqxx=
" rel=3D"nofollow" target=3D"_blank" style=3D"margin:0px;padding-top:0px;pa=
dding-bottom:0px;padding-left:0px;border:0px;font-weight:inherit;font-style=
:inherit;font-family:inherit;vertical-align:baseline;color:rgb(61,156,231);=
text-decoration-line:none">https://github.com/jtv/libpqxx</a>) for my karo =
target(<span style=3D"margin:0px;padding:0px;border:0px;font-weight:700;fon=
t-style:inherit;font-family:inherit;vertical-align:baseline">TX6S-8035</spa=
n>). i use karo BSP (<a class=3D"gmail-jive-link-external-small" href=3D"ht=
tps://community.nxp.com/external-link.jspa?url=3Dhttps%3A%2F%2Fgithub.com%2=
Fkaro-electronics%2Fmeta-karo" rel=3D"nofollow" target=3D"_blank" style=3D"=
margin:0px;padding-top:0px;padding-bottom:0px;padding-left:0px;border:0px;f=
ont-weight:inherit;font-style:inherit;font-family:inherit;vertical-align:ba=
seline;color:rgb(61,156,231);text-decoration-line:none">https://github.com/=
karo-electronics/meta-karo</a>). i am facing some issue( error : QA Issue: =
libpqxx.pc failed sanity test (tmpdir) in path). Anyone can help me fix thi=
s. thanks in advance. Here is my <a href=3D"http://libpqxx.bb">libpqxx.bb</=
a> file (<a class=3D"gmail-jive-link-external-small" href=3D"https://commun=
ity.nxp.com/external-link.jspa?url=3Dhttps%3A%2F%2Fpastebin.com%2FLcjrM47S"=
 rel=3D"nofollow" target=3D"_blank" style=3D"margin:0px;padding-top:0px;pad=
ding-bottom:0px;padding-left:0px;border:0px;font-weight:inherit;font-style:=
inherit;font-family:inherit;vertical-align:baseline;color:rgb(61,156,231);t=
ext-decoration-line:none">https://pastebin.com/LcjrM47S</a>) and my log.do_=
populate_sysroot file (<a class=3D"gmail-jive-link-external-small" href=3D"=
https://community.nxp.com/external-link.jspa?url=3Dhttps%3A%2F%2Fpastebin.c=
om%2FNy2UT6yn" rel=3D"nofollow" target=3D"_blank" style=3D"margin:0px;paddi=
ng-top:0px;padding-bottom:0px;padding-left:0px;border:0px;font-weight:inher=
it;font-style:inherit;font-family:inherit;vertical-align:baseline;color:rgb=
(61,156,231);text-decoration-line:none">https://pastebin.com/Ny2UT6yn</a>)<=
/p><p style=3D"margin:0px;padding:0px;border:0px;font-size:15px;font-family=
:arial,helvetica,&quot;helvetica neue&quot;,verdana,sans-serif;vertical-ali=
gn:baseline;color:rgb(81,98,111);min-height:8pt">=C2=A0</p><p style=3D"marg=
in:0px;padding:0px;border:0px;font-size:15px;font-family:arial,helvetica,&q=
uot;helvetica neue&quot;,verdana,sans-serif;vertical-align:baseline;color:r=
gb(81,98,111)">Best Reagrds,</p><p style=3D"margin:0px;padding:0px;border:0=
px;font-size:15px;font-family:arial,helvetica,&quot;helvetica neue&quot;,ve=
rdana,sans-serif;vertical-align:baseline;color:rgb(81,98,111)">vladzouth</p=
></div>

--000000000000ca84410576b3e6e6--
