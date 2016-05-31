Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0760F6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 02:00:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4V20G8M020347
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 May 2016 19:00:16 -0700 (PDT)
Received: from [128.224.162.144] (128.224.162.144) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 30 May 2016 19:00:15 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1464595294.git.Qi.Chen@windriver.com>
	<9697a509e56ad274d52f6d82866adfddd0a3d484.1464595294.git.Qi.Chen@windriver.com>
	<574C1A78.3090706@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <574CF026.6060203@windriver.com>
Date: Tue, 31 May 2016 10:00:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <574C1A78.3090706@linux.intel.com>
X-Originating-IP: [128.224.162.144]
Subject: Re: [PATCH 1/1] webkitgtk: disable gobject-introspection on mips64
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
X-List-Received-Date: Tue, 31 May 2016 02:00:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/30/2016 06:48 PM, Alexander Kanavin wrote:
> On 05/30/2016 11:02 AM, Chen Qi wrote:
>> Disable gobject-introspection on mips64 to avoid do_compile failure.
>> +
>> +# qemu: uncaught target signal 6 (Aborted) - core dumped
>
> Please add the actual error before the above line:
>
> | WebKit2-4.0: ../../libgpg-error-1.21/src/posix-lock.c:119: 
> get_lock_object: Assertion `!"sizeof lock obj"' failed.
>
> I just checked that updating libgpg-error to 1.22 does not help.
>
> Alex

Hi Alex,

I've added the comment and updated the remote branch.

Best Regards,
Chen Qi

