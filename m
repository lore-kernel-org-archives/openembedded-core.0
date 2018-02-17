Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 7359271C7A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 13:34:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Feb 2018 05:35:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,525,1511856000"; d="scan'208";a="201883592"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 17 Feb 2018 05:34:58 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
	<20180216115147.2869fdf2@seebsdell>
	<CA+chaQf=OMV60V7S=C6zaJ3sd_FwQkiojKY5EqAb6gTxXAQmXw@mail.gmail.com>
	<20180216132531.3a1c2398@seebsdell>
	<60cc88e3-577e-de47-e5da-b3cf93c74a2c@linux.intel.com>
	<CA+chaQdGobLWVzZ_YSpdWozrF3ZrYzBNAVusUMFgGFbAX+w90w@mail.gmail.com>
	<CA+chaQeNhb=nPaYz3XZdh_ceQopFKJvEq5Ximu83PykTjoHJWA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bb8be581-a074-b05b-86c6-71e1ee19fdfa@linux.intel.com>
Date: Sat, 17 Feb 2018 15:28:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeNhb=nPaYz3XZdh_ceQopFKJvEq5Ximu83PykTjoHJWA@mail.gmail.com>
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
X-List-Received-Date: Sat, 17 Feb 2018 13:34:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02/17/2018 02:03 PM, Martin Jansa wrote:
>  > Without this change (pseudo at 'Handle O_TMPFILE more better') things 
> work flawlessly, with epoll enabled.
> 
> Your 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/pseudo-1.9.0 
> is using this change with SRCREV b6a015aa91d7ab84c2f5466f3b5704f501129cbc.
> 
> Does it mean that the change you sent to the ML doesn't work flawlessly 
> and to make it work you need to downgrade SRCREV 
> from b6a015aa91d7ab84c2f5466f3b5704f501129cbc 
> to 23f089f480e04ca1b88df8fe1f46b864fee2a0b8 (while I did upgrade 
> from b6a015aa91d7ab84c2f5466f3b5704f501129cbc 
> to 26e30fa2e1a0fe4e885d7eea3f55d23cd2c3158f after Seebs reply)?
> 
> docker-shr @ ~/projects/pseudo $ git log --oneline yp/master  | head -n 5
> 26e30fa Allow closing client 0
> b6a015a Handle O_TMPFILE more better
> 23f089f Fix openat flag #ifdef typo
> 449c234 Half-undo FASTOP
> d107418 1.9.0

For me, with epoll enabled:

b6a015a works
23f089f and 26e30fa both lock up

Without epoll:

b6a015a works
23f089f produces fd errors
26e30fa wasn't tried.

So I left the poky-contrib branch at the commit where things work, at 
least for me.

Alex

