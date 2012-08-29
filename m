Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6lg3-0002IM-FP
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 19:03:39 +0200
Received: by wibhn17 with SMTP id hn17so816186wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 09:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=eEmRvd/n/JmHJHTb7a35Z3/WBVhYLlYie/0iTRjjeZg=;
	b=ME4WyITy/+pqopFVLMwPrz39l4zs5Rzq1qqNqYcqsJxzPg7TxKGiRCL8+0jBBOz8oi
	G6mfhhUlCGc82Z41X4/rkOXOMjvZXy6UMVj+OggPjegc9qD9+4ULDb+eGWPKmU1JsPX9
	8Atbjdh/gtxuIQJZfDfELyZDiJeA3pk2RG/wmOjaKBs7REr7F5XR9efyUmFkcw44hmAL
	Vdupxz2EX70A25tihwu7NIqEknI5cx1zuFFZfN/QhU+XLlQefzZ7/jywR2aAXOIse9Cz
	VGAazJGaZFz3SnsoEDtNOXm7kuuCE4KCY0LbApbn1P5y9vi3RDxYRlY6Hi2NKzpEQyk8
	7nLg==
Received: by 10.180.97.33 with SMTP id dx1mr4908906wib.18.1346259085331;
	Wed, 29 Aug 2012 09:51:25 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id eu4sm11043478wib.2.2012.08.29.09.51.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 09:51:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
Date: Wed, 29 Aug 2012 18:51:23 +0200
Message-Id: <92175252-0A9C-401F-87F5-751E4CFB8611@dominion.thruhere.net>
References: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQmeEwCiLuTU/oFVlDonGHMNIJA9k7PZv3599iP8Q+9xA9aTqCsIMP26b7VyVwL7J2Ii957n
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] xserver-xorg: ship the exa module in a separate package
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
X-List-Received-Date: Wed, 29 Aug 2012 17:03:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 aug. 2012, om 17:53 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> EXA is used by some Xorg video drivers, it doesn't need to be shipped =
unless
> it's being used.  Note that it's dynamically loaded so the automatic =
library
> dependencies won't catch this, but as far as I'm aware nothing on =
oe-core or
> meta-oe is using EXA.

FWIW, the idea of those subpackages was to split every module out, but I =
haven't kept up with xorg modules for some years now.=


