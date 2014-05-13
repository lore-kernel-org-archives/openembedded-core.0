Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (unknown [209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 897E465ECB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 07:45:31 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id n15so5729276wiw.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 00:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=+7aDRPD94PU3sUR0IBQk2/3osOPoL+1tHWu7m+jH/DA=;
	b=lz4p6YAfkBIj/Pfjv9ufKFkAJpAbWGEI2J0F+E6f/F+/dIiGmHlVpNhOKfuhP7LseL
	Gff29k9K1JxsPfBTQlDnECZcMiIPQh2RPqCQW2Y95KlRcoQkLm+kLmw6c6I7/JTzTbfH
	Y22DpUJFRdSEJvAI30LX2pnHP5KzorexrLXtwO5BAhjLOAQ107ZZT2qWCjMtvgk4cXJd
	2+ExnKYB9ZmgxNTr2TlOEq6jn93tfg5epPbTcIK2YiHkQb/z5f/hxstKD7b+B8B3C4zV
	Br/6xR9f9xfNn/A1WOcgLpaT2/sSJA53Ag9h2jaouMdyYpmapDGyfidKgd1GxRoqueB3
	BTMQ==
X-Gm-Message-State: ALoCoQkd873ClC75dL1w+PrsHm7+N1xUyhDqemZGpIKq0fdB+s0hinKR+8VXS2p5uXLrSjoYHnZV
X-Received: by 10.180.107.97 with SMTP id hb1mr19735877wib.20.1399967132784;
	Tue, 13 May 2014 00:45:32 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d55c:c67d:d4e:7aee?
	([2001:610:612:0:d55c:c67d:d4e:7aee])
	by mx.google.com with ESMTPSA id bj5sm20463091wib.3.2014.05.13.00.45.31
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 May 2014 00:45:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <53710BDA.10306@mentor.com>
Date: Tue, 13 May 2014 09:45:30 +0200
Message-Id: <AA1395AD-4FF5-4EF8-ACB1-8DFDE52EB8BF@dominion.thruhere.net>
References: <53710BDA.10306@mentor.com>
To: Sean Hudson <sean_hudson@mentor.com>
X-Mailer: Apple Mail (2.1874)
Cc: yocto-announce@yoctoproject.org, yocto-bsp@yoctoproject.org,
	yocto@yoctoproject.org, openembedded-core@lists.openembedded.org,
	meta-amd@yoctoproject.org, poky@yoctoproject.org
Subject: Re: New meta-amd mailing list announcement
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
X-List-Received-Date: Tue, 13 May 2014 07:45:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 mei 2014, om 19:58 heeft Sean Hudson <sean_hudson@mentor.com> het =
volgende geschreven:

> There is a new mailing list for AMD platform/board related patches and
> discussion.
> You can sign up here: https://lists.yoctoproject.org/listinfo/meta-amd
>=20
> The meta-amd layer git repository is publicly available here:
> git://git.yoctoproject.org/meta-amd
> (cgit web interface here:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-amd/)

Your machine.conf violates good practices by setting DISTRO vars.=

