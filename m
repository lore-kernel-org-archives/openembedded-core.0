Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 290BA7E45D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 12:02:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 04:03:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="296910077"
Received: from roenschv-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.50.17])
	by orsmga001.jf.intel.com with ESMTP; 13 Dec 2019 04:02:57 -0800
To: openembedded-core@lists.openembedded.org
References: <CANTMPe2PGPzM=hF8DVm9d8+yzf9VbR-DQgHe-UXDGfVqSR9MbA@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <c6852be3-2662-55fa-30b4-d0542ee8b644@intel.com>
Date: Fri, 13 Dec 2019 12:02:56 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CANTMPe2PGPzM=hF8DVm9d8+yzf9VbR-DQgHe-UXDGfVqSR9MbA@mail.gmail.com>
Subject: Re: Add New recipe in custom layer.
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
X-List-Received-Date: Fri, 13 Dec 2019 12:02:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 13/12/2019 04:59, ghalib exaleap wrote:
> Hi,
> 
>     I Added a New Layer & Recipe in yocto project ( 
> *Openembedded-core* ), to add Layer & recipe i have gone through 
> following step's
> 
> 1. cloned yocto
> 2. source oe-init-build-env
> 3. bitbake-layers add-layer ../meta-<MY-LAYER>
> 4. bitbake core-image-minimal ---->  ( Here Meta layers Build's fine )
> 5. bitbake -c compile <MY-RECIPE>
> 
> In my custom Recipe <MY-RECIPE> added <MY-RECIPE>_0.1.bb <http://0.1.bb> 
> has Written following statements...
> SRC_URI = "file://Makefile \
> file://build_cross_native.sh \
>             file://COPYING \
> 
> do_compile() {
> ${WORKDIR}/build_cross_native.sh
> }
> 
> *Out-put:--*
> * what where i mentioned in SRC_URI it's coping to build a directory of 
> yocto into its recipe folder, and script also running but *it stuck*, i 
> don't know whats worg, Can any you help me to overcome this?
> * I have attached the log of this Recipes Build, if what any 
> clarification please go through that.

Without seeing what build_cross_native.sh does, no we can't help.

There's a log.do_compile in the recipe's work directory under tmp, which 
might shed some light.  It's probably waiting for you to enter something 
and didn't notice that there is no way to get input.

Ross

