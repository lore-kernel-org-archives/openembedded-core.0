Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6712.1628069701243562309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 02:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1E79E20007;
	Wed,  4 Aug 2021 09:34:58 +0000 (UTC)
Subject: Re: [OE-core][PATCH] runqemu: Fix typo in error message
To: Matthias Klein <matthias@extraklein.de>,
 openembedded-core@lists.openembedded.org
References: <20210804085339.1894-1-matthias@extraklein.de>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <335a9653-429a-3ee3-13fa-f2759848fec5@bootlin.com>
Date: Wed, 4 Aug 2021 11:34:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804085339.1894-1-matthias@extraklein.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Matthias,

On 8/4/21 10:53 AM, Matthias Klein wrote:
> Signed-off-by: Matthias Klein <matthias@extraklein.de>
> ---
>  scripts/runqemu | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 2914f15d06..9c92eec030 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -776,7 +776,7 @@ class BaseConfig(object):
>                  raise RunQemuError('BIOS not found: %s' % bios_match_name)
>  
>          if not os.path.exists(self.bios):
> -            raise RunQemuError("KERNEL %s not found" % self.bios)
> +            raise RunQemuError("BIOS %s not found" % self.bios)
>  
>  
>      def check_mem(self):


Thanks for the patch. I caught that before, but then forgot to propose a
patch.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

