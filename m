Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9D9496FF7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 17:32:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Feb 2018 09:32:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,520,1511856000"; d="scan'208";a="201719702"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 16 Feb 2018 09:32:39 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <43e89607-bb40-3892-6b55-0a6b3b8c729b@linux.intel.com>
Date: Fri, 16 Feb 2018 19:26:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 16 Feb 2018 17:32:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02/16/2018 06:55 PM, Martin Jansa wrote:
> Something is a bit wrong with this version:
> 
> $ du -hs update-rc.d/0.7-r5/pseudo/*
> 72K     update-rc.d/0.7-r5/pseudo/files.db
> 16K     update-rc.d/0.7-r5/pseudo/logs.db
> 0       update-rc.d/0.7-r5/pseudo/pseudo.lock
> 31G     update-rc.d/0.7-r5/pseudo/pseudo.log
> 4.0K    update-rc.d/0.7-r5/pseudo/pseudo.pid
> 0       update-rc.d/0.7-r5/pseudo/pseudo.socket
> 
> $ grep -c "tried to close client 0 (highest is 1)" 
> update-rc.d/0.7-r5/pseudo/pseudo.log
> 579655922
> 
> All pseudo processes I've seen on various servers which were building 
> with this change included got stuck until disk space run out..

Strange. On this side it worked fine up to core-image-minimal.

Alex

