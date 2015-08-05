Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 645CF60017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 15:07:23 +0000 (UTC)
Received: by igr7 with SMTP id 7so97095274igr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=9ewxl0Y4C97yer3jqc10vbCGAywKhZFLe4Q6mjvj8nw=;
	b=kbQAfkAGd9DKsDspPenGFgQ3NDMl414lVBg9iVB+yBLlxlGirYtNVVrfDC42pejwMa
	7cZrErHVY8lD00fjs/JfHUEvmgxcEUT5aGpVIZzNiqexg3nnIaHbOzaXhqG9I65hLElL
	8rOc+Eo8lEFivZ85EowYl5oJdIxbrmdxKwCSuY9WYqWymf+I2tWKKOhSjSdQzOa5/KA7
	pq5cyxiiE6K++HO8rGEV4Gp4YQeCjPWc29mcZH12qZvEnezMJXZWePClchukeFZy+sLc
	kDdj+OcDmV0lwckql4u4zXaxfbGSn0sochtxqb5UYGw/H5Upz9CJUdO4COJJnfKmAthL
	m9qQ==
X-Received: by 10.50.153.112 with SMTP id vf16mr2924749igb.79.1438787242908;
	Wed, 05 Aug 2015 08:07:22 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.199 with HTTP; Wed, 5 Aug 2015 08:07:03 -0700 (PDT)
In-Reply-To: <1438759076-9075-1-git-send-email-sharron.liu@intel.com>
References: <1438759076-9075-1-git-send-email-sharron.liu@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 5 Aug 2015 08:07:03 -0700
X-Google-Sender-Auth: xMNKW1M5vaQ6ic1LuF-ieaZfy4I
Message-ID: <CABcZAN=aXnNDLvJZW0wmP9AkssWjn1HxYPhFm07ZqaR_j-OTHA@mail.gmail.com>
To: "LIU, Sharron" <sharron.liu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-selftest: support selftests from other layers
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
X-List-Received-Date: Wed, 05 Aug 2015 15:07:25 -0000
Content-Type: multipart/alternative; boundary=089e01536c108561c5051c91c25c

--089e01536c108561c5051c91c25c
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 12:17 AM, LIU, Sharron <sharron.liu@intel.com> wrote:

> [YOCTO #7865] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7865
>
> This script is extended to detect and run tests from all BBLAYERS added to
> BBPATH. Tests can be put in any sub-dir, except for "files" which is
> treated
> as test dependent files.
>
> To detect tests, this patch goes through "lib/oeqa/selftest/" of every
> layer
> added to BBPATH.
> To support sub-dir, this patch list test module with its sub-dirs prefix.
> To run tests, this patch adds tests package path into "sys.path" then
> reload
> "oeqa.selftest".
>
> Signed-off-by: LIU, Sharron <sharron.liu@intel.com>
>

This was implemented as a part of the work to do the same for devtool &
recipetool, see https://bugzilla.yoctoproject.org/show_bug.cgi?id=7865#c10
and https://bugzilla.yoctoproject.org/show_bug.cgi?id=7625#c3:


https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=d2023c34e4c3735d919c35d80daf991aab579500

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=51d760e2a7e22f1b07608fc925da343e56a9ae74
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01536c108561c5051c91c25c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 5, 2015 at 12:17 AM, LIU, Sharron <span dir=3D"ltr">&lt;<a href=
=3D"mailto:sharron.liu@intel.com" target=3D"_blank">sharron.liu@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overfl=
ow:hidden">[YOCTO #7865] <a href=3D"https://bugzilla.yoctoproject.org/show_=
bug.cgi?id=3D7865" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yo=
ctoproject.org/show_bug.cgi?id=3D7865</a><br>
<br>
This script is extended to detect and run tests from all BBLAYERS added to<=
br>
BBPATH. Tests can be put in any sub-dir, except for &quot;files&quot; which=
 is treated<br>
as test dependent files.<br>
<br>
To detect tests, this patch goes through &quot;lib/oeqa/selftest/&quot; of =
every layer<br>
added to BBPATH.<br>
To support sub-dir, this patch list test module with its sub-dirs prefix.<b=
r>
To run tests, this patch adds tests package path into &quot;sys.path&quot; =
then reload<br>
&quot;oeqa.selftest&quot;.<br>
<br>
Signed-off-by: LIU, Sharron &lt;<a href=3D"mailto:sharron.liu@intel.com" ta=
rget=3D"_blank">sharron.liu@intel.com</a>&gt;</div></blockquote></div><br>T=
his was implemented as a part of the work to do the same for devtool &amp; =
recipetool, see=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.=
cgi?id=3D7865#c10" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D7865#c10</a> and=C2=A0<a href=3D"https://bugzilla.yoctoprojec=
t.org/show_bug.cgi?id=3D7625#c3" target=3D"_blank">https://bugzilla.yoctopr=
oject.org/show_bug.cgi?id=3D7625#c3</a>:</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">=C2=A0 =C2=A0=C2=A0<a href=3D"https://gi=
t.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Dd2023c34e4c3735d919c35d8=
0daf991aab579500" target=3D"_blank">https://git.yoctoproject.org/cgit/cgit.=
cgi/poky/commit/?id=3Dd2023c34e4c3735d919c35d80daf991aab579500</a></div><di=
v class=3D"gmail_extra">=C2=A0 =C2=A0=C2=A0<a href=3D"https://git.yoctoproj=
ect.org/cgit/cgit.cgi/poky/commit/?id=3D51d760e2a7e22f1b07608fc925da343e56a=
9ae74" target=3D"_blank">https://git.yoctoproject.org/cgit/cgit.cgi/poky/co=
mmit/?id=3D51d760e2a7e22f1b07608fc925da343e56a9ae74</a><br>-- <br><div>Chri=
stopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbe=
dded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor =
Graphics</div>
</div></div>

--089e01536c108561c5051c91c25c--
