Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 60E5660797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 11:05:08 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 13-v6so6741087ois.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 04:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=anzH79pO/hOSZkWJ8u7qdpAtR2KKFmmkr0WOXjZQJKg=;
	b=fzFFOaNptFzPZl9Xs2MMu/HJcOKKACqJXRsZ9SgrEl/QevZuBenlj3jZyvSPJXRjgE
	rrXPbhbbwxjieisKM9c7TD9jWeRNFUSdpBe4dZQwgB8I1E9jbmLHrXqMQFjzgKgwCrlm
	CiltbAi0wDj3BTXoi4nP8IeWdGmuVBCuD40bu+QlF7HOn3t2/Ltd6RCzxBj9DmUBV2Oc
	oN8fAqqb3hnKUQ2vVHV0zsVF7fg3CsqXPZX/rbUvOhUYAjWx5LToa9xqzl+YqPpC6wq6
	/nbgT1NZNHKlSFNVMAp0O2dI2rH48y7DvhPsIWHIleAtGGI7ureZI02RzAEfI9/Ix7IO
	jpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=anzH79pO/hOSZkWJ8u7qdpAtR2KKFmmkr0WOXjZQJKg=;
	b=rYK6LPddVe/z063RDKhDh8k9hfIBnhXx4khXKjAdMQjgbw0iWWq5TAIRGQZ/7pcTos
	VQdLplc7fwvOA/ZroIxAzIxkC0jvlmduUX/mzXkgX19YYGxpimZnBOYdU4BoHUb8j3tR
	AZPe6wktPyobRwAEOpzld+yLsH+XWu2/qIHO4S1OEyJ05syTmJLBGxjIZvTRa92kvga+
	n4v1QXRTIZmKY0Qjij9sYLmpWxbJSqyuZzoYUOwQmcTPB4mA2xRVtx9HUIoHhOClmAYq
	Wv1NohWq3n/bjct1vTnObdcoYd0aC1r/pXLTBYXl5B1fejF93FBtcxO3XMa+RpcdkJjL
	o/qw==
X-Gm-Message-State: AOUpUlGX4lfL2/APkVDFoyI7/gZXZXEIIjGoh9fErTuC/fnrA/tc0BkC
	CY+JrhrgTgJc0XRKsM3CebMjmtNYvhV/v0aMPyVvEWl9
X-Google-Smtp-Source: AAOMgpcU5l8GbdnE32bNsVBM8vwN45fOnnBgiEzE2z2Fem/ZSMnDtrBi3ggPbdnk8obhZX37gPeRUPd05wGz008FAJ8=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr2869513oih.102.1532430309383; 
	Tue, 24 Jul 2018 04:05:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 24 Jul 2018 04:04:48
	-0700 (PDT)
In-Reply-To: <20180724105222.25606-6-dv@pseudoterminal.org>
References: <20180724105222.25606-1-dv@pseudoterminal.org>
	<20180724105222.25606-6-dv@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Jul 2018 12:04:48 +0100
Message-ID: <CAJTo0LavvoSVEOFXEwcJB3snMk7HgR-CWJF_hhVDAT9UyJqRLQ@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 6/6] gstreamer1.0-libav: Replace German umlaut to avoid parsing problems
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
X-List-Received-Date: Tue, 24 Jul 2018 11:05:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It can? Where?  That's surely a bug...

Ross

On 24 July 2018 at 11:52, Carlos Rafael Giani <dv@pseudoterminal.org> wrote=
:
> The umlaut can cause issues related to encoding; avoid by replacing it
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  .../workaround-to-build-gst-libav-for-i586-with-gcc.patch       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaro=
und-to-build-gst-libav-for-i586-with-gcc.patch b/meta/recipes-multimedia/gs=
treamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.=
patch
> index 36abf8607e..5355480aa4 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-=
build-gst-libav-for-i586-with-gcc.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-=
build-gst-libav-for-i586-with-gcc.patch
> @@ -1,5 +1,5 @@
>  Description: Workaround to build libav for i586 with gcc 4.9.2 by avoidi=
ng memset
> -Author: Bernhard =C3=9Cbelacker <bernhardu@vr-web.de>
> +Author: Bernhard Uebelacker <bernhardu@vr-web.de>
>
>  ---
>  Bug-Debian: https://bugs.debian.org/783082
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

