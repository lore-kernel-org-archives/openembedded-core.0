Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4461A77C5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 11:04:06 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 04:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,190,1488873600"; d="scan'208";a="88146446"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 12 Apr 2017 04:04:06 -0700
To: openembedded-core@lists.openembedded.org
References: <1491994341-28659-1-git-send-email-zhixiong.chi@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <33fa170a-78d8-a65e-856b-72989dd566ee@linux.intel.com>
Date: Wed, 12 Apr 2017 14:03:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491994341-28659-1-git-send-email-zhixiong.chi@windriver.com>
Subject: Re: [PATCH] gnome-common: add EXTRA_OECONF "--with-autoconf-archive"
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
X-List-Received-Date: Wed, 12 Apr 2017 11:04:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2017 01:52 PM, Zhixiong Chi wrote:
> At the same time, set the RDEPENDS for gnome-common.
> --- a/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
> +++ b/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
> +RDEPENDS_${PN} = "autoconf-archive"

You cannot make oe-core recipes depend on recipes from other layers.

You probably need to patch autoconf-archive instead, or bring it into 
oe-core, or check why we need gnome-common in oe-core and if it can be 
moved out.

Alex


