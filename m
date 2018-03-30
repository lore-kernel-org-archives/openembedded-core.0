Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3F48A746FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 10:33:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2018 03:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,381,1517904000"; d="scan'208";a="29721542"
Received: from anmitta2-mobl1.gar.corp.intel.com (HELO [10.249.69.122])
	([10.249.69.122])
	by orsmga008.jf.intel.com with ESMTP; 30 Mar 2018 03:33:23 -0700
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <33D4DBCAC5F2D74E96B07F6E7632BF7363ABF90A@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <6c9a937a-36b3-a1d7-28d6-f712c0e95427@intel.com>
Date: Fri, 30 Mar 2018 18:33:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF7363ABF90A@G08CNEXMBPEKD01.g08.fujitsu.local>
Subject: Re: question about libgcrypt
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
X-List-Received-Date: Fri, 30 Mar 2018 10:33:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ruoqin,

On 03/30/2018 06:10 PM, Zheng, Ruoqin wrote:
> Hi,
> 
> I got the following error when building wireshark 2.4.5 during do_configure,
>       ......
>      | checking for libgcrypt-config... 
> /yocto/work001/fnst/huangqy/upgrade/build/tmp/work/i586-poky-linux/wireshark/1_2.4.5-r0/recipe-sysroot/usr/bin/crossscripts/libgcrypt-config
>      | checking for LIBGCRYPT - version >= 1.4.2... ERROR: 
> /usr/bin/libgcrypt-config should not be used, use an alternative such as pkg-config
>      | ../wireshark-2.4.5/configure: line 20214: test: 
> --should-not-have-used-/usr/bin/libgcrypt-config: integer expression expected
>      | ../wireshark-2.4.5/configure: line 20217: test: 
> --should-not-have-used-/usr/bin/libgcrypt-config: integer expression expected
>      .....

You will have to change wireshark configure to use pkg-config for
libgcrypt instead of relying on binconfig file to get the version and flags.

Thanks,

Anuj

