Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQYzc-000257-5C
	for openembedded-core@lists.openembedded.org;
	Sun, 29 May 2011 07:56:52 +0200
Received: by pvc30 with SMTP id 30so1321111pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2011 22:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:subject:from:to:in-reply-to:references
	:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=t6fIrT5hRQAdIWedZuwIpZtZEaS3ymjQdYSYXx0iDh8=;
	b=VZs5ipkDhBvizNXiDjtapNX+U2nrZeHSFOUt3uD41tZWZCSQIz1ceNOlAgabutJUMr
	kWUAfWu2yT+kGxWI3mrYQ0p0mqlLKDrvM4rTkfVI46U9woeEVTp5yAJBfVhru+51jlhg
	c7bq/NU8KI6lSliCcXNYv9Nlvd1UEuolv2+n0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=UcjCI2sLE1I4Exy/tuRyxWeHmZkOx0ILCjDXdK2Hye0AcsTnDVoiwj3UFL9KU4IKeq
	salGKzZcd8ewSogaEuutpfb44gzfRumcITS8icWtY790voeHKIBEwmkmWS6NJzxzgnIf
	fsjqGuMouRMhUXj7YGU62l9z/sG+x2qV/RG3g=
Received: by 10.142.195.12 with SMTP id s12mr522221wff.307.1306648422450;
	Sat, 28 May 2011 22:53:42 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p5sm1839560pbk.84.2011.05.28.22.53.40
	(version=SSLv3 cipher=OTHER); Sat, 28 May 2011 22:53:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cb06560885d759a1f7bd36b1bf1b62f70102de8f.1306545413.git.nitin.a.kamble@intel.com>
References: <cover.1306545413.git.nitin.a.kamble@intel.com>
	<cb06560885d759a1f7bd36b1bf1b62f70102de8f.1306545413.git.nitin.a.kamble@intel.com>
Date: Sat, 28 May 2011 22:53:27 -0700
Message-ID: <1306648407.5246.0.camel@perseus>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [upgrades 1/4] m4: upgrade from 1.4.15 to 1.4.16
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
X-List-Received-Date: Sun, 29 May 2011 05:56:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-28 at 20:22 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../{m4-native_1.4.15.bb => m4-native_1.4.16.bb}   |    0
>  .../m4/{m4_1.4.15.bb => m4_1.4.16.bb}              |    6 +++---
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/m4/{m4-native_1.4.15.bb => m4-native_1.4.16.bb} (100%)
>  rename meta/recipes-devtools/m4/{m4_1.4.15.bb => m4_1.4.16.bb} (75%)
> 
> diff --git a/meta/recipes-devtools/m4/m4-native_1.4.15.bb b/meta/recipes-devtools/m4/m4-native_1.4.16.bb
> similarity index 100%
> rename from meta/recipes-devtools/m4/m4-native_1.4.15.bb
> rename to meta/recipes-devtools/m4/m4-native_1.4.16.bb
> diff --git a/meta/recipes-devtools/m4/m4_1.4.15.bb b/meta/recipes-devtools/m4/m4_1.4.16.bb
> similarity index 75%
> rename from meta/recipes-devtools/m4/m4_1.4.15.bb
> rename to meta/recipes-devtools/m4/m4_1.4.16.bb
> index 586071f..53ef5ae 100644
> --- a/meta/recipes-devtools/m4/m4_1.4.15.bb
> +++ b/meta/recipes-devtools/m4/m4_1.4.16.bb
> @@ -4,14 +4,14 @@ compatible although it has some extensions (for example, handling more than 9 po
>  GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
> -	file://examples/COPYING;md5=380fd7d57d3fd009a5716e074a845d6d"
> +	file://examples/COPYING;md5=fbc986d45b3dae6725c29870dd6b669d"
>  

what changed in license ?

>  PR = "r0"
>  SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
>             file://ac_config_links.patch;patch=1"
>  
> -SRC_URI[md5sum] = "5649a2e593b6c639deae9e72ede777dd"
> -SRC_URI[sha256sum] = "3d66dfeb609007062265a67b9a2c08d3686a74068830bacae60a6d58413c9367"
> +SRC_URI[md5sum] = "a5dfb4f2b7370e9d34293d23fd09b280"
> +SRC_URI[sha256sum] = "e9176a35bb13a1b08482359aa554ee8072794f58f00e4827bf0e06b570c827da"
>  
>  inherit autotools
>  





