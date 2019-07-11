Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 87CFD7EF58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 10:47:05 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id m24so11537962ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EztrYtBKqaW3j2R3wmZQ4NF2Cj33mVFCz2FAh8DEvbM=;
	b=t72QZY4XuxN/5LjwaZv9HCtClmlxH0T3k2tiNaJTTUjGyIWt9QJ0ZgRB7aTsEIr3Se
	PP+gYwPD+Q6QIm/EE/R+caR9RbYnBlz9F20CvRBEsQpsayV3eXa1t6JQ01V/N+83Zvzl
	Zf11hywGVdNmlohTw/1lT9GpFQrMM8TEAfVlXuCjYp/Cxjv8zPkPjIIa4wpKS6y7TVDo
	tgMY8kpl9orItguHx2pdIpndCQZXK2BePhs2ASFLMjwimE6zV4zI4lN3/8iiRFiXz1Jw
	6fbB9GcN/d0i/QCbgYMW7j66nOpScpWy6valNDJVY06geRPQ953DwNJWZ5gvzJek56Xy
	Dbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EztrYtBKqaW3j2R3wmZQ4NF2Cj33mVFCz2FAh8DEvbM=;
	b=U+/V+xVAkCJFivWQrGopAz/2qIOTcPRV+tQSBleILVR0LewSUx7exav8DVQrtha13D
	ix1rXuE89JSXq+aj0N5643AadfSuUApFQ6t7C+TuJt18uZZCYHA4s4k/qvkI117WV6ni
	EbYnQOdGcsdDyPqLSq0AuBMLaE+lTG4d2408g2a1pO6P6eDQQQBC3W+2QJ18lHxu+K/L
	IMzZxIPI9+8tKgBcd1W5JB2HGtYCKoqmj68XzLi5PdChKTHhIPcO+RT9Nsh+FKSJ4MNf
	7AoL8s/fPvkudzToZ2WGXfRAlvkH2KjRYvm+0fDvPdRuA7CppDLRPJPO6flBP6byZGlv
	5Kcg==
X-Gm-Message-State: APjAAAW0NIgfDTTB/l4T8aELYlgH+Nq2X4L8eFRBdYVLBRuACEP1X49d
	rdyJCmsmaRLtxj8gSL6vVGRSJPVG8L0jvYJ+aebrsA==
X-Google-Smtp-Source: APXvYqxaCRcUfBCMwU5ogMehdrqO55+xdme3xxT+XdQaqLc8jpwUEuK6b5bA+6H/T/6xTb3lkeD6cAINUwdbHldZpQs=
X-Received: by 2002:a02:a90a:: with SMTP id n10mr3631149jam.61.1562842026578; 
	Thu, 11 Jul 2019 03:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561724553.git.liezhi.yang@windriver.com>
	<37d251c3a3f0b81fa910df996f54bc0be22cf846.1561724553.git.liezhi.yang@windriver.com>
	<CAJTo0LYyTbnvKE2_YAK4_Xu1csQaqLcMg5fCKCMxJ49vk3SepA@mail.gmail.com>
	<add0a48c-e769-9b86-1de7-88a156b3a599@windriver.com>
	<CAJTo0LaNjqmPG0RnRmeNOOeVqnX=muVCeyWcjtFW+1gnidRQmw@mail.gmail.com>
In-Reply-To: <CAJTo0LaNjqmPG0RnRmeNOOeVqnX=muVCeyWcjtFW+1gnidRQmw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2019 11:46:55 +0100
Message-ID: <CAJTo0LboCz4FYFU5Rmy7a8XQXqXJCY1DNbpqHA7p_Anz+rgGow@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] waf: python2 -> python3
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
X-List-Received-Date: Thu, 11 Jul 2019 10:47:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jul 2019 at 11:26, Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 11 Jul 2019 at 03:59, Robert Yang <liezhi.yang@windriver.com> wrote:
> > On 6/28/19 8:15 PM, Burton, Ross wrote:
> > > Did you just do the minimum required, or take a new copy of waf from upstream?
> > >
> > > (https://gitlab.com/ita1024/waf/)
> >
> > I checked the one from upstream, it is still python2. The waf is the only one
> > which still requires python2 in oe-core. We can get rid of python2 after this
> > patch, what's your opinion, please?
>
> If that's the case then YES YES YES.  :)

Follow-up: do you mean remove python2 from HOSTTOOLS, or the recipe
from oe-core?

$ bitbake -g world
$ grep -- '-> "python"' recipe-depends.dot
"kernel-devsrc" -> "python"
"ltp" -> "python"
"meta-world-pkgdata" -> "python"
"packagegroup-core-tools-profile" -> "python"
"packagegroup-core-tools-testapps" -> "python"
"packagegroup-self-hosted" -> "python"
"perf" -> "python"
"python-nose" -> "python"
"python-numpy" -> "python"
"python-scons" -> "python"
"python-setuptools" -> "python"

Nothing depends on the python-* in core, we can ignore the
packagegroups, so that leaves kernel-devsrc, ltp, and perf. Also
u-boot uses nativepython.

HOSTTOOLS is more complicated and there's still plenty of pieces that
use host python.  I've an old poky-contrib:ross/nopy2 branch that
fixes a few more users of host python2 that needs rebasing and
retesting.

Ross

Ross

