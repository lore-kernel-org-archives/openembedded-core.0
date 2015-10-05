Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C7D4076FD5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 13:54:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Oct 2015 06:54:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,638,1437462000"; d="scan'208";a="803942780"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga001.fm.intel.com with ESMTP; 05 Oct 2015 06:54:58 -0700
Date: Mon, 5 Oct 2015 12:08:29 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20151005090829.GA30756@mbabyjoh-mobl.fi.intel.com>
References: <1444032201-28178-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1444032201-28178-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: srifenbark@gmail.com
Subject: Re: [PATCH] ref-manual: document the strace dependency for Swabber
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
X-List-Received-Date: Mon, 05 Oct 2015 13:55:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Oct 05, 2015 at 11:03:21AM +0300, Maxin B. John wrote:
> image-swab class depends on "strace" package to be present in the Build
> Host. Document that dependency.
> 
> [YOCTO #8439]
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  documentation/ref-manual/ref-classes.xml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
> index d87c9ff..fdee92a 100644
> --- a/documentation/ref-manual/ref-classes.xml
> +++ b/documentation/ref-manual/ref-classes.xml
> @@ -1363,7 +1363,8 @@
>          tool in order to detect and log accesses to the host system during
>          the OpenEmbedded build process.
>          <note>
> -            This class is currently unmaintained.
> +            We need to install strace package in the build host as a
> +            dependency for this tool.This class is currently unmaintained.
>          </note>
>      </para>
>  </section>
> -- 
> 2.4.0

Sorry, sent to wrong list. Will resend to yocto@yoctoproject.org.

Best Regards,
Maxin

