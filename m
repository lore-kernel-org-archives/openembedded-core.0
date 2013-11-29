Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18E9C6B0F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 12:16:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rATCGfiE027625
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 04:16:41 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Fri, 29 Nov 2013 04:16:41 -0800
Message-ID: <529885CA.7090009@windriver.com>
Date: Fri, 29 Nov 2013 20:17:14 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1385727181.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1385727181.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH V2 0/1] busybox: add busybox_git.bb recipe
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
X-List-Received-Date: Fri, 29 Nov 2013 12:16:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore V2 of this patch.
I sent out the some backup files by accident.

Sorry for the inconvenience.

//Chen Qi

On 11/29/2013 08:14 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The following changes since commit 32adaac34a614d106e6dd3e9f1130f4e94ff39ae:
>
>    libpng: set reasonable SUMMARY (2013-11-27 11:51:25 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/busybox-git
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busybox-git
>
> Chen Qi (1):
>    busybox: add busybox_git.bb recipe
>
>   .../busybox-appletlib-dependency.patch             |    0
>   ...usybox-list-suid-and-non-suid-app-configs.patch |    0
>   ...sybox-sed-fix-sed-clusternewline-testcase.patch |    0
>   .../busybox-sulogin-empty-root-password.patch      |    0
>   .../busybox-udhcpc-no_deconfig.patch               |    0
>   .../busybox/{busybox-1.21.1 => busybox}/defconfig  |    0
>   .../fail_on_no_media.patch                         |    0
>   .../get_header_tar.patch                           |    0
>   .../login-utilities.cfg                            |    0
>   .../run-parts.in.usr-bin.patch                     |    0
>   .../{busybox-1.21.1 => busybox}/stat-usr-bin.patch |    0
>   ...estsuite-du-du-k-works-fix-false-positive.patch |    0
>   .../watch.in.usr-bin.patch                         |    0
>   meta/recipes-core/busybox/busybox_git.bb           |   53 ++++++++++++++++++++
>   14 files changed, 53 insertions(+)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/busybox-appletlib-dependency.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/busybox-list-suid-and-non-suid-app-configs.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/busybox-sed-fix-sed-clusternewline-testcase.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/busybox-sulogin-empty-root-password.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/busybox-udhcpc-no_deconfig.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/defconfig (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/fail_on_no_media.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/get_header_tar.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/login-utilities.cfg (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/run-parts.in.usr-bin.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/stat-usr-bin.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/testsuite-du-du-k-works-fix-false-positive.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/watch.in.usr-bin.patch (100%)
>   create mode 100644 meta/recipes-core/busybox/busybox_git.bb
>


