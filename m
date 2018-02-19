Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8BA6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 18:43:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 10:43:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,536,1511856000"; d="scan'208";a="202254847"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 19 Feb 2018 10:43:47 -0800
To: Seebs <seebs@seebs.net>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
	<20180216115147.2869fdf2@seebsdell>
	<CA+chaQf=OMV60V7S=C6zaJ3sd_FwQkiojKY5EqAb6gTxXAQmXw@mail.gmail.com>
	<20180216132531.3a1c2398@seebsdell>
	<60cc88e3-577e-de47-e5da-b3cf93c74a2c@linux.intel.com>
	<CA+chaQdGobLWVzZ_YSpdWozrF3ZrYzBNAVusUMFgGFbAX+w90w@mail.gmail.com>
	<CA+chaQeNhb=nPaYz3XZdh_ceQopFKJvEq5Ximu83PykTjoHJWA@mail.gmail.com>
	<bb8be581-a074-b05b-86c6-71e1ee19fdfa@linux.intel.com>
	<20180217141701.229759cf@seebsdell>
	<bb1b003e-9bd3-f438-8ae1-637500d970b5@linux.intel.com>
	<20180219115538.5081767b@seebsdell>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <51d19b57-0054-0401-b939-b51325db47f7@linux.intel.com>
Date: Mon, 19 Feb 2018 20:37:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180219115538.5081767b@seebsdell>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: update to latest master
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
X-List-Received-Date: Mon, 19 Feb 2018 18:43:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/19/2018 07:55 PM, Seebs wrote:
> This gets back to "and one of the problems with testing is that
> if I don't actually check the logs, I often don't see problems",
> because pseudo does enough internal disaster recovery that things can
> explode horribly without observable failures.
> 
> Now extracting the data.u64 value and using that consistently as the
> index. Pushed fix to master.

Thanks; with this change things seem to work again on my side. I've 
updated and force pushed the branch on poky-contrib, so please test. 
I'll be on holiday until next Tuesday.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/pseudo-1.9.0


Alex

