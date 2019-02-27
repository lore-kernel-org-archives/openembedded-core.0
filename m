Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id 653187C828
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 17:10:22 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id v2so10312222ith.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 09:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Uvv2kXWmWwnbIuyWNT7qwdL2J3fkRh3ZATDfxX8M6zk=;
	b=jr89jLnkVip/aXP//fcOEu+W10f6PLu88DPR/X1dsG4187aYzFbnFfftknAy3uHqJf
	WyfGLNuWoRpJfVXWiLYqgxHM+AomXDf/GHXN2h+5zS5wk1bfuFiTLg/TvB4FX+p39MGM
	IE0XFeb0OrdowoOo1J2NCRjNkvHpZh1rDXHmfrWlrjJ4RyGSqWKqHTTg5iQ4ws8gGbvV
	6JxCWUR0RE+taLgpbXzLwXk7I1YY17Ar3SO5R66dLBtSmdl7dAhOGyQuIPWZ2H/vLM+S
	5Zn/Un++BfJaCaMvph0OxivJyLHJGjJZcMnKNIj4j55QyicBT546Ta/PBf7QAHqP0jr2
	k1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Uvv2kXWmWwnbIuyWNT7qwdL2J3fkRh3ZATDfxX8M6zk=;
	b=Iv7Yvba7K7XYFP5xWHQ1PEwa9E2TRxIAAkzO076vKj8y2pplsxTk8R8rwgH5WTlZIx
	xtJfjMKDLr9lO5jg0+oJBkJUUAO2hhM20Egepik6LVgxNbl4NTSaWhQo95Bc30XPkft/
	aWPQmKBtdKQAFBwck6Nh72SeDScOjX9pJvtlgk+v49YmObRj0xca+92fGUXSZlL8JuPX
	Th+s28Tdqoc6A2lI9JnmPC3XuOrJWbtOLGO6nEGHaVqE91PgV4t67b3c9ghJhI2w2c3S
	EWv4DyWietN/hYbQ370zf2OaeW2/nWgwG8MN3i70FfBzpke3VCz8GgAWi7r043FUwOhe
	Yb9Q==
X-Gm-Message-State: AHQUAuamAzgQohlggUhAkQzC5RO0berDKn2avqq5on57xsBBojHKxkk6
	My19cuJEELtXr1DjqOy/sAw5vGgonMUohkRZVAkwgqwk
X-Google-Smtp-Source: AHgI3IYICDTKHX2E0lOqP+UccPTiO0Mesw+tqlLRgxCKGoAv7pCye953oGx1Ks5MeYYwUgHYqHHuSjDihvqgk9rIXoY=
X-Received: by 2002:a02:1e13:: with SMTP id m19mr1817901jad.94.1551287422897; 
	Wed, 27 Feb 2019 09:10:22 -0800 (PST)
MIME-Version: 1.0
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 27 Feb 2019 18:10:11 +0100
Message-ID: <CAB2nKc9-EgbC729jBkNRbPPvewQUP=Th5WGEGaW-sK0aW=ThBg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>, richard.purdie@linuxfoundation.org
Subject: GO runtime crashes
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
X-List-Received-Date: Wed, 27 Feb 2019 17:10:22 -0000
Content-Type: multipart/alternative; boundary="000000000000c956d30582e33f35"

--000000000000c956d30582e33f35
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I'm trying to add node_exporter from Prometheus project to an Intel x86-64
machine.
I made the following recipe:

https://github.com/nefethael/meta-random/blob/master/recipes-connectivity/prometheus/go-nodeexporter_0.18.0.bb

node_exporter is crashing with multiple different runtime errors, so I
raised an issue on github:
https://github.com/prometheus/node_exporter/issues/1244

I just tested node_exporter binary without cross-compiling it with Yocto
and it does not crash. So now I'm stuck with it and nobody seems to
complain about golang on ML, so if there are some GO experts here to help
me on that,

Thanks,
Vincent

--000000000000c956d30582e33f35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hello everyone, <br=
></div><div><br></div><div>I&#39;m trying to add node_exporter from Prometh=
eus project to an Intel x86-64 machine.</div><div>I made the following reci=
pe:</div><div><br></div><div><a href=3D"https://github.com/nefethael/meta-r=
andom/blob/master/recipes-connectivity/prometheus/go-nodeexporter_0.18.0.bb=
">https://github.com/nefethael/meta-random/blob/master/recipes-connectivity=
/prometheus/go-nodeexporter_0.18.0.bb</a></div><div><br></div><div>node_exp=
orter is crashing with multiple different runtime errors, so I raised an is=
sue on github:</div><div><a href=3D"https://github.com/prometheus/node_expo=
rter/issues/1244">https://github.com/prometheus/node_exporter/issues/1244</=
a></div><div><br></div><div>I just tested node_exporter binary without cros=
s-compiling it with Yocto and it does not crash. So now I&#39;m stuck with =
it and nobody seems to complain about golang on ML, so if there are some GO=
 experts here to help me on that,</div><div><br></div><div>Thanks,</div><di=
v>Vincent<br></div><div><br></div></div></div></div>

--000000000000c956d30582e33f35--
