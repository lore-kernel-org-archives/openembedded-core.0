Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 776FB60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 21:54:07 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 190so125056898iow.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 14:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=mFozZasgeSQPG+NFS8ZLlDbLSAlF3sjHLHS8VQ7FdpU=;
	b=FIV//jJR3ZcA5+x0Jee6iHYOezdvt2DW7wEXSpLPuWmq/KKoCwfi2qDlw+F6sje17S
	x8v35UyAs4SSQ51O0u+QIq0HQBNcRMwgfQ7mGhajmaig+DpoddUPtEjcahWtYhf+9C6I
	dFclWAfOvA8BqekzQPqVDh3JQShi48ZJMSExiwN8tDuYXJgJmDodiYP4afMYyqLrssTu
	sd41rTkfLWmSmToVZABUz0H5sdn5PFKm0wvSVEVLzM7lgHB+qPDWfzlYD++VowDDdFOq
	8KAccY+cBXbQnbYoKTIG5VlZRzY6DcsxJ2xRutfMG0CtdP9edyV6CkRCGR2hcZmA0iRY
	rukA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=mFozZasgeSQPG+NFS8ZLlDbLSAlF3sjHLHS8VQ7FdpU=;
	b=EngTVAqaSHbvNghKigei3q0y1vHmBs1Cesx925bGoj1FWI2TL+oRdYdWV02VOLB0FU
	IWDXLLs2l+sOIEfbKSnGzJvviBwF+GIp8DcT2bexx68kVQceHvCf9TPXcn+x+73PWT7O
	3LobMXZ2MCr+Ao022ycF1lQeae0gmbPAwItaXp4u2rx5bp0mLvsh/l1DkcjVRf2wg6kd
	2j/ZiBvJGwgIfT5htMOmIter2oFk5Q8DBXO7LGeriB5p83KMQEwEyTZzYWJsj9Kx3LSg
	Ji6ZUrll1hgT5HOW5PfK/zB3x8WncZzo8e33zP/9irDCLt5vR0OpSpfwo5M4+mi4gNeM
	1FBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=mFozZasgeSQPG+NFS8ZLlDbLSAlF3sjHLHS8VQ7FdpU=;
	b=Y1criAjefzp7xLUFwPOEoqMvyPD9uLu66xAL7cCAju9GhXJlOJ01iUB5X/HazatY+j
	M4oWZmqt+X0DYja3NQnLn7nfGv9PiANXw0oi3VbPvSYRhyM2tOD/IAfuH3QiS4l3lOzk
	tZ/YAGAL8Dh4yC6PripGvsPZi2s6NgSthd5yxmTpXT/WiY5qsiq4ijvBRzVN8oF3j4Vu
	ErzJyqA8wX7J9EtzqmCXqT7zkDHTJi81cT9MxPT6jJRYyCIngZzNfkcWssptW/s2aRUc
	EvAD+YWWSroIrhsSIwDiMnd7WC/yzwtv42iusmlipSJWlHjlUaYcFt5mLmIEnmO6hZQA
	Me+Q==
X-Gm-Message-State: AOPr4FXPYlBiWo94eu8Nfy0h4e5r9e2MWRQwLcBfLIFkTsg/b/ACwiKyxb8X1KLx4bqYpkOxuNjuFLMIe78Ogg==
X-Received: by 10.36.41.11 with SMTP id p11mr45306itp.66.1463694848711; Thu,
	19 May 2016 14:54:08 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Thu, 19 May 2016 14:53:49 -0700 (PDT)
In-Reply-To: <CANFkWpkhm7MGWOa+ngd0cdA2p4-njcm4UVaj5z-V9AaNqRMA7Q@mail.gmail.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
	<9d32811fe04ce49bdc20891453d37819447d7f88.1462191317.git.ed.bartosh@linux.intel.com>
	<CABcZANkwedfVVu2cxREq2Qp2UECdtAfrcgZ5V9LfVPtkR5sjaA@mail.gmail.com>
	<CABcZANnwMhYwjVZwGGqrGERPbZoTrEaJ3P1WhGriG_RT9kUbtg@mail.gmail.com>
	<20160504070139.GB10864@linux.intel.com>
	<CABcZANnbS3xvxmrSX-L8m=4HBcD_yCkXKFyS9xT8ATA_Ziqfag@mail.gmail.com>
	<CANFkWpnwa1guuPHCFi-=swK5f4AOrjn_qwKFbNCToTD9+6p1OA@mail.gmail.com>
	<CABcZAN=AxiAhxdFqjzPLMJbCu9gRPObLS_NoG7Kj_g_VxWUMXQ@mail.gmail.com>
	<CANFkWpkhm7MGWOa+ngd0cdA2p4-njcm4UVaj5z-V9AaNqRMA7Q@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 19 May 2016 14:53:49 -0700
X-Google-Sender-Auth: I2utoatzUcTYGuxyhYQizksS92Q
Message-ID: <CABcZANmDTPGPWGJNv2X3wKoOvVdqKUXd6ABQL9JeZYoRkq_ZWA@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 May 2016 21:54:08 -0000
Content-Type: multipart/alternative; boundary=001a1143fd70848a1e05333903f4

--001a1143fd70848a1e05333903f4
Content-Type: text/plain; charset=UTF-8

On Thu, May 19, 2016 at 2:50 PM, Alexander Kanevskiy <kad@kad.name> wrote:

> On Thu, May 19, 2016 at 5:54 PM, Christopher Larson <clarson@kergoth.com>
> wrote:
>
>> On Thu, May 19, 2016 at 7:19 AM, Alexander Kanevskiy <kad@kad.name>
>> wrote:
>>
>>> On Wed, May 4, 2016 at 9:55 PM, Christopher Larson <clarson@kergoth.com>
>>> wrote:
>>>
>>>>
>>>>> Yeah, putting it there does require some discussion in general.
>>>> Personally, I'm in favor of such a thing, because we don't want to put
>>>> generated convenience tools in the sysroot, since we tell people explicitly
>>>> to not use sysroot contents directly.
>>>>
>>>> Regarding getting it built for the image, I'd suggest adding something
>>>> like IMAGE_TASKDEPENDS to image_type.bbclass, which is basically like
>>>> IMAGE_DEPENDS, but with the task included. I.e. IMAGE_TASKDEPENDS_bmap =
>>>> "bmap-tools-native:do_deploy". Then you wouldn't need the 'before
>>>> do_package', and it'd fix the from-sstate usage.
>>>>
>>>
>>> We had some private conversation with Richard about deploy/tools, I'll
>>> try to summarize results of our discussion here:
>>>
>>> Thing this, that content under deploy/tools/* supposed to be exported to
>>> "release" directory, and should not be used by any other tool during normal
>>> build/development process.
>>> Those are for usage on another host, where bitbake and content of
>>> sysroots are not usually available.
>>> bmaptool is a good example as stand-alone binary that require only
>>> python2 and nothing else to run.
>>> Another example is dfu-util-static, which is also, not dependant even on
>>> host's libusb even it runs on other host.
>>>
>>> So, in general, it's for static/standalone binaries that are supposed to
>>> be published as part of "release" of the build, same like deploy/images/*
>>>
>>> For any classes, any internals of build process, they never should
>>> depend on content of deploy/* and use *-native tools and binaries out of
>>> sysroot.
>>> E.g. wic require bmap-tool, it should be dependant on presence of
>>> bmap-tools-native installed into sysroot, and should be using both modules
>>> and binary out of this sysroot.
>>>
>>
>> I don't really understand the point you're trying to make here. As far as
>> I can tell, wic put bmaptool into deploy/tools/ as a convenience for the
>> user, not for wic itself to use, so it already does what you're saying it
>> should do.
>>
>
> Yeah, to some extend I'm mixing two topics. Most of above is about putting
> tools into depoloy/* (as Richard raised concern about that).
>
>
> Second topic is about subject "which part of image or wic should depend on
> which task". Both me and Ed are trying to understand exact scenario (or
> even better test case) would trigger issue which lead to idea above of
> putting dependencies like IMAGE_TASKDEPENDS_bmap =
> "bmap-tools-native:do_deploy".
>
> My initial idea,  while creating support for bmap-tools in Ostro, was that
> image type would depend on bmap-tools-native.
> This recipe is also responsible to handle deploy/*. Code or dependencies
> of specific image type don't know anything about deploy part, and IMHO
> should not know.
> In case of support in OE-core, I had impression that Ed implemented it
> same way. However, I didn't check myself part that he did in wic, so not
> sure about part of your comment "wic put bmaptool into deploy/tools/".
>
> I also tried in my environment to reproduce scenario as you described in
> some previous mails in this thread:
>
> > You're right that this is very handy, but we hit a problem when building
> from shared state. This uses do_deploy to deploy bmaptool into
> DEPLOY_DIR_IMAGE, but IMAGE_DEPENDS only depends > on do_populate_sysroot,
> not do_deploy, so an image build from sstate won't write this script out.
>
> but don't see issue with it: executing image build where all objects are
> available in sstate, but bmap-tools-native not present in sysroot leads to
> execution of following tasks:
>
> $ cat tmp-glibc/work/x86_64-linux/bmap-tools-native/3.2/temp/log.task_order
> do_populate_sysroot_setscene (29437):
> log.do_populate_sysroot_setscene.29437
> do_deploy_setscene (29438): log.do_deploy_setscene.29438
> do_populate_lic_setscene (29439): log.do_populate_lic_setscene.29439
> $
>
> if it for some reason not like that in code that Ed did for OE-core, we
> need to look at test scenario, investigate and  fix the issue.
>

For what it's worth, I'm no longer able to reproduce this. I did hit it at
one point, but it seems fine now. *shrug*
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1143fd70848a1e05333903f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, May 19, 2016 at 2:50 PM, Alexander Kanevskiy <span dir=3D"ltr">=
&lt;<a href=3D"mailto:kad@kad.name" target=3D"_blank">kad@kad.name</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"">On Thu, May 19=
, 2016 at 5:54 PM, Christopher Larson <span dir=3D"ltr">&lt;<a href=3D"mail=
to:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&gt;</span=
> wrote:<br></span><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color=
:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_ex=
tra"><div class=3D"gmail_quote"><span><span class=3D"">On Thu, May 19, 2016=
 at 7:19 AM, Alexander Kanevskiy <span dir=3D"ltr">&lt;<a href=3D"mailto:ka=
d@kad.name" target=3D"_blank">kad@kad.name</a>&gt;</span> wrote:<br></span>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"=
gmail_quote"><span><span class=3D"">On Wed, May 4, 2016 at 9:55 PM, Christo=
pher Larson <span dir=3D"ltr">&lt;<a href=3D"mailto:clarson@kergoth.com" ta=
rget=3D"_blank">clarson@kergoth.com</a>&gt;</span> wrote:<br></span><span c=
lass=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><spa=
n><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-=
left-color:rgb(204,204,204);padding-left:1ex"><br></blockquote></div></span=
>Yeah, putting it there does require some discussion in general. Personally=
, I&#39;m in favor of such a thing, because we don&#39;t want to put genera=
ted convenience tools in the sysroot, since we tell people explicitly to no=
t use sysroot contents directly.<br><br clear=3D"all"><div>Regarding gettin=
g it built for the image, I&#39;d suggest adding something like IMAGE_TASKD=
EPENDS to image_type.bbclass, which is basically like IMAGE_DEPENDS, but wi=
th the task included. I.e. IMAGE_TASKDEPENDS_bmap =3D &quot;bmap-tools-nati=
ve:do_deploy&quot;. Then you wouldn&#39;t need the &#39;before do_package&#=
39;, and it&#39;d fix the from-sstate usage.</div><span></span></div></div>=
</blockquote><div><br></div></span></span><span class=3D""><div>We had some=
 private conversation with Richard about deploy/tools, I&#39;ll try to summ=
arize results of our discussion here:</div><div><br></div></span></div><spa=
n class=3D"">Thing this, that content under deploy/tools/* supposed to be e=
xported to &quot;release&quot; directory, and should not be used by any oth=
er tool during normal build/development process.</span></div><span class=3D=
""><div class=3D"gmail_extra">Those are for usage on another host, where bi=
tbake and content of sysroots are not usually available.</div><div class=3D=
"gmail_extra">bmaptool is a good example as stand-alone binary that require=
 only python2 and nothing else to run.=C2=A0</div><div class=3D"gmail_extra=
">Another example is dfu-util-static, which is also, not dependant even on =
host&#39;s libusb even it runs on other host.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">So, in general, it&#39;s for static=
/standalone binaries that are supposed to be published as part of &quot;rel=
ease&quot; of the build, same like deploy/images/*</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">For any classes, any internals=
 of build process, they never should depend on content of deploy/* and use =
*-native tools and binaries out of sysroot.</div><div class=3D"gmail_extra"=
>E.g. wic require bmap-tool, it should be dependant on presence of bmap-too=
ls-native installed into sysroot, and should be using both modules and bina=
ry out of this sysroot.</div></span></div></blockquote><div><br></div></spa=
n><span class=3D""><div>I don&#39;t really understand the point you&#39;re =
trying to make here. As far as I can tell, wic put bmaptool into deploy/too=
ls/ as a convenience for the user, not for wic itself to use, so it already=
 does what you&#39;re saying it should do.</div></span></div></div></div></=
blockquote><div><br></div><div>Yeah, to some extend I&#39;m mixing two topi=
cs. Most of above is about putting tools into depoloy/* (as Richard raised =
concern about that).</div><div><br></div><div><br></div><div>Second topic i=
s about subject &quot;which part of image or wic should depend on which tas=
k&quot;. Both me and Ed are trying to understand exact scenario (or even be=
tter test case) would trigger issue which lead to idea above of putting dep=
endencies like IMAGE_TASKDEPENDS_bmap =3D &quot;bmap-tools-native:do_deploy=
&quot;.</div><div><br></div><div>My initial idea, =C2=A0while creating supp=
ort for bmap-tools in Ostro, was that image type would depend on bmap-tools=
-native.</div><div>This recipe is also responsible to handle deploy/*. Code=
 or dependencies of specific image type don&#39;t know anything about deplo=
y part, and IMHO should not know.</div><div>In case of support in OE-core, =
I had impression that Ed implemented it same way. However, I didn&#39;t che=
ck myself part that he did in wic, so not sure about part of your comment &=
quot;wic put bmaptool into deploy/tools/&quot;.</div><div><br></div><div>I =
also tried in my environment to reproduce scenario as you described in some=
 previous mails in this thread:=C2=A0</div><span class=3D""><div><br></div>=
<div><span style=3D"font-size:12.8px">&gt; You&#39;re right that this is ve=
ry handy, but we hit a problem when building from shared state. This uses d=
o_deploy to deploy bmaptool into DEPLOY_DIR_IMAGE, but IMAGE_DEPENDS only d=
epends &gt; on do_populate_sysroot, not do_deploy, so an image build from s=
state won&#39;t write this script out.</span><br></div><div><span style=3D"=
font-size:12.8px"><br></span></div></span><div><span style=3D"font-size:12.=
8px">but don&#39;t see issue with it: executing image build where all objec=
ts are available in sstate, but bmap-tools-native not present in sysroot le=
ads to execution of following tasks:</span></div><div><span style=3D"font-s=
ize:12.8px"><br></span></div><div><div><span style=3D"font-size:12.8px">$ c=
at tmp-glibc/work/x86_64-linux/bmap-tools-native/3.2/temp/log.task_order</s=
pan></div><div><span style=3D"font-size:12.8px">do_populate_sysroot_setscen=
e (29437): log.do_populate_sysroot_setscene.29437</span></div><div><span st=
yle=3D"font-size:12.8px">do_deploy_setscene (29438): log.do_deploy_setscene=
.29438</span></div><div><span style=3D"font-size:12.8px">do_populate_lic_se=
tscene (29439): log.do_populate_lic_setscene.29439</span></div></div><div><=
span style=3D"font-size:12.8px">$</span></div></div><div><br></div><div>if =
it for some reason not like that in code that Ed did for OE-core, we need t=
o look at test scenario, investigate and =C2=A0fix the issue.</div></div></=
div></blockquote><div><br></div><div>For what it&#39;s worth, I&#39;m no lo=
nger able to reproduce this. I did hit it at one point, but it seems fine n=
ow. *shrug*</div></div>-- <br><div class=3D"gmail_signature">Christopher La=
rson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Open=
Zaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</=
div>
</div></div>

--001a1143fd70848a1e05333903f4--
