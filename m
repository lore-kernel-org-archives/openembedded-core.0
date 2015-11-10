Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 641B176294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 15:17:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 10 Nov 2015 07:17:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="682208628"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 10 Nov 2015 07:17:55 -0800
Message-ID: <56420AE4.1090500@linux.intel.com>
Date: Tue, 10 Nov 2015 17:19:00 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
	<5641FF6D.7000508@linux.intel.com>
	<3967262.YS5vrjTqP1@peggleto-mobl.ger.corp.intel.com>
	<564207E6.9090409@linux.intel.com>
	<CAJTo0LYdyoLGS6ws1nKzagF=osJ7d1hdc+FdTOh_bAoeD2sqSQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYdyoLGS6ws1nKzagF=osJ7d1hdc+FdTOh_bAoeD2sqSQ@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 15:17:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2015 05:10 PM, Burton, Ross wrote:

>     I should clarify: there might be Vala software out there that
>     someone would want to run in an embedded context. And that software
>     might require Vala bindings for libraries that are in oe-core. If we
>     don't provide those bindings, then either the layer that adds vala
>     recipe also has to patch all of our oe-core recipes, or (worse!) the
>     person who needs something vala-based also has to ad-hoc-patch the
>     dependency recipes of that.
>
>
> One solution for no vala in oe-core would be for all vala-supporting
> recipes in oe-core to have a PACKAGECONFIG[vala], so if someone does
> want Vala then they just need to add meta-vala (for example) to their
> layers and enable the PACKAGECONFIGs where they want it enabled.
> There's plenty of prior art for this behaviour in oe-core already.


PACKAGECONFIG alone is not sufficient; to build the bindings properly, 
the package also needs to inherit vala.bbclass:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/classes/vala.bbclass?h=akanavin/gobject-introspection-experimental


Alex

