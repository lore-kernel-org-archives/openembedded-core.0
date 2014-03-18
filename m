Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id F2F976ADA2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 15:51:51 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k15so7222283qaq.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 08:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=shhdLNgtp6jSEf0AM0WNzE6CKePfXUc2cQ5smCVIx8c=;
	b=KHdey7ab8IYmV/0JXkxN1RkiQEvTmVF3WAkHFFm7o6lk+JZvdBpNGgH0gecpvCJpG6
	dm5fdhGu3l3PAipAJLnxGO2FDK+xNfeZEGok0gE5J3Cwe2x8p5KtnkolrK0psOtXxqIT
	b8j4g/z6CjeBt6EK27Z0Iaw2gA+kXTA9bOMaEPcZm3xPJYlUKRgW91NY3Bay9m6DWKt1
	u0jo8S3rhk26orCqxpvAY1d+3HGpDTqvjHs3omAaVqrq+fIN1GExK1fR6p+1dQT4sOfM
	D7v/Xuqumunp1c7v2dgKPky3Af9HCpsc7I8haYKT1+vqr4YWoDKtCSi/dhYRZ+8A+kKY
	lL8A==
X-Gm-Message-State: ALoCoQmGlM13dB2Zu5K12mj0g/LiXGsaIRQ9wEqeeTO8T31xdfUBqHae6pXI5SuBD0TXpW3Bny/g
X-Received: by 10.140.106.195 with SMTP id e61mr34418371qgf.66.1395157912148; 
	Tue, 18 Mar 2014 08:51:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Tue, 18 Mar 2014 08:51:31 -0700 (PDT)
In-Reply-To: <1394559360-27718-1-git-send-email-raj.khem@gmail.com>
References: <1394559360-27718-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Mar 2014 15:51:31 +0000
Message-ID: <CAJTo0LY4_XK3-KCTON_tnzhqTnOgH4UfKVTBcBfzYGrXy-wi3A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: Upgrade 4.0 -> 5.0
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
X-List-Received-Date: Tue, 18 Mar 2014 15:51:55 -0000
Content-Type: text/plain; charset=UTF-8

On 11 March 2014 17:36, Khem Raj <raj.khem@gmail.com> wrote:
> bluetooth-proximity has been removed in 5.0

This brings in a new QA warning:

WARNING: QA Issue: pulseaudio: configure was passed unrecognised
options: --enable-bluez

Ross

