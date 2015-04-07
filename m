Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52953606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 03:02:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3732ke2018862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Apr 2015 20:02:47 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 6 Apr 2015 20:02:46 -0700
Message-ID: <552348B5.3080404@windriver.com>
Date: Tue, 7 Apr 2015 11:02:13 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1427274653.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1427274653.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.236]
Subject: Re: [PATCH 0/2] Fix for runtime error for rescue mode
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
X-List-Received-Date: Tue, 07 Apr 2015 03:02:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

Any comment on this one?

//Chen Qi

On 03/25/2015 05:11 PM, Chen Qi wrote:
> The following changes since commit d3fcfe346b3472170641d9194243c4bbe06b8585:
>
>    systemd: fix firmware path to match linux-firmware (2015-03-23 11:27:13 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib ChenQi/bug6698
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/bug6698
>
> Chen Qi (2):
>    util-linux: split util-linux-sulogin
>    shadow: add 'util-linux-sulogin' to RDEPENDS
>
>   meta/recipes-core/util-linux/util-linux.inc | 10 +++++++---
>   meta/recipes-extended/shadow/shadow.inc     |  3 ++-
>   2 files changed, 9 insertions(+), 4 deletions(-)
>


