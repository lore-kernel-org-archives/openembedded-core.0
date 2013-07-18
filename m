Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 18A066B1EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:19:13 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id oz10so2583207veb.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=PII9ytdecoFN8H0AUSxms/hpM9bPmU57tqNAKRjLE1s=;
	b=G0RFgORWJ+Zy+lC4bqY/ausvasyLOO8pSSwCwn8r7BePW6Eh523LkSqjbpVNtmuy0S
	Y39jxErkh7/nVYiUkuuJnySOgZFgoX6lWeOrsUEKrwe4sFG84tukVuwfgJXLCFQp0o0X
	FBqluH9hn9rwb39ZcPq4He8C8I2ZgJJM/kvNcaBeJY6HlZXpXQn96xQpMBa6kuw/R9fc
	PKliESMSOa93MWabpZ4XEmAeqHiJJInxLk1cyvWFT5gO7t/u2S4G+Lc5ne9GDLq/n7IG
	DKPnFWVF1SnY+TSXuVwArX7FYThSg75gQVideBACV8ROC1S0xhLBN0+b9i6aj3yxkp8y
	Lh+Q==
X-Received: by 10.58.118.70 with SMTP id kk6mr4096799veb.1.1374157153561; Thu,
	18 Jul 2013 07:19:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 18 Jul 2013 07:18:52 -0700 (PDT)
In-Reply-To: <CA+jg_OXXS4UAojhcgZ3vO5ZeMoHsHEQ=0LCz1GVyGDbcTJJKUQ@mail.gmail.com>
References: <CA+jg_OV-i-dRAw92j2dXsodfi5=EmXSnFuA-GVvRCJYbEbS=gg@mail.gmail.com>
	<CAJTo0LaDbFWTXQ0NPtjQ-LMt+B+ZABRG17Ed3BW1=mH2Bv3jgQ@mail.gmail.com>
	<CAP9ODKqDSUs8gx1tKbSGT89Ap_hPX6xeD4DKteXKhxNO681Ymw@mail.gmail.com>
	<CAJTo0La40j24AqhFxuZMmjHe9cF6Ssr-jV2D7hhRCMKbLeyLnA@mail.gmail.com>
	<CA+jg_OXXS4UAojhcgZ3vO5ZeMoHsHEQ=0LCz1GVyGDbcTJJKUQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2013 15:18:52 +0100
Message-ID: <CAJTo0LYtBmmNzEAdhBYqRAcBVefQnx=-n3c5OvYFXAKd=fsK_w@mail.gmail.com>
To: Daiane Angolini <daiane.list@gmail.com>
X-Gm-Message-State: ALoCoQmWZj43vWa5dU1ZpeeDJUftVCCgEtz9Uyb+G86cDTOE+U0H2wHasHyQmBu6HPFFqC1dBadc
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: No package 'cairo' found for GTK+
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
X-List-Received-Date: Thu, 18 Jul 2013 14:19:13 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2013 15:12, Daiane Angolini <daiane.list@gmail.com> wrote:
> How should I send it? Could I attach the log.do_configure to maillist?

No, config.log, which will be in the build directory.  Based on your
log, I expect it will be at
/home/daiane/gerrit/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/gtk+/2.24.18-r0/build/config.log
assuming you've enabled separatebuilddirs.

Ross

