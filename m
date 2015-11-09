Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBB8876294
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 01:30:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA91UaH7015716
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Nov 2015 17:30:36 -0800 (PST)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 8 Nov 2015 17:30:35 -0800
Message-ID: <563FF73A.1010909@windriver.com>
Date: Mon, 9 Nov 2015 09:30:34 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1447031701.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1447031701.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/1 v2] mdadm: fix CFLAGS and ptest issues
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
X-List-Received-Date: Mon, 09 Nov 2015 01:30:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

The patch for this thread fails to send, anyways I need to re-send them 
again.

Please ignore this cover.

Wenzong

On 11/09/2015 09:16 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> V2 change:
>
> * also fix another ptest error while building poky-lsb:
>
>    raid6check.c:352:2: error: ignoring return value of posix_memalign, \
>    declared with attribute warn_unused_result [-Werror=unused-result]
>
> The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:
>
>    build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/mdadm
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/mdadm
>
> Wenzong Fan (1):
>    mdadm: fix CFLAGS and ptest issues
>
>   .../mdadm/files/mdadm-fix-ptest-build-errors.patch | 50 ++++++++++++++++++++++
>   meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |  3 +-
>   2 files changed, 52 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
>

