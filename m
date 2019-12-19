Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id A49987FDE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 11:36:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2019 03:36:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,331,1571727600"; d="scan'208";a="218149963"
Received: from brzodkie-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.172])
	by orsmga006.jf.intel.com with ESMTP; 19 Dec 2019 03:36:54 -0800
To: openembedded-core@lists.openembedded.org
References: <20191219051543.20185-1-alistair@alistair23.me>
	<20191219051543.20185-2-alistair@alistair23.me>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <42acb127-07f7-8457-2f20-d8ce4c82e264@intel.com>
Date: Thu, 19 Dec 2019 11:36:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191219051543.20185-2-alistair@alistair23.me>
Subject: Re: [PATCH v2 2/2] mesa: Upgrade to 19.3.0
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
X-List-Received-Date: Thu, 19 Dec 2019 11:36:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 19/12/2019 05:15, Alistair Francis wrote:
> Upgrade mesa to 19.3 and refresh the patches.
> 
> As MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in [1] we are going
> to change the do_install and add a patch to libepoxy to use the new
> define.

I just remembered last night that a Mesa .0 release isn't intended for use:

"Mesa 19.3.0 is released. This is a new development release. See the 
release notes for mor information about this release."

19.3.1 was just released, we should ship that and change the version 
checking regex to skip .0 releases.

Ross

