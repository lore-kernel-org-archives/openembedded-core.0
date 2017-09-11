Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E909F78489
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 22:40:25 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 11 Sep 2017 15:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,380,1500966000"; d="scan'208";a="148035109"
Received: from nrahulx-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.25])
	by orsmga005.jf.intel.com with ESMTP; 11 Sep 2017 15:40:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Sep 2017 10:40:17 +1200
Message-ID: <2482308.N8aakNJOlD@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAJTo0LZ_FCc-VOn9f+Z=cMPioWav+TmC4z=AXDuDe_+NHW2ywg@mail.gmail.com>
References: <20170911213326.3480-1-california.l.sullivan@intel.com>
	<CA+chaQcHzfovU588PVbky_AOrmXgUrgu0qe7U+Uhe8Azh_VUVw@mail.gmail.com>
	<CAJTo0LZ_FCc-VOn9f+Z=cMPioWav+TmC4z=AXDuDe_+NHW2ywg@mail.gmail.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] initramfs-framework: bump PR and fix install-efi and setup-live modules
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
X-List-Received-Date: Mon, 11 Sep 2017 22:40:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 12 September 2017 10:10:51 AM NZST Burton, Ross wrote:
> On 11 September 2017 at 23:09, Martin Jansa <martin.jansa@gmail.com> wrote:
> 
> > > Changing arch on a package resets the incrementing PR?  Isn't that a
> > bug?
> >
> > Arch is part of the key in PR server database.
> >
> > It's not a bug, because when you have MACHINE_ARCH recipe then it's normal
> > that different MACHINEs (with different bbappends in BSP layers) have
> > different EXTENDPRAUTO, without the arch in the key, the EXTENDPRAUTO
> > would be incremented in PR server database every time you change MACHINE
> > variable. It's not ideal but better than the alternative.
> 
> Hm, true.   Edge case noted. :)

Is someone documenting all of this? I'm pretty sure this isn't the only one.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

