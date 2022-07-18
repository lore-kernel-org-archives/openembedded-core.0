Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4ACC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 18:44:03 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web08.31283.1658169834176256557
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 11:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm3
 header.b=TL+7ujjn;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.29, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 88E9D5C0136
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 14:43:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute2.internal (MEProxy); Mon, 18 Jul 2022 14:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1658169833; x=1658256233; bh=icJDViOtBt
	lVPSivJCOFYhtOR1J5hHVXP1zSocg0wEY=; b=TL+7ujjnGngHc7dGkS/c/tLtcV
	bnFVvhKA6JB3yH7V0ePJ1ZLUI65zNXoccxdHbZ71QYmBuME24jrM7Nyf78xCxIzG
	nyaYveNILiNMgj+SW4/ISYpJxqreSDsGd5wUvCBxmBQg3l0uBAx5RVzYN/Wn9bsm
	3Ei2YzEKm2jIEdi5U4zGIG+ltFYKvm8199Ujrypj2V+ZCLpIzswXuTQMZdiDjhfR
	sjLJ2DH7l8Jf7ghQncg4/oFkaDh75ftxquL830thzjm/AUzQ/JGUDSFq7uqz9ptI
	eI0cHc2qUobT1IN90ow0meDZbRFSAKOS5DLzX5Ax+4RIUOJQthX/+EAflx5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658169833; x=1658256233; bh=icJDViOtBtlVPSivJCOFYhtOR1J5
	hHVXP1zSocg0wEY=; b=QQZhehLEmRt0K4vJQ9vttkeSO2z9pyMuTNk6IbxQg1Y9
	WAFbbMMVFX74fBNS8iOZAiAxlvBmoHoSsq5jVoCmvaiML08s3yAG/02eRcdbnLx0
	+TX9vIjl+WyX7zuoIlYyxlFDP3ltXIgF2OSh7v+u0Y0n/xpFEWqPWdkTPfQJOH5X
	2KUexyJLnigMG683+PczqQiJJa19jSJk8i3hmBNwhj1PGFahpRkb81I1AWY9VioZ
	SR1G/b/igxCnsB1GFVMtZaZvrfUtRosscPZ3Ha1cAByyo2bh/Y+d1DFlXS4zy7wv
	qDEQPd12KTWg79urNjZmCqrgtCf6hG2NpwXGteRfHw==
X-ME-Sender: <xms:6anVYtGApCGAQJPn2tEy2N_eDmKqidofLBB3FrLSVj2Pt2tJguGq0A>
    <xme:6anVYiW7aGVTxbr8Djg9FzHSDk1SydjzIQDtB6Co-_BCH_e1ZJ1DSqfiJDmxVZkKv
    73EjCPKq8FaprdAdQA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesrg
    dtreerreertdenucfhrhhomhepfdfrrghvvghlucgkhhhukhhovhdfuceophgrvhgvlhes
    iihhuhhkohhffhdrnhgvtheqnecuggftrfgrthhtvghrnheptdekheeghedttedtgeefje
    fgfeetieehheettedvueekvdeiudfggffftdfhgeelnecuffhomhgrihhnpehsthhrrggt
    vgdrihhopdhgihhthhhusgdrtghomhdpohhpvghnvghmsggvugguvggurdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrvhgvlhes
    iihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:6anVYvJEN9mGSrMKfZYao-KXta1XPi9Tg0p7nDx0AqTN4LNjruuLTw>
    <xmx:6anVYjEzddSzvl2c0R4F0GmWF36Tdncy6z_1Qy4WmbIsM0NO53leiA>
    <xmx:6anVYjWWVK3bRhmEteThYtsjCRvxvIQDlfv6zLgFEbVmw3oSfdLOkA>
    <xmx:6anVYrjUu3uIRo9nfFZpgtXXBNHAfCwPQAQTrhc_NaTaNGXlPj3ugQ>
Feedback-ID: ib94946c9:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4DC0EB6007B; Mon, 18 Jul 2022 14:43:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <e648693a-caae-42f1-8469-5371c40f395e@www.fastmail.com>
In-Reply-To: 
 <CANNYZj8hWHrog59eRbZ5z0eZTA6hn9XwHrsy=MrUNOD8Me-uWA@mail.gmail.com>
References: <20220718140910.519671-1-dragos.panait@windriver.com>
 <CANNYZj8hWHrog59eRbZ5z0eZTA6hn9XwHrsy=MrUNOD8Me-uWA@mail.gmail.com>
Date: Mon, 18 Jul 2022 20:42:24 +0200
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] strace: update SRC_URI
Content-Type: multipart/alternative;
 boundary=707c3c654a2c4cd4a4c1d77fb478a1aa
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 18:44:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168251

--707c3c654a2c4cd4a4c1d77fb478a1aa
Content-Type: text/plain

I've contacted upstream. New release files (tarballs) are  missing. The issue may be fixed already. 

--
Pavel

On Mon, Jul 18, 2022, at 20:02, Alexander Kanavin wrote:
> strace.io opens fine here. Can you check again please?
> 
> Alex
> 
> On Mon, 18 Jul 2022 at 16:09, Dragos-Marian Panait
> <dragos.panait@windriver.com> wrote:
> >
> > https://strace.io is down for some time now,
> > so switching to https://github.com.
> >
> > Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
> > ---
> >  meta/recipes-devtools/strace/strace_5.18.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/strace/strace_5.18.bb b/meta/recipes-devtools/strace/strace_5.18.bb
> > index 08f0f1d27e..2bdc3519ee 100644
> > --- a/meta/recipes-devtools/strace/strace_5.18.bb
> > +++ b/meta/recipes-devtools/strace/strace_5.18.bb
> > @@ -5,7 +5,7 @@ SECTION = "console/utils"
> >  LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=59a33f0a3e6122d67c0b3befccbdaa6b"
> >
> > -SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz <https://strace.io/files/$%7BPV%7D/strace-$%7BPV%7D.tar.xz> \
> > +SRC_URI = "https://github.com/strace/strace/releases/download/v${PV}/strace-${PV}.tar.xz <https://github.com/strace/strace/releases/download/v$%7BPV%7D/strace-$%7BPV%7D.tar.xz> \
> >             file://update-gawk-paths.patch \
> >             file://Makefile-ptest.patch \
> >             file://run-ptest \
> > --
> > 2.25.1
> >
> >
> > 
> >
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168247): https://lists.openembedded.org/g/openembedded-core/message/168247
> Mute This Topic: https://lists.openembedded.org/mt/92459281/6390638
> Group Owner: openembedded-core+owner@lists.openembedded.org <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pavel@zhukoff.net]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

--707c3c654a2c4cd4a4c1d77fb478a1aa
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>I've contacted =
upstream. New release files (tarballs) are&nbsp; missing. The issue may =
be fixed already.&nbsp;<br></div><div><br></div><div>--<br></div><div>Pa=
vel</div><div><br></div><div>On Mon, Jul 18, 2022, at 20:02, Alexander K=
anavin wrote:<br></div><blockquote type=3D"cite" id=3D"qt" style=3D""><d=
iv>strace.io opens fine here. Can you check again please?<br></div><div>=
<br></div><div>Alex<br></div><div><br></div><div>On Mon, 18 Jul 2022 at =
16:09, Dragos-Marian Panait<br></div><div>&lt;<a href=3D"mailto:dragos.p=
anait@windriver.com">dragos.panait@windriver.com</a>&gt; wrote:<br></div=
><div>&gt;<br></div><div>&gt;&nbsp;<a href=3D"https://strace.io">https:/=
/strace.io</a> is down for some time now,<br></div><div>&gt; so switchin=
g to&nbsp;<a href=3D"https://github.com">https://github.com</a>.<br></di=
v><div>&gt;<br></div><div>&gt; Signed-off-by: Dragos-Marian Panait &lt;<=
a href=3D"mailto:dragos.panait@windriver.com">dragos.panait@windriver.co=
m</a>&gt;<br></div><div>&gt; ---<br></div><div>&gt;&nbsp; meta/recipes-d=
evtools/strace/strace_5.18.bb | 2 +-<br></div><div>&gt;&nbsp; 1 file cha=
nged, 1 insertion(+), 1 deletion(-)<br></div><div>&gt;<br></div><div>&gt=
; diff --git a/meta/recipes-devtools/strace/strace_5.18.bb b/meta/recipe=
s-devtools/strace/strace_5.18.bb<br></div><div>&gt; index 08f0f1d27e..2b=
dc3519ee 100644<br></div><div>&gt; --- a/meta/recipes-devtools/strace/st=
race_5.18.bb<br></div><div>&gt; +++ b/meta/recipes-devtools/strace/strac=
e_5.18.bb<br></div><div>&gt; @@ -5,7 +5,7 @@ SECTION =3D "console/utils"=
<br></div><div>&gt;&nbsp; LICENSE =3D "LGPL-2.1-or-later &amp; GPL-2.0-o=
r-later"<br></div><div>&gt;&nbsp; LIC_FILES_CHKSUM =3D "file://COPYING;m=
d5=3D59a33f0a3e6122d67c0b3befccbdaa6b"<br></div><div>&gt;<br></div><div>=
&gt; -SRC_URI =3D "<a href=3D"https://strace.io/files/${PV}/strace-${PV}=
.tar.xz">https://strace.io/files/${PV}/strace-${PV}.tar.xz</a> \<br></di=
v><div>&gt; +SRC_URI =3D "<a href=3D"https://github.com/strace/strace/re=
leases/download/v${PV}/strace-${PV}.tar.xz">https://github.com/strace/st=
race/releases/download/v${PV}/strace-${PV}.tar.xz</a> \<br></div><div>&g=
t;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; file://update-gawk-paths.patch \<br></div><div>&gt;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://Makefile-p=
test.patch \<br></div><div>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://run-ptest \<br></div><div>&gt; --=
<br></div><div>&gt; 2.25.1<br></div><div>&gt;<br></div><div>&gt;<br></di=
v><div>&gt;&nbsp;<br></div><div>&gt;<br></div><div><br></div><div><br></=
div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><div>Lin=
ks: You receive all messages sent to this group.<br></div><div>View/Repl=
y Online (#168247):&nbsp;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/message/168247">https://lists.openembedded.org/g/openembe=
dded-core/message/168247</a><br></div><div>Mute This Topic:&nbsp;<a href=
=3D"https://lists.openembedded.org/mt/92459281/6390638">https://lists.op=
enembedded.org/mt/92459281/6390638</a><br></div><div>Group Owner:&nbsp;<=
a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded.org">opene=
mbedded-core+owner@lists.openembedded.org</a><br></div><div>Unsubscribe:=
&nbsp;<a href=3D"https://lists.openembedded.org/g/openembedded-core/unsu=
b">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=
=3D"mailto:pavel@zhukoff.net">pavel@zhukoff.net</a>]<br></div><div>-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><div><br></div><div><b=
r></div></blockquote><div><br></div></body></html>
--707c3c654a2c4cd4a4c1d77fb478a1aa--

