Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id B649760620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 14:55:09 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id d197so2856503ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 07:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=a/BHnEPJypUndq+Usyuq9zvPG9Ja9eJixcKwst6uswQ=;
	b=sNScdr430xsvvxDzrTA71xmX0hZkTXKUkuNzNjrwol7m9u+yY9cNDjyRj8kGJN/+IJ
	JluiQNGTMIVygJJ2f2yVRXFrVObUrLyULRjpQ9k/SdU4wdJemvDWPpc/zPemhYxHNn9B
	E4cspWXU3aSRcz1ARRqqj7wryf/ZzIAD+gBjakRmfIC/aih6PAc7KzwyFumBPY1jf43M
	AbA1jurPZ3E9DY91BQ8oCE1qude6NtHoB8SYqY0Ig5y6L1Rfhmsp6fxMRSkHscCmHMl9
	FxG8S3OzBQT/gXikoiVKVySOZJHcdChH9z5/bM09cuo9h/JdyTNdrt+fQr006iJjHQGB
	Clwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=a/BHnEPJypUndq+Usyuq9zvPG9Ja9eJixcKwst6uswQ=;
	b=WnSuC+LjuMBbqLcZ3h+ysTj4nTvpdizBjKQagcOksMJvm6JJx70CBB4nmGipY2FlO0
	AbG72w4AC+HJzgf8ej0zvJhOkZUQuMKRsD+F4YG4df4DfJEuN1u/NB5HYxqYTapMaePR
	7iIRrV6sWgdB5mxRjU4ZQ23H6gJgb9IiD7wjkgdTZNojz3OwJJk3/QA7Lmcefu3m6YmS
	rCa3pe64DBAIAUuh3a8Y0pyB8sNHYbZPZ8YM4mllg5s/Ocyu7dgkePn5/Vbyliu3G/79
	aBb57YoC2+blNTeKtnfZk7gL2+Ih8COByxxmasc7NMaedqEET1uPipAind9xhdq3bZsN
	Oang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=a/BHnEPJypUndq+Usyuq9zvPG9Ja9eJixcKwst6uswQ=;
	b=bemnO5l72j3NEu/M2tQZhxfNd0z/uH99D1RDAXDiVusQDdznvsFrgXBRMehiLbQWS4
	NCeLlAPn1rbEZDK3YYI6VwN3M/buY4HQiDX+ciSspiyxLeP20fvZVaMM08FUwYEYsEEH
	cRu3O2vT0LQOnrAqhGralbWDqwwAIZ+1xBJBJbngX9iUz/+grmdBjZ7neaBa1FLfX/yD
	MRbVqgCLapykGwz4ujWR3OHn6SoLBmxCuiHsa2KFoomqhb5/zUzgnTPd5Vk2NPBTn0us
	x1W4j4lA7GpK7RF2pCf26QSNo0+oVsfJtdCIctQHInMMNtBlZil/30+vkVBoMqO5hY7S
	znaA==
X-Gm-Message-State: AOPr4FWeIP/QhPZ3prJOVdRarq/oHHTDYJZ2fAJO6+l/pp6EfziHC7/c+zeMzq2B83hvhuiDanVee+rlIb8kKg==
X-Received: by 10.107.147.7 with SMTP id v7mr10221688iod.3.1463669710111; Thu,
	19 May 2016 07:55:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Thu, 19 May 2016 07:54:50 -0700 (PDT)
In-Reply-To: <CANFkWpnwa1guuPHCFi-=swK5f4AOrjn_qwKFbNCToTD9+6p1OA@mail.gmail.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
	<9d32811fe04ce49bdc20891453d37819447d7f88.1462191317.git.ed.bartosh@linux.intel.com>
	<CABcZANkwedfVVu2cxREq2Qp2UECdtAfrcgZ5V9LfVPtkR5sjaA@mail.gmail.com>
	<CABcZANnwMhYwjVZwGGqrGERPbZoTrEaJ3P1WhGriG_RT9kUbtg@mail.gmail.com>
	<20160504070139.GB10864@linux.intel.com>
	<CABcZANnbS3xvxmrSX-L8m=4HBcD_yCkXKFyS9xT8ATA_Ziqfag@mail.gmail.com>
	<CANFkWpnwa1guuPHCFi-=swK5f4AOrjn_qwKFbNCToTD9+6p1OA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 19 May 2016 07:54:50 -0700
X-Google-Sender-Auth: FdvdPTaWcVGGZ6SCiB8-zTTLM7U
Message-ID: <CABcZAN=AxiAhxdFqjzPLMJbCu9gRPObLS_NoG7Kj_g_VxWUMXQ@mail.gmail.com>
To: Alexander Kanevskiy <kad@kad.name>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 4/6] bmap-tools: generate standalone script
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
X-List-Received-Date: Thu, 19 May 2016 14:55:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c055f6823e5eb05333329fd

--94eb2c055f6823e5eb05333329fd
Content-Type: text/plain; charset=UTF-8

On Thu, May 19, 2016 at 7:19 AM, Alexander Kanevskiy <kad@kad.name> wrote:

> On Wed, May 4, 2016 at 9:55 PM, Christopher Larson <clarson@kergoth.com>
> wrote:
>
>>
>> >
>>> > Also, the convention is to add do_deploy before do_build, not before
>>> > do_package, otherwise do_deploy's checksum is included int he
>>> checksums of
>>> > do_package and subsequent tasks, even though its output isn't used by
>>> any
>>> > subsequent tasks.
>>>
>>> I also found this a bit unusual to put the tool into deploy/tools.
>>> That's why I isolated this change. I think it requires some more
>>> testing, but the rest of patchset can be accepted without it.
>>
>>
>> Yeah, putting it there does require some discussion in general.
>> Personally, I'm in favor of such a thing, because we don't want to put
>> generated convenience tools in the sysroot, since we tell people explicitly
>> to not use sysroot contents directly.
>>
>> Regarding getting it built for the image, I'd suggest adding something
>> like IMAGE_TASKDEPENDS to image_type.bbclass, which is basically like
>> IMAGE_DEPENDS, but with the task included. I.e. IMAGE_TASKDEPENDS_bmap =
>> "bmap-tools-native:do_deploy". Then you wouldn't need the 'before
>> do_package', and it'd fix the from-sstate usage.
>>
>
> We had some private conversation with Richard about deploy/tools, I'll try
> to summarize results of our discussion here:
>
> Thing this, that content under deploy/tools/* supposed to be exported to
> "release" directory, and should not be used by any other tool during normal
> build/development process.
> Those are for usage on another host, where bitbake and content of sysroots
> are not usually available.
> bmaptool is a good example as stand-alone binary that require only python2
> and nothing else to run.
> Another example is dfu-util-static, which is also, not dependant even on
> host's libusb even it runs on other host.
>
> So, in general, it's for static/standalone binaries that are supposed to
> be published as part of "release" of the build, same like deploy/images/*
>
> For any classes, any internals of build process, they never should depend
> on content of deploy/* and use *-native tools and binaries out of sysroot.
> E.g. wic require bmap-tool, it should be dependant on presence of
> bmap-tools-native installed into sysroot, and should be using both modules
> and binary out of this sysroot.
>

I don't really understand the point you're trying to make here. As far as I
can tell, wic put bmaptool into deploy/tools/ as a convenience for the
user, not for wic itself to use, so it already does what you're saying it
should do.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c055f6823e5eb05333329fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, May 19, 2016 at 7:19 AM, Alexander Kanevskiy <span dir=3D"ltr">=
&lt;<a href=3D"mailto:kad@kad.name" target=3D"_blank">kad@kad.name</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"">On Wed, May 4,=
 2016 at 9:55 PM, Christopher Larson <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><sp=
an><br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><span>&gt;<br>
&gt; Also, the convention is to add do_deploy before do_build, not before<b=
r>
&gt; do_package, otherwise do_deploy&#39;s checksum is included int he chec=
ksums of<br>
&gt; do_package and subsequent tasks, even though its output isn&#39;t used=
 by any<br>
&gt; subsequent tasks.<br>
<br>
</span>I also found this a bit unusual to put the tool into deploy/tools.<b=
r>
That&#39;s why I isolated this change. I think it requires some more<br>
testing, but the rest of patchset can be accepted without it.</blockquote><=
/div><br></span>Yeah, putting it there does require some discussion in gene=
ral. Personally, I&#39;m in favor of such a thing, because we don&#39;t wan=
t to put generated convenience tools in the sysroot, since we tell people e=
xplicitly to not use sysroot contents directly.<br><br clear=3D"all"><div>R=
egarding getting it built for the image, I&#39;d suggest adding something l=
ike IMAGE_TASKDEPENDS to image_type.bbclass, which is basically like IMAGE_=
DEPENDS, but with the task included. I.e. IMAGE_TASKDEPENDS_bmap =3D &quot;=
bmap-tools-native:do_deploy&quot;. Then you wouldn&#39;t need the &#39;befo=
re do_package&#39;, and it&#39;d fix the from-sstate usage.</div><span></sp=
an></div></div></blockquote><div><br></div></span><div>We had some private =
conversation with Richard about deploy/tools, I&#39;ll try to summarize res=
ults of our discussion here:</div><div><br></div></div>Thing this, that con=
tent under deploy/tools/* supposed to be exported to &quot;release&quot; di=
rectory, and should not be used by any other tool during normal build/devel=
opment process.</div><div class=3D"gmail_extra">Those are for usage on anot=
her host, where bitbake and content of sysroots are not usually available.<=
/div><div class=3D"gmail_extra">bmaptool is a good example as stand-alone b=
inary that require only python2 and nothing else to run.=C2=A0</div><div cl=
ass=3D"gmail_extra">Another example is dfu-util-static, which is also, not =
dependant even on host&#39;s libusb even it runs on other host.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So, in general, i=
t&#39;s for static/standalone binaries that are supposed to be published as=
 part of &quot;release&quot; of the build, same like deploy/images/*</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">For any clas=
ses, any internals of build process, they never should depend on content of=
 deploy/* and use *-native tools and binaries out of sysroot.</div><div cla=
ss=3D"gmail_extra">E.g. wic require bmap-tool, it should be dependant on pr=
esence of bmap-tools-native installed into sysroot, and should be using bot=
h modules and binary out of this sysroot.</div></div></blockquote><div><br>=
</div><div>I don&#39;t really understand the point you&#39;re trying to mak=
e here. As far as I can tell, wic put bmaptool into deploy/tools/ as a conv=
enience for the user, not for wic itself to use, so it already does what yo=
u&#39;re saying it should do.</div></div>-- <br><div class=3D"gmail_signatu=
re">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, =
OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer,=
 Mentor Graphics</div>
</div></div>

--94eb2c055f6823e5eb05333329fd--
