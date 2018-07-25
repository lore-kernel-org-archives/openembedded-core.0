Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id CFBAF60801
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 20:04:49 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id q11-v6so16085290oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EkJfTvyyXHewf8ciFdXTdIMEPZyM1DwDxP+UUh2pb7w=;
	b=mK/p8eq6AYLDkIGRM1kLtDsX3CbBl01LjBoUq1y2sFN+3n1YGQTfAp3B8EXlO38qg/
	HlPBfDApxw3hk424cPnrBOrDRtH19IHT+S15sO/z7On8qvevEyHL20lHBGLnkYG6Z2Sq
	IdN8hs4LotvFRKQuGnfaIjhks5g36414VthSvQ7Oqry326wxb6dhgbk0K+yW0Sdzhj7o
	Oq42pGtiWQMPQjFsxcILIP/MkGtGanyVaV2lDSXigU/RcmPEPtz+xa5xdzLhTBdWulIT
	29i8Qj1UyWLFy/HMXEmoWPWMCHDGaE/URIS0xqgCnsaAS0FhmGWQKY8bpW/ROgpZN2uZ
	PuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EkJfTvyyXHewf8ciFdXTdIMEPZyM1DwDxP+UUh2pb7w=;
	b=oE/XubLTJCoIVZiQUoKLJUx6AB35Rf1xPh2Zfhtt1lNvTuDxHcfaW4X0FWV3W4of/A
	9YqxeTYyr0nuUbmbEuDJWsnFw4CgaV+ajWiJ+03FcwEC0qY81yK11Yq5x4bXdILRkcXr
	YrrkRWAAVQn3NDzBgdBPy2kyMggBhU5YuLyLSIkgb+lUJeP3ZwZQc6z8pB2kdF4fR15V
	BW+mdgsCdJg8JF2C+VgKUKytgjQsTe7e49TUtKKQgNc/cw6RTQ8vY1Np3hZNhZLX5rXn
	QseyOk+WaasCt9K4mc20QGi/Xku0SgptHOPC8TxiaglFMiT0MDDwvI5FqB06FWnq15rd
	B7Nw==
X-Gm-Message-State: AOUpUlEZ8IWKPk4MNTsr2WKE6+0MgDtSF8U7S0qkqhHpZBGKw6FimPIH
	W6m1hN72Jj+HBVLfduSk+Yi3otUB1Xyv5gAv78C5hw==
X-Google-Smtp-Source: AAOMgpdTXEUIILkrH4QYqNHmzk+cEzuqDC7vfnMR5jAjE7Ohet9eexapEhxdOS4d9XNOBhaXJKloYkam508Vuoi/s6Q=
X-Received: by 2002:aca:b256:: with SMTP id
	b83-v6mr5141738oif.235.1532549090968; 
	Wed, 25 Jul 2018 13:04:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 13:04:30
	-0700 (PDT)
In-Reply-To: <618229eb-0ae4-e749-23f5-0cb1c2f3ceac@windriver.com>
References: <1532418493-21449-1-git-send-email-ovidiu.panait@windriver.com>
	<CAJTo0LaFai2biC-973Da-o7NMFwYkMWRTa4F5O+prseWFNwW4A@mail.gmail.com>
	<CANNYZj-FSOW33dXtdmo=467nktA_W8oXWknzUOURKWWb331tEQ@mail.gmail.com>
	<618229eb-0ae4-e749-23f5-0cb1c2f3ceac@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jul 2018 21:04:30 +0100
Message-ID: <CAJTo0LYOv4phpZTqcUue9AxY-GDj1h63pA7AEdwJLTz_t0=eNg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lsof: Update SRC_URI
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
X-List-Received-Date: Wed, 25 Jul 2018 20:04:50 -0000
Content-Type: text/plain; charset="UTF-8"

On 24 July 2018 at 21:18, Randy MacLeod <randy.macleod@windriver.com> wrote:
> I expect that Ovidiu just forgot the branch prefix in his subject line.
> Do you want him to resend for 2.5 and 2.4 ?

Probably for the best to be sure that the relevant release maintainer
sees the patches.

Ross

