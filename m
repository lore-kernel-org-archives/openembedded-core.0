Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id ADAD360778
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 10:51:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 08 Jun 2017 03:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,314,1493708400"; d="scan'208";a="271733857"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2017 03:51:03 -0700
To: Ismo Puustinen <ismo.puustinen@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170607134942.13281-1-ismo.puustinen@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <75435a83-d29b-4b68-3e27-90746b31c970@linux.intel.com>
Date: Thu, 8 Jun 2017 13:51:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170607134942.13281-1-ismo.puustinen@intel.com>
Subject: Re: [PATCH v2] python3: make readline, gdbm, and db support conditional.
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
X-List-Received-Date: Thu, 08 Jun 2017 10:51:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2017 04:49 PM, Ismo Puustinen wrote:
> The three libraries' (readline, gdbm, and db) licenses belong to the
> GPLv3 family. Add them to to PACKAGECONFIG so they can be switched off
> if the licensing doesn't allow using them. Python build system
> autodetects the dependencies but doesn't allow them to be explicitly
> disabled, so just deal with the dependencies.

db should be taken out from this patch, it's no longer a gplv3 concern 
now that we're providing db 5.x only :)

Alex


