Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THc63-0001YV-VV
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 17:03:20 +0200
Received: by pbbro12 with SMTP id ro12so5305703pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 07:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=g1Va93V1Xw5CWcsOdoLfKBNGKUaJnhf1Pjo97Bkmdl8=;
	b=NX4FRt9UFAyHoo/alZKpsYKW93BbTmYLCFRb5QgaYws/EHHbQ096R8GHll7mdO2Tsb
	KtkLfeikLJyVXRhNtkMmH6ZmhFOgsLrsTGj7CyU7yqrPOvnL/qWkQl/9uGSNISNnCUzm
	VttxSlxLv8GiDNmglrMRjsydA7vAiCvqPBEKzP2iR6ZVglyAe1xdSH5VTb2cgZQpamyR
	545fH74x4U+SHHOSn6ZqhllghwJWYESGKmMH6NXxqU7uWeVk2zqCbshtFoF0fzyvAsqe
	6FyTGRc5Wngr5JSuXunVOy97GSJVHxnrvNNYUkIaqubfoix3gHtOT7FQdimKDXLB2r7W
	5cSw==
Received: by 10.68.141.46 with SMTP id rl14mr21007285pbb.2.1348843826168;
	Fri, 28 Sep 2012 07:50:26 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	te6sm5699106pbc.29.2012.09.28.07.50.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 07:50:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5065B5BB.6080108@windriver.com>
Date: Fri, 28 Sep 2012 07:50:24 -0700
Message-Id: <0937B10C-C996-4FBA-8901-DF3C13B629E6@gmail.com>
References: <1348485983-8294-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<1348486253.31293.28.camel@phil-desktop>
	<506054A0.6090309@intel.com>
	<1348825951.32611.30.camel@phil-desktop>
	<5065ACC4.7080505@windriver.com>
	<1348840977.32611.51.camel@phil-desktop>
	<5065B5BB.6080108@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.1498)
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Fix for dynamic linker broken offset
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
X-List-Received-Date: Fri, 28 Sep 2012 15:03:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 28, 2012, at 7:35 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:

> In my testing no.  But I never integrated it with OE, so I never ran =
the test suite Khem was referring to.

anyhow provided I have time I will try to run regressions on beagle bone =
and see what I get.=20=


