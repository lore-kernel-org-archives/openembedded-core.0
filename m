Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id CFC0A60722
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 06:14:06 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id b186so3053270vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 23:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W3ZxVebRXkJvOSWwZHqyDw9/T5uWCFnO7iVr/ml8EgE=;
	b=tLK2IFMbuKYmGIlFzl5+ciZdNSTWSWcaVvDPd5BiM/ZYNmOmTRNpGwTvOtXbqhgGgv
	IJuqNAhELbhSLpY3keQQH+AqOXE/UN3egBF9pfqbXOXnywd4v1l1eRFhqgUvgFGvXKH5
	Z8NS/YLPfGHlyFYE0UjDOBd0F9h7zEStu0F79pr+BTfwPHg7u6K6X2Tl5jMlgvps15uU
	u5ohYvDCmhnCd0CYsY/40gqWdq7qpmwx8Wg3HXu/SikWkyNbjytBFZk7pFFZAfsCO4Fx
	CKTC8aoOOCOb57AOgn/twKbalh5S9Zd+Dgp9CkadffdsZJlMgX1VTQQcn5mEmb3t7XlH
	aOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W3ZxVebRXkJvOSWwZHqyDw9/T5uWCFnO7iVr/ml8EgE=;
	b=XKm4o1MZaPLBHzcCdM1iwvUJP61mFmrQyej39c8KaNCs8NKkuadFDYVBlzMYUEPVFI
	FiPLHorllNCRAuKjOi1WhBN+jT8Yelyj6JfDRuml0KaH35+AGY3vYLhfHWNY7lrPtX8A
	ToGaXFfMKF/R3pvM7wrWbrOVls2D8WPZB3fbur9aK9QnaOV3s6cWiWZBPPPW5ON2sDxH
	nfS7A22/ISfDasIFbevE+Dk66TZBfiTFmZhviLQL0LoTEz+7RxKHq4CFWT54V3l+twdY
	IwjQ/+7xRNFKgiGP7koahr2u5rQzhOAy9m2i+vVaD5ARZW00kMHONhOnKn8tiZKfPD+d
	nMMw==
X-Gm-Message-State: AA6/9RlplwzeDe5OJtvy2FKEoU5qHmUj/TUWZQIlU8Wu4CHq6vs9wXQGmFSs1ERVrhk2XL6nZZq6RkyhALGfsQ==
X-Received: by 10.31.108.70 with SMTP id h67mr3219176vkc.163.1476339248068;
	Wed, 12 Oct 2016 23:14:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Wed, 12 Oct 2016 23:14:07 -0700 (PDT)
Received: by 10.176.86.206 with HTTP; Wed, 12 Oct 2016 23:14:07 -0700 (PDT)
In-Reply-To: <3373280.EktDFKHOVZ@peggleto-mobl.ger.corp.intel.com>
References: <20161012132615.GC2923@jama>
	<7066324.XsME15mTTJ@peggleto-mobl.ger.corp.intel.com>
	<3373280.EktDFKHOVZ@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2016 08:14:07 +0200
Message-ID: <CAMKF1sp8heZDKvpAmYW+MQnQzdNS71Jaus8s-5VKi2DJ9prTiw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK_OLDEST_KERNEL vs OLDEST_KERNEL
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
X-List-Received-Date: Thu, 13 Oct 2016 06:14:08 -0000
Content-Type: multipart/alternative; boundary=001a11478d1472fdf6053eb904ba

--001a11478d1472fdf6053eb904ba
Content-Type: text/plain; charset=UTF-8

On Oct 13, 2016 5:23 AM, "Paul Eggleton" <paul.eggleton@linux.intel.com>
wrote:
>
> On Thu, 13 Oct 2016 09:38:08 Paul Eggleton wrote:
> > On Wed, 12 Oct 2016 15:26:15 Martin Jansa wrote:
> > > is this separate variable working correctly?
> > >
> > > It was introduced in:
> > > commit 522ba4c51fff53566678b2689d0d63c393e417b3
> > > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Date:   Fri Sep 11 13:25:46 2015 +0100
> > >
> > >     populate_sdk_base: Fix aarch64 OLDEST_KERNEL sdk issues
> > >
> > >     aarch64 sets OLDEST_KERNEL to 3.14. This stops the aarch64 SDK
> > >
> > > installing on anything with an older kernel which is clearly
incorrect.
> > >
> > >     I attempted to extract the correct non-overridden version from the
> > >     data
> > >
> > > store but it proved problematic and I was running into data store
issues.
> > > Those are a separate problem but there isn't time to fix this right
now.
> > >
> > >     Instead just code the SDK kernel version separately to work around
> > >     this
> > >
> > > for now (and fix the autobuilder tests and SDK usage).
> > >
> > > But when I'm using:
> > > OLDEST_KERNEL = "3.2" (default)
> > > SDK_OLDEST_KERNEL = "2.6.32"
> > > because we would like to use SDK on host with older kernel, then
> > > SDK_OLDEST_KERNEL helped to bypass the uname check in
environment-setup
> > > script, but then gcc cannot be used, because it fails immediately
with:
> > >
> > > FATAL: kernel too old
> > >
> > > So I'm not sure what this variable are trying to achieve, maybe
> > > autobuilder
> > > tests were only testing setup script and not the actual $CC?
> > >
> > > The other option is that it works only when sdk toolchain is built
with
> > > default OLDEST_KERNEL (which is lower than OLDEST_KERNEL_aarch64) and
only
> > > target bits use OLDEST_KERNEL_aarch64, but those aren't executed on
host
> > > using SDK.
> >
> > I'm not sure how this ever could have worked, since it doesn't enter
into
> > the nativesdk-glibc configuration. It seems to me that the glibc recipe
> > needs to be using SDK_OLDEST_KERNEL in place of OLDEST_KERNEL for
> > class-nativesdk.
>
> Thinking about it - even if that were fixed, would setting it to 2.6.32
> actually work on master? We are now using glibc 2.24 and that requires a
> minimum kernel version of 3.2.0.

For x86/x86_64  2.6.32 would still work which is the most common arch for
sdk host.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

--001a11478d1472fdf6053eb904ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">On Oct 13, 2016 5:23 AM, &quot;Paul Eggleton&quot; &lt;<a hr=
ef=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 13 Oct 2016 09:38:08 Paul Eggleton wrote:<br>
&gt; &gt; On Wed, 12 Oct 2016 15:26:15 Martin Jansa wrote:<br>
&gt; &gt; &gt; is this separate variable working correctly?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It was introduced in:<br>
&gt; &gt; &gt; commit 522ba4c51fff53566678b2689d0d63c393e417b3<br>
&gt; &gt; &gt; Author: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@=
linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; &gt; &gt; Date:=C2=A0 =C2=A0Fri Sep 11 13:25:46 2015 +0100<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0populate_sdk_base: Fix aarch64 OLDEST_KER=
NEL sdk issues<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aarch64 sets OLDEST_KERNEL to 3.14. This =
stops the aarch64 SDK<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; installing on anything with an older kernel which is clearly=
 incorrect.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0I attempted to extract the correct non-ov=
erridden version from the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0data<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; store but it proved problematic and I was running into data =
store issues.<br>
&gt; &gt; &gt; Those are a separate problem but there isn&#39;t time to fix=
 this right now.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Instead just code the SDK kernel version =
separately to work around<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0this<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; for now (and fix the autobuilder tests and SDK usage).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; But when I&#39;m using:<br>
&gt; &gt; &gt; OLDEST_KERNEL =3D &quot;3.2&quot; (default)<br>
&gt; &gt; &gt; SDK_OLDEST_KERNEL =3D &quot;2.6.32&quot;<br>
&gt; &gt; &gt; because we would like to use SDK on host with older kernel, =
then<br>
&gt; &gt; &gt; SDK_OLDEST_KERNEL helped to bypass the uname check in enviro=
nment-setup<br>
&gt; &gt; &gt; script, but then gcc cannot be used, because it fails immedi=
ately with:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; FATAL: kernel too old<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; So I&#39;m not sure what this variable are trying to achieve=
, maybe<br>
&gt; &gt; &gt; autobuilder<br>
&gt; &gt; &gt; tests were only testing setup script and not the actual $CC?=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The other option is that it works only when sdk toolchain is=
 built with<br>
&gt; &gt; &gt; default OLDEST_KERNEL (which is lower than OLDEST_KERNEL_aar=
ch64) and only<br>
&gt; &gt; &gt; target bits use OLDEST_KERNEL_aarch64, but those aren&#39;t =
executed on host<br>
&gt; &gt; &gt; using SDK.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m not sure how this ever could have worked, since it doesn&=
#39;t enter into<br>
&gt; &gt; the nativesdk-glibc configuration. It seems to me that the glibc =
recipe<br>
&gt; &gt; needs to be using SDK_OLDEST_KERNEL in place of OLDEST_KERNEL for=
<br>
&gt; &gt; class-nativesdk.<br>
&gt;<br>
&gt; Thinking about it - even if that were fixed, would setting it to 2.6.3=
2<br>
&gt; actually work on master? We are now using glibc 2.24 and that requires=
 a<br>
&gt; minimum kernel version of 3.2.0.</p>
<p dir=3D"ltr">For x86/x86_64=C2=A0 2.6.32 would still work which is the mo=
st common arch for sdk host.<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Paul<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; Paul Eggleton<br>
&gt; Intel Open Source Technology Centre<br></p>

--001a11478d1472fdf6053eb904ba--
