Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id F2450705D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 13:47:38 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f51so3244745qge.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 06:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fVkipx/d5a31BoYjJyimTrTHS8jCqnWt9KQP3zaPyF0=;
	b=fF4yefPJvfRXVVQh+YqUAOKqZvEpYExa/LXcW5sAy3fj4F6v45GxWVulw3hpyjClPj
	vbYPDIdhIVo3l3P5wSOI1mySiDzWqOTwZewY6RoecM0aUsZmCQhwQKXzyaGL1GwVoSFG
	xNQGsvx3p22qt5ZGHoI3C2ZQgwoE/9XtqRx0OUoTPJOCU6Mh/vHI/kRubRwYvRwtmN3A
	cVowR1EjWNCh1m9NOfoZuAZaSyIIQSOJllMa4vAFm/QpE+UuZFLtYnRYetEF9d3Og3I9
	sCNruwPcz24Bv7VP4MMUIYYW0QvmY8wMCdWvs4r9EBKFd+TOUGAcSsDTKHnnZwFu1b2N
	WiNA==
X-Gm-Message-State: ALoCoQmV1o5abd52Kd4ZozD3feYUtt2Q5qgEIFaINpJkuXHPrdlbk8Du4EyL80FwwulF12SCdK1h
X-Received: by 10.140.19.100 with SMTP id 91mr14935302qgg.32.1406209659585;
	Thu, 24 Jul 2014 06:47:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Thu, 24 Jul 2014 06:47:19 -0700 (PDT)
In-Reply-To: <1406209379-1662-3-git-send-email-Martin.Jansa@gmail.com>
References: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
	<1406209379-1662-3-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jul 2014 14:47:19 +0100
Message-ID: <CAJTo0LYLswjg2WOSFDadNNgLXeJQ4PqYPBLEpypqVBZAxzgTWg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] xorg-driver: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Thu, 24 Jul 2014 13:47:42 -0000
Content-Type: text/plain; charset=UTF-8

On 24 July 2014 14:42, Martin Jansa <martin.jansa@gmail.com> wrote:
> +# depends on virtual/libx11

I think these comments are fairly redundant - it's an X11 driver, of
course it depends on X11. :)

Ross

