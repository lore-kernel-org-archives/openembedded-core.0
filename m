Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1BDA771421
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 10:48:32 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id e89so9609933qgf.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 03:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xfYHoHDP3rtgK2jYyPALpUETvQDYzTTBZUnyeiNXW3U=;
	b=fJrs4NOurE2G3fws8qGYEHJuh8igHYb+BMJixLDtyowIBfCTzoB9NcoWXymfdxPHO5
	yZeA2H7WVCdtoDKtkJEm526PG99jE2Fl2ybEYm12ulaXn4WhllQuZr612r9fqSDUjWb6
	R1K9iPCCvBFZwceap4/U1mwXX0gFer0ETWW73AEG7OKoow/vRYxKqgdA0y/2SR9gOHGU
	I+bZuefEr3HRURKbgSuZEt05bUSrX3Ji8LsPuSlC7F6jcI8NZiMNvUUranT7JhD14ACY
	CLuwjhE3lAqjogcNiaDuChuBfoHoLN0/yFC0Ni0D7hvjlDCZaYhPxKezxP11Cxmqlnsw
	lq4Q==
X-Gm-Message-State: ALoCoQk2MT3eOht2SPia3Ljh66DYIgLKtEWsmW/z6Ju9/griMrFSTPxl/d0hzCjax8VIIzYRLBlh
X-Received: by 10.140.40.84 with SMTP id w78mr5188546qgw.87.1409827714142;
	Thu, 04 Sep 2014 03:48:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 03:48:14 -0700 (PDT)
In-Reply-To: <75bc00cf71e871a28e5d5b43053c3bfa85157674.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
	<75bc00cf71e871a28e5d5b43053c3bfa85157674.1409764769.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 11:48:14 +0100
Message-ID: <CAJTo0LZn81QZnOkiX5Ao4UEkKNdf+AEeiOeqHq2vcQmewa4HEg@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] irda-utils: obey LDFLAGS
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
X-List-Received-Date: Thu, 04 Sep 2014 10:48:37 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2014 18:27, Christopher Larson <kergoth@gmail.com> wrote:
> +++ b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch

Missing patch header.

> -export SYS_INCLUDES="-I${STAGING_INCDIR}"
> -
>  inherit autotools-brokensep update-rc.d
>
> +EXTRA_OEMAKE = "\
> +    'CC=${CC}' \
> +    'LD=${LD}' \
> +    'CFLAGS=${CFLAGS}' \
> +    'LDFLAGS=${LDFLAGS}' \
> +    'SYS_INCLUDES=' \
> +    'V=1' \

The autotools inherit appears to be redundant and can be removed too
if you're cleaning up the build.

Ross

