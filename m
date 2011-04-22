Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QDDDw-0005EO-2d
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 12:04:28 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2011 03:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="913091574"
Received: from unknown (HELO [10.255.12.226]) ([10.255.12.226])
	by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2011 03:00:39 -0700
Message-ID: <4DB151C6.1040605@intel.com>
Date: Fri, 22 Apr 2011 03:00:38 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
	<5ef17f7591a3e53a8e21bf529d117b906fe611bb.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <5ef17f7591a3e53a8e21bf529d117b906fe611bb.1303453279.git.sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 12:12:30 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/33] cdrtools: upgrade to v3.00
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
X-List-Received-Date: Fri, 22 Apr 2011 10:04:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/22/2011 12:24 AM, Saul Wold wrote:
> From: Scott Garman<scott.a.garman@intel.com>
>
> * Addresses CVE-2003-0655
> * Fixes [YOCTO #976]
>
> Note that the license has changed to the CDDL for most utilities.
>
> Note the following discussion of distribution issues with mixing GPL
> and CDDL licenses:
>
> http://lwn.net/Articles/195167/
>
> This should not impact us at this is a -native recipe only.
>
> Recipe changes derived from OpenEmbedded.
>
> Signed-off-by: Scott Garman<scott.a.garman@intel.com>

Please skip this patch - the CDDL is a weird license and may pose 
problems for us to distribute its sstate-cache.

The problem reported in the CVE is in a particular utility within 
cdrtools that we don't need, so I'm going to resolve the security 
advisory by not packaging that file, and stick with the GPL version we 
were previously using.

Sorry for the confusion.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


