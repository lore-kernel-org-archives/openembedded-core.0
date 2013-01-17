Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1TvvT7-0008Q2-4i
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 20:49:56 +0100
Received: from mail-gg0-f199.google.com ([209.85.161.199])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 17 Jan 2013 11:34:14 -0800
Received: by mail-gg0-f199.google.com with SMTP id n6so4419271ggf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 11:34:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-received:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=MlBFD66ZIgMsXey4wwduabwY5W6m1FNjQ9sO2gGmkcQ=;
	b=aRU/IyYrnp54/G5V7w5ikvLdURamO4wDwkcK23/T7mtuFGgO0Mf1CDzIfZNEkw1VHW
	5A6gFPD3UImINfkNEILlMEiYGnhxwz6Qz5xPw+ccfAoQYRPkGzdc6vJaQkpWzYm0nsIu
	o6TuefARTs95VWCESHvwIvd+mhmctSnGAoJlAm+++r2CXT0SYiagBKQpV2vjOfM+y/eQ
	dZRkLBd2Ny2iIA8sjJliMQf5t/7HsBJX8fxp+/mprE9HaiQ6WMnB6omzgDICayximTWg
	VjyBVPLXh9CJgZLFomrP4BnAHi7z0GFBh9R9OXiQ5C8BYvmRW5blr29jdCdg2OE8TQzV
	wUUg==
X-Received: by 10.224.216.65 with SMTP id hh1mr6746882qab.43.1358451253506;
	Thu, 17 Jan 2013 11:34:13 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.224.216.65 with SMTP id hh1mr6746871qab.43.1358451253350;
	Thu, 17 Jan 2013 11:34:13 -0800 (PST)
Received: by 10.49.128.234 with HTTP; Thu, 17 Jan 2013 11:34:13 -0800 (PST)
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
Date: Thu, 17 Jan 2013 11:34:13 -0800
Message-ID: <CAPhnLPAc5TcgvWdr6WMAK_6K5KzqS6_6vuJZf4YCxD6jfWOT+w@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Christopher Larson <kergoth@gmail.com>
X-Gm-Message-State: ALoCoQlv1mhhfru9P27lYxLH60ErOpC0N4DazcZXnA0o3P4QTZgayybuFDsfPWArz6aWaCl2eJu6W9y1cw3DVwB68xvoTWbKQtwSuV5Jk2NmeOpxz7+EGgANIfRxoJZfkccYj0Kp4EDqninXC4ccRf4otXFtD0or0onYeGFfveCT69nV34VNhhxFmfurk/eUirH5+yIyLL9a
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Fixes for INCOMPATIBLE_LICENSE handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 19:49:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 15, 2013 at 12:22 PM, Christopher Larson <kergoth@gmail.com> wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> This fixes a number of bugs spotted while trying to use INCOMPATIBLE_LICENSE
> = "*GPLv3", and also while experimenting with a recipe whose LICENSE includes
> GPLv3, but whose packages do not. In addition, it reduces the message spam by
> switching the license incompatibility messages to debug.
>
> Note: there's still one remaining bug I noticed, the wildcard support which
> was added is not very well supported in concert with the host tools exclusion
> variables. It asks for an spdx version of "*GPLv3", gets nothing but itself,
> and tries to look up whitelists for that string. This is not addressed by this
> patch series, but I mention it here for awareness, and also a reminder to
> myself to look in to it.

Acking the entire series. Thanks Chris!

Acked-by: Beth Flanagan <elizabeth.flanagan@intel.com>

>
> The following changes since commit 6080d1dc719c38fd97c2abd38e0ad938fbf6f452:
>
>   connman: fixed init script so connman can runs over nfs (2013-01-15 08:09:30 +0000)
>
> are available in the git repository at:
>
>   https://github.com/kergoth/oe-core incompatible-license
>
> for you to fetch changes up to 5cb12f38b2ac74ea118b58888a0c37f63917fbfa:
>
>   base.bbclass: improve the incompatible license logic a bit (2013-01-15 12:48:51 -0700)
>
> ----------------------------------------------------------------
> Christopher Larson (6):
>       license.bbclass: check LICENSE_pkg, not LICENSE_pn-pkg
>       license: correct re.search/fnmatch indentation
>       license.bbclass: cleanly handle invalid licenses in incompatible_license
>       linux-firmware: use LICENSEs which can actually be parsed
>       base.bbclass: use debug messages for INCOMPATIBLE_LICENSE
>       base.bbclass: improve the incompatible license logic a bit
>
>  meta/classes/base.bbclass                                |  9 ++++-----
>  meta/classes/license.bbclass                             | 16 +++++++++-------
>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 13 ++++++-------
>  3 files changed, 19 insertions(+), 19 deletions(-)
>
> Christopher Larson (6):
>   license.bbclass: check LICENSE_pkg, not LICENSE_pn-pkg
>   license: correct re.search/fnmatch indentation
>   license.bbclass: cleanly handle invalid licenses in
>     incompatible_license
>   linux-firmware: use LICENSEs which can actually be parsed
>   base.bbclass: use debug messages for INCOMPATIBLE_LICENSE
>   base.bbclass: improve the incompatible license logic a bit
>
>  meta/classes/base.bbclass                                |  9 ++++-----
>  meta/classes/license.bbclass                             | 16 +++++++++-------
>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 13 ++++++-------
>  3 files changed, 19 insertions(+), 19 deletions(-)
>
> --
> 1.8.0.3
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Elizabeth Flanagan
Yocto Project
Build and Release


