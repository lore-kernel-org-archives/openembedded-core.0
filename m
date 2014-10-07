Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 05F016FDEB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 18:26:41 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id tp5so5979753ieb.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7ZYqApiGaHPeHvE3paW8HtO4/AsBwvUgGe0e2AGcMQ4=;
	b=xBAQogesAmPD69kh0Xhzv91KuvgrTsiKgji7sRgu/pIKDQRxJuz0sdB4RPYogkzuT/
	DwQrRdQoU8nK1+PIZJh/MZhtahXCVhD6G6NBejOELFajO3Mz2o42TPcitPw2SaHf1Mfi
	FdS76xAf/xrYwP2RpqvxdUqzwGcmIMWmI6TfInYv1wvBFa2/2lmBGZVXMHv4S7nQuNX/
	bfOaaCA9gigJQCwdqB+poNpa3trBmlfJjcyV8jAPrTkzzVOJ87yZmRaC3NL+cUB6o7qZ
	YtiUEiPDAV7+zAKEoQLyRtRnKSYCWmXrtr+DUdvNXpU0ROr+fCleQrCOnQcuw9ITtzxM
	vu1Q==
X-Received: by 10.50.87.99 with SMTP id w3mr8568356igz.4.1412706402141; Tue,
	07 Oct 2014 11:26:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.179.5 with HTTP; Tue, 7 Oct 2014 11:26:12 -0700 (PDT)
In-Reply-To: <20140929184835.GU25706@jama>
References: <1412001614-15126-1-git-send-email-ross.burton@intel.com>
	<201722111.zmNURQEFnj@comp-006-thk>
	<CAJTo0LZ4RCk5eqdXb2MxchvQkZgiT3+4+yUnNuNwQZcX+0Vm4w@mail.gmail.com>
	<20140929171445.GT25706@jama>
	<CAJTo0LZQCt67M1L7KyPWLoj=fQOf7eccnMsnVioc-kANHD_DLg@mail.gmail.com>
	<20140929184835.GU25706@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Oct 2014 11:26:12 -0700
Message-ID: <CAMKF1sp0kmLyK_H8m5aO4i-7xBfHoJV97PSicaekcF09xkK8nQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: add SRCREV to do_fetch() hash
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
X-List-Received-Date: Tue, 07 Oct 2014 18:26:42 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 29, 2014 at 11:48 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Hm, should SRCREV_FORMAT also be in the hash?
>
> That probably won't be enough, you would need to include all
> SRCREV_foo
> SRCREV_bar
> variables when
> SRCREV_FORMAT = "foo_bar"
>
> Maybe we can include SRCPV in hash to cover both cases.

I think above fix is not fully solving the issue. As stated above

