Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD2B61853
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 09:36:07 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id m17so4904775vca.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 02:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7S8EBlKe9Xju8EycXPyBOCvgxqnxWbcGfvN7rSQtmv8=;
	b=Nr9Iw2kEeYEJ3/gj0lvJuV+lzd0nk56KgYRReNUiiQ1P5JAIRIryk39vtyveAOO0Ez
	VgjlmynDvMKtIt9MSuQrZl4DK6CbQ4iWBOBDWIZuQjG+Ra9rzJK4crzm5WWWZH2l0Sg2
	KjWev0f8mx+wiN8PMfaraZ+MC1lmy2MA/SdqWynBfDL2wxYtfWIoQxTqwI4qydgnDMSn
	Na9XHb9c2YVlmXSiJ3FZlauFnGEDfAzFu6IbI/zDdOiAR5vBUryIYORrGtYW4BTCx5k4
	jmPCHhTFitY0TCznpbBP00qHkDN/vYAqwEXqXraDzK3Itv/jcv+guHyZ4EFm6QW2wXHv
	4I+Q==
X-Gm-Message-State: ALoCoQksypzovNH4cydQjaR3SA0R2vpITz0h32S63Ob7iksDFntb90rUC1xEWiunwna+fF0vA4XS
X-Received: by 10.220.11.7 with SMTP id r7mr22070259vcr.12.1378805768920; Tue,
	10 Sep 2013 02:36:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 10 Sep 2013 02:35:48 -0700 (PDT)
In-Reply-To: <1378795010-807-1-git-send-email-b28495@freescale.com>
References: <1378795010-807-1-git-send-email-b28495@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Sep 2013 10:35:48 +0100
Message-ID: <CAJTo0LbM2CF4_vnvCZejQB6kMUtqazbbG3UKk1TUSUKBfvGzog@mail.gmail.com>
To: b28495@freescale.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcroco: disable Bsymbolic if it is not supported on some hosts
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
X-List-Received-Date: Tue, 10 Sep 2013 09:36:08 -0000
Content-Type: text/plain; charset=UTF-8

On 10 September 2013 07:36,  <b28495@freescale.com> wrote:
> +EXTRA_OECONF += "enable_Bsymbolic=auto"

Surely you mean "--enable-Bsymbolic=auto", as that's what the option is called.

Ross

