Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id A22556E667
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 17:24:36 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 38so189426705iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 10:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SzyP/4BqGpxWgMo8haYEA8o6xu3GPv0NGJeunnMMJYY=;
	b=jr27/dxzZb0VtIfEAwitsn4gbIRDRScjg0NHQPfLaS6Je0I033PboaG/YfMU5t9wuD
	FfeVOhFT+JsXEy+hz+t12gslAgRBfxB1YvhvUy+0MXSxNXXXhFIzZlq9IBnXJAdXZL8+
	oW64L9SC0ib2xyXJnpjVtUpN0j3RzwgQ3GBmG2r8dJmIqAhIzRucl+qQaBTU113ezuJs
	K3xhOQD2XeJ/HSWoLYpNaJtRTEjwIDA3XUmMU4BKzLNhWlolXiyITLcOgmUUCD0oJMVW
	FWd1qHGo27XUhCvmAh0P2yODptRJDPr7JuabpuID2w2mPw1VyNAi3uBFKIJRc+0owGLz
	H3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SzyP/4BqGpxWgMo8haYEA8o6xu3GPv0NGJeunnMMJYY=;
	b=A7WlTOHYWUbqBZpKEdr9XIE5i9yWt9+jI98y3L6QoAMSqLbpbPHNntFZzodG9+q8uO
	ClHDphSYPM7c1vxCXUezzYxqagP01WC+rQ5ZuHVUXbadC2bEZQePW2gjFfoDvixOe+lo
	OnCx3PMCL88rTntm6k3BZeRyYnwqiIoC06v19euxorL40RqSnIZ48VdVP6b9RL38+tmd
	btEIQ0kQ0kXQLw7A++iPCgft7qY/E/5zJJPSzYJeFuET4EtDMZpaDst67+4mCkmenTR+
	2jKOqR2gUY1xOfYfZjQISMJORlI0gptyV+0naKNcFq3rXi9fwH7zVajl8pNWNAiIAt/j
	N1zw==
X-Gm-Message-State: AEkoout+fRfxEPPFQrs9tiaifI/55OHGBKiKTqHi1PipERBQiUgzCBpePrEx3F9NAHpuR14eRGeZcqiEaLv+wxXT
X-Received: by 10.107.138.212 with SMTP id c81mr55282202ioj.148.1470072277148; 
	Mon, 01 Aug 2016 10:24:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 1 Aug 2016 10:24:16 -0700 (PDT)
In-Reply-To: <CAOLEWZWbyZXc53TgQijWtxRbTQ9bEnTULpM9uUa4Hp5Px4AYKw@mail.gmail.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
	<CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
	<CAOLEWZWbyZXc53TgQijWtxRbTQ9bEnTULpM9uUa4Hp5Px4AYKw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Aug 2016 18:24:16 +0100
Message-ID: <CAJTo0LbwrLtSG+wv=_379TeQOAAqBHVUet=bD0kfdUUg6_c-yw@mail.gmail.com>
To: Stephen Arnold <stephen.arnold42@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Fan Xin <fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH v2] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Mon, 01 Aug 2016 17:24:36 -0000
Content-Type: multipart/alternative; boundary=001a113ed932dfd57a053905df42

--001a113ed932dfd57a053905df42
Content-Type: text/plain; charset=UTF-8

On 1 August 2016 at 18:22, Stephen Arnold <stephen.arnold42@gmail.com>
wrote:

> That's actually not a bad idea, but I need to crank out another
> abstract today (the deadline for special session snuck up on me).  We
> kinda needed this for a project, but I think a tiny print server is
> always useful.  What's your plan?
>

Well my plan was:

1) say that someone should create meta-printing
2) watch someone create meta-printing
3) delete everything printing related in oe-core

I can help a bit on (2) I guess...  Fan Xin, would you or anyone else at
Fujitsu (as you clearly have interest here) be able to help?

Ross

--001a113ed932dfd57a053905df42
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 August 2016 at 18:22, Stephen Arnold <span dir=3D"ltr">&lt;<a href=3D"=
mailto:stephen.arnold42@gmail.com" target=3D"_blank">stephen.arnold42@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1j=
4" class=3D"a3s aXjCH m15647209c6651ed3">That&#39;s actually not a bad idea=
, but I need to crank out another<br>
abstract today (the deadline for special session snuck up on me).=C2=A0 We<=
br>
kinda needed this for a project, but I think a tiny print server is<br>
always useful.=C2=A0 What&#39;s your plan?</div></blockquote></div><br>Well=
 my plan was:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">1) say that someone should create meta-printing</div><div class=3D"=
gmail_extra">2) watch someone create meta-printing</div><div class=3D"gmail=
_extra">3) delete everything printing related in oe-core</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">I can help a bit on (2) =
I guess...=C2=A0 Fan Xin, would you or anyone else at Fujitsu (as you clear=
ly have interest here) be able to help?</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed932dfd57a053905df42--
