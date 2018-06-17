Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C187875264
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 07:35:50 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5H7Zink019713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 17 Jun 2018 08:35:47 +0100
Message-ID: <94d6b405cb120ce19d09a60b9f4accb6802a1285.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Jun 2018 08:35:44 +0100
In-Reply-To: <20180611133822.32004-2-alexander.kanavin@linux.intel.com>
References: <20180611133822.32004-1-alexander.kanavin@linux.intel.com>
	<20180611133822.32004-2-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/6] lib/oe/package_manager: turn postinst failure warnings into bitbake failures
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
X-List-Received-Date: Sun, 17 Jun 2018 07:35:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-06-11 at 16:38 +0300, Alexander Kanavin wrote:
> Sumo release provides a transition period so that deferrals to first
> boot
> via 'exit 1' can be converted to pkg_postinst_ontarget(). For the
> next release
> however, postinst script failures should be treated as such.
> 
> [YOCTO #12607]
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/lib/oe/package_manager.py               | 22 +++++++-----------
> --
>  meta/lib/oeqa/selftest/cases/runtime_test.py |  4 ++--
>  2 files changed, 9 insertions(+), 17 deletions(-)

This nearly managed a clean build, there was a single failure:

DISTRO_FEATURES_append = " api-documentation"

https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/1082/steps/BuildImages_2/logs/stdio

Cheers,

Richard




