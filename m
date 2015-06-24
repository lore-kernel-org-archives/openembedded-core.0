Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 691BC75A20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 07:49:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O7nX9x007416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 00:49:34 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Jun 2015 00:49:33 -0700
Message-ID: <558A610C.2060600@windriver.com>
Date: Wed, 24 Jun 2015 15:49:32 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
	<bb310561fc74eda7e03e10ccd7b3c29e7ad50992.1435126503.git.liezhi.yang@windriver.com>
In-Reply-To: <bb310561fc74eda7e03e10ccd7b3c29e7ad50992.1435126503.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 8/8] perl-ptest: fix RDEPENDS
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
X-List-Received-Date: Wed, 24 Jun 2015 07:49:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Sorry, please drop the last patch [PATCH 8/8] , I copy it from
IMAGE_INSTALL, but it isn't correct, other patches are fine.

// Robert

On 06/24/2015 02:26 PM, Robert Yang wrote:
> The test cases require make, gcc, libssp and so on to run.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-devtools/perl/perl-ptest.inc |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
> index 948ea7c..74ac110 100644
> --- a/meta/recipes-devtools/perl/perl-ptest.inc
> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
> @@ -34,4 +34,5 @@ python populate_packages_prepend() {
>               '${PN}-ptest%s', '%s', recursive=True, match_path=True)
>   }
>
> -RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc sed"
> +RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc sed make gcc \
> +                         procps libgcc-dev gcc-dev gdbm perl-dev libssp libssp-dev"
>

