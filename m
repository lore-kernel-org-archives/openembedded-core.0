Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 75A6471A61
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 10:32:29 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id w33so66134878qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 02:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xU+uSi9/0EPy0ncEb8hURJDBOGiHp7faaDjNzI1Qdrk=;
	b=n5SbaZ2nUGuFJuQr+OKOEFtqh/dV7KeOPBmVCPlYgHFliFUjA1E7aGfMXZHj4/cQ9O
	c61mhNmCvD3kpsjaTGqAsh6QhguMWpLGFpdxF91w6PQQv5MNdargYw23tiD210Rr0Xoh
	b4zR2kQmZIcuSDt6yBBfYHa/6/E73A8SixARbD7OyBaSfJZrFbdoAXyfEJ6e9EnObV/p
	/CI6rdoXnuzQwi1Ft89v1MqLOYNPpLWkHcksJfhUFvq4gVfL0Y73QFrHa+QVm4CCCpBS
	Mmzok+5T1dNO4lNmTZNN5ORjP6hhDbfRZnIlHC973MguCNoVBydwCXsMnPZ6T5kE6Kh7
	1SDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xU+uSi9/0EPy0ncEb8hURJDBOGiHp7faaDjNzI1Qdrk=;
	b=K+020zZ+keebktPvQGiD8gpCqyZNIOn/9nU8VL4GClw3uW+6wtKByWoosy2tI+U43g
	wd7QRTn7q0Hbt2JM17bYS7kKiNJohaVABErdd80Ww5ZIxqV2s0NSuoSJTHk92qBOYodN
	1/o02l4ucfIiuCvYVf8R/OrCDcL2UeTCBrr65oZdYtMY1Nq3H43cJb7PmYLY57ihNf9T
	VeNbq4ZntqLqzKsWu7cMRbrjRhC6DHEBfxpzqP80NhrE2rJ40tPweh2JTGu4qJk4vUIk
	EQ0mWwTGlEEGlgazY5UbP4DkLUeP91wVIjEVOjba+BqTYlVhOKcz3pclRo4AO9QA/BNL
	wIHQ==
X-Gm-Message-State: ABUngvc4QFWHInqVBjjjt+6dh977r+kTlBO4UHT8O0usO+6SY5hJKmXHxsp5SyTCNTuAQspou/pYNQpFVT6EGFVH
X-Received: by 10.237.37.77 with SMTP id w13mr10600429qtc.197.1479205950648;
	Tue, 15 Nov 2016 02:32:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 15 Nov 2016 02:32:10 -0800 (PST)
In-Reply-To: <cover.1479201985.git.maciej.borzecki@rndity.com>
References: <cover.1479201985.git.maciej.borzecki@rndity.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Nov 2016 10:32:10 +0000
Message-ID: <CAJTo0LYeL-yaSsM2yp_Ss8FQAGbBGwaJCB=ZO4jEy1c_SSrUkg@mail.gmail.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 00/11] wic: bugfixes & --fixed-size support, tests, oe-selftest: minor fixes
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
X-List-Received-Date: Tue, 15 Nov 2016 10:32:31 -0000
Content-Type: multipart/alternative; boundary=001a114108ea3d0d7505415479aa

--001a114108ea3d0d7505415479aa
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 09:52, Maciej Borzecki <maciej.borzecki@rndity.com>
wrote:

> I have noticed that Ross has cherry-picked some patches into his
> pull request to master. Just for reference, the patches are included in
> this
> series, but have not been changed since the previous version. The
> patches in question are:
>   oe-selftest: fix handling of test cases without ID in --list-tests-by
>   wic: make sure that partition size is always an integer in internal
>     processing
>   wic: use partition size when creating empty partition files
>   wic: check that filesystem is specified for a rootfs partition
>   wic: fix function comment typos
>   wic: add --fixed-size wks option
>

These were simple and/or fixing serious problems, hope I didn't cause too
much inconvenience doing this.

Ross

--001a114108ea3d0d7505415479aa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 November 2016 at 09:52, Maciej Borzecki <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maciej.borzecki@rndity.com" target=3D"_blank">maciej.borzecki@rn=
dity.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":4l6" class=3D"a3s aXjCH m158676777d36ad52">I have noticed that Ross ha=
s cherry-picked some patches into his<br>
pull request to master. Just for reference, the patches are included in thi=
s<br>
series, but have not been changed since the previous version. The<br>
patches in question are:<br>
=C2=A0 oe-selftest: fix handling of test cases without ID in --list-tests-b=
y<br>
=C2=A0 wic: make sure that partition size is always an integer in internal<=
br>
=C2=A0 =C2=A0 processing<br>
=C2=A0 wic: use partition size when creating empty partition files<br>
=C2=A0 wic: check that filesystem is specified for a rootfs partition<br>
=C2=A0 wic: fix function comment typos<br>
=C2=A0 wic: add --fixed-size wks option</div></blockquote></div><br>These w=
ere simple and/or fixing serious problems, hope I didn&#39;t cause too much=
 inconvenience doing this.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a114108ea3d0d7505415479aa--
