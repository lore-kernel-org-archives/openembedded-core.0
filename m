Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id B74B17143F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:32:40 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id s7so3882201qap.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 07:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MDcyA6nO36TtM0QqROz5TE8znmglbjxzhR9P5TVkTNM=;
	b=HCSRMloa4BpMy2CpvgvoML6ayYZjPr38G/WtOoP8iiOyaNToRzC7eVCm4B8mS3+gjx
	ZDg34VDhy2Xbv4l2e6hYebwl/3cgZ/OcUUIRONVpzTWC6iljfzhXm6XqW+CRU0BFfgW3
	1bm/KTRs+WaShT3WUv3rvq+ykXJ7Ubcr40Wy19STm1Xz10WDacfJL75/zJCe0B+eaXwB
	Fe96y5b+XrLcZM1y0FwYSsby96/3rncwWlWYM37JBtM+WbOBcWCE8nqkgaf1BZc++hbE
	vo+jErp6VSLn2/RCWLsyu+8fDoIMfeB1mnPspXMkMfbnem+6GJ80A7/HUIOjcVSB/A0N
	JOZQ==
X-Gm-Message-State: ALoCoQnDABpmHvrfEj5mUQcR1FlN07y+UFlPckwqF6WtSqg6J3OROkn1beS2n1A2o+M8NeQ4sfDi
X-Received: by 10.140.40.84 with SMTP id w78mr37946827qgw.87.1410791560866;
	Mon, 15 Sep 2014 07:32:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 07:32:20 -0700 (PDT)
In-Reply-To: <1410769631-5672-1-git-send-email-rongqing.li@windriver.com>
References: <1410769631-5672-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 15:32:20 +0100
Message-ID: <CAJTo0LZd_5dYP7sc-umCev+rzU_YzGNLWUq6o0Y0ZK9b6ayB3g@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kmod: remove the setting of INHIBIT_PACKAGE_STRIP
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
X-List-Received-Date: Mon, 15 Sep 2014 14:32:45 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 09:27,  <rongqing.li@windriver.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Setting INHIBIT_PACKAGE_STRIP is added by 61cb45869c[kmod: ptest fixes], but I
> can not reproduce the described issue, and seems it make wrong logical [
> when enable ptest, INHIBIT_PACKAGE_STRIP is always 1; and when disable ptest,
> INHIBIT_PACKAGE_STRIP is always 0]
>
> Cc: Tudor Florea <tudor.florea@enea.com>

As Tudor added this I'd love to hear from them about this, but I can
confirm that this patch doesn't cause warnings with ptest enabled.

Ross

