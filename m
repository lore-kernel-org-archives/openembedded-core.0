Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD7571A60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 03:15:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAU3FAoJ015502
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Nov 2016 19:15:10 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 29 Nov 2016 19:15:10 -0800
To: <openembedded-core@lists.openembedded.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>,
	Mike Looijmans <mike.looijmans@topic.nl>, Patrick
	Ohly <patrick.ohly@intel.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <25721f64-19ae-7998-7e64-5e7a165347eb@windriver.com>
Date: Wed, 30 Nov 2016 11:15:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1479871728.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/2] fix can't login when debug-tweaks is not in IMAGE_FEATURES
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
X-List-Received-Date: Wed, 30 Nov 2016 03:15:13 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

According to the discussions, here are things that we may do,
please feel free to give your comments.
1) Add an image feature like "production", which will conflict with
    debug-tweaks, and check for some common security issues ?

2) Add a way like ROOT_PASSWD to let user can set root passwd easily ?

3) Do nothing, leave it as the current status.

// Robert

On 11/23/2016 03:49 PM, Robert Yang wrote:
> Fixed 2 bugs:
> - Can't login as root when debug-tweaks/empty-root-password is not in
>   IMAGE_FEATURES since no passwd.
> - When set root passwd and debug-tweaks/empty-root-password is in
>   IMAGE_FEATURES, passwd is *required* to login.
>
> Filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=10710, and
> marked doc changes required as yes.
>
> // Robert
>
> The following changes since commit a675b2c89e477af088faee9b3be96eae19a85f0b:
>
>   sanity.bbclass: fix logging of an error (2016-11-15 15:18:50 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/root
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/root
>
> Robert Yang (2):
>   rootfs-postcommands.bbclass: fix zap_empty_root_password
>   base-passwd: set root's default password to 'root'
>
>  meta/classes/rootfs-postcommands.bbclass                 |  8 ++++----
>  .../base-passwd/base-passwd/passwd_master.patch          | 16 ++++++++++++++++
>  meta/recipes-core/base-passwd/base-passwd_3.5.29.bb      |  1 +
>  3 files changed, 21 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-core/base-passwd/base-passwd/passwd_master.patch
>

