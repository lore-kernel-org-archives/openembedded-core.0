Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id B436E65D57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 08:41:43 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id x13so2558214qcv.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 01:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=erzFAmlYFMX0l7BaKgR868szIF1zTjcws4JPrI8iofo=;
	b=Sy9YjtJ538qatQOlFdtnvSNyeLRMZR7YSU7kITtYGOhobMIYmYJke0nX2/1cfmjY/l
	Z/bVCQnObuiWPe5L0P5sLedGFD/VZHYm0+cUexfZo/d1qLqHRLmad6BWq5w8bYiH1+tU
	KHUmcZTasdtpUVpYcRqMeLnKmZPi+UKIQlq38cYF/wdWJ2TD2OiEYLLIJSGtS0hHmaN6
	N52nwHpbaoF8+jUAgxSiBrmiw0JjnQfeHuKTo31tQW7w7F+cRJ4wPgKZ6l06aRCa99MM
	HcNNvAT2T0ROScuIKmUcRHDVMVrZciz0kUX+3oap060aCiilVrt6m3eHPqhT6Ej8EJWm
	rxPw==
X-Gm-Message-State: ALoCoQkZrsGBnQhCYuKpx2uYrRiMfpPM3qIpD8Z0CHvDZqpgcixJcQdRKqmPcGbF5LNUViB0ME5c
X-Received: by 10.140.103.75 with SMTP id x69mr4006163qge.17.1407832904289;
	Tue, 12 Aug 2014 01:41:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.95.235 with HTTP; Tue, 12 Aug 2014 01:41:24 -0700 (PDT)
In-Reply-To: <1407828058-9939-1-git-send-email-li.wang@windriver.com>
References: <1407824758-9261-1-git-send-email-li.wang@windriver.com>
	<1407828058-9939-1-git-send-email-li.wang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Aug 2014 09:41:24 +0100
Message-ID: <CAJTo0LZW2OdpmevQW+5+j9Vau2M2qUpe+XUEL9aO6b=WS_B5fg@mail.gmail.com>
To: Li Wang <li.wang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpcbind: add option to fix port number
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
X-List-Received-Date: Tue, 12 Aug 2014 08:41:45 -0000
Content-Type: text/plain; charset=UTF-8

On 12 August 2014 08:20, Li Wang <li.wang@windriver.com> wrote:
> fix a random port to offer customer an option for select.

I'm curious as to why this is needed.

Ross

