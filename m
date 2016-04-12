Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9099860053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 00:53:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3C0rBVp000877
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Apr 2016 17:53:11 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Apr 2016 17:53:10 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1460085139.git.liezhi.yang@windriver.com>
	<a9ea8a660f37bbcf917c71360512ab155241114e.1460085139.git.liezhi.yang@windriver.com>
	<CAJTo0LY9PMgCJXqAL8qw=u37UyTo+o=ykzGdb8Vv_4w+5O58ag@mail.gmail.com>
	<CAJTo0LZkC4Q22PNMKnjSA97v-7T1yxvne6kraBydNS9-PVOqjQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <570C46F4.6060406@windriver.com>
Date: Tue, 12 Apr 2016 08:53:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZkC4Q22PNMKnjSA97v-7T1yxvne6kraBydNS9-PVOqjQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pbzip2: fix for rebuild
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
X-List-Received-Date: Tue, 12 Apr 2016 00:53:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2016 10:48 PM, Burton, Ross wrote:
>
> On 11 April 2016 at 15:46, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>
>     Wouldn't "oe_runmake clean" be simpler?
>
>
> Or not disabling do_configure in the recipe, as base.bbclass's do_configure
> includes an invocation to make clean.

Thanks, Andre McCurdy has sent the patch, thanks.

// Robert

>
> Ross

