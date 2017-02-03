Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0C19971D9C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 01:07:43 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id b65so4735367wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 17:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EU8ChtCQ69e/7m/4AKSum0FSJA0le7C9TiCp80RJEgU=;
	b=SrBLPCFikSqD4PC30NHeYBa5SMzW1MNXywTB3DkIOopFUyGJABCVZ/S26FewVrTzft
	5ZgaJ3mrTWOZnuwCLdfXWwgN5C3IPqKNfxaMidirnm0EmyV1DbYhBNHbccC8H8xjFR1w
	yVshrSKariG67tVRGdoKrdfOBviqngbT/JcxzzJsFQTyYSodpsOQSmkdjX/qSlKnz6LD
	7PekeO5nDIJydQs8/49RQ+FDcVM10RQbSBo1/LRLJEBb7kEByTI3+Xy6Owy66jEVpRKP
	yCBtZYXUDcB62RmYGAPjJ5Y10T9ypYd/uQP8ErUNgOBLdnoCBRaasVgm6nJ4ocd+tQ/q
	5N+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EU8ChtCQ69e/7m/4AKSum0FSJA0le7C9TiCp80RJEgU=;
	b=Jjaw4khnGhnGN7zekOAfIqFgFL9ubiw4EPWzgNnZArFUk17gS9dPyVF/3DAeS7qvhn
	BBKkyXVNf7Hyx5aWZ0ekGVR+Yv50MyeJUPwmObw74Ctj3Op7aO//z3zABsIwqE19eCWw
	dIGx+hjy0NYSbLWX82Djr30xyGw5L/ZVsqkX3QFtJApbxL9CoV5mCB3fUrLDqoXaqIrd
	Kzu6Fii7+0+mzDy+8ivztqDOT++jUPLFzlawCU70b0+4S3AqXw2yFaz1m6vakeesk0TR
	HKosQ2TymjX5KrpFdyU5UgvHwyOiDguLteTKCvmiz0mIyIt6w9Lr7YCA7gg6K8Pn2qWK
	Qu+A==
X-Gm-Message-State: AMke39lDVLh5YBXpZL0w9LaIjw9lrMwu+KC3ni7kXm65AP6yS4yfUkmlY0fNrVLCUuwHnxvOpUa2dRP4WQDrNA==
X-Received: by 10.28.56.134 with SMTP id f128mr222701wma.29.1486084063620;
	Thu, 02 Feb 2017 17:07:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.195.17.228 with HTTP; Thu, 2 Feb 2017 17:07:42 -0800 (PST)
In-Reply-To: <1485556151-9063-1-git-send-email-armccurdy@gmail.com>
References: <1485556151-9063-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 2 Feb 2017 17:07:42 -0800
Message-ID: <CAJ86T=XpXr3jvAj81Qt9C_FUNjrGkiNT6_Wn+DJyk-ZOaH1axA@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] replace USE_LDCONFIG with ldconfig distro feature
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
X-List-Received-Date: Fri, 03 Feb 2017 01:07:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 27, 2017 at 2:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Andre McCurdy (2):
>   bitbake.conf: replace USE_LDCONFIG with new "ldconfig" distro feature
>   systemd: check "ldconfig" distro feature when setting PACKAGECONFIG

Ping!

>  meta/classes/package.bbclass              | 5 +----
>  meta/conf/bitbake.conf                    | 2 +-
>  meta/recipes-core/glibc/glibc-package.inc | 9 +++------
>  meta/recipes-core/systemd/systemd_232.bb  | 2 +-
>  4 files changed, 6 insertions(+), 12 deletions(-)
>
> --
> 1.9.1
>

