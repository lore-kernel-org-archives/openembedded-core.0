Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5B6E561117
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:40:34 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id r5so4404521qcx.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 08:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vBwow5HFGlB6jJJCIZDhaH+YnKNVPrJ4mppdnxSFifY=;
	b=iGP+ZkbAsEWurOd3vctj3QLnFxYUjXOER5Ed2dNvwM28IJlXevFXWQ08iQCHUuyaDw
	Lj5uayF4y6pPVxtpxF39mbiv17BXMPFQgHUX7pVtke0motnBKOogGvfieFRnmKjk9Bfh
	Sh1RoaV97k23hQ5Jvl0TgpTdPZx1cMASXos4K5Nhfin/9ZSLaOfErAzg0rO96x6W2GB9
	mfYDm+pj8m5M830TN/+M3/OXIztavaky6xhBNZhumsWgmyFluDz6O5iYZZktJoUS4uB0
	Upnjgqw/rBxceTx7khZjVjU34/gWE/MaCd3MJBilgen63Qg1DG1zPA6ntXS/YqHym/Fv
	F1GA==
X-Gm-Message-State: ALoCoQkTLmuaZlggt/W/lWWAY0+KAhcXSrl9VKWn2XsmIv4So3Fk1hjScGJV1svGXIm+2nPl9CS3
X-Received: by 10.49.29.230 with SMTP id n6mr32922634qeh.20.1378827635830;
	Tue, 10 Sep 2013 08:40:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.211 with HTTP; Tue, 10 Sep 2013 08:40:15 -0700 (PDT)
In-Reply-To: <1378827427.3484.165.camel@ted>
References: <cover.1378483732.git.pkj@axis.com>
	<8455f1f49363caff9ceb89a81d9b9a4650dd8ece.1378483732.git.pkj@axis.com>
	<1378827008.19978.103.camel@dvhart-mobl4.amr.corp.intel.com>
	<1378827427.3484.165.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Sep 2013 16:40:15 +0100
Message-ID: <CAJTo0LZ6X50pk+KY6Sy+uf3kpzNcLEvrF50XyYfQtbUXVsnVOg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bb-matrix: Clean before, rather than after, building
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
X-List-Received-Date: Tue, 10 Sep 2013 15:40:34 -0000
Content-Type: text/plain; charset=UTF-8

On 10 September 2013 16:37, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Sadly this isn't recursive, it applies to <target> and not any
> dependencies of it. I'd be tempted to simplify this to rm tmp* and
> depend on a convention of calling them tmp*...

You could invoke bitbake -e and get the right directories to remove
(see wipe-sysroot).

Ross

