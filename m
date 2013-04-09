Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPd93-0008Ri-PA
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 20:19:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Apr 2013 11:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,441,1363158000"; d="scan'208";a="292492464"
Received: from unknown (HELO helios.localnet) ([10.255.13.195])
	by orsmga001.jf.intel.com with ESMTP; 09 Apr 2013 11:02:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 09 Apr 2013 19:02:16 +0100
Message-ID: <1491180.EIgD7lcAzZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-26-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAHUNapQLmeRw2jz=caaGk-db3UkggOLVL_MrGg_VSeJPwnL+DQ@mail.gmail.com>
References: <cover.1365517068.git.paul.eggleton@linux.intel.com>
	<CAHUNapQLmeRw2jz=caaGk-db3UkggOLVL_MrGg_VSeJPwnL+DQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Minor comment/doc fixes
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
X-List-Received-Date: Tue, 09 Apr 2013 18:19:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Trevor,

On Tuesday 09 April 2013 13:51:03 Trevor Woerner wrote:
> On Tue, Apr 9, 2013 at 10:19 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> >   git://git.openembedded.org/openembedded-core-contrib
> >   paule/layer-tweaks-core
> This is odd... I perform a:
> 
> $ git fetch --all
> 
> But I can only find a paule/layer-tweaks and not
> paule/layer-tweaks-core. Yet the http:// link works fine.
> 
> Did I set something up wrong?
> 
> $ git remote -v
> contrib git://git.pokylinux.org/poky-contrib (fetch)
> contrib git://git.pokylinux.org/poky-contrib (push)
> origin  git://git.yoctoproject.org/poky (fetch)
> origin  git://git.yoctoproject.org/poky (push)

The openembedded-core-contrib and poky-contrib repos are entirely separate. In 
this case I have two separate (but related) patchsets, one for the files in OE-
Core (paule/layer-tweaks-core in openembedded-core-contrib), and one for the 
files that are just in the poky repository (paule/layer-tweaks in poky-
contrib).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


