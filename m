Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 54915605BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 16:52:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 038F926180C
To: "Burton, Ross" <ross.burton@intel.com>
References: <1450283593-26774-1-git-send-email-joshua.lock@collabora.co.uk>
	<1450368555-20921-1-git-send-email-joshua.lock@collabora.co.uk>
	<CAJTo0LbLOLuych6csLX4gEc9ZpboknLiEj9jw6HezmshtCCcLQ@mail.gmail.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <5672E846.2080706@collabora.co.uk>
Date: Thu, 17 Dec 2015 16:52:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbLOLuych6csLX4gEc9ZpboknLiEj9jw6HezmshtCCcLQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest/wic: add test case for sparse images
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
X-List-Received-Date: Thu, 17 Dec 2015 16:52:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/12/15 16:21, Burton, Ross wrote:
>
> On 17 December 2015 at 16:09, Joshua Lock <joshua.lock@collabora.co.uk
> <mailto:joshua.lock@collabora.co.uk>> wrote:
>
>     +        used = int(runCmd("du %s | awk '{print $1}'" % path).output)
>     +        apparent = int(runCmd("du --apparent-size %s | awk '{print
>     $1}'" % path).output)
>
>
> Surely os.stat() can do this instead?

Of course it can — st_blocks is the "number of 512-byte blocks allocated 
for file" we can multiply st_blocks by 512 to get the on-disk size 
(whilst st_size is the apparent size).

https://docs.python.org/2/library/os.html#os.stat

I'll create a v2.

Joshua


