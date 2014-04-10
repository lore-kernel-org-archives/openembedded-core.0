Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 574076059B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 02:34:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3A2YdNv002666
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Apr 2014 19:34:39 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 9 Apr 2014 19:34:39 -0700
Message-ID: <5346033D.7070107@windriver.com>
Date: Thu, 10 Apr 2014 10:34:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1396633542.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1396633542.git.paul.eggleton@linux.intel.com>
Subject: Re: [dora][PATCH 0/4] Fixes backported from master
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
X-List-Received-Date: Thu, 10 Apr 2014 02:34:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Reviewed and Tested by Robert Yang <liezhi.yang@windriver.com>

// Robert


On 04/05/2014 01:46 AM, Paul Eggleton wrote:
> The following changes since commit 590c2135858bb5d0cfc375c0d82ca610550ccd4a:
>
>    Revert "buildhistory_analysis: fix error when comparing image contents" (2014-04-04 16:16:39 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/dora-next
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dora-next
>
> Paul Eggleton (2):
>    classes/kernel: move module postinst commands to kernel-base
>    classes/image: ignore modules.* changing during multilib image
>      construction
>
> Richard Purdie (2):
>    sstatesig.py: Fix image regeneration issue
>    sstatesig: Anchor inherits class tests
>
>   meta/classes/image.bbclass  | 2 +-
>   meta/classes/kernel.bbclass | 7 +++++--
>   meta/lib/oe/sstatesig.py    | 6 ++++--
>   3 files changed, 10 insertions(+), 5 deletions(-)
>

