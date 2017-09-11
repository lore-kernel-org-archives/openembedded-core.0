Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF5177D67
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 01:39:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8B1dkYQ012005
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 18:39:46 -0700 (PDT)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 10 Sep 2017 18:39:45 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1504751799.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <b778febb-da33-00e5-280e-b7f878dea91e@windriver.com>
Date: Mon, 11 Sep 2017 09:45:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1504751799.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.167]
Subject: Re: [PATCH 0/1] iputils: backport patch to fix arping hang problem
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
X-List-Received-Date: Mon, 11 Sep 2017 01:39:45 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 09/07/2017 10:37 AM, Chen Qi wrote:
> The following changes since commit 8b4f16a9cbbaf521461f699b7264fac2ac872581:
>
>    mesa-gl: Fix build after recent mesa PACKAGECONFIG changes (2017-09-05 15:01:02 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/iputils-hang
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/iputils-hang
>
> Chen Qi (1):
>    iputils: backport patch to fix arping hang problem
>
>   ...ing-fix-arping-hang-if-SIGALRM-is-blocked.patch | 44 ++++++++++++++++++++++
>   meta/recipes-extended/iputils/iputils_s20151218.bb |  1 +
>   2 files changed, 45 insertions(+)
>   create mode 100644 meta/recipes-extended/iputils/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch
>


