Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 85904780B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 14:23:23 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 07:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,350,1496127600"; d="scan'208";a="107380451"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga004.jf.intel.com with ESMTP; 12 Jul 2017 07:23:23 -0700
Message-ID: <1499869984.5349.41.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 12 Jul 2017 09:33:04 -0500
In-Reply-To: <18c26d81808842d3ab4272a5f6d0090fa99aa0f0.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<18c26d81808842d3ab4272a5f6d0090fa99aa0f0.1499803885.git.anibal.limon@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 28/30] argparse_oe: Add int_positive type
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
X-List-Received-Date: Wed, 12 Jul 2017 14:23:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
> Sometimes only expect positive values from cmdline so it's better
> to filter at parsing cmdline step instead of validate later.
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  scripts/lib/argparse_oe.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
> index bf6eb17197b..9bdfc1ceca2 100644
> --- a/scripts/lib/argparse_oe.py
> +++ b/scripts/lib/argparse_oe.py
> @@ -167,3 +167,10 @@ class OeHelpFormatter(argparse.HelpFormatter):
>              return '\n'.join(lines)
>          else:
>              return super(OeHelpFormatter, self)._format_action(action)
> +


when adding an argument into a script, one can define the type expected
so and the library itself does what you are doing for free, so not sure
if this is needed.



> +def int_positive(value):
> +    ivalue = int(value)
> +    if ivalue <= 0:
> +        raise argparse.ArgumentTypeError(
> +                "%s is not a positive int value" % value)
> +    return ivalue



