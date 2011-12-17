Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RbwRt-0007pt-Ny
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 16:45:21 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A3D8C110018A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2011 16:38:22 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 418DC11000B0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2011 16:38:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g230118223.adsl.alicedsl.de
	[92.230.118.223]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2011 16:38:19 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 9ADAB3C49C; Sat, 17 Dec 2011 16:38:17 +0100 (CET)
Date: Sat, 17 Dec 2011 16:38:17 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111217153816.GA9547@rhein.zuhause.netz>
References: <cover.1324132972.git.shane.wang@intel.com>
	<aec7142fcdb265b6bab0b3328043d62e8fe10a8a.1324132972.git.shane.wang@intel.com>
MIME-Version: 1.0
In-Reply-To: <aec7142fcdb265b6bab0b3328043d62e8fe10a8a.1324132972.git.shane.wang@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH 1/1] Create a script for SUMMARY audit in recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Dec 2011 15:45:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 17, 2011 at 11:07:12PM +0800, Shane Wang wrote:
> Some recipes don't contain SUMMARY, which HOB will use for descriptions.
> If the summary is missing, bitbake will create a default value for summary.
> That is PN plus string " version " plus its version. Every maintainer should add and update the summary fields according to audit results.
> 
> [YOCTO #1804] got fixed, and maintainers should follow up.
> 
> Signed-off-by: Shane Wang <shane.wang@intel.com>
> ---
>  scripts/contrib/summary-audit.sh |   53 ++++++++++++++++++++++++++++++++++++++
>  1 files changed, 53 insertions(+), 0 deletions(-)
>  create mode 100755 scripts/contrib/summary-audit.sh
> 
> diff --git a/scripts/contrib/summary-audit.sh b/scripts/contrib/summary-audit.sh
> new file mode 100755
> index 0000000..068e283
> --- /dev/null
> +++ b/scripts/contrib/summary-audit.sh
> @@ -0,0 +1,53 @@
> +#!/bin/bash
> +#

Hm,

where do you need special bash features? 

Bye Henning


