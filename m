Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id C983F75A38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 19:04:15 +0000 (UTC)
Received: by qkgc186 with SMTP id c186so18313693qkg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 12:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=R6gHOOxA21JvnYzHLw8PpK+aRCyovWag/s64omsFgf8=;
	b=OT6ZED9u1czJx785xjNh7izSbzYkyaJqHXV0Xj1tiGgfvrmoa+aAuXOAH7IOciPbmv
	4EkmWPclJaCAuCr58IQDKN3PtGi4fQeuUzLBmnZxP5FD05yucYapcSY6AH9i6YyVMb6d
	FudDsRXdzAzVyKuELVqCkdFTQIBxD6ipuwb5QUBxswyRtjL4F86v2Y4sXZvabpgxsl7s
	2ekJHT7NAy9Nhf8yh7kgOGHNmS7NNXGXpmnoyCN8r2XS4AxqQH7Cls1x4eb5ou40Px+O
	BJMHa2SInJgNx3T53MfoWh8rs5KHUKK7l0wx6TC/XH2dM0z/tQ4T2jEDcxBa0yTricQq
	mtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=R6gHOOxA21JvnYzHLw8PpK+aRCyovWag/s64omsFgf8=;
	b=bWwA9x/ZFHYN1Ppbh3ByJg6VFoFgWs2fRZo3tnzX4Db9z/d/nB0nCLB8PoXGhdV9wu
	ZVhWT6JkZRqYatfYTTUs8ctgtFrlHFnTjm9Ka5jrzRX+vHWidauDu8w86j8HoNYYOmSq
	jlvlQ0GFh/F0I0dMy1W0s85vWcDHMhStQlAGbJkKI0kv6RiHf454VjqGOBBYOfmBo3gF
	bhJZXwkU0TBGCfooEHg6MepaTt44iw2FWRequ0PZJ+XjwF4jiKShC0bpNhrAVNfkRP4g
	pOmhZ7f5YxmU5d3fFRUjRmhwtPACGFKzOnV0qYu9Mu/6uTUdFWjGAntQWtWfg1QKD2c8
	1agw==
X-Gm-Message-State: ALoCoQnRrs8z8cdln0ZEvNYRYZFGMbRI3ltFK2bkIJiiswwqGX/2/fqwBRB57SuaVwF7zXW+p+3p
X-Received: by 10.55.78.143 with SMTP id c137mr4570520qkb.72.1446145455565;
	Thu, 29 Oct 2015 12:04:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 29 Oct 2015 12:03:56 -0700 (PDT)
In-Reply-To: <1556288.oU3CJGhmjq@peggleto-mobl.ger.corp.intel.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
	<16FB52C0-E87A-40C9-A677-F1220982FB30@gmail.com>
	<1556288.oU3CJGhmjq@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Oct 2015 19:03:56 +0000
Message-ID: <CAJTo0LYGCZQXHw2q2YCG6GRcKcDBcD9akRZa-M_HWFE+RFgGZQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Thu, 29 Oct 2015 19:04:15 -0000
Content-Type: multipart/alternative; boundary=001a114a8f682c7837052342faa0

--001a114a8f682c7837052342faa0
Content-Type: text/plain; charset=UTF-8

On 29 October 2015 at 12:27, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> At this point in the release it's too late for version upgrades unless the
> upgrade fixes a critical issue and applying the patch to fix that issue is
> more
> risky than the upgrade. I should imagine Ross has this queued for master
> when
> the release happens and we diverge.
>

Indeed I do (poky-contrib:ross/mut).

Ross

--001a114a8f682c7837052342faa0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 October 2015 at 12:27, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":23e" class=3D"a3s" style=3D"overflow:hidden">At this point in the rele=
ase it&#39;s too late for version upgrades unless the<br>
upgrade fixes a critical issue and applying the patch to fix that issue is =
more<br>
risky than the upgrade. I should imagine Ross has this queued for master wh=
en<br>
the release happens and we diverge.<br></div></blockquote></div><br>Indeed =
I do (poky-contrib:ross/mut).</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a114a8f682c7837052342faa0--
