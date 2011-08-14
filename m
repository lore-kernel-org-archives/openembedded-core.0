Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QsebU-0006sF-2V
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Aug 2011 19:36:05 +0200
Received: by wwe32 with SMTP id 32so3558149wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Aug 2011 10:31:29 -0700 (PDT)
Received: by 10.216.90.8 with SMTP id d8mr1417453wef.25.1313343088835;
	Sun, 14 Aug 2011 10:31:28 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fm9sm3922853wbb.27.2011.08.14.10.31.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Aug 2011 10:31:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <fdc4b5810c9adedea19d41a7856612201615e99c.1313328487.git.ke.yu@intel.com>
Date: Sun, 14 Aug 2011 19:31:24 +0200
Message-Id: <73BE3575-4FA5-4C20-9476-A36B9A5422D7@dominion.thruhere.net>
References: <cover.1313328487.git.ke.yu@intel.com>
	<fdc4b5810c9adedea19d41a7856612201615e99c.1313328487.git.ke.yu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/1] gcc-cross-intermediate: revise the 64bithack.patch for multilib case
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
X-List-Received-Date: Sun, 14 Aug 2011 17:36:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 14 aug. 2011, om 15:32 heeft Yu Ke het volgende geschreven:

> current gcc-cross-intermediate has build failure in qemux86-64 lib64
> multilib case. the reason is that it still use lib instead of lib64
> while do_install use the libdir i.e. lib64
> 
> so this patch fix this issue by making gcc honour the libdir.
> 
> CC: Kumar Gala <galak@kernel.crashing.org>
> CC: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Signed-off-by: Yu Ke <ke.yu@intel.com>
> ---
> meta/recipes-devtools/gcc/gcc-4.6.inc             |    2 +-
> meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch |   16 +++++++++-------

wouldn't gcc 4.5 need a similar change?


