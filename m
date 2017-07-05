Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id D07CC60777
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 10:38:40 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id 32so182614468qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 03:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D7/N2PWCB8H+wPjzkHgkanUEfP0K4oeu5cVCqzyNepI=;
	b=Nq4AvVLKgho3dBcXD9fuavQ2JP0BzWd4HcKix2kPlEux9pn+TtMLgmr3mbll/TiaTl
	X3EL9Cs7DWvnAvlp/Hsb1Ac/2zxzJMNtJdIP7dNu41bazPJHDh8OQ4knENJbEutnggia
	73ae02QCtBFC9ewqvequMxluJzPUiIvckyjFWmM9wOPCGwYRhFxD7Yd2Hovu+5jqD4PG
	7izb5jXryMx+1lW62mWtbixe1u3SD6fyHqaPcbAysDbvxW3lqx1B/ibeQOGqTcp5kfNR
	Nq1ef+r6nPNpVR/9t27D5A/UUG/8HYa481q8pcsYcKuqS92uBS8XmvDVU6O5foOOiYQA
	6y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D7/N2PWCB8H+wPjzkHgkanUEfP0K4oeu5cVCqzyNepI=;
	b=Xm1ZlGy3FqVCJTTKwBEA9dLYDrcDiIvk8KcdS9bhgyH8ehqPplCZ6HuoeXc6QD7kpb
	c4pYwuyNlvaLv5kkIAkr1cYM4d5OlgkFiksGX2g5G23XWu6xt6qVBqXjL9tfb/Re9ulf
	UhNue1ZZpRpyOoj1ysZCH/FUnT+BDPrw0xZEyFaJeZ2HMH5Hlx0kZR8dheiu5kfBZCtR
	aUEYW0M1P0uLCt2j6dTqOq1pHL3mudSc60WOTlk/JBEKp6Bhb9dnZADBfcwauli0uvXc
	mMMNpO3ADBOLu2nno6lhtgrQ+5iZVZeLxC+2OQ88aU9u/PZNsLTf+rZa5gBYnkZKW8to
	hNhA==
X-Gm-Message-State: AKS2vOzdaSs29q2WvMe1ZJig92dO9Xve5HXK7cJu2s8YZDqmJdKaNI8W
	qA9kFF7UyGKgquI3xVo/QJQJ0M/hf522
X-Received: by 10.237.49.41 with SMTP id 38mr52037940qtg.161.1499251121420;
	Wed, 05 Jul 2017 03:38:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Wed, 5 Jul 2017 03:38:21 -0700 (PDT)
In-Reply-To: <20170705080138.GA29283@linux.intel.com>
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<3d4d64770e679caa28b6a99486bbbad9a610abb2.1498569961.git.ed.bartosh@linux.intel.com>
	<CAJTo0LZC=Ee+ctXnFCO2WtURObsE=UfuaDqUyrJtgW+1u3_hgw@mail.gmail.com>
	<20170705080138.GA29283@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Jul 2017 11:38:21 +0100
Message-ID: <CAJTo0LbNK0ir=GeWS6iZC3p6-wuvX37Ytd97cHE+jVEFS__5Qw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/5] wic: copy rootfs directory before changing fstab
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
X-List-Received-Date: Wed, 05 Jul 2017 10:38:41 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c955c858fff05538f9afa"

--94eb2c0c955c858fff05538f9afa
Content-Type: text/plain; charset="UTF-8"

On 5 July 2017 at 09:01, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> There is always a chance. Which commit is this? I'll try to reproduce this.
>

poky-contrib:ross/mut.  Lots of unrelated changes in there though.

Ross

--94eb2c0c955c858fff05538f9afa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 July 2017 at 09:01, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailto=
:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ec" clas=
s=3D"a3s aXjCH m15d11d01061c48ed">There is always a chance. Which commit is=
 this? I&#39;ll try to reproduce this.<br></div></blockquote></div><br>poky=
-contrib:ross/mut.=C2=A0 Lots of unrelated changes in there though.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--94eb2c0c955c858fff05538f9afa--
