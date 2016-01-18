Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3385E6FFE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 08:41:17 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l65so89570327wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 00:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Cc2KF6lyjg+zY4IUf4WBtgjEcxnQogPavuMF70cWKWQ=;
	b=rgebRGOtsfUvPwUQdaxCnqj3d3rzvA/9DRvUxWzi8FUj9TQipR+OqiTj7QZwrK72cJ
	WEQsZOp4GvGF8vltyHsXODpHQV0VAWp170xJwzRhVYQkpqCyd+PXVqesji81t9Y5tF8q
	Ts3+/Z3zP9ZxsMoNMU3IifY8de9LdEBI+VfqFTE6efg8iuRcRXuAlrGU6tGLHGthD06I
	Jift6rBeBmW3XBGiMI+0AO3Lr2QUmkI5NS1Dlhez5P4z3ltOAo/3+ISij+CDmBdTyMMR
	wLDhvTxJCyKaf0pnNv5Y7LiKwPRUs5W06msD/bnDQDbmQc/0FO+Hu/P+HtrXdo5mr3sl
	sqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=Cc2KF6lyjg+zY4IUf4WBtgjEcxnQogPavuMF70cWKWQ=;
	b=WRgWNhI7OApluOWXRHFB4JNyHk25sWX8kpALBNPPZXM8bANIyqTPIPrjKixktuDfTG
	cQDIWX6XbCHNFfmAX+t/CMNZ/CPmngdD1JG5CTbxzUNJNAE9s2QMn8S80yKjvuOVvKRZ
	9UeZVfz0dbwIzNr8hrKW5bJkupHvOwUgiR9TTeBPbtzn8cCXP25WVIMsQfHw7zu/4Ij3
	5/7LnoyUHhbjLWtfiYuJf0ycnChwLSVp1BeMnxOF/TdwM4notKHpwjMgM+6pfeLeP5HO
	x5uOkm9FNwprorMktO4b8TE0Bu2Qh6xPWX5nPfQvPI4HPz1OkSp5pf88VDqFx19yzfdz
	QEag==
X-Gm-Message-State: ALoCoQmiBO0im/bLsN0X4krMdJqtt678NrBScmHjfed81mi4+iyaqR1xDA4GffEfuSvszZlBF2AQ6P7CMHyfAUiW3spOZCYc5A==
X-Received: by 10.194.92.8 with SMTP id ci8mr22870038wjb.33.1453106477596;
	Mon, 18 Jan 2016 00:41:17 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	qs1sm22733043wjc.2.2016.01.18.00.41.16
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jan 2016 00:41:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3117\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <569CA241.20805@dresearch-fe.de>
Date: Mon, 18 Jan 2016 09:41:14 +0100
Message-Id: <F620CA2D-BA83-436A-B7D4-EA0C117154D9@dominion.thruhere.net>
References: <5698E002.5090800@dresearch-fe.de>
	<1452863169.28375.161.camel@linuxfoundation.org>
	<5698F31E.1020905@dresearch-fe.de>
	<56990180.9080407@dresearch-fe.de>
	<6AFD6AF0-3B94-44BB-BAA0-30EBB9747193@dominion.thruhere.net>
	<569CA241.20805@dresearch-fe.de>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Mailer: Apple Mail (2.3117)
Cc: Christopher Larson <clarson@kergoth.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: fido -> jethro switching problem
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
X-List-Received-Date: Mon, 18 Jan 2016 08:41:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 18 jan. 2016, om 09:28 heeft Steffen Sledz <sledz@dresearch-fe.de> =
het volgende geschreven:
>=20
> On 15.01.2016 15:29, Koen Kooi wrote:
>>> Op 15 jan. 2016 om 15:26 heeft Steffen Sledz <sledz@dresearch-fe.de> =
het volgende geschreven:
>>> It seems that all machines based on armv5e are affected.
>>=20
>> FWIW, I'm seeing the same problem. The last time it happened it was =
due to the fixup angstrom does for broken arm BSPs
>=20
> What commits do you talking about ("last time it happened")?
>=20
> =
https://github.com/Angstrom-distribution/meta-angstrom/commit/7f3d89893007=
7710dfa42150882bce60d437af7d ?
> =
https://github.com/Angstrom-distribution/meta-angstrom/commit/4b2e8ecb9a82=
109022727f6d80b8db56ae493fe8 ?
>=20
> Or something else?

Yes, those ones.=20

regards,

Koen

>=20
> --=20
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058


