Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SvuA5-00060D-54
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 19:53:45 +0200
Received: by weyr6 with SMTP id r6so3439955wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 10:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=q37zF+4vzzHQC/KTWI/yRulVUibpehQKyPBwNCqufaY=;
	b=Tw+FWFzl6Kf5ks2Fjt4sLlXif/WjA3W3Mbx5VYesm27QhTSgZSp4AaLLszNvoZlFyM
	gYx7ncnqpKEDnkh0Z1/1tNZj5pIz0u8iOYHalytQmOZG6NoyX9NjQKeVbCyk0M/DQeG9
	00xj8WYrlCM1HbHVoX5XFiDrAE9nGVYzZ6zKQKNfHNowaWo8c0uDdLI7cxQ7XchmBsDo
	iw+G2t3pSTpP3wDKAqXo2b3/DiqC6QFqXpzdID1eVXE2gqAcGD4Bc075w4O1ZyYq8iv6
	t6d+TZAKjJjFtoqFI8twXQLtmdczUDhvZNtjUm7/69ofVw/mVzM46aAfxlXFhRD8UPD1
	Tvlg==
Received: by 10.180.14.34 with SMTP id m2mr28231946wic.21.1343670129371;
	Mon, 30 Jul 2012 10:42:09 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id z11sm25755309wiv.10.2012.07.30.10.42.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 10:42:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1343660594-16583-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 30 Jul 2012 19:42:28 +0200
Message-Id: <49266E69-88A0-4DF7-AAC0-7D8B22EF169A@dominion.thruhere.net>
References: <1343660594-16583-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmurbEsYrPB+ZLRAT4SgCkNKb0BvRR6YahRFqsYLAbULR1vvgJvRHyZc0oO6rQuJUGhVdKc
Subject: Re: [PATCH] udev-extraconf: merge with udev-extra-rules from meta-oe
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
X-List-Received-Date: Mon, 30 Jul 2012 17:53:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 jul. 2012, om 17:03 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> * license in meta-oe was MIT, in oe-core it was GPLv2, everyone fine =
with this?

Hmm, MIT to GPL is a big regression, anyway to keep MIT?=


