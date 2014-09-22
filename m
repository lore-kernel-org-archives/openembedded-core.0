Return-Path: <alexandre.belloni@free-electrons.com>
X-Greylist: delayed 556 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Sep 2014 12:46:02 UTC
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7345C71481
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 12:46:02 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 5E3CE905; Mon, 22 Sep 2014 14:36:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 10AA36F3;
	Mon, 22 Sep 2014 14:36:47 +0200 (CEST)
Date: Mon, 22 Sep 2014 14:36:42 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-ID: <20140922123642.GA25675@piout.net>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1411385721-22264-6-git-send-email-maciej.borzecki@open-rnd.pl>
MIME-Version: 1.0
In-Reply-To: <1411385721-22264-6-git-send-email-maciej.borzecki@open-rnd.pl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Denys Dmytriyenko <denys@ti.com>, Tom Zanussi <tom.zanussi@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/9] ref-manual: document IMAGE_BOOT_FILES
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
X-List-Received-Date: Mon, 22 Sep 2014 12:46:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 22/09/2014 at 13:35:17 +0200, Maciej Borzecki wrote :
> Document IMAGE_BOOT_FILES variable.
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> ---
>  documentation/ref-manual/ref-variables.xml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
> index 7ea753d..5282790 100644
> --- a/documentation/ref-manual/ref-variables.xml
> +++ b/documentation/ref-manual/ref-variables.xml
> @@ -3235,6 +3235,24 @@
>              </glossdef>
>          </glossentry>
>  
> +        <glossentry id='var-IMAGE_BOOT_FILES'><glossterm>IMAGE_BOOT_FILES</glossterm>
> +            <glossdef>
> +                <para>
> +                    Comma separated list of files that will be installed into
> +                    boot partition when preparing an image. Source files By default the file
> +                    is installed unser tha same name as source file. To change
"under the"

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

