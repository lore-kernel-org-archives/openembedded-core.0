Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD9F60144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 11:23:24 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id i13so4433414qae.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 04:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FnJkVaZptfT8rnFg0n1zUcWnEw1oClx2W9YbyJvuy6o=;
	b=SCP1IOk7f7Dp2k3SBO8qInvzHV/LE0cTzSs49vA3yOV0D/C0o5hglhwEFm4lQhA7yW
	BZs7Y+Unvq5aoQIYkhjGnAYIh1HrmJUrZNc2RU4mhWkVveDTYef4TEooG0x1TMMCHCF8
	k2jlffTCyksVPrFp6dcU3g+yNJEGDtPmB7C4ax8DUG3n2tMWZOqFCDlc3ekyvP212jD0
	dXdIOKcIMejz6qlmFTY80Cdm/sQQG/DNXzI1Q5sIIIZgzUhEUa8NX/SnikrSGFo+5DGH
	4hxQECqHG0SgukgWvtdn/yMZvtSEuf2vciOdYq6MAkuM6F/VhPRx0bxAAnXrpnMTuuVC
	uUcg==
X-Gm-Message-State: ALoCoQm6RsPWZvVd2hLt4psa4+0TytMD7/RbHtaxc/ssI+vJ2Qtl/USYw7fks1KY1LVLXh9cy9dh
X-Received: by 10.224.104.2 with SMTP id m2mr18041195qao.52.1411644200407;
	Thu, 25 Sep 2014 04:23:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 25 Sep 2014 04:23:00 -0700 (PDT)
In-Reply-To: <5423F97B.6020705@pabigot.com>
References: <1411148655-5500-1-git-send-email-pab@pabigot.com>
	<54229DB5.90806@pabigot.com>
	<CAJTo0LY0a9_Rb5Eyq3b20ML89YcVkNS0N=NnXL-zkUQescGu3Q@mail.gmail.com>
	<5423F97B.6020705@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Sep 2014 12:23:00 +0100
Message-ID: <CAJTo0LbX7eq-+Ji9ivzQvQQiaD3=sXGNx5jGTk-cgfXHRE9MSA@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] git: add Git perl module to perltools package
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
X-List-Received-Date: Thu, 25 Sep 2014 11:23:26 -0000
Content-Type: text/plain; charset=UTF-8

On 25 September 2014 12:16, Peter A. Bigot <pab@pabigot.com> wrote:
> Can you suggest a way to reproduce the problem?  Or a pointer to the log
> where the errors above can be seen in context?

Build nativesdk-git, not git-nativesdk.

Ross

