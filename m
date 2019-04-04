Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f180.google.com (mail-it1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id DE7B17D169
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 08:52:02 +0000 (UTC)
Received: by mail-it1-f180.google.com with SMTP id z17so7633067itc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 01:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=upTEUYmfPcDZjW/Beoxg4M/pYQgNATIeMl4D1DKpZwo=;
	b=vTec1wGQxiTaupLTJky+hN2ZXXJ7SM+PEII2lZqwcUsBKY/MiLtYZ1ZNXYwc+2Lqwp
	rJdyEl52Tf2XpwHXdbvkw2DvfQOBPjAad7gYLx1YxMbepwjHgqKjb5XiRfqBO+zz3JP4
	KHrghrrMNtTvAtDm46Uj56SGf+xensQ76OoQNM8BxeuKy0bRVO3MgJ9v93jle4aBslll
	6Ykuqe8/wovPjHfn3TZTo50LaaXF4y4GXiVTrcujE/GbEC2yESt4l2b5AqA/RFpNtVr6
	mcejOs+SQ5Si0ELnLpzeArEqgJ+7sTN98XjZwpnJu+LOqIZ9E4BMdRK/evtJ4TrzOR3G
	/GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=upTEUYmfPcDZjW/Beoxg4M/pYQgNATIeMl4D1DKpZwo=;
	b=AnSsKC5celiCgdQ6CB/0zjUGNhpkEKfLX0fQajOQhY4nKHlnul2m1Jp6Qo4ncjEl37
	x00HXQXoCO2HWesUmvCO61nQwgukyD4VMz9E/coOK+coQWhPiopEu0rNtHlgvnCqk8qW
	c/1pE1PNdj23Hgbhg7emLlwq4eGdBFneKGQtpM/LhteuNINPw6VLUnkliNMBzqujQnH6
	gWl+KK/y1/QtSIuviZEZKsrkX3ydh9Af4jx/BTK2eCqwjrApNhFpIzAYpu9kLakDKLKp
	KonqhLChPpcW7MBPSONslhAWEPXmnFGTUZklKJjudY9BcdkdVQU6jJGKZvZFEyRfBifX
	q52w==
X-Gm-Message-State: APjAAAWDlcKeW2hm5OCJuTvqBHKnPDVvTGMCTnsT7QTyEFh2cSkmbP6Y
	eOzhQjJya37XE6Z7/buWax27z2Bf2cjC61py1ye7iw==
X-Google-Smtp-Source: APXvYqzO/wAti/PkDceBz7yRtD2JJZU1tydeoLD8CljzRhYXgRfU1cTsYqtaDvGNy+PVGwjsq0rJsoJ5lKyGO+rzVjU=
X-Received: by 2002:a02:7a48:: with SMTP id z8mr3662891jad.62.1554367923920;
	Thu, 04 Apr 2019 01:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190403123657.10547-1-ovidiu.panait@windriver.com>
	<CAJTo0LZ_zeiAChah_z4TMauj4vNhmHghQqezjnL4T2kJUeUiww@mail.gmail.com>
	<c44f9100-579c-75ed-be2d-46e6e8d038ab@windriver.com>
In-Reply-To: <c44f9100-579c-75ed-be2d-46e6e8d038ab@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Apr 2019 09:51:52 +0100
Message-ID: <CAJTo0LY5Ji0GcT+_G0Xx0WwwfUbDY1V1SKnhqpUr967+HwESag@mail.gmail.com>
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] ghostscript: Fix CVE-2019-3835 and CVE-2019-3838
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
X-List-Received-Date: Thu, 04 Apr 2019 08:52:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Apr 2019 at 07:56, Ovidiu Panait <ovidiu.panait@windriver.com> wrote:
> > Have all of these been resolved in master?
> >
> > Ross
>
> No, these have not been resolved in master. Ghostscript version on
> master is 9.26 and the fixes come from 9.27, which hasn't been released yet.
>
> I only sent them for thud since I remember that on master is preferred
> to upgrade to a newer version when it's available instead of backporting
> fixes.

Policy is that security issues are fixed in master then the release
branches, so that we don't regress.  If this is merged then the next
release will be vulnerable because it is frozen for upgrades right
now...

Ross

