Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id E7D987858F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 14:55:49 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id g35so79379306ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4RZjDiMRlBgRw9HKejBzCU68hqtaNQOPb1DXFnAxsCI=;
	b=Adm8wiCLzAkyiEjoYVd3eYlMv+KU+o0bCfjoSnGzmS0YAraSpKfxo6uG7vd3By4Po9
	u6+jt5dDrPok6/1WwjiECBSk263prm6xUPQbCV7sUOaYLgahA6ttMtwx8AnGNrkTpD9b
	jbymHeNvGbo4n6g/R5ZYIHHztliPTVaZCZaCW7x6Y+8sTFHrHhKCv1tG0/P3RNtLpxeQ
	HyFFm5eLvyHwYrZ0TNqG/8HGT61DEU/bd4EparOY1eidTyEhv6i+PP1rwvnIChMwpfVh
	DRZ/RF6rmb2jZlb4LQYUbeWKWO6YeF6Q9RDuTPST5HQ4WAMyDUzJ8tfisUWKSN9mq35+
	7Upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4RZjDiMRlBgRw9HKejBzCU68hqtaNQOPb1DXFnAxsCI=;
	b=oWCe/4zm7buNC930J86bIglqyvW83+MHKkxp5WWFlR2VbZ1OgGwTajiaDJot7JylnY
	4j/OOy3h6TepT3TwoXMfhbZKH33FQsXYOuzEt43EeDPcJBEgxBBg+dgeFxe5ze7zgUHy
	OAN9i2sML9bhrb8h/4EaXadD4sdrX+81WmOfOW7cDLhS/TfyVka9kuu34dWxDipo6H/h
	y+ULO0+dKB4kpWM5BVFfqQU7uIJZBgPvFs11YjSpbqWhNKGUPS/aQIKLyihqdhbu4QN5
	nFdughlgo5SGmPLkqfGW7daDAFTl83Kgx5Gcb5FXEMRlb21krSzxuq4eoKLkPXd0SSQN
	q7Ig==
X-Gm-Message-State: AIVw113W+yu0P9iZw1DZVteKgPoEwi0hpPIRu+X0RRWsdqGjzlRbQ/c3
	KFVHjyokN/25QggdoHjje5LqVmhL65zb
X-Received: by 10.107.132.33 with SMTP id g33mr18199954iod.300.1501512951128; 
	Mon, 31 Jul 2017 07:55:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Mon, 31 Jul 2017 07:55:30 -0700 (PDT)
In-Reply-To: <b80a80e1-1384-3702-fe94-61315c502f85@linux.intel.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
	<20170724142818.44403-5-alexander.kanavin@linux.intel.com>
	<CAJTo0LbJvsviFJGW8k=Hgsr=kCgFhv7MX=wyjxYz2t23zkSQ1Q@mail.gmail.com>
	<CAMKF1so7BKN37KMUBDcDw9zHqZmO6YJuFpM8igAHo40QG_CkkQ@mail.gmail.com>
	<CAJTo0LbDLYh1vOOt6UqjbMpK86b5TuhcXRBqFz=EhzjEp0J1mA@mail.gmail.com>
	<287709d4-1010-10fa-fd94-929e4c465e49@linux.intel.com>
	<1501494217.18633.0.camel@linuxfoundation.org>
	<6b824286-9d84-5b3c-3106-40b35bc4050b@linux.intel.com>
	<b80a80e1-1384-3702-fe94-61315c502f85@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Jul 2017 15:55:30 +0100
Message-ID: <CAJTo0LaVVvB2GG2PN3ub_18FZimsPC9tTHhQ2HbfAPHKm0NAqg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/11] gperf: upgrade to 3.1
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
X-List-Received-Date: Mon, 31 Jul 2017 14:55:50 -0000
Content-Type: multipart/alternative; boundary="001a113ed2e8140b0705559e3a20"

--001a113ed2e8140b0705559e3a20
Content-Type: text/plain; charset="UTF-8"

Neither Debian not Fedora rebuild dependencies, you'll see a lot of
"rebuild" changelog entries where API changes demanded it to happen.

Our builds take longer but you know the build always works.  Their builds
may be broken without anyone noticing for a while.

Ross

On 31 July 2017 at 11:18, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 07/31/2017 12:53 PM, Alexander Kanavin wrote:
>
>> The only thing I found was this email:
>> http://lists.gnu.org/archive/html/bug-gperf/2017-01/msg00004.html
>> which was ignored by upstream.
>>
>> However, both debian testing and fedora rawhide have gperf 3.1, so I'm
>> not sure how they made it work. I'm running debian here, so can look into
>> this.
>>
>
> Right. Debian dropped the updated gperf package into repositories, but did
> not rebuild anything that relies on it. When I tried that with libcap, I
> got the exact same error as we've seen.
>
> Not sure what's going to happen when they discover the incompatibility.
> I'm a bit surprised they don't do such dependency rebuilds when changes are
> introduced.
>
> Alex
>

--001a113ed2e8140b0705559e3a20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Neither Debian not Fedora rebuild dependencies, you&#39;ll=
 see a lot of &quot;rebuild&quot; changelog entries where API changes deman=
ded it to happen.<div><br></div><div>Our builds take longer but you know th=
e build always works.=C2=A0 Their builds may be broken without anyone notic=
ing for a while.</div><div><br></div><div>Ross</div></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 31 July 2017 at 11:18, Alexande=
r Kanavin <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.i=
ntel.com" target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 07/31/2017 1=
2:53 PM, Alexander Kanavin wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The only thing I found was this email:<br>
<a href=3D"http://lists.gnu.org/archive/html/bug-gperf/2017-01/msg00004.htm=
l" rel=3D"noreferrer" target=3D"_blank">http://lists.gnu.org/archive/h<wbr>=
tml/bug-gperf/2017-01/msg00004<wbr>.html</a><br>
which was ignored by upstream.<br>
<br>
However, both debian testing and fedora rawhide have gperf 3.1, so I&#39;m =
not sure how they made it work. I&#39;m running debian here, so can look in=
to this.<br>
</blockquote>
<br></span>
Right. Debian dropped the updated gperf package into repositories, but did =
not rebuild anything that relies on it. When I tried that with libcap, I go=
t the exact same error as we&#39;ve seen.<br>
<br>
Not sure what&#39;s going to happen when they discover the incompatibility.=
 I&#39;m a bit surprised they don&#39;t do such dependency rebuilds when ch=
anges are introduced.<br>
<br>
Alex<br>
</blockquote></div><br></div>

--001a113ed2e8140b0705559e3a20--
