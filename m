Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id C96E96CD66
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 23:33:23 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id e13so1066764vbg.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2013 16:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9fikmVBjTGUrKyOcoxhjxdftiZ6ASUpylWn3o/BZm/Q=;
	b=cHp8vFnvbN7jtW0IWRJPNZVdMF9+T6cNEUswiTqQ0XIpTh9Xu0bqaTJILHx64ihOUl
	frZDs/P9PEAknQUuY2bOYfX74TlM1QHWB24ShlJ8Gwd4uTvAXXTR8w7wr+iH3JpIHEIm
	oS/zIkTY+8C32ODkQ7K9GusFD8sJBN6OHy6RugGckbViA7JVvB5Gwb215UbxSSoU1Ndi
	HTWmdECd7dAgJh66aiVxcwFkNE56aCqFd+v8sR523JHjsdPrDxGnhekf3zcn4t84w9w3
	fi4SUn2umu4Bala2HvqiNDDGpQmjeNGLKG34wHmjuQ5ezvS8wKfei0Fo48g53HcYgOe0
	ruLQ==
X-Gm-Message-State: ALoCoQnUKbkD4KRMbtmoDwsLLtyRfYszqlJS2To/S1gw2DI4rXvMygnnc/yxgQLm3d1B1lWLEYS7
X-Received: by 10.52.229.4 with SMTP id sm4mr2592749vdc.50.1381361605489; Wed,
	09 Oct 2013 16:33:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 9 Oct 2013 16:33:05 -0700 (PDT)
In-Reply-To: <CABcZAN=u1TsXA745EJxv-NwHwv+HUvuzENGV7StnH=wOiOYB8Q@mail.gmail.com>
References: <1381242605-13393-1-git-send-email-ross.burton@intel.com>
	<1381242605-13393-2-git-send-email-ross.burton@intel.com>
	<CABcZAN=u1TsXA745EJxv-NwHwv+HUvuzENGV7StnH=wOiOYB8Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Oct 2013 00:33:05 +0100
Message-ID: <CAJTo0LY+xZMo6Xm=3JHD2HwP9NL4ou0t-AhMAF=y=cm5My5DXA@mail.gmail.com>
To: Chris Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane: configure option checking
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
X-List-Received-Date: Wed, 09 Oct 2013 23:33:24 -0000
Content-Type: text/plain; charset=UTF-8

On 10 October 2013 00:17, Chris Larson <clarson@kergoth.com> wrote:
> Why is the entire block in the try/except rather than just the
> subprocess.check_output()?

It could easily be just the check_output call if I pull the test into
a separate function so it can return after handling the exception
(which normally means that no warnings were found).  I'm not bothered
either way to be honest.

Ross

