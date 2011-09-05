Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R0bkv-0006r7-JL
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 18:10:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Sep 2011 09:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,334,1312182000"; d="scan'208";a="48266258"
Received: from unknown (HELO helios.localnet) ([10.252.120.53])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2011 09:05:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Denis Carikli <denis@eukrea.com>
Date: Mon, 5 Sep 2011 17:05:38 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1315237881-14077-1-git-send-email-denis@eukrea.com>
In-Reply-To: <1315237881-14077-1-git-send-email-denis@eukrea.com>
MIME-Version: 1.0
Message-Id: <201109051705.38793.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: import the configuration from openembedded.dev
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
X-List-Received-Date: Mon, 05 Sep 2011 16:10:41 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 05 September 2011 16:51:21 Denis Carikli wrote:
> Without that patch many applets are not build, like for instance
>   mdev, which could be necessary for building certain images.

So, leaving aside the problems of replacing the config file with one from an 
older version and disabling some options that are currently enabled, the 
specific issue of mdev has already been discussed:

http://patches.openembedded.org/patch/5247/

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


