Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 112B47BFA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 13:09:31 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id m62so3971695ith.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 05:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Xy6fmr/EDOOUghKEsQUHIB/TD0G1TlMlrppD8auBTKI=;
	b=U0YZHo9xFz9YDUmAFpi3hmpdx1TO3iYXcSabinZjimKZXzS/Iznh2Q+le2sPXYWl5M
	XInIujqUU3a6dhjC5oOFwU3G/7Nu2bxaQzPNZspR3KXRzG1p201gwmmlflxfqgBS8Hwv
	cyvZUK+jh8Mlen7vhoxzCQJTGzeu8axVQ+LABRLFzCJjEqlFq1VXaCIUgOoKMwYMIFoS
	UC7NjOJB9WyxUcrCMrIzp3jhVRf+5cKJkCuNcarmqPlj4p3ImhEuGJjalKTRcExQGW5x
	5TAKfJtZCUc7xu3vKCyVw89Nb3s7Bpwjl0993mPAltfcyjaZ4X1hAC+CaFiuvzeXkC2k
	JTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xy6fmr/EDOOUghKEsQUHIB/TD0G1TlMlrppD8auBTKI=;
	b=dIYKwxZkHhD9+Z8CsKi1+ml1c9A2om+8PvPnSwq6foH6KEQziOPgFmOHUNIB61UTLE
	cCXfmyVC/WrAyJ3feKKIyjGcrYHR0BPaIeXO6d/VFbPdXUbjT1dJwEJu1vUJz9uZ30OY
	85i7rKGCDJm1DuVYpIJFjupO1yJ3hAH0UXGRD8uHb/pqdZg3Kt+/TCWSWpqMf7aw8RM+
	EuarQX1q2evf4V/5a65r5uiJhJHr6iQ54cU33D63FUIY9sv+IR64TDSM4cNp/aOn1YEV
	d7+AZ8/dwSZjPHbZJjQ1WojZhgVbfAY8x2azczvIma/jmvDVW1L9QX2guCZN7ERqxDzu
	oUsg==
X-Gm-Message-State: AA+aEWYnbjaPDgEvXE8WsZJ1ZEk99f6Z9/60rqCJwfNVUCaIyQsqiVIy
	K+9molwcJKAtRWbPDufwTbOXrYOKsNzAS0jvM1i4EQ==
X-Google-Smtp-Source: AFSGD/XA7YDnNtx2sZ9UHmBylJQqBjEFUpOrrZjnrZUBnTy6YDuRwSLErWlkgOVu7fLLrZpvQUrvhjmgbV9A1cj5LDE=
X-Received: by 2002:a24:c601:: with SMTP id j1mr3037463itg.130.1545138573097; 
	Tue, 18 Dec 2018 05:09:33 -0800 (PST)
MIME-Version: 1.0
References: <20181215125926.12227-1-sno@netbsd.org>
	<CAJTo0LYR+x05NHQMN_bfLgSnceiOCRznodAFza-UBkyT_NZh=w@mail.gmail.com>
	<A198D244-A078-49CF-941D-41BF011F39F1@netbsd.org>
In-Reply-To: <A198D244-A078-49CF-941D-41BF011F39F1@netbsd.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Dec 2018 13:09:20 +0000
Message-ID: <CAJTo0LamSuzh+Z9tp2VvSbyq9FNmmvs2XHEYCpo-=eAbX5HbOQ@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_deb.bbclass: report error during creation
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
X-List-Received-Date: Tue, 18 Dec 2018 13:09:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Dec 2018 at 12:58, Jens Rehsack <sno@netbsd.org> wrote:
> Do this as one bb.error
>
> Sure
> and you won't need to re-raise as it will fail.
> So neither raise nor pass - just print?

bb.fatal will show the message and raise an exception itself, or
bb.error()/return. Either works.

Ross

