Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E8BD149D8
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 17:27:02 +0000 (UTC)
Received: from h3.cmg2.smtp.forpsi.com (h3.cmg2.smtp.forpsi.com [185.129.138.188])
 by mx.groups.io with SMTP id smtpd.web11.1251.1729877215240131254
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 10:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=OEoPOgtx;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=OEoPOgtx;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.188, mailfrom: andrej.v@skyrain.eu)
Received: from skyrain.eu ([10.11.3.203])
	by cmgsmtp with ESMTPA
	id 4O5MtPmIfTNCy4O5MtZxSe; Fri, 25 Oct 2024 19:26:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1729877213; bh=njzROlWkDut0VTrTJ311GQbxcWMHSUOLVbb3PFiuU8w=;
	h=Date:Message-Id:Subject:MIME-Version:Content-Type:From:To;
	b=OEoPOgtxglq3PuaCVG5DjoHOmT0kSuphOLS48BohkXLQvGu9Y30pAW2dNOB89ni/a
	 /lB9EMeA43Ia1CX5mMb9MBwkXK7YxBYaeK/gn1Y7m7t4wb/XeBkEYPcUaXfVukwhhl
	 RgHhHi58UDVHfjX4er+Bmo3MNDFNJfehc07yjE6os1dmRzVDrH+tL3JZ2dGDI87t00
	 2T9DyFUfsCXu8k5fMXKjsxcg9SJ57E0CNhKVk5lkFjOYh+owENGVwxBC2F1BCIGvNz
	 qScP4ffojQiPyQ05+97eOt2tWBafIJ+wSUVU2Sj73R/BpIj6/iwG3U2qeFwYV2bjoF
	 iGhA8a2e95SRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1729877213; bh=njzROlWkDut0VTrTJ311GQbxcWMHSUOLVbb3PFiuU8w=;
	h=Date:Message-Id:Subject:MIME-Version:Content-Type:From:To;
	b=OEoPOgtxglq3PuaCVG5DjoHOmT0kSuphOLS48BohkXLQvGu9Y30pAW2dNOB89ni/a
	 /lB9EMeA43Ia1CX5mMb9MBwkXK7YxBYaeK/gn1Y7m7t4wb/XeBkEYPcUaXfVukwhhl
	 RgHhHi58UDVHfjX4er+Bmo3MNDFNJfehc07yjE6os1dmRzVDrH+tL3JZ2dGDI87t00
	 2T9DyFUfsCXu8k5fMXKjsxcg9SJ57E0CNhKVk5lkFjOYh+owENGVwxBC2F1BCIGvNz
	 qScP4ffojQiPyQ05+97eOt2tWBafIJ+wSUVU2Sj73R/BpIj6/iwG3U2qeFwYV2bjoF
	 iGhA8a2e95SRQ==
Date: Fri, 25 Oct 2024 19:26:52 +0200
Message-Id: <SLX9SS$38183D9630E103129BF22210DCF67086@skyrain.eu>
In-Reply-To: <0eff54fc7c7be4f7d5ea956d7209a2a93fa0aca4.camel@linuxfoundation.org>
References: =?iso-8859-1?q?=3C20241007120950=2E975803=2D1=2Dejo=40pengutronix=2Ed?=
	=?iso-8859-1?q?e=3E_=3C86710f995a94387b6246fca883d5669acef032dd=2Ecam?=
	=?iso-8859-1?q?el=40pengutronix=2Ede=3E_=3Ca30ee7e5=2Dbc6c=2D4490=2D9?=
	=?iso-8859-1?q?c10=2D2972138051b5=40skyrain=2Eeu=3E_=3C0eff54fc7c7be4?=
	=?iso-8859-1?q?f7d5ea956d7209a2a93fa0aca4=2Ecamel=40linuxfoundation?=
	=?iso-8859-1?q?=2Eorg=3E?=
Subject: Re: [OE-core] [yocto] [PATCH 0/9] busybox: cleanup and fix config 
	fragments
MIME-Version: 1.0
X-Sensitivity: 3
Content-Type: multipart/alternative;
	boundary="_=__=_XaM3_.1729877212.2A.424161.42.23144.52.42.007.1754653388"
From: "Andrej" <andrej.v@skyrain.eu>
To: richard.purdie@linuxfoundation.org
Cc: ejo@pengutronix.de,
	yocto@pengutronix.de,openembedded-core@lists.openembedded.org
X-XaM3-API-Version: V4(R2)
X-type: 0
X-SenderIP: 62.197.243.174
X-CMAE-Envelope: MS4xfMj1E2k1hCs6RMYtIis2aUnJ/hS6aqRDYpMcsg8qgCydeSg9ZFEctqGMnodzVSswrzEGlTKZFFqoMOPHgOVZSHzmMApr5TXJDF0g3IxvGrRO2OSt3bzz
 mr0pzZWKTBc6d8EXGLqF/nTcSqvG1HqL6OD0O/Vl78PUlBsYw9QU814c1d+1Oi+OSf55W8p506gtScjMcAep5b2mvHaYtvUrlPn5i90kYl8L5AUkw114tDbF
 xplzkDtvvEw1B75Xv77U7z4UYfiE+YyTEb/lHhh5UpDyFu/w3sSv0rLaEE03A7Tm652yAKfiBmk0CsZP4yzoew==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 17:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206356


--_=__=_XaM3_.1729877212.2A.424161.42.23144.52.42.007.1754653388
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


--_=__=_XaM3_.1729877212.2A.424161.42.23144.52.42.007.1754653388
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ok, I was thinking that it was done by intention, but it happened 14y ago=
&nbsp;https://github.com/openembedded/openembedded-core/commit/615a98ed9a=
021da245513790c064761a0a5a67e9 . So I guess not.&nbsp;<div><br></div><div=
>Enrico, no&nbsp;</div><div>&nbsp;problem, most&nbsp;of them could by int=
egrated into defconfig. P<span style=3D"font-size: 1em;">lease squash it =
into one commit if you're going to do it. Or let me know and I will take =
a care of it&nbsp;;).&nbsp;</span></div><div><br></div><div>Regards,&nbsp=
;</div><div>Andrej<br><div class=3D"xam-quoted-text xam-reply-text"><div>=
<br>=0A<div><span style=3D"font-family:Arial; font-size:11px; color:#5F5F=
5F;">Od</span><span style=3D"font-family:Arial; font-size:12px; color:#5F=
5F5F; padding-left:5px;">: "Richard Purdie" richard.purdie@linuxfoundatio=
n.org</span></div>=0A<div><span style=3D"font-family:Arial; font-size:11p=
x; color:#5F5F5F;">Komu</span><span style=3D"font-family:Arial; font-size=
:12px; color:#5F5F5F; padding-left:5px;">: andrej.v@skyrain.eu,"Enrico J=C3=
=B6rns" ejo@pengutronix.de</span></div>=0A<div><span style=3D"font-family=
:Arial; font-size:11px; color:#5F5F5F;">Kopie</span><span style=3D"font-f=
amily:Arial; font-size:12px; color:#5F5F5F; padding-left:5px;">: yocto@pe=
ngutronix.de, openembedded-core@lists.openembedded.org</span></div>=0A<di=
v><span style=3D"font-family:Arial; font-size:11px; color:#5F5F5F;">Datum=
</span><span style=3D"font-family:Arial; font-size:12px; color:#5F5F5F; p=
adding-left:5px;">: Fri, 25 Oct 2024 16:07:14 +0100</span></div>=0A<div><=
span style=3D"font-family:Arial; font-size:11px; color:#5F5F5F;">P=C5=99e=
dmet</span><span style=3D"font-family:Arial; font-size:12px; color:#5F5F5=
F; padding-left:5px;">: Re: [OE-core] [yocto] [PATCH 0/9] busybox: cleanu=
p and fix config fragments</span></div>=0A<br>=0A<div>On Fri, 2024-10-25 =
at 17:01 +0200, Andrej Valek via lists.openembedded.org wrote:</div><div>=
&gt; Could you please guide me to the right patch? I wasn't able to find<=
/div><div>&gt; it ;).</div><div>&nbsp;</div><div>They're listed here:</di=
v><div>&nbsp;</div><div>https://lore.kernel.org/openembedded-core/a30ee7e=
5-bc6c-4490-9c10-2972138051b5@skyrain.eu/</div><div>&nbsp;</div><div>Sorr=
y about not getting these in before the upgrade, I'm a bit</div><div>dist=
racted by the autobuilder changes and retesting the upgrade</div><div>dis=
tracted me further.</div><div>&nbsp;</div><div>The fixes there do look re=
ally good so it would be great if we could</div><div>rebase them and get =
them merged,</div><div>&nbsp;</div><div>Thanks,</div><div>&nbsp;</div><di=
v>Richard</div></div></div><br><br></div>
--_=__=_XaM3_.1729877212.2A.424161.42.23144.52.42.007.1754653388--


