Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5414378433
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 19:16:05 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id q66so6047966wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 11:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qrdlcGWkD90yxcxNcZWPxYBsnjnWvFbydRlNkEWhyWc=;
	b=lVnhgzE9Pbjd/z4d0Ljs+bJwTD/avV3ZT9/bCc5Sq1eYJ2J/ClusH74vORINgsv0P5
	LtHgB/9a9pDFcS5e9P8N8HZGNV8noz7cxrXxV47LnB7LekspTjVxZ30HyDk0jj2vL6HG
	2KtnG06htBH8aX+WQSkKE+V1BLnoRuWQrOKIlFf+irS4lyQ9X7LxLWnI3nHGt8KATqz9
	zUKp2QvnZGmkHupJjF1OqdwV6MgJ/6H6GLbDCWBap/XtvCBHf89AwwGSvWq0IdmW8HIg
	bn4NnrFfEhomrwjm5E68BNdwkf9FJvvk4qc+hTxB+mcmXL1Q5MOuSxNU8b1cqa3Ot69B
	HygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qrdlcGWkD90yxcxNcZWPxYBsnjnWvFbydRlNkEWhyWc=;
	b=S/tqTK3cJfegmoDK96zbnm0KYg29RGbjz0B2uSteSv7vuchI2yL1AYkQuzoyj4aolj
	KspgfkFixnmsHy9zKd2ZhKT6eYY6/HeQ/ro3x/RJ2QCGY3Ojj++KxWZNP41IRyshxyuN
	p0AhUiZmk61h+ASzr0nYSfssSoq+pPlgGY0xgxTi0SgY/PYUiMl411mDWMpKTKhAappZ
	JhbqkZZHV6hx4zBzaoquRIOMkGyY3wGmbg47JUWVMoO5kk+8mGrdzMQIHjCtCDrLr2B4
	TLIiDqy20AW9AtsjuxTqlV4U/i8+JpLQO0vvkJRGyvEs9NNHJ1uZ/mw/QmdnAMz3chpP
	j5uA==
X-Gm-Message-State: AMCzsaXEUPqfnqCJOEBkUylH93oN0rk2T2ElZI9JkkNiENcfCvIOElr2
	JXfMWGa8jbvqX4b1SnfzONGWvCaMfx0/MyFZIu4=
X-Google-Smtp-Source: ABhQp+T5YX9p2QvcsRvbIneLKkHYbTH2zBta1W7++5FQ3wVWXDAoemyrBPjWYRD8bP7g2Ib4cu00lAHPDxYlw1/chZ4=
X-Received: by 10.223.145.165 with SMTP id 34mr11989042wri.140.1509995767030; 
	Mon, 06 Nov 2017 11:16:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.199.140 with HTTP; Mon, 6 Nov 2017 11:16:06 -0800 (PST)
In-Reply-To: <CAJTo0La7eK950Up4033qmX_1PQnS5nJJt4zb_P7uJn1Y8eO0QQ@mail.gmail.com>
References: <CAEg-Je9nrUypvdDyTXMDTqgv9qBB_R0VSA_hzs6pswkzPJgr7Q@mail.gmail.com>
	<CAJTo0La7eK950Up4033qmX_1PQnS5nJJt4zb_P7uJn1Y8eO0QQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 6 Nov 2017 11:16:06 -0800
Message-ID: <CAJ86T=VN8PDUWrNAuW=y_RpUEoOtGa-TyufyGwbZT6APPMsm9A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Releases of BitBake to package for Fedora?
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
X-List-Received-Date: Mon, 06 Nov 2017 19:16:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 6, 2017 at 3:33 AM, Burton, Ross <ross.burton@intel.com> wrote:
> The bitbake API isn't really stable and has a reasonable amount of change,
> so if you were to package it then there's a good chance it would be out of
> date within six months and people who wanted to use the latest oe-core
> release against the packaged bitbake would hit API version errors.  The
> recommended usage is to bundle in some way bitbake and the metadata
> (combo-layer, submodules, repo, whatever).
>
> As such there are no tarballs.  There are branches for each version and
> commits where the version is bumped, if you're really determined to package
> a snapshot.

If there's no realistic hope of (or need for) using bitbake standalone
then maybe it's time to move bitbake into oe-core?

