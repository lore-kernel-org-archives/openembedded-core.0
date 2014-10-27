Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A05D265D4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 02:09:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9R296aH000522
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Oct 2014 19:09:06 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 26 Oct 2014 19:09:05 -0700
Message-ID: <544DA93F.4010501@windriver.com>
Date: Mon, 27 Oct 2014 10:09:03 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1414131798.git.Chong.Lu@windriver.com>
	<a7d924a83ec81fcff71ba17281c892f1f3778495.1414131798.git.Chong.Lu@windriver.com>
	<CAJTo0LY_TALpKFyeFtV-wUOVHhkJxwLTy2VYTgUiGb56gXkEdQ@mail.gmail.com>
In-Reply-To: <CAJTo0LY_TALpKFyeFtV-wUOVHhkJxwLTy2VYTgUiGb56gXkEdQ@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] kmod: fix debuginfo is missing in shared library
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
X-List-Received-Date: Mon, 27 Oct 2014 02:09:10 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/24/2014 07:08 PM, Burton, Ross wrote:
>
> On 24 October 2014 07:25, Chong Lu <Chong.Lu@windriver.com 
> <mailto:Chong.Lu@windriver.com>> wrote:
>
>     +++ b/meta/recipes-kernel/kmod/kmod/run-ptest
>     @@ -1,3 +1,4 @@
>      #!/bin/sh
>      touch testsuite/stamp-rootfs
>     +tar xf testmodule.tar
>      make -k runtest-TESTS 2>/dev/null| grep -e ^PASS -e ^FAIL
>
>
> We should to make sure that the ptest scripts clean up after 
> themselves, so can you change this to delete the modules after the 
> test has ran?
>
> Ross

OK, I will send a V2.

Best Regards
Chong

