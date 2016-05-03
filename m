Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id A234C6FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 19:31:19 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id u185so3657738iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 12:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Et46cCbw2Ck/7E4p/VAZ+Y4hdWpJsj4paoD7i3235mU=;
	b=ASgQ2bLVTgk0vthR1JiWR2JvGs3k1oN5ldSkIjU2HRDbQyyGkYrACFfqMpNhcbNm9p
	IN3T329fVJnP4QxXpFZnUYWjcuN3Dp2LEd+PZFM+MaUcdkA44YqqFCUejabnY8s5E3Ib
	VWibPgiY74p+QY4D51s9Ya6r77/IYPi2E00gF85OEKN7vSHufSROj5X+0p4JeWIJQZrt
	ABQ2eh6ksZouh3SO2lpMmj7hgzsUFVnV2lHx3Ke0OQibmj2Rw686I5B2/zO1pOryTez8
	Gkw4R611ziNbxi5P91j8gBvw3TkIp3apZPHAUB91UvHNyNQi+Z5InKbHTsiJ9cAJ3/Zy
	D58Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Et46cCbw2Ck/7E4p/VAZ+Y4hdWpJsj4paoD7i3235mU=;
	b=OJzyVYmIk6QzkVC03VSp7NOXKLtp5DNKW5UbeqjQtnAuJJJJlNgmUYB9SNb8L5NDDS
	KUiO5Dm94sfFP+rNixsJrCUnQTeiCVcFCXDm45RNN6ULAKg9zoKrN1HaBMnVWanRavjW
	yqO3KARycBykjMDvGCOL5nSPV/439j+UFK9YmAZdidlVIMZ8zXY29uakkhapA+/BcGSp
	brv5ZV0YlOwj/YGD5JMq5kiCQeGxF8F6E7xqAoxYi5/9Z4HFaPb1pqGQNprQk4e9rpii
	9WCOShMEhivRjw+5mSHqgoDa4ISAtixh7bwi2fO6X12qYdeifXr9fw6zfwFaYNE7w2QZ
	6h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Et46cCbw2Ck/7E4p/VAZ+Y4hdWpJsj4paoD7i3235mU=;
	b=jluMMfJXc6hulEf/FE54jYjMpo2U8p8hXWADQhqKPjcHM8o2W6afQLGGjBGktuzYiQ
	q5KKAl7CKMKF0fvL6nRBGHihkY8sIdALgYbiPer7rzfBNDKHV5YjUfmaoevNdp/xkdEE
	dJ2lEJDf+hfr67b1Yk0daNqfdQsdv6Gnw05GoW5wr4K0KJKXiaBx9E6esZpRMaOcHu0N
	IfE1AZmJZxCLn/u9PKIEQC9FDb5AHNRLahDpEIH+VQrMWObg5ys2ydkGWk7bz6hopC8B
	m+H8V2yf2r8TKALy9ETPEcFwCR8GC+v2QC7fDvsLz2XtX3D1GhvVFvZEqe0lCW3VLlH8
	btrg==
X-Gm-Message-State: AOPr4FWXwrFQ56qqQYCQDoLx7pxl99N/zcNj/Ax0ri3idWkKslIk4ESb+CdkOd30byFGBtgKbTnvEW5sfxiDRg==
X-Received: by 10.107.2.70 with SMTP id 67mr5775347ioc.70.1462303879909; Tue,
	03 May 2016 12:31:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Tue, 3 May 2016 12:31:00 -0700 (PDT)
In-Reply-To: <9d32811fe04ce49bdc20891453d37819447d7f88.1462191317.git.ed.bartosh@linux.intel.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
	<9d32811fe04ce49bdc20891453d37819447d7f88.1462191317.git.ed.bartosh@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 3 May 2016 19:31:00 +0000
X-Google-Sender-Auth: PPonZuHwLSgaI1W5xxxQbFG8zt4
Message-ID: <CABcZANkwedfVVu2cxREq2Qp2UECdtAfrcgZ5V9LfVPtkR5sjaA@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 4/6] bmap-tools: generate standalone script
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
X-List-Received-Date: Tue, 03 May 2016 19:31:20 -0000
Content-Type: multipart/alternative; boundary=001a113968145121eb0531f5279a

--001a113968145121eb0531f5279a
Content-Type: text/plain; charset=UTF-8

On Mon, May 2, 2016 at 12:22 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> Generated standalone bmaptool script that is more convenient
> to use than native script. It can be run straight from
> its location ./tmp/deploy/tools/bmaptool. The script doesn't
> depend on anything except Python.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>

You're right that this is very handy, but we hit a problem when building
from shared state. This uses do_deploy to deploy bmaptool into
DEPLOY_DIR_IMAGE, but IMAGE_DEPENDS only depends on do_populate_sysroot,
not do_deploy, so an image build from sstate won't write this script out.

I don't know the right way to fix this, but it's a problem. I just ran into
it :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113968145121eb0531f5279a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 2, 2016 at 12:22 PM, Ed Bartosh <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux=
.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Generate=
d standalone bmaptool script that is more convenient<br>
to use than native script. It can be run straight from<br>
its location ./tmp/deploy/tools/bmaptool. The script doesn&#39;t<br>
depend on anything except Python.<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;<br></blockquote><div><br></div><div>You=
&#39;re right that this is very handy, but we hit a problem when building f=
rom shared state. This uses do_deploy to deploy bmaptool into DEPLOY_DIR_IM=
AGE, but IMAGE_DEPENDS only depends on do_populate_sysroot, not do_deploy, =
so an image build from sstate won&#39;t write this script out.</div><div><b=
r></div><div>I don&#39;t know the right way to fix this, but it&#39;s a pro=
blem. I just ran into it :)</div></div>-- <br><div class=3D"gmail_signature=
">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Op=
enEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, M=
entor Graphics</div>
</div></div>

--001a113968145121eb0531f5279a--
