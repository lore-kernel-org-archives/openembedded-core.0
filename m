Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7F08D77BDE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 10:23:08 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id n21so134495781qta.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 03:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jeSAwlzuu2pjK+jfQYwWS9Hlj7OgAfMH93wsjcnIrPM=;
	b=zi1pmcg6FE3vDIyKn4IJVUBH2U8GQBLQRFtGRQPwLQrwNCKJtXX/xIVl7B7PF1RpcV
	SSXnNk8qK3xx0IUEil04M0iNwvx95AZpEbs/jxGRUDVLoTXfAYR2diHYDc7DOQUDcVQ1
	9uAlFk5KAU+1Z4hlhIXWQWO55Gy8giDDo7sNLxmOK2w6h/87UVlrzxVInxhDql3Y+gF0
	nV/sT8wHK32tF+kKvgdig7bsLwGemn2Ka5duD+ybLohPyQGgilvXKg1pTzS7K49kIavf
	dzxz6DZRXlHSwM9LqAU1Wf5x1NLKWzJbIvP5WLB7vDxG19vcGIyILsCdFUEIgBdbk7aO
	4h+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jeSAwlzuu2pjK+jfQYwWS9Hlj7OgAfMH93wsjcnIrPM=;
	b=dKDwX6kaaDVq31dtZtWlkh2dkVPDXlIeHVo6gErUC1FsKzCSOVCFLh22Nuz1DRJvid
	179htOJA71b8P6agUVly519hoG5FMLkBAAdL89pAbAxHrYz85zZcG/RPnEvJ5PkzX+aj
	RaOXEc3JpXccB3T7PxODIfYFGL1+TfZqExzaqqVRfA3nmXb0AVsFXfzULuPB27t9lVqm
	5XquIkuwyXr/5HpGtj4IWteg82BWok7C3z+EHPW7gpqgSbJEJVhOiz5p/2/z+AF+7cak
	i4BD+pE230jARM+Wkhw4P+rQbEbtQWpIa+IQx38mCWwSdR9fwCEpbZQ3Vqw8GkGEzbD0
	apjA==
X-Gm-Message-State: AFeK/H1dQEvcurcv6qWhVuF//oLv6VnDbM7voXTaorwnjH+c3w6OU3tlbDGILuHxvtq0A3hhGUaaiD3n0QvezRz3
X-Received: by 10.237.43.69 with SMTP id p63mr21808557qtd.68.1491301390191;
	Tue, 04 Apr 2017 03:23:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 4 Apr 2017 03:22:49 -0700 (PDT)
In-Reply-To: <20170404042008.23356-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170404042008.23356-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Apr 2017 11:22:49 +0100
Message-ID: <CAJTo0LYynrv+_6-T_x6Z1Q9nkBCOV1Ah9u66tdeMvYEkE7BWZg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/devtool: skip test in case of poky-tiny distro
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
X-List-Received-Date: Tue, 04 Apr 2017 10:23:09 -0000
Content-Type: multipart/alternative; boundary=94eb2c124cc49da3d5054c54a9f5

--94eb2c124cc49da3d5054c54a9f5
Content-Type: text/plain; charset=UTF-8

On 4 April 2017 at 05:20, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> The recipe being tested (devtoo-test-patch-gz) by devtool has dependencies
> (at
> least libxres and virtual/libx11) that cannot be built with poky-tiny
> distro so
> skip the test for this particular policy.
>

I think that whilst this is probably a good fix for now as we're trying to
stabilise, changing the test so that it can be built with poky-tiny would
be sensible.

Ross

--94eb2c124cc49da3d5054c54a9f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 April 2017 at 05:20,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leonardo=
.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.gon=
zalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div id=3D":30d" class=3D"a3s aXjCH m15b35f3627241682">The recipe being =
tested (devtoo-test-patch-gz) by devtool has dependencies (at<br>
least libxres and virtual/libx11) that cannot be built with poky-tiny distr=
o so<br>
skip the test for this particular policy.<br></div></blockquote></div><br>I=
 think that whilst this is probably a good fix for now as we&#39;re trying =
to stabilise, changing the test so that it can be built with poky-tiny woul=
d be sensible.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--94eb2c124cc49da3d5054c54a9f5--
