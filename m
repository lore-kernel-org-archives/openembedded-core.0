Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id B8DC56FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 19:20:12 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id e98-v6so12160360itd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 12:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w2eegA1qDsm4UY8Ode3/kMGvd8CsirSa1EtEFWbTF80=;
	b=LWuxtRifI9w1WpplUnNW58YffsmTqqa/VeDVUqX8JMYXGNBuDs8KBv4H6lOu3Ve+t1
	Tf3utuEYBpoiPnem5sJBRLGxC17R7e4FgIk3HWDfQ0C30Ony9VcP5Lo4pOKwK5Bc5710
	tVkMEGZT5I38eKs9iedT6dZQGFNL9ClaRCfQaAFWW7ZW7WWNAyVzFCOzy6BRxHAUnS82
	ofXM0ftxRmbymz+ZHlbAnMr7Ai7kPe80tHcHRSnZXV4DL4lUImimb15DNgkt8HAmPL0X
	DPCWnLXXxGIzkh07jhNPoQoDIFk0Xd1Qcyoa10lIjTOnzIVdwAGwTd3U4v+95ZJU953+
	QPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w2eegA1qDsm4UY8Ode3/kMGvd8CsirSa1EtEFWbTF80=;
	b=iW9zfXSXz6VWp2qFElod0JkgGbZgt407P/bie2Crd53PPrHyGqqndQxxwJail8LbTE
	SDmKCM3mbBJRjdkRlZGCdWam7rvk7DMD4E6Eb04rH1hdnlTrYSDaDr2edqnEeDJ5Qhcq
	EwqypKEuNRrVlocs4I9sCx8oKtZWDqoxpZ10pmFQUAmG+pqha2czhAc6RhthLC+iBb9M
	Cc+w06xNbotsOLmTh+1hzZ26ZSOAh8DBssZBdEqm1gsY1A/QzZ+T8rDGrM8rpGSsbgQh
	DJQEm/O0NV3WFyoQCE3hnbi9JX78+XpjRkDsM/mT5ccqQlQTDYD9CvmdlZl36WV6tXAS
	2wag==
X-Gm-Message-State: AElRT7ELHQXyAt9pPG8NzTTJSc4TgOyj1HniHAmYPewISi+1zT6B850t
	gJZsLal2hw/fBUdxAD16jaGdVU6IWXwsmMA7M5UtA7xi
X-Google-Smtp-Source: AG47ELvcM4paauvO9fHqF/X/1YXImyJ14TU/Om1rWOk7jcROZ8iFynj6XRzB30D70ZHqGfFeMuR3zvC2KFrUEbt+Nls=
X-Received: by 2002:a24:22c2:: with SMTP id
	o185-v6mr24936221ito.60.1522092013989; 
	Mon, 26 Mar 2018 12:20:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 26 Mar 2018 12:19:53 -0700 (PDT)
In-Reply-To: <1521912413-6148-1-git-send-email-derek@asterius.io>
References: <1521912413-6148-1-git-send-email-derek@asterius.io>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Mar 2018 20:19:53 +0100
Message-ID: <CAJTo0LYONUNCwkG5djkGeXdpqkD_wVGfMtivYOm48OOXTZEr2A@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-pycairo: update to version 1.16.3
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
X-List-Received-Date: Mon, 26 Mar 2018 19:20:13 -0000
Content-Type: text/plain; charset="UTF-8"

Doesnt work correctly in multilib environments:

| Writing /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-multilib/build/build/tmp/work/core2-64-poky-linux/python3-pycairo/1.16.3-r0/image/usr/lib64/python3.5/site-packages/pycairo-1.16.3-py3.5.egg-info
| install: cannot stat
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-multilib/build/build/tmp/work/core2-64-poky-linux/python3-pycairo/1.16.3-r0/image/usr/share/lib/pkgconfig/py3cairo.pc':
No such file or directory
| WARNING: exit code 1 from a shell command.

Ross

