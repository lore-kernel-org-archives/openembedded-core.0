Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 365E0762CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:29:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2015 08:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="533112480"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2015 08:29:46 -0700
Message-ID: <55BA4327.1050406@linux.intel.com>
Date: Thu, 30 Jul 2015 18:30:47 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
	<92e5275b2d09f7230def50f83e09e8189a28a09a.1438265949.git.alexander.kanavin@linux.intel.com>
	<20150730144327.GL2457@jama>
In-Reply-To: <20150730144327.GL2457@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 11/21] webkitgtk: add a new recipe for latest upstream version
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
X-List-Received-Date: Thu, 30 Jul 2015 15:29:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2015 05:43 PM, Martin Jansa wrote:
> On Thu, Jul 30, 2015 at 05:27:34PM +0300, Alexander Kanavin wrote:
>> Recipe for the obsolete webkit-gtk 1.8.3 is removed in a separate commit
>
> Why is it renamed from webkit-gtk to webkitgtk?

To match the name of the upstream tarball and simplify the recipe.

> That will break at least one PACKAGECONFIG:
> meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb:PACKAGECONFIG[helpbrowser]
> = "--with-webkit, --without-webkit, webkit-gtk"

I wrote a patch for that, and will send it to meta-oe later.


Alex

