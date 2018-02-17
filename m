Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EDA1B71C42
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 11:28:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Feb 2018 03:28:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,524,1511856000"; d="scan'208";a="201871125"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 17 Feb 2018 03:28:24 -0800
To: Seebs <seebs@seebs.net>, Martin Jansa <martin.jansa@gmail.com>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
	<20180216115147.2869fdf2@seebsdell>
	<CA+chaQf=OMV60V7S=C6zaJ3sd_FwQkiojKY5EqAb6gTxXAQmXw@mail.gmail.com>
	<20180216132531.3a1c2398@seebsdell>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <60cc88e3-577e-de47-e5da-b3cf93c74a2c@linux.intel.com>
Date: Sat, 17 Feb 2018 13:22:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180216132531.3a1c2398@seebsdell>
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
X-List-Received-Date: Sat, 17 Feb 2018 11:28:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/16/2018 09:25 PM, Seebs wrote:
> On Fri, 16 Feb 2018 20:11:48 +0100
> Martin Jansa <martin.jansa@gmail.com> wrote:
> 
>> I didn't get to the logs yet, but with this change added I see many
>> do_install tasks failing with exit code '134'.
> 
> Huh, that's SIGABRT. I'll see if I can reproduce.

My experience is again radically different to that of Martin. Without 
this change (pseudo at 'Handle O_TMPFILE more better') things work 
flawlessly, with epoll enabled.

With this change (pseudo at 'Allow closing client 0), pseudo again locks 
up and goes into endless 100% CPU spin. There's nothing useful in 
pseudo.log, and it does not grow in size.

I think we need someone else to try this, perhaps on the autobuilder, to 
have more than two data points. I rebased my patch on top of latest poky 
master, but did not bump it to latest pseudo master:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/pseudo-1.9.0


Alex

