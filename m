Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 21D1161FB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 14:38:11 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2013 07:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,980,1363158000"; d="scan'208";a="263104634"
Received: from unknown (HELO [10.255.13.91]) ([10.255.13.91])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2013 07:38:10 -0700
Message-ID: <51D2E5D2.8050608@linux.intel.com>
Date: Tue, 02 Jul 2013 07:38:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1372457299-8340-1-git-send-email-sgw@linux.intel.com>
	<CAJTo0LYvUMKyKqLBFEHXavjgRmwAxnPY6rfwFTux2ZAdSGX0Lw@mail.gmail.com>
In-Reply-To: <CAJTo0LYvUMKyKqLBFEHXavjgRmwAxnPY6rfwFTux2ZAdSGX0Lw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] security_flags: Add the compiler and linker flags that enhance security
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
X-List-Received-Date: Tue, 02 Jul 2013 14:38:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2013 03:36 AM, Burton, Ross wrote:
> On 28 June 2013 23:08, Saul Wold <sgw@linux.intel.com> wrote:
>> These flags add addition checks at compile, link and runtime to prevent
>> stack smashing, checking for buffer overflows, and link at program start
>> to prevent call spoofing later.
>>
>> This needs to be explicitly enabled by adding the following line to your
>> local.conf:
>>
>> require conf/distro/include/security_flags.inc
>
> Will we be enabling this in Poky?
>
No we will not enable by default, but we will do builds with them 
enabled regularly to test for build failures.  They add overhead both in 
binary size and performance.

Sau!

> Ross
>
>

