Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TOjZu-0004RJ-Sx
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 08:27:35 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so7076539pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=ss8UlIyw3nAyWMcP+TYR4uxzIXUFCbhlS1Q2LXb4N98=;
	b=JlxqtIIgaKPlva/MeTBeLepzVmTIZVHgwrvm+rW11AZDUVZo0u+adjO+eR6kiynkkN
	+K/g+1L8wxq4IoMBWxWT9sqLiiN1aUJO93PZsEuCoEK+uc0oaAkTbSkCOcLqg2m3YJbI
	d7DTM3U2CrjBTgNeWiO3LBf/kUZE2ZDea8+fSbp1JM0liILiWFwEt+aut4oNiizMcckx
	TOOxBd5zXo9AvXw5ooZBrB2T1M2HiHqeanrymPr92e9HT7n6C+B8mTbSWXvRZq3yo3RO
	4wizRL3AZAs4QSXccHREcm8MWgTTq/LLITsorLOzkLS7yuPcfL5palNiILfL65+K1Wgo
	8n+g==
Received: by 10.66.85.233 with SMTP id k9mr56328516paz.73.1350540855089;
	Wed, 17 Oct 2012 23:14:15 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	qv4sm12367328pbc.38.2012.10.17.23.14.13 (version=SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 23:14:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
Date: Wed, 17 Oct 2012 23:14:26 -0700
Message-Id: <7A2134DD-519C-4FFB-ACEE-8E36E7A5A088@gmail.com>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
To: Yashpal Dutta <yashpal.dutta@freescale.com>
X-Mailer: Apple Mail (2.1499)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cryptodev kernel module recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2012 06:27:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Oct 18, 2012, at 2:57 AM, Yashpal Dutta <yashpal.dutta@freescale.com> =
wrote:

> +-install:
> ++modules_install:
> + 	make -C $(KERNEL_DIR) SUBDIRS=3D`pwd` modules_install
> +-	@echo "Installing cryptodev.h in /usr/include/crypto ..."
> +-	@install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
> ++	@echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto =
..."
> ++	@install -D crypto/cryptodev.h =
$(PREFIX)/usr/include/crypto/cryptodev.h
> +=20

why is it installing linux headers under /usr/include shouldn't they be =
under usr/include/linux ?=


