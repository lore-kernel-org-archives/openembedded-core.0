Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 481836FFED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 13:27:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2018 05:27:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,440,1511856000"; d="scan'208";a="26938060"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2018 05:27:17 -0800
To: "Burton, Ross" <ross.burton@intel.com>,
	Hongxu Jia <hongxu.jia@windriver.com>
References: <cover.1517383469.git.hongxu.jia@windriver.com>
	<2966cc751ff78de85ebac9776f78204c3cea0267.1517383469.git.hongxu.jia@windriver.com>
	<CAJTo0LZo4a195YP24GeLY_wGj4uUEBtu2-QDXj=L594KExZV7Q@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8b00918e-df88-20ef-6d44-f3850021039d@linux.intel.com>
Date: Wed, 31 Jan 2018 15:27:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZo4a195YP24GeLY_wGj4uUEBtu2-QDXj=L594KExZV7Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] gpgme: 1.9.0 -> 1.10.0
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
X-List-Received-Date: Wed, 31 Jan 2018 13:27:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/31/2018 02:28 PM, Burton, Ross wrote:
> On 31 January 2018 at 07:48, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
> 
>     1. Disable test at build time to workaround corss-compile
> 
> 
> Looks like more tests need to be disabled:
> 
> | Making all in tests
> | make[4]: Entering directory 
> '/data/poky-tmp/master/work/corei7-64-poky-linux/gpgme/1.10.0-r0/build/lang/python/tests'
> | echo no-force-v3-sigs > ./gpg.conf
> | echo pinentry-program 
> /data/poky-tmp/master/work/corei7-64-poky-linux/gpgme/1.10.0-r0/build/../gpgme-1.10.0/tests/gpg/pinentry 
>  >gpg-agent.conf
> | gpgconf --kill all
> | echo ignore-invalid-option agent-program >> ./gpg.conf
> | /bin/bash: gpgconf: command not found
....

I think this set of failures in particular can be fixed by adding 
gnupg-native to dependencies (which is better than creating yet another 
'Inappropriate' patch that we have to carry forever).

I'd be however interested to see the successful build log from the 
submitter because I'm bit puzzled how it could succeed (probably host 
gpg was used, but I want to see details).


Alex

