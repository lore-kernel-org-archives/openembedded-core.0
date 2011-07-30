Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnEX3-0000fe-Bf
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 20:45:05 +0200
Received: by pzk1 with SMTP id 1so8483945pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 11:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=sJ/p1zG0xsMbBwb+TWds4VweNZNPjEMffPh28LuXDc0=;
	b=ezfYqyWh84ybO63mXH3MQXu6hxoEdPLUanmWOUnUFrvN2i4P64AUKK8WruhqK7NHFk
	h8Im62SVJXh5BAIXf3LM7NmmYKlB3yHqwAHv92ejsyfmT382p7XyEhL+JtSBcWgd8wsi
	zTyMjXVB98H3GG18tAgC1ewmSu2BMcPORVHJ4=
Received: by 10.68.5.129 with SMTP id s1mr4499549pbs.205.1312051246320;
	Sat, 30 Jul 2011 11:40:46 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p7sm3509730pbn.1.2011.07.30.11.40.45
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 11:40:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jul 2011 11:40:43 -0700
Message-ID: <2717944.t8ib7oWynB@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <706a2e04c5d4373a4f5a0dfbaf94bc63f95bc850.1311776363.git.richard.purdie@linuxfoundation.org>
References: <7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
	<706a2e04c5d4373a4f5a0dfbaf94bc63f95bc850.1311776363.git.richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] base.bbclass: Fix PACKAGE_ARCH typo
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
X-List-Received-Date: Sat, 30 Jul 2011 18:45:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, July 27, 2011 03:29:15 PM Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/base.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 3ed1bb8..a0a189f 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -407,7 +407,7 @@ python () {
>          # if multiple differences are present?
>          # Look through PACKAGE_ARCHS for the priority order?
>          if pkgarch and pkgarch == mach_arch:
> -            bb.data.setVar('PACAKGE_ARCH', "${MACHINE_ARCH}", d)
> +            bb.data.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}", d)

nice I was wondering this warning in my builds

>              bb.warn("Recipe %s is marked as only being architecture
> specific but seems to have machine specific packages?! The recipe may as
> well mark itself as machine specific directly." % d.getVar("PN", True)) }
-- 
Khem Raj


