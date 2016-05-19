Return-Path: <kad@kad.name>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9107460670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 21:50:32 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id b78so8112659ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 14:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kad-name.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=XlcpoxnyUnRyakUaoRAHA8nv8e8XXWmoDEkUriI4ypw=;
	b=Rp0PZq9DM4+2TaNyn1r4CjcnTSYUxnitpDQ/Xkyl+KY4oFjZTXGjNEgVO9nnkSXB1w
	z+1a+HVEl8iNWxyPmR4UraOR40CRxwP3KawC0j5AYNSiX4U8tbYZRnucFaqZxXtV5G4j
	jOoXJq0668JAvyJsbB9fqq7osdNHz5A9BhzpLalOJixknug5q/dDqGVs2lpOClR0ayuu
	CXVYIIDgYIFMiqTqlIy0K5a1qntewPvpOsnUFRIs8WaLQN5BbeJi0fxYpidBoqDa3yjx
	hoFEl3mxjS6JkI89IXWNKgRZ7VnupIVVKtigyRNWk3W2EPl+XEP3tFvo9e9+wlQIi4n2
	oGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=XlcpoxnyUnRyakUaoRAHA8nv8e8XXWmoDEkUriI4ypw=;
	b=ikAtsWE5XMADU4knHHJf2zLet04RB0DClSrFPGKGIwR61D/80kZubpDVyjX+rorh6g
	FsSUoyr4sB0s9eixmchYa7Vunuy44tXk9rMyiyOalbR7q3qPR1lU0TDzwWYj+i2fYUcI
	o2gmtPq6d7swT2wAeuzgqhWGIqz5wFZitSFIRSTzf+L2Zyk6azaERPw6K2l4XZIwMnUR
	dmewCFhuPOf0Xk6huiWTWGsyDnMZ+sVfYGC6VHd8ajd4KSSiVJDLD742sZr3p6527aT7
	LPlJJYGGJ/3sGMr7QfpWIg7uv2rG25RwMYDWrfpVdtsp1CWDAGpZjjR0OdimMGiO3oAV
	9/AA==
X-Gm-Message-State: AOPr4FUp5Y3lQFEfehxty3QlmtGBBhaj13Ez9gDTp9JIQP+aaSsFV6QibyWId1bEd6YDI2gBS52cSy+iGdbn/w==
MIME-Version: 1.0
X-Received: by 10.36.31.13 with SMTP id d13mr1303itd.87.1463694633012; Thu, 19
	May 2016 14:50:33 -0700 (PDT)
Received: by 10.107.19.219 with HTTP; Thu, 19 May 2016 14:50:32 -0700 (PDT)
In-Reply-To: <CABcZAN=AxiAhxdFqjzPLMJbCu9gRPObLS_NoG7Kj_g_VxWUMXQ@mail.gmail.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
	<9d32811fe04ce49bdc20891453d37819447d7f88.1462191317.git.ed.bartosh@linux.intel.com>
	<CABcZANkwedfVVu2cxREq2Qp2UECdtAfrcgZ5V9LfVPtkR5sjaA@mail.gmail.com>
	<CABcZANnwMhYwjVZwGGqrGERPbZoTrEaJ3P1WhGriG_RT9kUbtg@mail.gmail.com>
	<20160504070139.GB10864@linux.intel.com>
	<CABcZANnbS3xvxmrSX-L8m=4HBcD_yCkXKFyS9xT8ATA_Ziqfag@mail.gmail.com>
	<CANFkWpnwa1guuPHCFi-=swK5f4AOrjn_qwKFbNCToTD9+6p1OA@mail.gmail.com>
	<CABcZAN=AxiAhxdFqjzPLMJbCu9gRPObLS_NoG7Kj_g_VxWUMXQ@mail.gmail.com>
Date: Fri, 20 May 2016 00:50:32 +0300
Message-ID: <CANFkWpkhm7MGWOa+ngd0cdA2p4-njcm4UVaj5z-V9AaNqRMA7Q@mail.gmail.com>
From: Alexander Kanevskiy <kad@kad.name>
To: Christopher Larson <clarson@kergoth.com>
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
X-List-Received-Date: Thu, 19 May 2016 21:50:34 -0000
Content-Type: multipart/alternative; boundary=001a11405626a928ad053338f686

--001a11405626a928ad053338f686
Content-Type: text/plain; charset=UTF-8

On Thu, May 19, 2016 at 5:54 PM, Christopher Larson <clarson@kergoth.com>
wrote:

> On Thu, May 19, 2016 at 7:19 AM, Alexander Kanevskiy <kad@kad.name> wrote:
>
>> On Wed, May 4, 2016 at 9:55 PM, Christopher Larson <clarson@kergoth.com>
>> wrote:
>>
>>>
>>>> Yeah, putting it there does require some discussion in general.
>>> Personally, I'm in favor of such a thing, because we don't want to put
>>> generated convenience tools in the sysroot, since we tell people explicitly
>>> to not use sysroot contents directly.
>>>
>>> Regarding getting it built for the image, I'd suggest adding something
>>> like IMAGE_TASKDEPENDS to image_type.bbclass, which is basically like
>>> IMAGE_DEPENDS, but with the task included. I.e. IMAGE_TASKDEPENDS_bmap =
>>> "bmap-tools-native:do_deploy". Then you wouldn't need the 'before
>>> do_package', and it'd fix the from-sstate usage.
>>>
>>
>> We had some private conversation with Richard about deploy/tools, I'll
>> try to summarize results of our discussion here:
>>
>> Thing this, that content under deploy/tools/* supposed to be exported to
>> "release" directory, and should not be used by any other tool during normal
>> build/development process.
>> Those are for usage on another host, where bitbake and content of
>> sysroots are not usually available.
>> bmaptool is a good example as stand-alone binary that require only
>> python2 and nothing else to run.
>> Another example is dfu-util-static, which is also, not dependant even on
>> host's libusb even it runs on other host.
>>
>> So, in general, it's for static/standalone binaries that are supposed to
>> be published as part of "release" of the build, same like deploy/images/*
>>
>> For any classes, any internals of build process, they never should depend
>> on content of deploy/* and use *-native tools and binaries out of sysroot.
>> E.g. wic require bmap-tool, it should be dependant on presence of
>> bmap-tools-native installed into sysroot, and should be using both modules
>> and binary out of this sysroot.
>>
>
> I don't really understand the point you're trying to make here. As far as
> I can tell, wic put bmaptool into deploy/tools/ as a convenience for the
> user, not for wic itself to use, so it already does what you're saying it
> should do.
>

Yeah, to some extend I'm mixing two topics. Most of above is about putting
tools into depoloy/* (as Richard raised concern about that).


Second topic is about subject "which part of image or wic should depend on
which task". Both me and Ed are trying to understand exact scenario (or
even better test case) would trigger issue which lead to idea above of
putting dependencies like IMAGE_TASKDEPENDS_bmap =
"bmap-tools-native:do_deploy".

My initial idea,  while creating support for bmap-tools in Ostro, was that
image type would depend on bmap-tools-native.
This recipe is also responsible to handle deploy/*. Code or dependencies of
specific image type don't know anything about deploy part, and IMHO should
not know.
In case of support in OE-core, I had impression that Ed implemented it same
way. However, I didn't check myself part that he did in wic, so not sure
about part of your comment "wic put bmaptool into deploy/tools/".

I also tried in my environment to reproduce scenario as you described in
some previous mails in this thread:

> You're right that this is very handy, but we hit a problem when building
from shared state. This uses do_deploy to deploy bmaptool into
DEPLOY_DIR_IMAGE, but IMAGE_DEPENDS only depends > on do_populate_sysroot,
not do_deploy, so an image build from sstate won't write this script out.

but don't see issue with it: executing image build where all objects are
available in sstate, but bmap-tools-native not present in sysroot leads to
execution of following tasks:

$ cat tmp-glibc/work/x86_64-linux/bmap-tools-native/3.2/temp/log.task_order
do_populate_sysroot_setscene (29437): log.do_populate_sysroot_setscene.29437
do_deploy_setscene (29438): log.do_deploy_setscene.29438
do_populate_lic_setscene (29439): log.do_populate_lic_setscene.29439
$

if it for some reason not like that in code that Ed did for OE-core, we
need to look at test scenario, investigate and  fix the issue.

-- 
br, Alexander Kanevskiy

--001a11405626a928ad053338f686
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, May 19, 2016 at 5:54 PM, Christopher Larson <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-co=
lor:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_extra"><div class=3D"gmail_quote"><span class=3D"">On Thu, May 19, 2016 at=
 7:19 AM, Alexander Kanevskiy <span dir=3D"ltr">&lt;<a href=3D"mailto:kad@k=
ad.name" target=3D"_blank">kad@kad.name</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quot=
e"><span>On Wed, May 4, 2016 at 9:55 PM, Christopher Larson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@ker=
goth.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_extra"><span><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><br=
></blockquote></div></span>Yeah, putting it there does require some discuss=
ion in general. Personally, I&#39;m in favor of such a thing, because we do=
n&#39;t want to put generated convenience tools in the sysroot, since we te=
ll people explicitly to not use sysroot contents directly.<br><br clear=3D"=
all"><div>Regarding getting it built for the image, I&#39;d suggest adding =
something like IMAGE_TASKDEPENDS to image_type.bbclass, which is basically =
like IMAGE_DEPENDS, but with the task included. I.e. IMAGE_TASKDEPENDS_bmap=
 =3D &quot;bmap-tools-native:do_deploy&quot;. Then you wouldn&#39;t need th=
e &#39;before do_package&#39;, and it&#39;d fix the from-sstate usage.</div=
><span></span></div></div></blockquote><div><br></div></span><div>We had so=
me private conversation with Richard about deploy/tools, I&#39;ll try to su=
mmarize results of our discussion here:</div><div><br></div></div>Thing thi=
s, that content under deploy/tools/* supposed to be exported to &quot;relea=
se&quot; directory, and should not be used by any other tool during normal =
build/development process.</div><div class=3D"gmail_extra">Those are for us=
age on another host, where bitbake and content of sysroots are not usually =
available.</div><div class=3D"gmail_extra">bmaptool is a good example as st=
and-alone binary that require only python2 and nothing else to run.=C2=A0</=
div><div class=3D"gmail_extra">Another example is dfu-util-static, which is=
 also, not dependant even on host&#39;s libusb even it runs on other host.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So, in=
 general, it&#39;s for static/standalone binaries that are supposed to be p=
ublished as part of &quot;release&quot; of the build, same like deploy/imag=
es/*</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">F=
or any classes, any internals of build process, they never should depend on=
 content of deploy/* and use *-native tools and binaries out of sysroot.</d=
iv><div class=3D"gmail_extra">E.g. wic require bmap-tool, it should be depe=
ndant on presence of bmap-tools-native installed into sysroot, and should b=
e using both modules and binary out of this sysroot.</div></div></blockquot=
e><div><br></div></span><div>I don&#39;t really understand the point you&#3=
9;re trying to make here. As far as I can tell, wic put bmaptool into deplo=
y/tools/ as a convenience for the user, not for wic itself to use, so it al=
ready does what you&#39;re saying it should do.</div></div></div></div></bl=
ockquote><div><br></div><div>Yeah, to some extend I&#39;m mixing two topics=
. Most of above is about putting tools into depoloy/* (as Richard raised co=
ncern about that).</div><div><br></div><div><br></div><div>Second topic is =
about subject &quot;which part of image or wic should depend on which task&=
quot;. Both me and Ed are trying to understand exact scenario (or even bett=
er test case) would trigger issue which lead to idea above of putting depen=
dencies like IMAGE_TASKDEPENDS_bmap =3D &quot;bmap-tools-native:do_deploy&q=
uot;.</div><div><br></div><div>My initial idea, =C2=A0while creating suppor=
t for bmap-tools in Ostro, was that image type would depend on bmap-tools-n=
ative.</div><div>This recipe is also responsible to handle deploy/*. Code o=
r dependencies of specific image type don&#39;t know anything about deploy =
part, and IMHO should not know.</div><div>In case of support in OE-core, I =
had impression that Ed implemented it same way. However, I didn&#39;t check=
 myself part that he did in wic, so not sure about part of your comment &qu=
ot;wic put bmaptool into deploy/tools/&quot;.</div><div><br></div><div>I al=
so tried in my environment to reproduce scenario as you described in some p=
revious mails in this thread:=C2=A0</div><div><br></div><div><span style=3D=
"font-size:12.8px">&gt; You&#39;re right that this is very handy, but we hi=
t a problem when building from shared state. This uses do_deploy to deploy =
bmaptool into DEPLOY_DIR_IMAGE, but IMAGE_DEPENDS only depends &gt; on do_p=
opulate_sysroot, not do_deploy, so an image build from sstate won&#39;t wri=
te this script out.</span><br></div><div><span style=3D"font-size:12.8px"><=
br></span></div><div><span style=3D"font-size:12.8px">but don&#39;t see iss=
ue with it: executing image build where all objects are available in sstate=
, but bmap-tools-native not present in sysroot leads to execution of follow=
ing tasks:</span></div><div><span style=3D"font-size:12.8px"><br></span></d=
iv><div><div><span style=3D"font-size:12.8px">$ cat tmp-glibc/work/x86_64-l=
inux/bmap-tools-native/3.2/temp/log.task_order</span></div><div><span style=
=3D"font-size:12.8px">do_populate_sysroot_setscene (29437): log.do_populate=
_sysroot_setscene.29437</span></div><div><span style=3D"font-size:12.8px">d=
o_deploy_setscene (29438): log.do_deploy_setscene.29438</span></div><div><s=
pan style=3D"font-size:12.8px">do_populate_lic_setscene (29439): log.do_pop=
ulate_lic_setscene.29439</span></div></div><div><span style=3D"font-size:12=
.8px">$</span></div></div><div><br></div><div>if it for some reason not lik=
e that in code that Ed did for OE-core, we need to look at test scenario, i=
nvestigate and =C2=A0fix the issue.</div><div><br></div>-- <br><div class=
=3D"gmail_signature">br, Alexander Kanevskiy</div>
</div></div>

--001a11405626a928ad053338f686--
