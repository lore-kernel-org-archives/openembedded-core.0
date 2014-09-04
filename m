Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id DF3EB71498
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 19:37:46 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id w7so10939925qcr.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 12:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bgDl6e8O6J7ja378MPf2B5nA5SCD0FOC7GSNe17r6gs=;
	b=YA7QabYEI6sO236TJ2N0uq8juwjsX7xlA5UVJtLYwrBZjY3anukEYYm3tdQAQtzEZz
	k4Rx80GLdGKtuNqxDcXiA8a1WK0qfD0x1kZQ6WU4ZCEB2+UuLJV9yzX1EmsNV8sk0r3v
	iiSj0UxBRLom1FEbXKN2FFe2IV1UQ6D8SkecFJ9nzHo0oAhHgZsHhFTyixReoe3pfXxp
	lmmkbs2TN+bqT8qrG4vFv7mY6a45wmAUwVuF1a5wM1KjBWx9C9QxWwEWCJ/Lt+tea3Qu
	ZF7hzOXRgiDRN3mj6KkLH+npUu+3emJ0WDeNVnOeg721IjbvNp8g++GVQQB8Oiqnm4Zq
	KUlg==
X-Gm-Message-State: ALoCoQmBprrd3nBxFX8CRr54k5HV5gutrvdxjTWyev8Hsg5k97nka3s3VY4OHkPns2ykqPr+emvP
X-Received: by 10.229.206.68 with SMTP id ft4mr10727690qcb.28.1409859462567;
	Thu, 04 Sep 2014 12:37:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 12:37:22 -0700 (PDT)
In-Reply-To: <5408BDC6.2060006@pabigot.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<c57d855c12c783cdfa52f304e52fc2fd1267dd96.1409655125.git.Qi.Chen@windriver.com>
	<5408BDC6.2060006@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 20:37:22 +0100
Message-ID: <CAJTo0LbwGsQc1Qyb-cMLPJfLgc6hMW44vfK9UgJUYhExC2TJiA@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/26] systemd: upgrade to 216
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
X-List-Received-Date: Thu, 04 Sep 2014 19:37:54 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2014 20:30, Peter A. Bigot <pab@pabigot.com> wrote:
> Further investigation suggests that systemd-networkd is intended to do the
> same sort of thing as connman, though so maybe I need to shoot that instead.
>
> I have no answers, but just wanted to note that there now appears to be some
> conflict between connman and systemd that didn't used to be there. Maybe
> systemd-networkd and its constituent pieces need to be pulled out as a
> separate package?  Or some sort of conflict detection if both connman and
> systemd-networkd are in the same image?

systemd-networkd is meant for early init or "simple" configuration and
there's meant to be handover from systemd to connman.  At least that's
what I was told, and the connman authors have contributed code to
systemd...

Chen, can you look into this?  I'll chase when I'm up tomorrow if
you've not managed to resolve this already.

Ross

