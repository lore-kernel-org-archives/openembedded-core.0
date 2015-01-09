Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 813EC7169F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 11:50:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t09BopSV016587
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 9 Jan 2015 03:50:54 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 9 Jan 2015 03:50:51 -0800
Message-ID: <54AFC08E.2040401@windriver.com>
Date: Fri, 9 Jan 2015 19:50:38 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <cover.1419823473.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1419823473.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH V2 0/4] Packages upgrade: groff and directfb
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
X-List-Received-Date: Fri, 09 Jan 2015 11:50:57 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/2014 01:47 PM, Hongxu Jia wrote:
> Changed in V2:

Ping

//Hongxu

> - Follow Saul's suggestions, investigate groff's README, double
>    check its DEPENDS;
>
> - Follow Richard's suggestions, correctly set the path to perl
>    in the recipe.
>
> - Fix qt4-embedded build failure which caused by the upgraded
>    directfb. (thanks Richard and Otavio for pointing it out)
>
> //Hongxu
>
>
> The following changes since commit e3a623bfe39fda16420d2042647af75877bb6f70:
>
>    runqemu-internal: increase memory for qemuarm64 (2014-12-25 08:27:13 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/upgrade-packages
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-packages
>
> Hongxu Jia (4):
>    groff: upgrade 1.22.3
>    groff: fix native perl path
>    directfb: upgrade to 1.7.6
>    qt4-embedded: support c++0x stand for directfb
>
>   ...off-1.22.2-correct-man.local-install-path.patch |  32 --
>   .../groff-correct-man.local-install-path.patch     |  45 +++
>   .../groff/{groff_1.22.2.bb => groff_1.22.3.bb}     |  23 +-
>   .../directfb/directfb/fixsepbuild.patch            |  19 --
>   .../rename-no-instrument-function-macro.patch      | 345 ---------------------
>   .../{directfb_1.7.4.bb => directfb_1.7.6.bb}       |   8 +-
>   ...figure-support-c-0x-standard-for-directfd.patch |  40 +++
>   meta/recipes-qt/qt4/qt4-embedded.inc               |   4 +-
>   8 files changed, 99 insertions(+), 417 deletions(-)
>   delete mode 100644 meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
>   create mode 100644 meta/recipes-extended/groff/groff-1.22.3/groff-correct-man.local-install-path.patch
>   rename meta/recipes-extended/groff/{groff_1.22.2.bb => groff_1.22.3.bb} (72%)
>   delete mode 100644 meta/recipes-graphics/directfb/directfb/fixsepbuild.patch
>   delete mode 100644 meta/recipes-graphics/directfb/directfb/rename-no-instrument-function-macro.patch
>   rename meta/recipes-graphics/directfb/{directfb_1.7.4.bb => directfb_1.7.6.bb} (58%)
>   create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0033-configure-support-c-0x-standard-for-directfd.patch
>


