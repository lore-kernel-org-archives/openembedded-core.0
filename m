Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id AC30E6A5AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 14:48:14 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id c13so3787542vea.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 07:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=XnbweDIGy8OjWm7SioFSaXSlEVb/D0dmi/G1m60QBnY=;
	b=kLPJAivXc0zP8euZ5wll9vAniboBnd1rFMvSlgBcnDIYt8wIJz6Hl6r0CMASwOclTL
	Czqi6urI5eIEFKGfiOcumHBYY+8ZnDMUZ3Ti9Wpwfo23L5IRevG2I27Gus2r3lMHsqC9
	y3T//qpLi2bZgxAPYT6z0OYulP7PP3bFZ0A40DaRcoBmCiuD9xByCNVCJbQB+YOYyGMR
	F7QuooY/cYYikb2m4WNqKS7g2z7HaRfzoHA04x7geR/mF4aLT8Yhol+SbQ+mT145Yex5
	20l4LR+NGkxG48+9mv8b0rvFE4RybbJKz68fBTNlLQSz8+Gs8LG6EZIfuCQIabfdYa7W
	h1dg==
X-Received: by 10.52.36.113 with SMTP id p17mr8359964vdj.51.1372690095348;
	Mon, 01 Jul 2013 07:48:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 1 Jul 2013 07:47:55 -0700 (PDT)
In-Reply-To: <367511c226fe8bc2ee8773db5322017d30ab69fd.1372638415.git.rongqing.li@windriver.com>
References: <cover.1372638415.git.rongqing.li@windriver.com>
	<367511c226fe8bc2ee8773db5322017d30ab69fd.1372638415.git.rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Jul 2013 15:47:55 +0100
Message-ID: <CAJTo0LbF84bsseZcJiBU1gYmaFa7oJ2un0s8+NskETpkUkx7ew@mail.gmail.com>
To: rongqing.li@windriver.com
X-Gm-Message-State: ALoCoQlmUuBszcJ+ijsI9ULg6R7MngmUelllMuVF9TrhA4z3UswQNDzze9sCgoZp0pjwjYYAPXBe
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sysstat: backport a patch to fix a parallel building error
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
X-List-Received-Date: Mon, 01 Jul 2013 14:48:14 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2013 01:32,  <rongqing.li@windriver.com> wrote:
> +From eb44730094a68f4d37d95ddc3480a5972619b43f Mon Sep 17 00:00:00 2001
> +From: Sebastien GODARD <sysstat@orange.fr.fake>
> +Date: Sat, 22 Jun 2013 14:08:40 +0200
> +Subject: [PATCH] Update Makefile to allow for parallel execution
> +
> +Upstream-status: backport

Please put the Upstream-Status: Backport and your own signed-off
(which you forgot) at the top of the patch, before the patch header.

Ross

