Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 800C865E80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 14:26:09 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id a1so963346wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 07:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=k2gbKPzylYxGSCFmzKfYDerYWzWYKc/DeHEL3VopgT0=;
	b=Xoz3WSz1UXgsfsvzxi3DEmtrEm1/ildC3g/757RYIR8vavJANt4D0XDjuZwrkp511z
	9tdeDxXmIZ0fh8rXqEAlE1WNkoX+LOCo0U9g9kEU79hyWpebGoKJzoTdjb4f7Vcjo7c4
	otOXvjUnZygpMOBlatQ1abd2pnxmMW3vd3V7vy8t2MaSOH/0VzMXDwTtUWQw3bvTZoTe
	1OQjpQVr4EK41NhlahCdU6ZEdutqYXHzWSG3HrspXocNi32GCSECXFCiIt5arnZIbM1t
	BDlQzisRb0Yi3HdsknRQ7LfZ+5Vc7nhAwSZ1QXSWeFRcNPTQ73URU0kOiXpC+9bGhUAU
	c+kQ==
X-Gm-Message-State: ALoCoQlp4t5yhuD4gybg7kMDqBLfodhK7HTc5hVO3Lzl6kyvXn3Z6lsuhS6dWDWJR303dJ+YN6ga
X-Received: by 10.180.210.238 with SMTP id mx14mr13095859wic.61.1398695169203; 
	Mon, 28 Apr 2014 07:26:09 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	h19sm18085519wiw.17.2014.04.28.07.26.07 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Apr 2014 07:26:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1373547110-11539-1-git-send-email-cristian.iorga@intel.com>
Date: Mon, 28 Apr 2014 16:26:07 +0200
Message-Id: <4087F39D-2252-47C8-B596-81648E6C08FD@dominion.thruhere.net>
References: <1373547110-11539-1-git-send-email-cristian.iorga@intel.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xdg-utils: upgrade to 1.1.0-rc1
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
X-List-Received-Date: Mon, 28 Apr 2014 14:26:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 jul. 2013, om 14:51 heeft Cristian Iorga =
<cristian.iorga@intel.com> het volgende geschreven:

> This version of xdg-utils is needed by BA in order
> to associate correctly types of files with PCManFM
> file manager.
> The release cycle of xdg-utils is very slow, so this
> is the best shot of a stable version available for
> YP 1.5 release.
> As a reference, the previous stable version was released in 2007.
> Also, desktop Linux distros use this release candidate as a stable
> version, for example, Ubuntu 12.04.
>=20
> Part of the implementation of [YOCTO #2370].
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
> .../xdg-utils/{xdg-utils_1.0.2.bb =3D> xdg-utils_1.1.0-rc1.bb}  |    9 =
++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)
> rename meta/recipes-extended/xdg-utils/{xdg-utils_1.0.2.bb =3D> =
xdg-utils_1.1.0-rc1.bb} (80%)

This has been in OE-core for a while, but I do have to point out that it =
violates the version policy, it should be: 1.0.2+1.1.0-rc1=

