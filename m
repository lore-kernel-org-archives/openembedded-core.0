Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0FDCB76486
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 09:26:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t779QfQG018596
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Aug 2015 02:26:41 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 7 Aug 2015 02:26:40 -0700
Message-ID: <55C479CF.4000506@windriver.com>
Date: Fri, 7 Aug 2015 17:26:39 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
	<6a9899fa17063139292c39c162444d1a1356ccce.1438619216.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <6a9899fa17063139292c39c162444d1a1356ccce.1438619216.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 1/7] fotowall: update SRC_URI to use github instead of qt-apps.org
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
X-List-Received-Date: Fri, 07 Aug 2015 09:26:42 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Also fotowall:

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds/430/steps/BuildImages/logs/stdio

// Robert

On 08/04/2015 12:29 AM, Alexander Kanavin wrote:
> GitHub is where upstream development is happening, so we are more likely
> to find out about new releases from there
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   meta/recipes-qt/qt-apps/fotowall_0.9.bb | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9.bb b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> index 48dcc02..e92e862 100644
> --- a/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> +++ b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> @@ -10,13 +10,11 @@ SECTION = "x11/apps"
>
>   PR = "r4"
>
> -SRC_URI = "http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2 \
> +SRCREV = "06d5a4142c599604d9a9fd64727b6945eb8cd3da"
> +SRC_URI = "git://github.com/enricoros/fotowall.git \
>              file://ExportWizard-depends-on-ui_wizard.patch \
>              "
>
> -SRC_URI[md5sum] = "142ef697332e0777c6d22c5bc96cc438"
> -SRC_URI[sha256sum] = "e4d0c005d2cb1d7c09438bfc3098eadebc08946e4fbc0655b7fc8b046de3810d"
> -
>   S = "${WORKDIR}/Fotowall-${PV}"
>
>   inherit qt4x11
>

