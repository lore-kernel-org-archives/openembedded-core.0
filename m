Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8246AC00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 01:55:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0J1t9LE005647
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 18 Jan 2017 17:55:13 -0800
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 18 Jan 2017 17:55:08 -0800
To: <openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1481706394.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <4baafdb7-8bc6-98d4-20f7-1a50f2943f32@windriver.com>
Date: Thu, 19 Jan 2017 09:55:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1481706394.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.184]
Subject: Re: [PATCH V3 0/4] Persistent /var/log support
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
X-List-Received-Date: Thu, 19 Jan 2017 01:55:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

Could you please help review this patch series?
Is there something I need to change?

Best Regards,
Chen Qi

On 12/14/2016 05:08 PM, Chen Qi wrote:
> Changes since V2:
> Use boolean value consistently. Update the comments to fit the use of boolean value.
>
> The following changes since commit d62f18c39bc0ed3b0f5ac8465b393c15f2143ecf:
>
>    targetloader.py: drop test for ClassType (2016-12-12 15:16:39 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib ChenQi/persistent-var-log
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/persistent-var-log
>
> Chen Qi (4):
>    bitbake.conf: add VOLATILE_LOG_DIR variable
>    base-files: respect VOLATILE_LOG_DIR
>    initscripts: support persistent /var/log
>    package.bbclass: support persistent /var/log
>
>   meta/classes/package.bbclass                       |  2 +-
>   meta/conf/bitbake.conf                             |  4 ++
>   meta/files/fs-perms-persistent-log.txt             | 69 ++++++++++++++++++++++
>   meta/recipes-core/base-files/base-files_3.0.14.bb  |  4 +-
>   .../initscripts/initscripts-1.0/volatiles          |  1 -
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |  3 +
>   6 files changed, 79 insertions(+), 4 deletions(-)
>   create mode 100644 meta/files/fs-perms-persistent-log.txt
>


