Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn7Y6-0006jC-G9
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 13:54:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Dec 2012 04:38:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,347,1355126400"; d="scan'208";a="238468463"
Received: from costin-desktop (HELO [10.237.105.152]) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 24 Dec 2012 04:39:38 -0800
Message-ID: <50D84D32.1040305@intel.com>
Date: Mon, 24 Dec 2012 14:40:18 +0200
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
	<1d67932d2878800a0b033b6d2349e179df566d97.1356337650.git.constantinx.musca@intel.com>
	<2A6636D5170440C9924CFC01BDED831A@intel.com>
In-Reply-To: <2A6636D5170440C9924CFC01BDED831A@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 07/15] libcroco: upgrade to 0.6.8
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
X-List-Received-Date: Mon, 24 Dec 2012 12:54:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/2012 11:13 AM, Ross Burton wrote:
> On Monday, 24 December 2012 at 08:34, Constantin Musca wrote:
>> License checksum modification due to:
>> src/cr-rgb.c: code (not license) change
> Can the checksum be moved to another file, or changed so that it only checksums the license itself?
>
> Ross
Done. I have sent a patch which changes the endline variable in order to 
checksum only the license part.

Cheers,
Constantin


