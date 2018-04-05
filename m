Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD1874F43
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 21:41:14 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id c24so30744996wrc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 14:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bf8HSpwruMBFMwY6pU1Wxg60pT0afjmdCpD5FmE17PU=;
	b=ub98VbMU35wZShs5HDgor3EGzgissYMTWUe3tSVF9cfN8uLd+9lon6wGPs4PkMsOTB
	jj+H/OaD6hEoLDe6Uw+LGLBwH1x7F8m+v1Y0MWiRggl7W6PGT3OOHuW2OlbkV7aj+aSQ
	1JcpMZ3JEB9+wmT9PggsCKBtd75r/5f3BaIIjsBCxf/ZM0kS7k6QKODOgWBwZk9Ahkyb
	HPHy2AhUoI+/vW5zUlzC0OsAsqmtXpkxh6OEWFhvYhx0GHtXpdFYG9LnwSD7L+8wYJV3
	vrgrtZfvxh0gNq0aiOLaQyX9mp5gNPG73uYyTVI3DAHqh0GmheRUVBJr2Ky4fEtDtzLB
	LhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bf8HSpwruMBFMwY6pU1Wxg60pT0afjmdCpD5FmE17PU=;
	b=ilkgRjh7awufIK1WoMNQLMNkRJ+rdDUZBDtenHEO9yzUTAPOztbEAuU0ZPuP6S7Y/F
	Ybyh9pme1q2/akQH84QPW0ydQ9XFZe7ve/FdyUDE1AxbkPLf6LqRR3MY0Q+WHJP5yapF
	L26hw/0woi+hfX9NDgC+lWJADsF2+aGK2OzzoZF4xlY2BvvgHRshms6cLJLoTcUsBF9U
	l+6heXZzD744fQtY/voqvuk5Z2baIuT2/EDuefhUox3mHV3s02ROhI7UT0OpxJ4bwzfj
	NZcvHj56FMzBfZMKzIuPAXCTCTXep7THWYxl9uk7f210QUV6MMqMiIm4egojyzDB6bJa
	GmbA==
X-Gm-Message-State: AElRT7ExMgZHZFrKtzdFDXCTrxNU40GAx1v3zQzFRWcycvfGKdv+nNuY
	lj/4bI+pJs/M7OTRXD/rM2+aMI8fbPFpmIfhRjnFdA==
X-Google-Smtp-Source: AIpwx49rDwj2RvuIQLVVwKmEPyhEZ8dZawVgA5WXwGNAmRE7tpD/ZjjQOCKNl5cmBelwKXI0QPEF3cKfECumJnod7Z4=
X-Received: by 10.223.175.201 with SMTP id y9mr16913589wrd.107.1522964475387; 
	Thu, 05 Apr 2018 14:41:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Thu, 5 Apr 2018 14:41:14 -0700 (PDT)
In-Reply-To: <cover.1522936224.git.akuster808@gmail.com>
References: <cover.1522936224.git.akuster808@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 5 Apr 2018 14:41:14 -0700
Message-ID: <CAJ86T=XmqNbTF+qXWhG5xFHNBUnRCaDx5DKeTQ_Y+wfqhgbiyg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/38] Morty Next pull request
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
X-List-Received-Date: Thu, 05 Apr 2018 21:41:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 5, 2018 at 6:53 AM, Armin Kuster <akuster808@gmail.com> wrote:
> Please consider these changes for Morty. Clean AB build
>
> This included sdk locale and host glibc 2.27 fixes.
>
> The following changes since commit 34b26ec18450a3bc72f7b8a0f2df0bfaae1140dd:
>
>   linux-firmware: Add reference to iwlwifi-8000C firmware (2018-03-19 15:58:33 +0000)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib stable/morty-next
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stable/morty-next
>
> Richard Purdie (4):
>   lib/oe/package_manager/sdk: Ensure do_populate_sdk_ext and
>     do_populate_sdk repos don't conflict
>   glibc: Separate locale files to their own sstate task

This commit comes with the comment:

    Putting the locale and script files into the sysroot for use by their
    specific recipes used to be a simple way to share the files. With RSS,
    we don't want to copy these into many different recipes so put these
    files in their own sstate task.

Is it safe to backport to morty, which doesn't have RSS?

>   image/packagegroup/populate_sdk: Drop do_populate_sysroot task
>     properly
>   glibc-package: Avoid race sstate races with do_stash_locale

