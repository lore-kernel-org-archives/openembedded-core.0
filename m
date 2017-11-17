Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F3B0E787A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 07:09:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 23:09:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,407,1505804400"; 
   d="scan'208";a="6007083"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 16 Nov 2017 23:09:51 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
	<20171114145754.9643-18-alexander.kanavin@linux.intel.com>
	<CAJTo0LZLK6THGLwVAgZBaH0JZjyUukipy+LvTXWGHcn2cmaOrw@mail.gmail.com>
	<CAJTo0Lb6_qzWqbCRk7tw=GwZJfgn+S=bjU2Eo_z49SJ7f+uqLQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <099c23c0-0db0-59ba-fc1b-b1516721245a@linux.intel.com>
Date: Fri, 17 Nov 2017 09:10:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb6_qzWqbCRk7tw=GwZJfgn+S=bjU2Eo_z49SJ7f+uqLQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/27] psmisc: update to 23.0
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
X-List-Received-Date: Fri, 17 Nov 2017 07:09:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/17/2017 02:35 AM, Burton, Ross wrote:
> This fixes the build:
> 
> EXTRA_AUTORECONF=""
> do_configure_prepend() {
>      ( cd ${S} && po/update-potfiles )
> }

Thanks for looking! I admit I try to avoid becoming better at autotools :)

There's also the question of me being the de facto maintainer of jku's 
recipes, which means I cut corners a bit more than I otherwise would.

Alex

