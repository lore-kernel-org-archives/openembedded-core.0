Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 593027FCA6;
	Mon, 20 Jan 2020 17:12:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2020 09:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="221492701"
Received: from grossi-mobl.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.38.20])
	by fmsmga008.fm.intel.com with ESMTP; 20 Jan 2020 09:12:52 -0800
To: Tim Orling <ticotimo@gmail.com>
References: <20200120115132.3618-1-ross.burton@intel.com>
	<CANx9H-BBqLtyL3g9KmzyUw1ZasginK7eQzWA8AM05R_8KJqM+g@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <b832a1d9-8713-2997-5e3d-0ce022b1f588@intel.com>
Date: Mon, 20 Jan 2020 17:12:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CANx9H-BBqLtyL3g9KmzyUw1ZasginK7eQzWA8AM05R_8KJqM+g@mail.gmail.com>
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][meta-python2] python: add 2.7.17 from oe-core
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
X-List-Received-Date: Mon, 20 Jan 2020 17:12:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 20/01/2020 17:03, Tim Orling wrote:
> First of all, a GREAT BIG THANK YOU for doing this.
> 
> ERROR: ParseError at 
> /home/ttorling/Projects/meta-python2/recipes-devtools/python/python_2.7.17.bb:1 
> <http://python_2.7.17.bb:1>: Could not include required file python.inc
> 
> Seems like python.inc is 2.7 specific and should also move? I grepped 
> for usage in poky and didn't find any.

Huh.  I wonder how my test actually worked :)

Ross


