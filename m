Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5F778C7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 20:58:40 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id y9-v6so8932201vky.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 13:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HY20wvJbsR3OO9crgouP0B164YjXHSYCqBiYnB62jkw=;
	b=WRwiyDqyExXbomp094ZdGr/8ONH+z05iM6TMg/XCGUs+ZUcKcipvCc3xKVovDeRxE4
	tYtgLAn8EVQbGJIVwZ8CrIF7JeuOJI+Xd3i437J9KnvhKZwqKREDOemATy8HACdRwuHM
	g5LEXpKhAxb70khvFSzEqqH+5Lf+1mYKUAuEOXiDAix5ea+yJqUCg5AHanJjuKRro3uh
	NW78REnqhxISJEJixqVHX852sHF0EdqDom0EvzZtRIhpUeo7+S6a72EOIkS52VU38I2V
	gkNdJEnU4dENrF3GtSnd1WlvOz5f1VPoNZN0Y7p6BPbpOwgmXQSxEwTux4UnZ2m1wE24
	WsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HY20wvJbsR3OO9crgouP0B164YjXHSYCqBiYnB62jkw=;
	b=Zp6i3Tfy9Ec+/IwMhw7NBJfaZmjRn2gQHz59PiCey4NSW9EytYjAQO0o07hs9cZWXk
	HTYxudAAAoH9T6cZXVScsqxdIAUmAyfJDPKphmKc+Con67i/mE+UmBdhEeirM3BQEDqh
	4v627zuZ/fQBBHvxsfXrb+byGiRFAY7G1ioVVawbCBGlTPoRh6peMojMPtl87QQifFsQ
	1HZ3g4ZeKk3KGvssghK9WpqKL8tnZQzFoSJuRid0wRjEqinQQGOZMMP5cMXysVv1K15j
	uN17bXcaFyam11wptQIcye4P7V5HCIWYcYkytGPvIhpk/laezNdzDiz4mDXFgNEOSKVG
	s0DQ==
X-Gm-Message-State: AOUpUlGtZy4suXWmcmnWA/JmOahOIRCimckg97NR6CuVoOWy4L7LJZ3q
	V0jq9vXqdnym8Nzv6pwLoeUD6xJD+FQuXez3fcw=
X-Google-Smtp-Source: AA+uWPw6kcWzA872eNaXt1UVjzxqGy1uwubeml7aza09wahW8wL116mWZaYBvsEALt0uhz3jRNO7njMXrO0qtilW7Cg=
X-Received: by 2002:a1f:ce03:: with SMTP id
	e3-v6mr33855287vkg.22.1534885121110; 
	Tue, 21 Aug 2018 13:58:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Tue, 21 Aug 2018 13:58:40 -0700 (PDT)
In-Reply-To: <5adbae192a432b8997d266ddb4fb6860be4f5ccf.camel@linuxfoundation.org>
References: <20180719085353.4499-1-andrej.valek@siemens.com>
	<20180719113037.6337-1-andrej.valek@siemens.com>
	<3540cc10-ffab-8805-c471-0a7f12b81acc@siemens.com>
	<5adbae192a432b8997d266ddb4fb6860be4f5ccf.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 21 Aug 2018 13:58:40 -0700
Message-ID: <CAJ86T=Us-E+Q4Z8=8ZHHPZd05USx-UftS7wFs_EYyfCLOC-A4A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] busybox: update to 1.29.1
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
X-List-Received-Date: Tue, 21 Aug 2018 20:58:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 21, 2018 at 1:29 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2018-08-17 at 10:18 +0200, Andrej Valek wrote:
>> ping
>
> Fails to build on the autobuilder due to missing crypt headers. That is
> probably a missing DEPENDS but I'm wondering what changed and if the
> change was intentional.
>
> https://autobuilder.yocto.io/builders/nightly-x86/builds/1259/steps/BuildImages/logs/stdio
>
> https://autobuilder.yocto.io/builders/nightly-x32/builds/1225/steps/BuildImages/logs/stdio
>
> and more...

Busybox 1.29.2 has been out for a few weeks, so this patch should be
refreshed 1.29.1 -> 1.29.2 (as well as fixing the build issues).

