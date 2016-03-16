Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 066A4612E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 21:52:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Mar 2016 14:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,346,1455004800"; d="scan'208";a="935494309"
Received: from ajayaram-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.130.46])
	by orsmga002.jf.intel.com with ESMTP; 16 Mar 2016 14:52:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, "Burton,
	Ross" <ross.burton@intel.com>
Date: Thu, 17 Mar 2016 10:52:22 +1300
Message-ID: <4132846.MxUMxyiN00@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.4-301.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <CAJTo0LaGJyuoNL7V=y1+tCWWZQV1DuNAEeQSfoTgkieGrNRkLA@mail.gmail.com>
References: <cover.1458096408.git.dengke.du@windriver.com>
	<7f65eb60b218d156262f426460a2873ecdb32a14.1458096408.git.dengke.du@windriver.com>
	<CAJTo0LaGJyuoNL7V=y1+tCWWZQV1DuNAEeQSfoTgkieGrNRkLA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] nativesdk-coreutils: a lot of warnings fixed
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
X-List-Received-Date: Wed, 16 Mar 2016 21:52:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 16 Mar 2016 21:30:35 Burton, Ross wrote:
> On 16 March 2016 at 02:49, Dengke Du <dengke.du@windriver.com> wrote:
> > When we create nativesdk-coreutils, a lot of warnings appear,it
> > show many files can't find.
> 
> I don't think anywhere where nativesdk packages are used actually runs the
> postinst scripts to create the alternative links, so maybe we should be
> stopping update-alternatives do anything in nativesdk (just like it doesn't
> do anything for native)?

Actually I checked this by adding a dummy line which creates a file in $D to 
the dbus postinst and then adding nativesdk-dbus to buildtools-tarball - it 
seems that the postinst does actually get run. As long as the postinst can 
successfully run at SDK construction time then apparently it should work.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

