Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA9C60FD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 20:54:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02CKrixq030541
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 12 Mar 2020 13:53:54 -0700
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0;
	Thu, 12 Mar 2020 13:53:33 -0700
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1582781146-253903-1-git-send-email-changqing.li@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <6830c57f-37de-dc1a-ba80-5a4217644060@windriver.com>
Date: Thu, 12 Mar 2020 16:53:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582781146-253903-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [172.25.44.3]
Subject: Re: [PATCH] qemu: fix CVE-2020-7039
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
X-List-Received-Date: Thu, 12 Mar 2020 20:54:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2020-02-27 12:25 a.m., changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc                |  3 +
>   .../qemu/qemu/CVE-2020-7039-1.patch                | 44 +++++++++++++++
>   .../qemu/qemu/CVE-2020-7039-2.patch                | 59 ++++++++++++++++++++
>   .../qemu/qemu/CVE-2020-7039-3.patch                | 64 ++++++++++++++++++++++
>   4 files changed, 170 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch
> 

LGTM, I don't see it in master or master-next.

NVD gives this defect a 'critical' score so it would be good to get
it tested and merged.
https://nvd.nist.gov/vuln/detail/CVE-2020-7039

-- 
# Randy MacLeod
# Wind River Linux

