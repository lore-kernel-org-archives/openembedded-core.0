Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 59DD86FE7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 00:17:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Jul 2014 17:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,727,1400050800"; d="scan'208";a="461129173"
Received: from unknown (HELO [10.255.12.245]) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 24 Jul 2014 17:17:29 -0700
Message-ID: <1406247450.6205.12.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Thu, 24 Jul 2014 19:17:30 -0500
In-Reply-To: <1406204223-16935-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1406145547.6335.37.camel@empanada>
	<1406204223-16935-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] wic: --fsoptions handling
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
X-List-Received-Date: Fri, 25 Jul 2014 00:17:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-07-24 at 14:17 +0200, Maciej Borzecki wrote:
> Add handling of --fsoptions in parition definition. If no options are
> specified, 'defaults' is used.
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>

Acked-by: Tom Zanussi <tom.zanussi@intel.com>

> ---
>  scripts/lib/mic/imager/direct.py | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
> index 77a118a..7e2b63a 100644
> --- a/scripts/lib/mic/imager/direct.py
> +++ b/scripts/lib/mic/imager/direct.py
> @@ -113,7 +113,15 @@ class DirectImageCreator(BaseImageCreator):
>                  device_name = "/dev/" + p.disk + str(num + 1)
>              else:
>                  device_name = "/dev/" + p.disk + str(num)
> -            fstab_entry = device_name + "\t" + p.mountpoint + "\t" + p.fstype + "\tdefaults\t0\t0\n"
> +
> +            opts = "defaults"
> +            if p.fsopts:
> +                opts = p.fsopts
> +
> +            fstab_entry = device_name + "\t" + \
> +                          p.mountpoint + "\t" + \
> +                          p.fstype + "\t" + \
> +                          opts + "\t0\t0\n"
>              fstab_lines.append(fstab_entry)
>  
>      def _write_fstab(self, fstab, fstab_lines):



