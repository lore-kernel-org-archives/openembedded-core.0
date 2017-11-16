Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 640837872E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:06:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 07:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,404,1505804400"; 
   d="scan'208";a="5731470"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 16 Nov 2017 07:06:04 -0800
To: Stefan Agner <stefan@agner.ch>
References: <a316ea0c483e68f37d624e742472d248@agner.ch>
	<da5f7d07-f51c-e1f4-56dd-78e4febe9da7@linux.intel.com>
	<a4fcab328359fd5906f90c75d3d8cef0@agner.ch>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0658eacf-cf19-fd5b-6518-65e3f3f349e4@linux.intel.com>
Date: Thu, 16 Nov 2017 17:06:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <a4fcab328359fd5906f90c75d3d8cef0@agner.ch>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Error when connecting to OpenSSH server using rocko
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
X-List-Received-Date: Thu, 16 Nov 2017 15:06:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/16/2017 04:51 PM, Stefan Agner wrote:
> True, I cannot reproduce using qemuarm, but I created a ARMv7 qemu
> machine and run that using qemu-system-arm -M virt -cpu cortex-a15, and
> it did fail...
> 
> So yeah qemuarm is not affected, but pretty much every relevant 32-bit
> ARM machine out there...

openssl recipes have an architecture-specific configuration step where 
you need to specify the target machine by hand. I strongly *suspect* we 
do something incorrectly there in the 1.0 recipe for ARM machines.

I couldn't stand looking at that mess when writing 1.1, so rewrote the 
whole recipe from scratch, and it *probably* works correctly on ARM :)

Alex

