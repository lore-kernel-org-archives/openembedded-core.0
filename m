Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 98823601A3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 00:57:11 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id hl10so83511igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 17:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WSA/ki/1+wwaBrK3RQLPfIeOHu0bxN8JPhU+qwlIxfY=;
	b=Q5QN8UTrlhpGqupaTcw4Xna3ixvoWhNQKmCoZVCAuSWpCbQIlIzzS75oy3VYNlPZj+
	oNTipP4nYl/c8En3a0FqaDHfm0Jrv0knpatwk9fpTT9ZWvNr6bo/F9OB0vCoXR8lKmLq
	zShIK8+a6n1NdZFKEln09KGd9MJHojCIcBjYAgEfjxUX0DEX3CgKorfazfmuR+rqhCXN
	m7dKWXT/P0wGOAp8fjq/MrGM0S6cfBN05XMn3S4mtdVdDdNt0VkLSfju/w4UpdSdpMJ1
	I2dL90L4AFtjY8dlD5chHpmaXYUCzrlL6/FDFdtBvvxENKHuwV3/Mtp4ihrRglT5Gtvc
	4HCg==
X-Received: by 10.50.60.72 with SMTP id f8mr7489699igr.20.1397869032321; Fri,
	18 Apr 2014 17:57:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Fri, 18 Apr 2014 17:56:42 -0700 (PDT)
In-Reply-To: <1397860715-2417-1-git-send-email-jslater@windriver.com>
References: <1397860715-2417-1-git-send-email-jslater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Apr 2014 17:56:42 -0700
Message-ID: <CAMKF1sodzHjMx8UTj8JEAza7qWPQOk7iqGm=2g0TK8OfVBoR7A@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] apr: do not try to use sctp.h
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
X-List-Received-Date: Sat, 19 Apr 2014 00:57:16 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 18, 2014 at 3:38 PM, Joe Slater <jslater@windriver.com> wrote:
>  CACHED_CONFIGUREVARS += "apr_cv_mutex_recursive=yes"
>
> +# Also suppress trying to use sctp.
> +#
> +CACHED_CONFIGUREVARS += "ac_cv_header_netinet_sctp_h=no ac_cv_header_netinet_sctp_uio_h=no"
> +

Put it in single var  above. Is there any way to make is cross compile
safe too instead of disabling the tests

