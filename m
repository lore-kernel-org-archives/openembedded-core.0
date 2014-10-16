Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id D374060DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 11:20:59 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id i13so2133941qae.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 04:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/VOEH0hq7qaGxIg4BT8XwRMJAE/AvLhR7abRa5dOKBo=;
	b=KjF0hGtFloRCziR7YmV3ewiin1pBV2vPPqm0VqADSync8wu43Au+N1vjxgiQeLnAUM
	d1DbhV6kQ8cV6mGbt+dFuasG9OnVnIk2scMHWubWcc5Laz73/uoIhrPA/33dXfNd8IrE
	9nT6FQAd+O10czZJhaQ0Ru8S69MPW8sdGuzw6la8tSpqMHYB+GWZ8yPeP1tjFKwkUnz5
	SLpvpOWk5uJjMZWN7qsg2Yxqk9XucpN+cREMQY+Da3Z2itV++stFl2czl6F3cW7QWsB+
	lds6Kz/CCG9shNHBpI2g9wkbj+aPySHGwRnRNV9IdE1MY8jJ9EEmqjPLK/uewPl/WHCs
	+WTQ==
X-Gm-Message-State: ALoCoQnK8/S9GxrcP+APA6RQFo4a9nlWL5Kzqnvi8aO66TvT0eFkGzTzgf1IQLolS32sTn2GYHcL
X-Received: by 10.140.109.181 with SMTP id l50mr926975qgf.80.1413458460709;
	Thu, 16 Oct 2014 04:21:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Thu, 16 Oct 2014 04:20:40 -0700 (PDT)
In-Reply-To: <6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
References: <cover.1413452836.git.kai.kang@windriver.com>
	<6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Oct 2014 12:20:40 +0100
Message-ID: <CAJTo0LYZHWzJFtt3xZksna7dj7qx9Esqkn+ONwRBz=S66-sEJQ@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
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
X-List-Received-Date: Thu, 16 Oct 2014 11:21:04 -0000
Content-Type: text/plain; charset=UTF-8

On 16 October 2014 10:48, Kai Kang <kai.kang@windriver.com> wrote:
> +++ b/meta/recipes-core/readline/readline_6.3.bb
> @@ -1,5 +1,7 @@
>  require readline.inc
>
> +SRC_URI_append = " file://readline63-003"

Doing SRC_URI += is the usual thing to do.  Does this CVE also apply
to readline 5.2 that we ship as a non-GPLv3 alternative?

Ross

