Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D95A67E407
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 13:18:36 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w13so4176994wru.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 06:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=aOSF2vOtsMyOizfxXx7KMtQK/QDZxcykClLDTtCpkcE=;
	b=ZMats2Z8ay5CsAaDj/lgf8Fluw5y4bwAPcDGZBZMoGvGq9XXceBuP70zHLmKh2mD6B
	VUQhNxOyelSpoIETDEXHuxo1ZmlGHmFwnK78aAR4gYcHoROa3gXNoCbXJEBIkM/pPBD/
	ZIdTiq3mI1AxYt4L2dJEChTAdfOYi+1yj6seY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=aOSF2vOtsMyOizfxXx7KMtQK/QDZxcykClLDTtCpkcE=;
	b=YP7bFWZWfrNk3gExWH9zZTR/KMUSYagaYtPPuOC1guFhxgvSSGoP/Il0CrC6dVynax
	VXc0uRtPa23VilLxW8+MGrW59TW1QWzHHkZj/ss3PFnWjzoy20lfQCNkJ8D7nuGhi/ik
	OT1iApG0ywhOp5SV+4pQCxKBQ9K9wOwjq4WOoeNlEkjtRatvxLSBy3Fvd0l7/SznKIIV
	1FTptWx9eBfbFuEYmDI5Lc2KAG7An1I3ByfMwNd9JAcIaiFHCVJhoVg2Ls/lVeYTcLAY
	GIOID8OVnFyIBRk7ec0UsTAEBq6hjERVJcutvb1Qpl2/uR7I+77b57aIjgTsiBf5O11b
	vyFA==
X-Gm-Message-State: APjAAAWb6wVwNlUXnrbCmr3QjvotapTxwCr0pLleAfsUJ+8ZU5Gs2BPY
	q7o4igEF18HyWr1ASVrQPWVZpA==
X-Google-Smtp-Source: APXvYqxBzO8ami1RNj7szBL0MZo9PZZktGNDlnZ+eX7R6nOThxSHQIbiLaALU3uj9OR46o/DZZr7dw==
X-Received: by 2002:adf:e590:: with SMTP id l16mr2544603wrm.257.1559222317578; 
	Thu, 30 May 2019 06:18:37 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o1sm878997wre.76.2019.05.30.06.18.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 06:18:37 -0700 (PDT)
Message-ID: <f3c0ec27ac8d1d90468532152081c219ddf1061f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rob Walton <Rob.Walton@arm.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 30 May 2019 14:18:36 +0100
In-Reply-To: <1558529060-79451-2-git-send-email-rob.walton@arm.com>
References: <1558529060-79451-1-git-send-email-rob.walton@arm.com>
	<1558529060-79451-2-git-send-email-rob.walton@arm.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] package.bbclass: Emit HOMEPAGE pkgdata.
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
X-List-Received-Date: Thu, 30 May 2019 13:18:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-22 at 12:44 +0000, Rob Walton wrote:
> Emit the contents of HOMEPAGE in the extra pkgdata. This is useful
> information to have when creating license manifests.
> 
> Signed-off-by: Rob Walton <rob.walton@arm.com>
> ---
>  meta/classes/package.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
> index 4c0a859..a08aefe 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1458,6 +1458,7 @@ fi
>          write_if_exists(sf, pkg, 'PKGR')
>          write_if_exists(sf, pkg, 'LICENSE')
>          write_if_exists(sf, pkg, 'DESCRIPTION')
> +        write_if_exists(sf, pkg, 'HOMEPAGE')
>          write_if_exists(sf, pkg, 'SUMMARY')
>          write_if_exists(sf, pkg, 'RDEPENDS')
>          rprov = write_if_exists(sf, pkg, 'RPROVIDES')

This isn't the first time this has been requested, back in 14/11/2017 a
similar patch had the reply:

"This was already proposed once and rejected as its using the interface
for something it really wasn't designed for"

You've also sent this patch once already and questions were raised
then.

I have to admit I don't like the license.bbclass code, its starting to
look like anything every legal department could ask for, meaning it
does no one thing well, just many things badly. I don't like that mess
starting to creep into the packaging code which does have a clearly
defined purpose and use.

Put another way, which variables do we draw the line at?

I worry about the path accepting this patch leads us down :(

Cheers,

Richard




