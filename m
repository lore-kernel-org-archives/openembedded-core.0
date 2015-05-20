Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 321FC601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 15:23:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 20 May 2015 08:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,464,1427785200"; d="scan'208";a="713138391"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site) ([10.237.68.142])
	by fmsmga001.fm.intel.com with ESMTP; 20 May 2015 08:23:36 -0700
Message-ID: <555CA719.5080508@linux.intel.com>
Date: Wed, 20 May 2015 18:24:09 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1432064457-15895-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1432064457-15895-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] midori: fix build with GLib 2.44
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
X-List-Received-Date: Wed, 20 May 2015 15:23:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/19/2015 10:40 PM, Ross Burton wrote:
> GLib 2.44 introduced a GListStore type which is ambiguous with GtkListStore when
> using wildcard using statements.  Use the full type name to fix builds.
>

Midori is already at 0.5.10 upstream; if it's compatible with the webkit 
currently in oe-core, maybe it's better to update to the latest version?

When the new webkit patches are ready, I'll definitely pull in the 
latest midori as well.

Alex

