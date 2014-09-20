Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF4270FAB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Sep 2014 00:30:54 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id m20so4013842qcx.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 17:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BSJhwT4dPVT3s6AwbhfGY6Vv/griwMnPN8qW3QEN7Wk=;
	b=EmQk9SBi+gDteJVGzYdObw0HBd2DvoJ4e9IFK6QekOUK3rAlkayd+VmzU9tC5croeM
	D6df2CT9KEAwc7wuWMLsqp5y7PePFuIQX1eCmkNy/n5WRNNBSAgyHiboBqb5KMzS5Xrv
	ZpzrHpDiHQEHHf5FKKekoE/11njoulUmZSpGHjJMrO/1MWUyjwjzTTuAZPtRUllfYASe
	w5DLTFCglHX0cE/KhDvJ21JCrsckVO84ivbQr9OGyxM5mDMH/TL1Y+AO7Tlb5U4GMphQ
	f/L8Mjt2rb3B+qKrCJW2Av205gQ55O6SVp7XIex8PUgXuUamzPaubFPeP7L7Y3jsgYuV
	MTqg==
X-Gm-Message-State: ALoCoQm3WIRAljUMaedDutt5yL9ACexU58YajcsiDIVf1PT8eAMGX1EOvnWbn+u408EbBKrrpto6
X-Received: by 10.224.79.139 with SMTP id p11mr5023771qak.93.1411173055622;
	Fri, 19 Sep 2014 17:30:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 19 Sep 2014 17:30:35 -0700 (PDT)
In-Reply-To: <1409737854-29513-1-git-send-email-b50113@freescale.com>
References: <1409737854-29513-1-git-send-email-b50113@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 20 Sep 2014 01:30:35 +0100
Message-ID: <CAJTo0LatnB0y19+haQaWnrfra55cM1ZvSvSpC=opAX1zVNu_ew@mail.gmail.com>
To: Zidan Wang <b50113@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib: libasound should runtime depends on alsa-conf
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
X-List-Received-Date: Sat, 20 Sep 2014 00:30:56 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2014 10:50, Zidan Wang <b50113@freescale.com> wrote:
> -RDEPENDS_libasound = "alsa-conf-base"
> +RDEPENDS_libasound = "alsa-conf-base alsa-conf"

If we're doing this then what's the point of splitting the conf to
alsa-conf and alsa-conf-base?  Should more files be moved to
alsa-conf-base?  Should we somehow change the contents of
alsa-conf-base on a per-machine basis?

Ross

