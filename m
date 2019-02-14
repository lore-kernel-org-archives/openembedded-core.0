Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id DEBAA7C611
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 14:04:42 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id z7so15261658iti.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 06:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NCKDu+uOlH53E4h9Ov1+V1TBfxytvrv5M3tkTwBqJqk=;
	b=u4/2MMISaFYym+xra8dzlTPpjp06+Gl82QeOMwdOZaeYFVbpNHkSuCwhCLMeK4PQoe
	+BAAMAAQaN+0CWUu3EDl7pgUR/7Sz8OiYV0hQsnHk4jeiKquLcY+9FvPCaj5ByCH3G81
	D3rS5KFhmhOJ90bCbpPtMKnCa9MdMwUHyqAoxsbpZyiypnYFeMxS0K2PQLo7ccguCZKZ
	3NocToQU7r5eBKaYoaWSCdK6VJBYtY+C8vlK9lMkxogjZsIBKcjjQnRe4yszrBTswn4B
	16EbclkhmbMZb2w1OvMfzMn6JWFI4+mT+s+0N2rK2A8Djvrh369R6V1c0UhalOQDTb1y
	VfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NCKDu+uOlH53E4h9Ov1+V1TBfxytvrv5M3tkTwBqJqk=;
	b=rb+DG9brRVNPomObz5u9s0tgocnDnt5fV+PZq7VUbmYP87Zmcm4E4FLT/m1b9HyBaZ
	rBR3XhIJMYSH/n/VetAJkBBXhc9oHb6Wp5NAX6r6qQ/dNt4o8avYf66dpKI+afucYKGj
	MDCgGTy7EimupF7VT0bVsh2QFwPhQuET3ps/wSGsrKpnfwpggamOH07wCG4sdETe+Rma
	xeETayWQUjmHiQssw1K48n4l2H9eea7a/879w65rg6m1mTqZ9276xVpGtCD+Ylv7dkmj
	9SWbW9tKoXmUTc0LJfpSVT/uLulmoLtYNNx/KbOl33MWySZNk1mxNvPCS4Y5bf8/xu+7
	/IPw==
X-Gm-Message-State: AHQUAuYDGnc87ENhO6N58S38y+HIYZ7KI1yd1QJcD14TwbzL3aMu4Ydl
	pDSZfELE9+UgROK2kE/zPxX48UuvgJpBCSplvG6rfg==
X-Google-Smtp-Source: AHgI3IaFrxpt/y/faGr89t7M9fCfrJ35HqS/v280cCPLdUNnWGQEyLgNSU2GYN5yvCemk2VnTTca1Jwn+NRofBFBOz4=
X-Received: by 2002:a24:c601:: with SMTP id j1mr2410435itg.130.1550153083924; 
	Thu, 14 Feb 2019 06:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20190214054857.18876-1-anuj.mittal@intel.com>
In-Reply-To: <20190214054857.18876-1-anuj.mittal@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Feb 2019 14:04:32 +0000
Message-ID: <CAJTo0LYLQRxrByBagTYWfEA2jES-+GfZrfjFCvEDq+ONLmOgDg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] x264: update to latest on stable branch
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
X-List-Received-Date: Thu, 14 Feb 2019 14:04:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Feb 2019 at 05:49, Anuj Mittal <anuj.mittal@intel.com> wrote:
>  do_configure() {
> -    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
> -    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
>      ./configure ${EXTRA_OECONF}
>  }

I wouldn't delete those copies, those files were last updated in 2015 upstream:

https://git.videolan.org/?p=x264.git;a=history;f=config.guess;h=375fa2a818f84ff8727cec0f516b9c8160ff5749;hb=HEAD

Up-to-date copies of these are required for building on new architectures.

Ross

