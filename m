Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6B077EA5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 16:09:49 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id k101so10998380iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 09:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g0eePIS1cjhHP9vdlDlihH7KwrCsSZ8OUDgbEVGcomU=;
	b=m+0dwY1idBEvkXdMryYrllv+2iSXDiEoojcwkZJFJQwdJ/I2/cKITqT88WO2bM+TqX
	BeBnLx9oWAWF750YFV/sk19EuBcaNV/X/UmXmoWl5NckDSLIi9eGsORQrWD3K2OZPYkO
	/pmQsqgoOxcQs9w/HK/VWGxlyJ+QUJDBby4cpbZmd3AYqG46F3KOS6SKhUGhky494aVN
	xKAjCB0zHS4ac9Ms5n6tIy+dR6Q/iIM+BIek9WYETYoKAtTVw09UNbNV9Gn6fUmAtZre
	7KSZCHluAVbGEKuCKBnN/iaV39elY+VVVBuVCidAAr7aft+TovjT6jvvqpZ+by6VJN3q
	zlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g0eePIS1cjhHP9vdlDlihH7KwrCsSZ8OUDgbEVGcomU=;
	b=nH/tPef1z1Qe9eTT/jt+DVmqjK/hW0uDwzQQW5axg/t5bWP4m8VM63h/XMojH5OnHk
	KpXvS0ONoR6ZFxfIJEKCsRJQqZlBuPJA1zbHUMWXw6g4ekCJ0fkRJWa9ROW+Lv6U8FGn
	ws188fyostic2BYhPsgR1nPYUS9BwTLTBX5zKcljVwidvhk8fnjgoBfKPCv1K9J4Gz2c
	jjcKTMioVNuWevBh3DgayhfqOuZ0P4qbanL6DmmabS3okd4YIBAQ4CnEvp2ssTGFJzMa
	LfsjeBF2QKZa57/uY20StfzYN4BuQwKn3DL0jdZu8KDHPk701J31Zbig/hbIQCt03kNS
	BtUA==
X-Gm-Message-State: AHPjjUgZBqh+vxcgNRRO0H5rxTYPrGhoDm8JZt1HNXLkyNTp9t9V8uXd
	XJTQkHJTs/qfg5LVSX3/NJFupOrLB1PrxqV8AYeNhQ==
X-Google-Smtp-Source: AOwi7QD89exg/S8BNSuAD5AfBKsVJTHGtW4tUiWtGsB1lJqxj/ngd7+2cMsCjrt7Iykjvv0utthjT25E6h5LeyZcRkM=
X-Received: by 10.107.41.135 with SMTP id p129mr32211237iop.142.1507133391190; 
	Wed, 04 Oct 2017 09:09:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.134 with HTTP; Wed, 4 Oct 2017 09:09:30 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B611A2318C@ORSMSX112.amr.corp.intel.com>
References: <1507067652-27633-1-git-send-email-juro.bystricky@intel.com>
	<CAJ86T=UdzPA4WyTELZjiLmfAtK4asKRN-SBd6tsinmi76FiV_A@mail.gmail.com>
	<427c98e1-fbe4-592b-6554-a3a93d747c61@denx.de>
	<CAMKF1sqiBU6oicH4vCvJQDDR+5BRP=RXttheU9ysCdd4QRYwfQ@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B611A2318C@ORSMSX112.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Oct 2017 17:09:30 +0100
Message-ID: <CAJTo0LYuJ219t7mzyNoh+Qt8Nn4GpWfT1n1WJ3p-+gMfBS98ag@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: Marek Vasut <marex@denx.de>, Juro Bystricky <jurobystricky@hotmail.com>,
	"Gan, Yau Wai" <yau.wai.gan@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] siteinfo: nios2-linux - remove wrong mutex info
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
X-List-Received-Date: Wed, 04 Oct 2017 16:09:50 -0000
Content-Type: multipart/alternative; boundary="001a1141f226695e01055abad604"

--001a1141f226695e01055abad604
Content-Type: text/plain; charset="UTF-8"

On 4 October 2017 at 17:07, Bystricky, Juro <juro.bystricky@intel.com>
wrote:

> > > On 10/04/2017 04:01 AM, Andre McCurdy wrote:
> > >> On Tue, Oct 3, 2017 at 2:54 PM, Juro Bystricky
> > <juro.bystricky@intel.com> wrote:
> > >>> With the commit f4e8e9242c5df095b52688b083df3c9d36e7144b
> > >>
> > >> That revision doesn't exist in oe-core...
> > >
> >
> > it exists in poky, sometimes users confuse Openembedded repositories with
> > yocto repositories, its unfortunate but not uncommon
> >
>
> The commit I referenced is here:
> http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/
> recipes-support/db?id=f4e8e9242c5df095b52688b083df3c9d36e7144b
>
> Just to clarify: that commit did not break the build, it exposed the error
> that broke the build for nios2.


The canonical repository is oe-core so we try to use oe-core references.
I'll fix the commit in my queue. :)

Ross

--001a1141f226695e01055abad604
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 October 2017 at 17:07, Bystricky, Juro <span dir=3D"l=
tr">&lt;<a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.=
bystricky@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt=
; &gt; On 10/04/2017 04:01 AM, Andre McCurdy wrote:<br>
&gt; &gt;&gt; On Tue, Oct 3, 2017 at 2:54 PM, Juro Bystricky<br>
&gt; &lt;<a href=3D"mailto:juro.bystricky@intel.com">juro.bystricky@intel.c=
om</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt; With the commit f4e8e9242c5df095b52688b083df3c<wbr>9d36e7=
144b<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; That revision doesn&#39;t exist in oe-core...<br>
&gt; &gt;<br>
&gt;<br>
&gt; it exists in poky, sometimes users confuse Openembedded repositories w=
ith<br>
&gt; yocto repositories, its unfortunate but not uncommon<br>
&gt;<br>
<br>
</span>The commit I referenced is here:<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/recipes-su=
pport/db?id=3Df4e8e9242c5df095b52688b083df3c9d36e7144b" rel=3D"noreferrer" =
target=3D"_blank">http://git.yoctoproject.org/<wbr>cgit.cgi/poky/commit/met=
a/<wbr>recipes-support/db?id=3D<wbr>f4e8e9242c5df095b52688b083df3c<wbr>9d36=
e7144b</a><br>
<br>
Just to clarify: that commit did not break the build, it exposed the error =
that broke the build for nios2.</blockquote><div><br></div><div>The canonic=
al repository is oe-core so we try to use oe-core references.=C2=A0 I&#39;l=
l fix the commit in my queue. :)</div><div><br></div><div>Ross=C2=A0</div><=
/div></div></div>

--001a1141f226695e01055abad604--
