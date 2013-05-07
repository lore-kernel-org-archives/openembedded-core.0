Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UZeu1-0004Zo-JO
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:13:46 +0200
Received: by mail-vc0-f180.google.com with SMTP id hv10so290278vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 02:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=VBJR+T6YgRG1IwYnebQ6Alpn90nd78vB7GNa4Nxe4Zc=;
	b=oJSyoQDd4Rk3aXJnYWHBqNOCmjnUdQRHSyGZSdxGAAL9fe9JGGvQoszJ4ZUMWTO+nF
	+ir4F3tTfDJADQ1YNGf49gowW1UpOU1zQDUW8u0QtVzwsLol+mt48i0KnEo1ahIJTJOv
	SfCUy+wrvzqXsMspEj1sjagROG4cM6fpZTc63+ledZIUhuPjpKLXSjT6hg5e4a1gzFL9
	GdzQ7JQn2m41bbwUIrbsDQH2X+4qtM5LnQ2s2xyQR80pFVeu/j9+i+5JOFmK9MVbS10M
	WMPnwoEGiqPN/uHXkr3/E8J4hKiXXEjrmsIcie8ZVEUE73FGPHiQkYrUazcPgB96/F/I
	uW0Q==
X-Received: by 10.220.96.76 with SMTP id g12mr640250vcn.53.1367920544696; Tue,
	07 May 2013 02:55:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 7 May 2013 02:55:24 -0700 (PDT)
In-Reply-To: <1367787030-5056-1-git-send-email-dv@pseudoterminal.org>
References: <1367787030-5056-1-git-send-email-dv@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 May 2013 10:55:24 +0100
Message-ID: <CAJTo0LZrtVHq4PpF4uEL+_GeQBzDOMTEu-rt39j7agamGOe+MQ@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
X-Gm-Message-State: ALoCoQkuQbKqFOl7Q0DzagNLjLCQkyc0XSaq0HzZW+2CvsrRG/FbUJ/XffDcv0shzHdaVWWaGA0H
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer: Fixed dependency problem with -meta packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 10:13:51 -0000
Content-Type: text/plain; charset=UTF-8

On 5 May 2013 21:50, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> Installing the gstreamer -meta packages was not possible, because the
> -apps and -glib packages were missing. Allowing for empty -apps/glib
> packages fixes this.

From what I can tell there's only one -apps package
(gst-plugins-base-apps) and one -glib package (gst-plugins-bad-glib),
so why not add those extra dependencies in -base and -bad explicitly
instead of creating empty packages for no reason?

Ross


