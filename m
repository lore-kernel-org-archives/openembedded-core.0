Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2F746730B6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 08:41:16 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2017 00:41:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,200,1484035200"; d="scan'208";a="68571095"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 24 Feb 2017 00:41:16 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
	<82576a21b491938531cbbba58160459b91ec6960.1487774787.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LYeRPDGFjL2113ciF7sN9F2o1iap8e5Z_m8b4LPpL3GbQ@mail.gmail.com>
	<CAMKF1squEy9GvqMPCGBtNg06frrW1csujShZMX2fq06rrruX+Q@mail.gmail.com>
	<CAJTo0LZdyMYg6cc2LffwTuvFvSDZ74_FWi+X5qTox-0g5MzbsQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0cf7176e-d6e5-9f12-ea37-644793bca533@linux.intel.com>
Date: Fri, 24 Feb 2017 10:40:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZdyMYg6cc2LffwTuvFvSDZ74_FWi+X5qTox-0g5MzbsQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/24] libiconv: remove recipe
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
X-List-Received-Date: Fri, 24 Feb 2017 08:41:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2017 01:04 AM, Burton, Ross wrote:
>     > ERROR: Nothing PROVIDES 'virtual/nativesdk-libiconv' (but
>     > virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-extras/build/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>     <http://gettext_0.19.8.1.bb>
>     > DEPENDS on or otherwise requires it)
>
>     It seems that nativesdk-glibc is not providing it. We
>     should fix that
>
>
> Oh, this was with  SDKMACHINE = "i686-mingw32" which likely makes a
> difference but it's too late for me to make an informed opinion. :)

Must be. Compiling nativesdk-gettext works perfectly fine on plain poky, 
so it's mingw stuff that needs to be fixed (or take libiconv recipe if 
they need it).

Alex


