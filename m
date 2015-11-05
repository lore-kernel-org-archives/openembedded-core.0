Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B18E175D22
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 01:28:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA51SpP5026455
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 4 Nov 2015 17:28:56 -0800
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 4 Nov 2015 17:28:51 -0800
To: <mariano.lopez@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1446623061.git.mariano.lopez@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <563AB0D2.4000305@windriver.com>
Date: Thu, 5 Nov 2015 09:28:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1446623061.git.mariano.lopez@linux.intel.com>
Subject: Re: [PATCH 0/3] Delete WORKDIR/installed_pkgs.txt after use
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
X-List-Received-Date: Thu, 05 Nov 2015 01:28:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/04/2015 03:50 PM, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>
> These changes will delete the file installed_pkgs.txt once it used.
> This file is used internally for complementary package installation
> but it was left there after the use. This file was causing some
> confusion and shouldn't be left there after the installation process

The installed_pkgs.txt is very useful as a reference when we want to know
which pkgs are installed, there is no other easy way to know.

// Robert

>
> The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:
>
>    build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib mariano/bug8444
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8444
>
> Mariano Lopez (3):
>    runtime/_ptest.py: Delete WORKDIR/installed_pkgs.txt
>    rootfs.py: Stop using installed_pkgs.txt
>    package_manager.py: Delete installed_pkgs.txt file
>
>   meta/lib/oe/package_manager.py  |  1 +
>   meta/lib/oe/rootfs.py           | 24 +++++++++---------------
>   meta/lib/oeqa/runtime/_ptest.py |  2 ++
>   3 files changed, 12 insertions(+), 15 deletions(-)
>

