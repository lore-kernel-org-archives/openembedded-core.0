Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1FE260750
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 02:09:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9Q29WGv021769
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 19:09:32 -0700 (PDT)
Received: from [128.224.162.209] (128.224.162.209) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 25 Oct 2016 19:09:32 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1477381190.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <58101066.7010007@windriver.com>
Date: Wed, 26 Oct 2016 10:09:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <cover.1477381190.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.209]
Subject: Re: [PATCH 0/1] systemd: CVE-2016-7795
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
X-List-Received-Date: Wed, 26 Oct 2016 02:09:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I just realized that my patch does not conform to the CVE patch 
requirement in the link below.
I'll send out V2.

http://openembedded.org/wiki/Commit_Patch_Message_Guidelines#Example:_CVE_patch_header

Best Regards,
Chen Qi

On 10/25/2016 03:40 PM, Chen Qi wrote:
> The following changes since commit 6e96deb024e4c41d911f590ff2b92b402f672661:
>
>    local.conf.sample.extended: remove RM_OLD_IMAGE (2016-10-19 17:07:14 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib ChenQi/CVE-2016-7795
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/CVE-2016-7795
>
> Chen Qi (1):
>    systemd: CVE-2016-7795
>
>   ...s-zero-length-notification-messages-again.patch | 68 ++++++++++++++++++++++
>   meta/recipes-core/systemd/systemd_230.bb           |  1 +
>   2 files changed, 69 insertions(+)
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-pid1-process-zero-length-notification-messages-again.patch
>


