Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6D379763F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:02:20 +0000 (UTC)
Received: by qged69 with SMTP id d69so25944705qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 08:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1GvgDowRzUXJ5U8CuPRlTy0YlptmHmmq18bIsBlaMf8=;
	b=laLuVvSU57yBBhe/Ed8WOCo68kWLQUXWlHFnZ+tVygw1zE4iwLpmrEqpyccY8GXrgL
	S2wMvq4PsjDglGtYReqfjWAFTzxfIgAFN93JFNbBjOPTEo66x3qbwUDcc8EWwr7Y+Irl
	t9FJPrKb4FnpMkWMtuFnar00wUtd25XaEdKQyuEWR8lpzhmvmU33juB28ndrYCwk7LKD
	sL5Ll02LZs4hP0lfVkKphSGedcB1yXFiD519tM/jkkB9BcWFfgpA5egxKNp+qot72ul1
	T2fO4D0edtvI9uGBBbv2E3BaKBrr+Nqoz1jdlnOJVBc+w2ENlqi5yelL82kBfeoKN7T8
	BUpQ==
X-Gm-Message-State: ALoCoQmDsxnO6Gb/sP6nBVm4cEkJWGohU3SuIhiigwJWTLIYJ2mH9Ru40L9I5LhDnCKkEsbfyi3l
X-Received: by 10.140.43.199 with SMTP id e65mr70438996qga.80.1438268540892;
	Thu, 30 Jul 2015 08:02:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Thu, 30 Jul 2015 08:02:01 -0700 (PDT)
In-Reply-To: <20150730143117.GE2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<4dc547325ca078af13412654a8533507f26978ad.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143117.GE2457@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 16:02:01 +0100
Message-ID: <CAJTo0LZiQVfWtAtPqA3CNVFG7tAikMybeXZwnOwd+0mU+fWRZg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/26] eglinfo: change version from 1.0 to 1.0.0 to match the upstream git tag
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
X-List-Received-Date: Thu, 30 Jul 2015 15:02:21 -0000
Content-Type: multipart/alternative; boundary=001a113a9baa78cfd5051c18fd71

--001a113a9baa78cfd5051c18fd71
Content-Type: text/plain; charset=UTF-8

On 30 July 2015 at 15:31, Martin Jansa <martin.jansa@gmail.com> wrote:

> Why don't you set PV in eglinfo.inc and rename them to _git.bb?
>

I think we're going to need the TSC to resolve the opinion in style here.
Again, when it's a release that just happens to use git, I do prefer
keeping the PV in the filename.

Ross

--001a113a9baa78cfd5051c18fd71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 July 2015 at 15:31, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":23l" class=3D=
"a3s" style=3D"overflow:hidden">Why don&#39;t you set PV in eglinfo.inc and=
 rename them to _<a href=3D"http://git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">git.bb</a>?<br></div></blockquote></div><br>I think we&#39;re going to=
 need the TSC to resolve the opinion in style here.=C2=A0 Again, when it&#3=
9;s a release that just happens to use git, I do prefer keeping the PV in t=
he filename.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a113a9baa78cfd5051c18fd71--
