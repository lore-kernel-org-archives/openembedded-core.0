Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id A7E3F6059E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 18:32:42 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id w194so210869461vkw.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 10:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MXHrbRY/SwyuKTa0wpyZZYomsmgAvLFCvz0ArVusE1k=;
	b=tx6M3KS2ifVWFfB5iP+eqV+aF2z7rvilsXTB80WeJlEOYCmGrPWfg0QOVkDoMdeDZk
	J6u72CvhWMO4fHHFhT2RR49oob912/v+mVp4P2XvohfXnQ4tSfWS6LbCxuAC/oxef7Ba
	R58t/XSR9LgyG4n4CQP+z2M1x79KeOGdr4kHliYUrChVT4Jg802B4Eo9uG9zFZE/ELHZ
	lM8YWEE49D9CU6oSlzXIlJEwRv7NeTsFx35CBCaICjeYxniCBxnE8fKFfNs8QqZnLFql
	99ExKqBUZZXS0MAGzopSF3+qOUpqnAkKtq9WI5kouE44Q/5X/WTUPxerTwKRb6tz8VNc
	hCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MXHrbRY/SwyuKTa0wpyZZYomsmgAvLFCvz0ArVusE1k=;
	b=Z6c9g26RyHYBCv6YVeU4EcOHdtjAWflGmdY00Wk0pcAVtWasfl2U2xkhyYtP1IE1u9
	YhHHeLeHg1JEREG73QLk9lB4/gRhDtdfAV6G7TEd90yFC4/maswQTq0HRUDtcTdYeJqI
	6UEjtDr/8rjTvMXd+SBJPSvt3krSCtOlnJW5wlQt+wcLj5DoHpoqA3s9nLUtij/fBbGd
	mQ2Bbqh8UFj0kYCpWTgnbXxHJfsA7gW/Kh9+RbwRyqsN5+nwD+xwJqHJKWYdIbx14zy9
	7+dNa4ZE/N2Z/orLmaLnrDEAu0rRAv1sBaMZfOzW+MCzSMWoPIRa9iD1RLBdsHZSitDo
	v7aA==
X-Gm-Message-State: ABUngvcg3OFMqhN5IoGBmu5SnKuyeg33Nm85ASv/j+3mmvedGnN40x/nS9eCazAADAl5KHEW9YfQV+sEuilKg4R2
X-Received: by 10.31.5.132 with SMTP id 126mr3939892vkf.164.1478802764214;
	Thu, 10 Nov 2016 10:32:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.87.91 with HTTP; Thu, 10 Nov 2016 10:32:13 -0800 (PST)
In-Reply-To: <1478800392.3449.79.camel@intel.com>
References: <1476389794-109684-1-git-send-email-jianxun.zhang@linux.intel.com>
	<1478800392.3449.79.camel@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 10 Nov 2016 20:32:13 +0200
Message-ID: <CAHiDW_HWS9ZuOL8EtdMLOXfgFdXCYuByw4k6pg+Tx1-FvurWFg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Olev Kartau <olev.kartau@intel.com>
Subject: Re: [PATCH V2] sqlite3: Revert ad601c7962 from 3.14.1 amalgamation package
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
X-List-Received-Date: Thu, 10 Nov 2016 18:32:44 -0000
Content-Type: multipart/alternative; boundary=001a11440f82744aa80540f699d0

--001a11440f82744aa80540f699d0
Content-Type: text/plain; charset=UTF-8

On 10 November 2016 at 19:53, Patrick Ohly <patrick.ohly@intel.com> wrote:

> On Thu, 2016-10-13 at 13:16 -0700, Jianxun Zhang wrote:
> > It turns out this change between 3.12.2 and 3.13 introduces
> > a 2% increase of build time based on statistic data in
> > bz10367.
>
> Let me add that this patch increased build performance in Ostro even
> more: apparently one big impact of the sqlite performance issue is on
> pseudo. Ostro depends fairly heavily on pseudo because of meta-swupd and
> xattrs on all files.
>
> When this patch and others recently landed in Ostro, total build times
> dropped from 4:46h (build #508,
> https://ostroproject.org/jenkins/job/build_intel-corei7-64/2763/console)
> to 2:07h (build #510,
> https://ostroproject.org/jenkins/job/build_intel-corei7-64/2831/console).
>
> That could also be because of other improvements, perhaps even in our CI
> hardware, so take those numbers with a large chunk of salt.
>
> However, in local builds with and without this patch (i.e. everything
> else the same) I also see big differences for pseudo-heavy operations:
>
> $ buildstats-diff --diff-attr walltime --min-val 60 with-patch/
> without-patch/
> Ignoring tasks less than 01:00.0 (60.0s)
> Ignoring differences less than 00:02.0 (2.0s)
>
>   PKG                                     TASK
> ABSDIFF   RELDIFF  WALLTIME1 -> WALLTIME2
> ...
>   bundle-ostro-image-swupd-qa-bundle-b    do_rootfs
>  78.1s   +115.4%      67.7s -> 145.8s
>   bundle-ostro-image-swupd-qa-bundle-a    do_rootfs
>  80.3s   +116.8%      68.8s -> 149.1s
>   bundle-ostro-image-swupd-qa-bundle-a    do_image
>  106.8s   +291.9%      36.6s -> 143.3s
>   bundle-ostro-image-swupd-qa-bundle-b    do_image
>  107.9s   +298.2%      36.2s -> 144.1s
>   bundle-ostro-image-swupd-mega           do_image
>  244.4s    +74.2%     329.2s -> 573.6s
>   bundle-ostro-image-swupd-world-dev      do_rootfs
> 246.7s   +207.2%     119.1s -> 365.8s
>   bundle-ostro-image-swupd-world-dev      do_image
>  269.2s    +83.5%     322.6s -> 591.7s
>   bundle-ostro-image-swupd-mega           do_rootfs
> 272.6s   +246.1%     110.8s -> 383.3s
>   ostro-image-swupd                       do_rootfs
> 676.1s   +808.1%      83.7s -> 759.8s
>   bundle-ostro-image-swupd-world-dev      do_copy_bundle_contents
>  1339.5s  +2957.6%      45.3s -> 1384.8s
>   bundle-ostro-image-swupd-qa-bundle-b    do_copy_bundle_contents
>  1475.0s  +3147.8%      46.9s -> 1521.9s
>   bundle-ostro-image-swupd-qa-bundle-a    do_copy_bundle_contents
>  1503.9s  +3283.0%      45.8s -> 1549.8s
>
> Cumulative walltime:
>   6070.9s    +326.9%    30:57.3 (1857.3s) -> 2:12:08.2 (7928.2s)
>

yikes.

So it really seems that the sqlite change is a very relevant
> improvement.
>
> That leads me to a bigger question: has upstream been notified about
> this?
>
> Our observation may also be relevant to other sqlite users. Besides, not
> getting this fixed upstream means that we'll have to do the same tricky
> revert for the next upstream version update.
>

Completely true. It may also be worthwhile to profile what pseudo is really
doing. The feeling I had was that there could be something going wrong
there as recipes that install lots of files not only take very long but
also create _very_ large database file: The increases do not seem even
close to linear as one might expect. Seebs gave some advice about this in
the bug (https://bugzilla.yoctoproject.org/show_bug.cgi?id=10367#c11).

Jussi




> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11440f82744aa80540f699d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
0 November 2016 at 19:53, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span =
class=3D"gmail-">On Thu, 2016-10-13 at 13:16 -0700, Jianxun Zhang wrote:<br=
>
&gt; It turns out this change between 3.12.2 and 3.13 introduces<br>
&gt; a 2% increase of build time based on statistic data in<br>
&gt; bz10367.<br>
<br>
</span>Let me add that this patch increased build performance in Ostro even=
<br>
more: apparently one big impact of the sqlite performance issue is on<br>
pseudo. Ostro depends fairly heavily on pseudo because of meta-swupd and<br=
>
xattrs on all files.<br>
<br>
When this patch and others recently landed in Ostro, total build times<br>
dropped from 4:46h (build #508,<br>
<a href=3D"https://ostroproject.org/jenkins/job/build_intel-corei7-64/2763/=
console" rel=3D"noreferrer" target=3D"_blank">https://ostroproject.org/<wbr=
>jenkins/job/build_intel-<wbr>corei7-64/2763/console</a>)<br>
to 2:07h (build #510,<br>
<a href=3D"https://ostroproject.org/jenkins/job/build_intel-corei7-64/2831/=
console" rel=3D"noreferrer" target=3D"_blank">https://ostroproject.org/<wbr=
>jenkins/job/build_intel-<wbr>corei7-64/2831/console</a>).<br>
<br>
That could also be because of other improvements, perhaps even in our CI<br=
>
hardware, so take those numbers with a large chunk of salt.<br>
<br>
However, in local builds with and without this patch (i.e. everything<br>
else the same) I also see big differences for pseudo-heavy operations:<br>
<br>
$ buildstats-diff --diff-attr walltime --min-val 60 with-patch/ without-pat=
ch/<br>
Ignoring tasks less than 01:00.0 (60.0s)<br>
Ignoring differences less than 00:02.0 (2.0s)<br>
<br>
=C2=A0 PKG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TASK=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ABSDIFF=C2=A0 =C2=A0RELDIFF=C2=A0 WALLTIME1 -&gt; WALLTIME2<br>
...<br>
=C2=A0 bundle-ostro-image-swupd-qa-<wbr>bundle-b=C2=A0 =C2=A0 do_rootfs=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A078.1s=C2=
=A0 =C2=A0+115.4%=C2=A0 =C2=A0 =C2=A0 67.7s -&gt; 145.8s<br>
=C2=A0 bundle-ostro-image-swupd-qa-<wbr>bundle-a=C2=A0 =C2=A0 do_rootfs=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A080.3s=C2=
=A0 =C2=A0+116.8%=C2=A0 =C2=A0 =C2=A0 68.8s -&gt; 149.1s<br>
=C2=A0 bundle-ostro-image-swupd-qa-<wbr>bundle-a=C2=A0 =C2=A0 do_image=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0106.8s=C2=
=A0 =C2=A0+291.9%=C2=A0 =C2=A0 =C2=A0 36.6s -&gt; 143.3s<br>
=C2=A0 bundle-ostro-image-swupd-qa-<wbr>bundle-b=C2=A0 =C2=A0 do_image=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0107.9s=C2=
=A0 =C2=A0+298.2%=C2=A0 =C2=A0 =C2=A0 36.2s -&gt; 144.1s<br>
=C2=A0 bundle-ostro-image-swupd-mega=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0do_image=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0244.4s=C2=A0 =C2=A0 +74.2%=C2=A0 =C2=A0 =C2=A0329.2s -&gt; 573.6s<br>
=C2=A0 bundle-ostro-image-swupd-<wbr>world-dev=C2=A0 =C2=A0 =C2=A0 do_rootf=
s=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 246.7s=C2=
=A0 =C2=A0+207.2%=C2=A0 =C2=A0 =C2=A0119.1s -&gt; 365.8s<br>
=C2=A0 bundle-ostro-image-swupd-<wbr>world-dev=C2=A0 =C2=A0 =C2=A0 do_image=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0269.2s=
=C2=A0 =C2=A0 +83.5%=C2=A0 =C2=A0 =C2=A0322.6s -&gt; 591.7s<br>
=C2=A0 bundle-ostro-image-swupd-mega=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0do_rootfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
272.6s=C2=A0 =C2=A0+246.1%=C2=A0 =C2=A0 =C2=A0110.8s -&gt; 383.3s<br>
=C2=A0 ostro-image-swupd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_rootfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 676.1s=C2=A0 =C2=A0+808.1%=C2=A0 =C2=A0 =C2=
=A0 83.7s -&gt; 759.8s<br>
=C2=A0 bundle-ostro-image-swupd-<wbr>world-dev=C2=A0 =C2=A0 =C2=A0 do_copy_=
bundle_contents=C2=A0 =C2=A01339.5s=C2=A0 +2957.6%=C2=A0 =C2=A0 =C2=A0 45.3=
s -&gt; 1384.8s<br>
=C2=A0 bundle-ostro-image-swupd-qa-<wbr>bundle-b=C2=A0 =C2=A0 do_copy_bundl=
e_contents=C2=A0 =C2=A01475.0s=C2=A0 +3147.8%=C2=A0 =C2=A0 =C2=A0 46.9s -&g=
t; 1521.9s<br>
=C2=A0 bundle-ostro-image-swupd-qa-<wbr>bundle-a=C2=A0 =C2=A0 do_copy_bundl=
e_contents=C2=A0 =C2=A01503.9s=C2=A0 +3283.0%=C2=A0 =C2=A0 =C2=A0 45.8s -&g=
t; 1549.8s<br>
<br>
Cumulative walltime:<br>
=C2=A0 6070.9s=C2=A0 =C2=A0 +326.9%=C2=A0 =C2=A0 30:57.3 (1857.3s) -&gt; 2:=
12:08.2 (7928.2s)<br></blockquote><div>=C2=A0</div><div>yikes.</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
So it really seems that the sqlite change is a very relevant<br>
improvement.<br>
<br>
That leads me to a bigger question: has upstream been notified about<br>
this?<br>
<br>
Our observation may also be relevant to other sqlite users. Besides, not<br=
>
getting this fixed upstream means that we&#39;ll have to do the same tricky=
<br>
revert for the next upstream version update.<span class=3D"gmail-HOEnZb"><f=
ont color=3D"#888888"><br></font></span></blockquote><div><br></div><div>Co=
mpletely true. It may also be worthwhile to profile what pseudo is really d=
oing. The feeling I had was that there could be something going wrong there=
 as recipes that install lots of files not only take very long but also cre=
ate _very_ large database file: The increases do not seem even close to lin=
ear as one might expect. Seebs gave some advice about this in the bug (<a h=
ref=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10367#c11">https=
://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10367#c11</a>).=C2=A0</div><=
div><br></div><div>Jussi<br></div><div><br></div><div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmai=
l-HOEnZb"><font color=3D"#888888">
--<br>
Best Regards, Patrick Ohly<br>
<br>
The content of this message is my personal opinion only and although<br>
I am an employee of Intel, the statements I make here in no way<br>
represent Intel&#39;s position on the issue, nor am I authorized to speak<b=
r>
on behalf of Intel on this matter.<br>
</font></span><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div></div>

--001a11440f82744aa80540f699d0--
