Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 687AD73C63
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 15:25:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jun 2015 08:25:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,602,1427785200"; d="scan'208";a="726112731"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2015 08:25:08 -0700
Message-ID: <557AF9D9.7060207@linux.intel.com>
Date: Fri, 12 Jun 2015 18:25:13 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <7321ee7236ec75dd68269421edafaefc52df6a88.1434114213.git.jussi.kukkonen@intel.com>
	<92679ff5c46cdb6353aa62f8fd859f0edde6e562.1434114213.git.jussi.kukkonen@intel.com>
In-Reply-To: <92679ff5c46cdb6353aa62f8fd859f0edde6e562.1434114213.git.jussi.kukkonen@intel.com>
Subject: Re: [PATCH v2 6/6] midori: Depend on Adwaita, not gnome-icon-theme
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
X-List-Received-Date: Fri, 12 Jun 2015 15:25:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2015 04:11 PM, Jussi Kukkonen wrote:

> -RRECOMMENDS_${PN} += "glib-networking ca-certificates gnome-icon-theme"
> +RRECOMMENDS_${PN} += "glib-networking ca-certificates adwaita-icon-theme"

This should probably be moved to gtk+ recipes or gnome class; if 
most(all?) gtk+ applications need those icons, then they shouldn't have 
to list them in their own recipes.

Alex


