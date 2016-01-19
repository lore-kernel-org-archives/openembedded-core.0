Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 88CD360116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 12:04:23 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id mw1so66170547igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 04:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TAbajL4lTvKcSe8j3yhAYpt9OZciqOrT5eqDdJ7lsbE=;
	b=j6jorBLm/OA2iy57i6/9WGFKf1nvOv8Px0fqcWOZejyG1vgOkWRRmZtDmodvilmeCF
	q9rK0QekxmscJX4cFWYGapqx1vFvb3fp6fdrabmXySwRmowEiBPn6RixZFDFZXU0OIrG
	NmF4Y1hvYWdrt0eQGTDptgOrStLc0q8ZkrsqB/HsPHPvhoKM5Gsd8a8svsmFHAadrJQy
	NI8OI+py41n4Z16fS/iKTPh3oKzXNSH3zseeP4Sk4qB6mQ+pjxKMw1MAU7Kjshp/VUq4
	M0kYY4iR9n5ndT9ArtuaqdQtfa9m80Mu4iG+37YIwP0S6G2rEQqWl4cgOQqaKI/iYCFV
	53Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TAbajL4lTvKcSe8j3yhAYpt9OZciqOrT5eqDdJ7lsbE=;
	b=Hh8AJaqthAX3mF3YEtdn+t7II2g1N3VprvRI2M0mJ+A9e9/rdPeUOJZCHL0MCn5CVy
	Y2zdCpOkKXJT6giqKDF+xlnW+Bo10CBpuOU/gPi1tfSQL+Q1OYEh6ds0vd1umhSKZyGb
	KRqP7KobL30OAQkPwzA90Z3YTep+Lad+zu76M4SBznJ/FEJhmczM2ltlX0gNaCFr0dzW
	QeiMAxTZ/Xyq2RG7VtHbBwNYUg2y80HYaMl+1wuJEm9QurXfGJEECL6ozLDYnRTqTezT
	ufuAKD4QIJzGtfv85j794vkybCuLLcrhVqnr5Nhye9TdjRvuilHqh+tHGqdON3jXFFa1
	TSxQ==
X-Gm-Message-State: AG10YORP23NGmOKFPpsSlp1vdQSHE+wgBLWkaXQQOAeSfjK5PVAq2BRThMerSX5usaQv4RQxKLZWuWItd3pjXDrh
X-Received: by 10.50.111.111 with SMTP id ih15mr15960789igb.78.1453205064386; 
	Tue, 19 Jan 2016 04:04:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 19 Jan 2016 04:04:04 -0800 (PST)
In-Reply-To: <20160119114018.GC2611@jama>
References: <cover.1453173729.git.liezhi.yang@windriver.com>
	<dc955f7651afe19ce915cedc95bfb9ab96d52d73.1453173729.git.liezhi.yang@windriver.com>
	<20160119114018.GC2611@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Jan 2016 12:04:04 +0000
Message-ID: <CAJTo0LY9=yvm0y5EQ50T9VoR-o2FLs=pTL2t0+cwJE8saeEwfA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] e2fsprogs: fix PV
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
X-List-Received-Date: Tue, 19 Jan 2016 12:04:26 -0000
Content-Type: multipart/alternative; boundary=089e0149be34a627700529aeaba1

--089e0149be34a627700529aeaba1
Content-Type: text/plain; charset=UTF-8

On 19 January 2016 at 11:40, Martin Jansa <martin.jansa@gmail.com> wrote:

> If 0f26747167cc9d82df849b0aad387bf824f04544 is going to be released as
> 1.43, then it would be better to use 1.42.99+1.43+git${SRCPV} to make
> sure, that hypothetical 1.42.14 will also sort lower than this future
> 1.43.
>

Agreed - if this hash came from the 1.43 branch and won't ever be released
as 1.42, then 1.42.99 is sensible.

Ross

--089e0149be34a627700529aeaba1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 January 2016 at 11:40, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":c72" class=
=3D"a3s" style=3D"overflow:hidden">If 0f26747167cc9d82df849b0aad387bf824f04=
544 is going to be released as<br>
1.43, then it would be better to use 1.42.99+1.43+git${SRCPV} to make<br>
sure, that hypothetical 1.42.14 will also sort lower than this future<br>
1.43.</div></blockquote></div><br>Agreed - if this hash came from the 1.43 =
branch and won&#39;t ever be released as 1.42, then 1.42.99 is sensible.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--089e0149be34a627700529aeaba1--
