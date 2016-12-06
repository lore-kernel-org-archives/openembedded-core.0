Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FF5E719B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 09:01:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB6913Jq018603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 6 Dec 2016 01:01:04 -0800
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Dec 2016 01:01:02 -0800
To: Randy Witt <randy.e.witt@linux.intel.com>, Nathan Rossi
	<nathan@nathanrossi.com>
References: <cover.1481014270.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <b54c6e1b-dfb8-2753-74ff-ce42b65db95b@windriver.com>
Date: Tue, 6 Dec 2016 17:01:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1481014270.git.liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/6] runqemu: fix for slirp, network device and hostfwd
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
X-List-Received-Date: Tue, 06 Dec 2016 09:01:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2016 04:55 PM, Robert Yang wrote:
> * V2
>   - Add QB_NETWORK_DEVICE to set network device for both slirp and tap,
>     the idea is from Randy and Nathan.

Add Randy and Nathan in the loop, I had added them in git send-email,
but there were not in the CC list, look strange.

// Robert

>   - Use different mac sections for slirp and tap to fix conflicts when
>     running both of them on the same host.
>
> * V1
>   - Initial version
>
> The following changes since commit 11063a01d4511b2688ea7ba2d7359e4e07328c66:
>
>   ruby: upgrade to 2.3.1 (2016-11-30 15:47:17 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu
>
> Robert Yang (6):
>   scripts/runqemu: fix checking for <file>.cpio.gz
>   qemuboot.bbclass: use IMGDEPLOYDIR
>   runqemu-export-rootfs: fix inconsistent var names
>   runqemu: support mutiple qemus running when nfs
>   runqemu: fixes for slirp, network device and hostfwd
>   qemuboot.bbclass: add blank lines in comments
>
>  meta/classes/qemuboot.bbclass              |  34 ++++++--
>  meta/conf/machine/include/qemuboot-x86.inc |   1 -
>  meta/conf/machine/qemuarm64.conf           |   1 -
>  scripts/runqemu                            | 133 ++++++++++++++++++++++-------
>  scripts/runqemu-export-rootfs              |  21 ++---
>  5 files changed, 140 insertions(+), 50 deletions(-)
>

