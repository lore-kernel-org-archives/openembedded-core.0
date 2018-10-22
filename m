Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07A23745BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 02:30:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9M2UMEP026223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 19:30:23 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 21 Oct 2018 19:30:21 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1539876421.git.kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <59eb98b2-610b-f83d-bee1-f219f5e55d0d@windriver.com>
Date: Mon, 22 Oct 2018 10:29:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1539876421.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/1] udev-hwdb: fix postinstall scripts failures when multilib enabled
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
X-List-Received-Date: Mon, 22 Oct 2018 02:30:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018/10/18 下午11:28, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> The following changes since commit 4ef016683d986cc5291e494789ff5a49b28030eb:
>
>    bitbake: test/data: Add new tests for task checksum changing/not changing (2018-10-18 10:59:27 +0100)
>
> are available in the Git repository at:
>
>    git://git.pokylinux.org/poky-contrib kangkai/udev
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/udev


Rebased on origin/master and updated contrib branch kangkai/udev.

Regards,
Kai


>
> Kai Kang (1):
>    udev-hwdb: fix postinstall scripts failures when multilib enabled
>
>   meta/recipes-core/systemd/systemd_239.bb     | 13 ++++++-------
>   meta/recipes-core/udev/eudev_3.2.5.bb        | 11 +++++------
>   scripts/postinst-intercepts/update_udev_hwdb |  6 ++++++
>   3 files changed, 17 insertions(+), 13 deletions(-)
>   create mode 100644 scripts/postinst-intercepts/update_udev_hwdb
>

-- 
Regards,
Neil | Kai Kang


