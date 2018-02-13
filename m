Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 12FF360557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 19:27:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1DJRpHC028162
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 13 Feb 2018 11:27:51 -0800
Received: from [128.224.56.223] (128.224.56.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 13 Feb 2018 11:27:39 -0800
From: Randy MacLeod <randy.macleod@windriver.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, Mark Asselstine
	<mark.asselstine@windriver.com>
References: <20180208202228.20850-1-alexander.kanavin@linux.intel.com>
Message-ID: <9e88817b-57e5-adb6-0176-9c1aa9609dce@windriver.com>
Date: Tue, 13 Feb 2018 14:27:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208202228.20850-1-alexander.kanavin@linux.intel.com>
X-Originating-IP: [128.224.56.223]
Subject: Re: [PATCH 1/3] latencytop: remove recipe
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
X-List-Received-Date: Tue, 13 Feb 2018 19:27:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-02-08 03:22 PM, Alexander Kanavin wrote:
> Last commit and release were in 2009; website is down; it's a dead project.

Add MarkA who might care/know more about latencytop than I do.


Is there another package that makes use of the kernel feature?
The kernel Kconfig has been tweaked in 2017:

    commit a34a766ff96d9e88572e35a45066279e40a85d84
    Author: Josh Poimboeuf <jpoimboe@redhat.com>
    Date:   Mon Jul 24 18:36:58 2017 -0500

      x86/kconfig: Make it easier to switch to the new ORC unwinder

and there are people updating latencytop on github last year:
    https://github.com/namhyung/latencytop/commits/master
commits on some random github page. That's shocking I know but it
does indicate that there's still interest in the tool even if the
original authors haven't been maintaining it.

../Randy


<snip>

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

