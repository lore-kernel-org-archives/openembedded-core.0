Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id AA80B6AECA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 10:35:33 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id f12so396955vbg.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 03:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=6HUHH/Irqpk75fpkP7wSegNsON9jTW91F9pDPDjJFuM=;
	b=B3OBmQLALRQ8J6qoDoM4KyVkrkxAlVPo8iq+MvMRVZPosQr41xZVpOzuu59+pCpFhg
	fE967ai677G/nqZGFfDHmKIh6/q1WlWaJq3xJl5FAEUo7yNqSpbDrpaWtjDuZjrbwKLC
	kFN38OQM7JBRrd5yFCfd9HbyCzpRaYaXn+CtJw7W1JLxghPcWbO9nyj0jY68tjQ8UeT+
	UeqElIHFPOa69b2tFeTLx6h6g9VcDTd7gvVf+sKoiHKOmAHH2LdyWaPL50ugBv02kXy/
	wvQmstClmPhcwUAoig4HZNmbamYVd4obqWJGzGbtA/KR7vylM1JnKykSIu3XjXPpUdze
	Jcfw==
X-Received: by 10.52.164.227 with SMTP id yt3mr17941870vdb.107.1373538934306; 
	Thu, 11 Jul 2013 03:35:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 11 Jul 2013 03:35:14 -0700 (PDT)
In-Reply-To: <1373401795-11886-1-git-send-email-sgw@linux.intel.com>
References: <1373401795-11886-1-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 11:35:14 +0100
Message-ID: <CAJTo0LavtWda_fxY-VnKKMi+r+q9StdsO41mwWh9dZe=LQ9+_A@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQnPxQl8HrcBDrqSeR4aQVJ5ZKaK09fs11cmQM29m5DpjXeRySrJiibPQ+5kDMXeBOt6ZjRz
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pciutils: Add kmod dependency
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
X-List-Received-Date: Thu, 11 Jul 2013 10:35:33 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2013 21:29, Saul Wold <sgw@linux.intel.com> wrote:
>  DEPENDS = "zlib"
> -RDEPENDS_${PN} = "${PN}-ids"
> +RDEPENDS_${PN} = "${PN}-ids kmod"

Did you mean to add this to DEPENDS?

Ross

