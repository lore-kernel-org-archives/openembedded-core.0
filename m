Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id D13366B876
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Sep 2014 00:07:30 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id x12so3351062qac.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 17:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1P6/HsgOhkOhFAKmi12veZpi9DJskzfVWpsZabxRjNE=;
	b=UKwsFrxSp6xj+Mohnc6/01y8BOUAjVtXGSImMYb395a1QtdRf76BcErDWhfMUU/iXg
	pLESMZEqAiYz/tVvf2X/Mw3S/5YfSq+FHb4fetjUz+D33xeWvx+PGiJvateqfktiItuP
	n98klJo6+bj9D7EWytKHVg9BLHUUiK6BhG9VXkoHuJD4qfOOiht4SD4s8NiycvlK11OU
	0Je59q0VykAv3V5z57y8qweykFr7aFEIyotg8C2SNy5h1aQJ4ZU5sONUCSJHcWagiEV2
	YBTrTCMVJaRYYjKhpKyCarMDLmnAKeicepwtu5/z8owwGGzWwCxNuErBfe0SVmuTHhRa
	xINA==
X-Gm-Message-State: ALoCoQkl3T5DSRjJrOKRvS3ICLdSu5hOG/kbqI9UWaO+Acm5H3NOxsDFgrIv2MkzlhiO94LGya1Z
X-Received: by 10.224.79.139 with SMTP id p11mr4925098qak.93.1411171651404;
	Fri, 19 Sep 2014 17:07:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 19 Sep 2014 17:07:11 -0700 (PDT)
In-Reply-To: <1410909001-3284-1-git-send-email-denis@denix.org>
References: <1410909001-3284-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 20 Sep 2014 01:07:11 +0100
Message-ID: <CAJTo0LbGHQEa_QjRnekh8L+-+kAn575K3jFJ2ypty-EDkKS6RQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] u-boot: cleanup indentation and consolidate .inc file
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
X-List-Received-Date: Sat, 20 Sep 2014 00:07:33 -0000
Content-Type: text/plain; charset=UTF-8

On 17 September 2014 00:10, Denys Dmytriyenko <denis@denix.org> wrote:
> --- a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> @@ -1,25 +1,9 @@
>  require u-boot.inc
>
> -# To build u-boot for your machine, provide the following lines in your machine
> -# config, replacing the assignments as appropriate for your machine.
> -# UBOOT_MACHINE = "omap3_beagle_config"
> -# UBOOT_ENTRYPOINT = "0x80008000"
> -# UBOOT_LOADADDRESS = "0x80008000"

Was this little piece of documentation deleted deliberately?

Ross

