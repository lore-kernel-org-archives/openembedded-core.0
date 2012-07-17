Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sr7xz-0006Oi-9c
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 15:37:31 +0200
Received: by weyr6 with SMTP id r6so255193wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 06:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=VMNO3OVIbrZShk238M9X6U7DWrIgZfudz30aQGWCRsA=;
	b=Me0FopsLxPtKiibowT2oQGsjS6o+5fvNYmYjaSMmPFicH9Vmk7/mtHAm04uvWgs+OQ
	xYgXha7e6PfY2zv3gFK3DUX5g7HHv/6vPf5XLq0T5qk4fMgGHm7vxaqCnXqGlScA1VQJ
	iV7+pwYGExXcuycdom1H+qYqExR+bwpvGmG2UJVEO5hm8UKXZV4gV7lbxWzggq/QoeE8
	IMyz9LwOvfvzoPFf8fJtgZfshuU4/xtkfCdrWkT10ITxXZBKnbtHKxjiGZJxsGBASAls
	Fn17rcpgMqVqTP7EZPN4zzcAF3OOIjGSFTugQGlWWAPbYI1H7GQhFjJcanJ14WZJuOkr
	ndhg==
Received: by 10.216.154.69 with SMTP id g47mr1469130wek.171.1342531571922;
	Tue, 17 Jul 2012 06:26:11 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id ep14sm27771412wid.0.2012.07.17.06.26.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 06:26:11 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1342519612-24566-1-git-send-email-alexandru.damian@intel.com>
Date: Tue, 17 Jul 2012 15:26:06 +0200
Message-Id: <522F00C1-E54D-4588-9B05-982CCCCB1AAB@dominion.thruhere.net>
References: <1342519612-24566-1-git-send-email-alexandru.damian@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlnfz+Xz9hfD8x6fOkKvHzPAVCs9djMA22iIX8rICTZLcGHxADqsJmAl5cE5+NXMlLBseqQ
Subject: Re: [PATCH] udev: upgrade to 182
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 13:37:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 17 jul. 2012, om 12:06 heeft Alex DAMIAN het volgende geschreven:

> From: Alexandru DAMIAN <alexandru.damian@intel.com>
> 
> This is the final upgrade of udev. Futher upgrades will only
> come in conjunction with systemd.
> 
> The v4l1 removal patch is deprecated as the bug is fixed inside udev.
> There is a new patch fixing the path for default sh interpreter.
> New debug binaries are generated, and udev.inc is modified to package
> those correctly.
> The install locations changed for udevd and udevadm, so the scripts
> are updated accordingly.

Have you compared this to the udev 182 recipe in meta-oe?


