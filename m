Return-Path: <ross.burton@intel.com>
Received: from mail-qe0-f41.google.com (mail-qe0-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 177D16B531
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 13:43:44 +0000 (UTC)
Received: by mail-qe0-f41.google.com with SMTP id gh4so18608160qeb.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2014 05:43:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OVGxCR6A1YMk4yOYYuUzb66JrNrwmOXRMP+wzmnwSTk=;
	b=I8gE/ENuRP4WigGNlz/VCQawvykZkHOIUiA1To+Qu/MYRk1xdImT/HIN+plsC80w1H
	sLzwXEiCcKS+0nKsv6uABYNBegoneErE/Jd2HPuGFEx3X017iUb+gtiI2QX/za9aa14e
	MhqPM5mjdvpkYsK+wRLVFpZe1eI70UxV5ZIRdTjwAi/OvhwcW7C+cFJB/jK7/46J7Yi1
	Y6aMam0jhNcnhMgY0E4O+m23EpjPj/q/hvDpP3q80bI04CWoJIe+thoM3oBp8NJlXngS
	Bfj4dJxkvsvPZoarJ5wZA+1Q1sAypgV5trhq6mS/iPEXnvE0XOhPjrFSLxhU6xWhriIl
	exUQ==
X-Gm-Message-State: ALoCoQkQOUkryzP6uKDskybRhXFhyghkhx8b3AzpyFO9jJD/pQ2WOuCng6zilMFaEo8EgZZIETCv
X-Received: by 10.49.51.66 with SMTP id i2mr183718858qeo.26.1389015824647;
	Mon, 06 Jan 2014 05:43:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Mon, 6 Jan 2014 05:43:23 -0800 (PST)
In-Reply-To: <4e72f16aff4f57ad0d71404c21727d78610b27d0.1388397582.git.liezhi.yang@windriver.com>
References: <cover.1388397582.git.liezhi.yang@windriver.com>
	<4e72f16aff4f57ad0d71404c21727d78610b27d0.1388397582.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Jan 2014 13:43:23 +0000
Message-ID: <CAJTo0Lawha6evfdNjAkqX3djsbeo44+N3dT02znhFK_k=hWMpA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] make: upgrade to 4.0
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
X-List-Received-Date: Mon, 06 Jan 2014 13:43:47 -0000
Content-Type: text/plain; charset=UTF-8

On 30 December 2013 10:02, Robert Yang <liezhi.yang@windriver.com> wrote:
> Upgrade to 4.0, remove the following patches since they have been fixed
> by the upgrade:
>  - expand_MAKEFLAGS.patch
>  - intermediate-target-bugfix.patch
>  - make-savannah-bug30612-fix_white_space.patch
>  - make-savannah-bug30612-handling_of_archives.patch

Have you tried a build from scratch using make-native as make instead
of host make?

Not that I'm concerned that in fixing the bugs there's new regressions...

Ross

