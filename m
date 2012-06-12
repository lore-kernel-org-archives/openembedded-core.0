Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SeT8g-0002VW-2D
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 17:36:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jun 2012 08:25:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="151978231"
Received: from unknown (HELO helios.localnet) ([10.252.120.143])
	by orsmga001.jf.intel.com with ESMTP; 12 Jun 2012 08:25:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Tue, 12 Jun 2012 16:25:36 +0100
Message-ID: <2704914.5qldZ3P3Ag@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-24-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <CAMZjud3vpBnst6PWtSq-io+5CPZZdCCM7whOOSWbi9YCzbE7sQ@mail.gmail.com>
References: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1so7Y_ccRi_RcfjRzzbska1WRbY7N8w=VuN=aFp-U5oYSw@mail.gmail.com>
	<CAMZjud3vpBnst6PWtSq-io+5CPZZdCCM7whOOSWbi9YCzbE7sQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] strace: update to 4.7
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
X-List-Received-Date: Tue, 12 Jun 2012 15:36:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 12 June 2012 18:13:35 Marinescu, Bogdan A wrote:
> On Tue, Jun 12, 2012 at 4:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > You have to build it on uclibc to see if you can drop this patch or not.
> 
> Thanks for your reply. I built with uclibc and the build succeeded.
> Not sure how to test it though. Is there a 'standard' image that I can
> build in order to test? I tried core-image-lsb, but it fails with an
> error.

Any core-image-* would do e.g. core-image-minimal, and you could just use 
CORE_IMAGE_EXTRA_INSTALL += "strace" in your local.conf to have strace 
installed in the image by default for the purpose of doing this test.

Cheers,
Paul 

-- 

Paul Eggleton
Intel Open Source Technology Centre


