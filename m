Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id A4CF160620
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 10:42:17 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id g195so65344677qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 03:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gOMgLwjoFF3ur7Mb8p8MCYcccPo3cPCNbHtTwM8scAk=;
	b=RAORvkjubjPGBO6DSAtq9+UTXAs1EFuoZ8w/ySquB87IdBmo00OTdWY/v/mjOi7S6X
	Z5bTuJEBGC4RkCm5qn5SR2BDKZrwH52Ep0bpETAvya0C7NlDpRk7dJi/DGsZ58JOJ9sr
	cFH96+I7r//p2YGZkOzzPKhmFOaoVP7VhdWAZHWG6ayqiEOesAanDKBtNtI+cjXI2Mg7
	uzhvVRq0MphQjZz4FUTOLy3aLwj/i9eka6VFIhTrupvZyVj8l8xdKcpJTRgGkGzzqL2u
	o3ju/KBk6AVCcfpy8jjewNrGZIZ1LMFTSjdyBatBd6p4zpI3vnRgYeEWuxii+5Tu8q7f
	sVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gOMgLwjoFF3ur7Mb8p8MCYcccPo3cPCNbHtTwM8scAk=;
	b=a3Es2V6gdfyYEFyDUFgBODZV8m9bdnTCjj2E801NtKKQfG4HjnK2JswfnCw5cNSJEM
	O68cBN989U3sKj3QyMwnZysmkMUkQWNWHRpVfL/6IQDucX/Gm7J/yGWVEMIUthx5SQ/H
	eqxfdww4IN3rRkDAskA3IU7wZtpjEqQGb9tQvnVKVcDTSVwv26yTAm/7dkvDLyQHwvDC
	Q7PJas7GVlQH7lxYk+HxnGn8zLFyL2PTDMWurmEjPS0YKCCko9WNmHE12/9uIebGCRL6
	UkCpSX6YFbwJ8rIfSuLdqGlbs6RzhKnLODp5wEZ6LnuY2TaI6NgHz2LK3N0wI/ixrl2y
	CxjQ==
X-Gm-Message-State: AFeK/H2Eb9zEX80g7vkzGAtQi2W3lXREi7953XPnGSmJdO9avkaaDMA2C5fgnP0mc9djYw77GvI8bLW+A2fgdEZ2
X-Received: by 10.55.123.6 with SMTP id w6mr24119348qkc.36.1491302538658; Tue,
	04 Apr 2017 03:42:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 4 Apr 2017 03:41:58 -0700 (PDT)
In-Reply-To: <1491233968.17259.79.camel@linux.intel.com>
References: <20170402213135.21193-1-pbarker@toganlabs.com>
	<1491233968.17259.79.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Apr 2017 11:41:58 +0100
Message-ID: <CAJTo0LYL5iz_PCVPFK3tmypyRmoDiNh2w6XSsSnRyp6EGYz3Lg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ethtool: Switch to download mirror
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
X-List-Received-Date: Tue, 04 Apr 2017 10:42:17 -0000
Content-Type: multipart/alternative; boundary=94eb2c063a1811dc19054c54ee58

--94eb2c063a1811dc19054c54ee58
Content-Type: text/plain; charset=UTF-8

On 3 April 2017 at 16:39, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> so why the sums are not changed in the recipe if these change at the
> upstream repo?
>

Because the patch changes the SRC_URI to point at our mirror, which
contains the old tarball.

Ross

--94eb2c063a1811dc19054c54ee58
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 April 2017 at 16:39, Leonardo Sandoval <span dir=3D"ltr">&lt;<a href=
=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">le=
onardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div id=3D":308" class=3D"a3s aXjCH m15b3485f75e3e086=
">so why the sums are not changed in the recipe if these change at the<br>
upstream repo?<br></div></blockquote></div><br>Because the patch changes th=
e SRC_URI to point at our mirror, which contains the old tarball.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--94eb2c063a1811dc19054c54ee58--
