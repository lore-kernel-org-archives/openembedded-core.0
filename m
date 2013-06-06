Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 417476A60F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 05:02:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2013 22:02:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,812,1363158000"; d="scan'208";a="345601599"
Received: from unknown (HELO [10.255.13.19]) ([10.255.13.19])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2013 22:03:10 -0700
Message-ID: <51B017F8.8050709@linux.intel.com>
Date: Wed, 05 Jun 2013 22:02:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1370491540-21915-1-git-send-email-net147@gmail.com>
In-Reply-To: <1370491540-21915-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/qmake_base: allow parallel make
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
X-List-Received-Date: Thu, 06 Jun 2013 05:02:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2013 09:05 PM, Jonathan Liu wrote:
> Remove MAKEFLAGS= from EXTRA_OEMAKE to allow parallel make.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/classes/qmake_base.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
> index 52e7fb0..3762887 100644
> --- a/meta/classes/qmake_base.bbclass
> +++ b/meta/classes/qmake_base.bbclass
> @@ -4,7 +4,7 @@ OE_QMAKE_PLATFORM = "${TARGET_OS}-oe-g++"
>   QMAKESPEC := "${QMAKE_MKSPEC_PATH}/${OE_QMAKE_PLATFORM}"
>
>   # We override this completely to eliminate the -e normally passed in
> -EXTRA_OEMAKE = ' MAKEFLAGS= '
> +EXTRA_OEMAKE = ""
>
I don't think this is correct, have you checked the run.do_compile script?

It shows
         make -j 16  MAKEFLAGS=  "$@" || die "oe_runmake failed"

Which means the parallel make info is being passed correctly.

Sau!


>   export OE_QMAKE_CC="${CC}"
>   export OE_QMAKE_CFLAGS="${CFLAGS}"
>

