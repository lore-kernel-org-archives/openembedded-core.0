Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id A8E8D6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 08:28:14 +0000 (UTC)
Received: by wizk4 with SMTP id k4so119824667wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 01:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=AWT+oli05f7UnIGs6JESlStP1WGxS69cQTLNs/N6W0U=;
	b=M9PEXemHLoQKQvj/TXLEhL8vaJwXYA6rW/t1ltcziSyXk+4sYSkQB5A/sULjc9422x
	n0f7voQEhZc7w/EQJ1sToxGkJXmyD3olaKbq1UIYp0e9H3KRam5nc2JeOwB4vAd910mu
	An+iX1GU5pSNsLSI4zIm68lTchw4m7JhQpzWkcTjsXrQMBcAXq7Ba5Buc/fUaKIaF/VS
	rFisy7UinFRxpeIsCPLx9HYR8lPsTHvMj9UJOMFae4FLlVivrXxD6ZW8/Vf7M65vOF9Y
	Yo6jbX//IAYk7bZmsNDNpruO9UanwCZKNRGb3dhNxsdpA8egca1ANBIDm9zVFaq/ILGM
	AI4A==
X-Gm-Message-State: ALoCoQlIgkPhZlZyBZBMtdTn5OrDELEWRPKh7JLtSEdzaQPUzd80Yv0diYaGiPxbVOdMncAsIhrx
X-Received: by 10.194.156.202 with SMTP id wg10mr932222wjb.70.1428654495197;
	Fri, 10 Apr 2015 01:28:15 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a99a:eead:4d56:f5c1?
	([2001:610:612:0:a99a:eead:4d56:f5c1])
	by mx.google.com with ESMTPSA id ju2sm2325550wid.12.2015.04.10.01.28.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 Apr 2015 01:28:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6cb3f4e0e51908d8c57b74330f0fa6bcbf2cbb03.1428577515.git.jussi.kukkonen@intel.com>
Date: Fri, 10 Apr 2015 10:28:12 +0200
Message-Id: <D71B7CC5-A19B-44C6-B20C-63D2BEFFA751@dominion.thruhere.net>
References: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
	<cover.1428577515.git.jussi.kukkonen@intel.com>
	<6cb3f4e0e51908d8c57b74330f0fa6bcbf2cbb03.1428577515.git.jussi.kukkonen@intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] libepoxy: Add as GTK+ 3.16 requirement
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
X-List-Received-Date: Fri, 10 Apr 2015 08:28:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 9 apr. 2015, om 14:16 heeft Jussi Kukkonen =
<jussi.kukkonen@intel.com> het volgende geschreven:
>=20
> Libepoxy is a OpenGL function pointer management library required by
> GTK 3.16.

Slightly related to libepoxy: what is your opinion on a patch like this: =
https://github.com/Angstrom-distribution/meta-angstrom/commit/b6b079e79044=
1b3d926e9dff931b4be59b79b987 ?
I needed it for xf86-video-ati, but it does good things for most GL =
drivers, the exception being xf86-video-intel.

regards,

Koen=

