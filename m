Return-Path: <ncrypticus@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2B473285
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 19:22:38 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id x130so153667850vkc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2016 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jW7FgLxP38h4F7zqi6f9fZ4/kPR7zcou0ivcvS/+qp8=;
	b=n0uA0wP28HkObUPQUHkvexRLnGiQ2WJX4/+o9m5z+ie6XWl9jq9rlQ6lXFULOolXha
	oUl4AjGKjXrJDfT/qjWSmbKBHjaHFmnnV919cDrGdMEZKoeaRA4PdUa+bHn5mB5eZk/p
	65gHmWQ6e+Vc7TuMyGYBE7fEFc5csHrPMc+Xo3pbc2AK27inez2h4oNnwq9YF+f2jTuy
	lPLDgy5cbZ48pr6Ks4MoIKWorFdmChDFrqr242BrAepwjvRSU5aYsRJO1l12CBPcMTPU
	0MKVf8neB+ZoCDUGf9UXwzC9ctY/YatdXzPisdkEtOwufUCV/NmEEq1rIFV6Cg14+IiM
	GXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jW7FgLxP38h4F7zqi6f9fZ4/kPR7zcou0ivcvS/+qp8=;
	b=EtyKUgPf5Ht15PzuvlI81+8unqjeFK4zCOhipI+CROmClNUUUzxQRryMmbmcR9uRsP
	T4q390w78lfGLTRdelZTB0BsU0CtcaRp7qHMQbH3EV3cB1HHLLIRif3nnr4K7fTMej4X
	sGOfB9R+brM+4DOTWnkryPEwoXs0wfqhbDjHlX8Hi7oct81an84WJ3Xh+C0EUmlXHEoa
	CuDmcP5rERfTqZdXx+g0155IVl0lMrKT66noTb1QBkX7fqIA8C1E6dQwmMEjCcqY2JBE
	VHwPmaeJP5Dg0AOkxBtBw4Tp6d/s1DBtfVflH60qucEE6No510N0FlORPmlm9qiOGCiD
	2YjA==
X-Gm-Message-State: AEkoouufAIUlbM3HQNK2ejkKygtT66/V0W7pjd5NiC9NY7IrlNS8gKKx2gpRrA6K7QupZtzbMIRwGLyPNUblSQ==
X-Received: by 10.31.230.194 with SMTP id d185mr33509114vkh.143.1470252158870; 
	Wed, 03 Aug 2016 12:22:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.112.2 with HTTP; Wed, 3 Aug 2016 12:22:38 -0700 (PDT)
In-Reply-To: <CAMSG=xXtzC+62ViRN8WSayWr6+aarNVwxEYDr-Y7LbJdmHbvuQ@mail.gmail.com>
References: <CAMSG=xVPrR7peULZh4Ng+EVrjo5SXWwRBU2+o2XjFJGb_F-Xyw@mail.gmail.com>
	<175B9BD5-9DEE-4B4C-B9AD-65F1D81438A3@gmail.com>
	<CAMSG=xVfhcMA3_23fi8hxiaA6NqU_Ki10yFnxAd24jde0wn16A@mail.gmail.com>
	<CAMSG=xXtzC+62ViRN8WSayWr6+aarNVwxEYDr-Y7LbJdmHbvuQ@mail.gmail.com>
From: Nemicolopterus Crypticus <ncrypticus@gmail.com>
Date: Wed, 3 Aug 2016 12:22:38 -0700
Message-ID: <CAMSG=xV6Yqz49bZsNy7At8GfeSrHADmu_Nv1r537ZKXz6T9j3w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: multilib support on Jethro: populate_sdk help
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
X-List-Received-Date: Wed, 03 Aug 2016 19:22:40 -0000
Content-Type: multipart/alternative; boundary=94eb2c0954e8a8e93405392fc12e

--94eb2c0954e8a8e93405392fc12e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ok, I moved past that above error as well. I edited the image recipe, and
just commented out the packages that aren't ready for lib32 build yet.

Unfortunately, even when I build with lib32-<image name> -c populate_sdk,
the sysroots for armv7 aren't getting populated. Also, the environment
setup script does not work properly. (i.e., the environment variable $CC
points to a file that does not exist).

Here is the name of the output in tmp/deploy/sdk:
poky-glibc-x86_64-lib32-<image name>-aarch64-toolchain-2.0.1.sh

As you can see, the TUNE_PKGARCH is still set to aarch64. In fact, when I
first run the bitbake command, this is what I see:
$ bitbake lib32-<image name> -c populate_sdk
Build Configuration:
BB_VERSION        =3D "1.28.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-14.04"
TARGET_SYS        =3D "aarch64-poky-linux"
MACHINE           =3D "qcom-bsp"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "2.0.1"
*TUNE_FEATURES     =3D "aarch64"*
TARGET_FPU        =3D ""

It seems this is coming from the MACHINE file, which includes this line:
require conf/machine/include/arm/arch-armv8.inc

That file just has a single line in it:
 requires conf/machine/include/arm/arch-arm64.inc

THAT file immediately sets the DEFAULTTUNE to aarch64.

So, how am I supposed to enable armv7 SDK to be built? Shouldn't the
DEFAULTTUNE be set to armv7-neon for this to work?
Am I missing something simple? I've read through the documentation a few
times, but fully admit that bitbake is large and complex and I may be
missing something.




On Mon, Aug 1, 2016 at 4:05 PM, Nemicolopterus Crypticus <
ncrypticus@gmail.com> wrote:

> Ok, I've made some progress.
> I'm running
> $bitbake lib32-<image name> -c populate_sdk
>
> and it proceeds for a while.
> We do have a few packages that are not ready to be built as 32-bit, and
> those fail as compiler errors.
>
> Is there a way to temporarily remove them from the list of packages to be
> built?
> Poking around I found DEFAULT_PREFERENCE*, but that looks like it's not
> quite what I'm looking for.
>
> Is there any easy way to quickly disable a particular package from an
> image build?
>
> * http://www.embeddedlinux.org.cn/OEManual/recipes_defaultpreference.html
>
>
> On Fri, Jul 29, 2016 at 1:30 PM, Nemicolopterus Crypticus <
> ncrypticus@gmail.com> wrote:
>
>> Added: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10054
>>
>>
>> Please let me know if I can try anything else or provide more info.
>>
>> In the meantime, I'm going to try to disable multilib, and only build th=
e
>> ARMv7 version of the SDK.
>>
>>
>> On Fri, Jul 29, 2016 at 12:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>>
>>> On Jul 29, 2016, at 10:48 AM, Nemicolopterus Crypticus <
>>> ncrypticus@gmail.com> wrote:
>>>
>>> Hello all,
>>>
>>> We are having issues with our generated SDK files. We're using the
>>> jethro branch, and have enabled multilib (see relevant portion of
>>> local.conf below).
>>>
>>> I can succesfully run the command to generate the SDK:
>>> $ bitbake <recipe name> -c populate_sdk
>>>
>>> But the output is incorrect. *While the aarch sysroots look good, the
>>> sysroots for arm are completely missing. The environment setup script e=
nds
>>> up pointing to non-existent compilers. *Please let me know if you need
>>> more information!
>>>
>>>
>>> Thanks for report. It will be good if you can open a bugzilla entry for
>>> this. So it can be tracked.
>>>
>>>
>>> Steps to reproduce:
>>> $ bitbake <recipe name> -c populate_sdk
>>> $ cp tmp/deploy/sdk/<sdk-script>.sh /test/directory
>>> $ cd /test/directory
>>> $ bash <sdk-script>.sh
>>> $ ls sysroots/
>>> aarch64-poky-linux/   x86_64-pokysdk-linux/
>>>
>>> Note the missing ARM directories.
>>>
>>> Also, the setup script for arm sets this as the command for compiler:
>>>  12 export CC=3D"arm-pokymllib32-linux-gnueabi-gcc
>>>
>>> But that compiler doesn't exist anywhere in the folder where I installe=
d
>>> everything, or environment!
>>>
>>> So it appears that it's not completely or correctly packaging everythin=
g
>>> for ARMv7.
>>>
>>> The documentation does mention some environment variables
>>> <http://www.yoctoproject.org/docs/2.0/mega-manual/mega-manual.html#sdk-=
dev-environment>,
>>> but it's not clear how those related to multilib.
>>>
>>> For instance, none of our recipes have "SDKIMAGE_FEATURES" defined, but
>>> clearly the aarch64 sysroots are getting populated correctly (we
>>> succesfully compiled and ran a simple hello world).
>>>
>>> *Can anyone point me to an example, or discuss a successful use of
>>> "multilib" on the Jethro branch (given desparate brainstorming below),
>>> share some more verbose documentation, or ask follow-up questions?*
>>>
>>>
>>> _____________________________________________________________
>>> Desperate brainstorming below:
>>> I did find this years-old patch:
>>> https://patchwork.openembedded.org/patch/30941/
>>> Notably, the do_populate_sdk method in
>>> poky/meta/classes/populate_sdk_base.bbclass iterates over the values li=
sted
>>> in the MULTILIB_VARIANTS variable:
>>>
>>> +	variants =3D d.getVar("MULTILIB_VARIANTS", True) or ""+	for item in v=
ariants.split():+		# Load overrides from 'd' to avoid having to reset the v=
alue...+		overrides =3D d.getVar("OVERRIDES", False) + ":virtclass-multilib=
-" + item+		localdata.setVar("OVERRIDES", overrides)+		bb.data.update_data(=
localdata)+		bb.build.exec_func("create_sdk_files", localdata)
>>>
>>>
>>>
>>> The latest version in Jethro does not have anything equivalent to that,
>>> but I did not dig deeply into the code or the commit history.
>>>
>>>
>>>
>>>
>>> ______________________________________________________________
>>> More data:
>>>
>>> local.conf relevant section:
>>> #
>>> # Multilib configuration
>>> #
>>> # This sets any packages preprended with lib32- to be built with
>>> # the armv7a tuning (32 bit) instead of 64 bit aarch.
>>> #
>>> require conf/multilib.conf
>>> MULTILIBS =3D "multilib:lib32"
>>> DEFAULTTUNE_virtclass-multilib-lib32 =3D "armv7at-neon"
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>>
>>
>

--94eb2c0954e8a8e93405392fc12e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div>Ok, I moved past t=
hat above error as well. I edited the image recipe, and just commented out =
the packages that aren&#39;t ready for lib32 build yet.<br><br></div>Unfort=
unately, even when I build with lib32-&lt;image name&gt; -c populate_sdk, t=
he sysroots for armv7 aren&#39;t getting populated. Also, the environment s=
etup script does not work properly. (i.e., the environment variable $CC poi=
nts to a file that does not exist).<br><br></div>Here is the name of the ou=
tput in tmp/deploy/sdk:<br>poky-glibc-x86_64-lib32-&lt;image name&gt;-<a hr=
ef=3D"http://aarch64-toolchain-2.0.1.sh">aarch64-toolchain-2.0.1.sh</a><br>=
<br></div>As you can see, the TUNE_PKGARCH is still set to aarch64. In fact=
, when I first run the bitbake command, this is what I see:<br></div>$ bitb=
ake lib32-&lt;image name&gt; -c populate_sdk<br>Build Configuration:<br>BB_=
VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.28.0&quot;<br=
>BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64=
-linux&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0 =3D &quot;Ubuntu-14.04&quot;<br=
>TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;aarch64-pok=
y-linux&quot;<br>MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &quot;qcom-bsp&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;poky&quot;<br>DISTRO_VERSION=
=C2=A0=C2=A0=C2=A0 =3D &quot;2.0.1&quot;<br><strong>TUNE_FEATURES=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;aarch64&quot;</strong><br>TARGET_FPU=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;&quot;<br><br></div>It seems this =
is coming from the MACHINE file, which includes this line:<br>require conf/=
machine/include/arm/arch-armv8.inc<br><br></div>That file just has a single=
 line in it:<br>=C2=A0requires conf/machine/include/arm/arch-arm64.inc<br><=
br>THAT file immediately sets the DEFAULTTUNE to aarch64.<br><br></div>So, =
how am I supposed to enable armv7 SDK to be built? Shouldn&#39;t the DEFAUL=
TTUNE be set to armv7-neon for this to work?<br></div>Am I missing somethin=
g simple? I&#39;ve read through the documentation a few times, but fully ad=
mit that bitbake is large and complex and I may be missing something.<br><b=
r><br><div><div><div><br></div></div></div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Mon, Aug 1, 2016 at 4:05 PM, Nemicolopte=
rus Crypticus <span dir=3D"ltr">&lt;<a href=3D"mailto:ncrypticus@gmail.com"=
 target=3D"_blank">ncrypticus@gmail.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><div><div><div>Ok, I&#39;ve made some=
 progress.<br>I&#39;m running <br>$bitbake lib32-&lt;image name&gt; -c popu=
late_sdk<br><br>and it proceeds for a while.<br>We do have a few packages t=
hat are not ready to be built as 32-bit, and those fail as compiler errors.=
<br><br></div>Is there a way to temporarily remove them from the list of pa=
ckages to be built?<br></div>Poking around I found DEFAULT_PREFERENCE*, but=
 that looks like it&#39;s not quite what I&#39;m looking for.<br><br></div>=
Is there any easy way to quickly disable a particular package from an image=
 build?<br><div><br>* <a href=3D"http://www.embeddedlinux.org.cn/OEManual/r=
ecipes_defaultpreference.html" target=3D"_blank">http://www.embeddedlinux.o=
rg.cn/OEManual/recipes_defaultpreference.html</a><br><br></div></div><div c=
lass=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Fri, Jul 29, 2016 at 1:30 PM, Nemicolopterus Crypticus =
<span dir=3D"ltr">&lt;<a href=3D"mailto:ncrypticus@gmail.com" target=3D"_bl=
ank">ncrypticus@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr"><div>Added: <a href=3D"https://bugzilla.yoctoprojec=
t.org/show_bug.cgi?id=3D10054" target=3D"_blank">https://bugzilla.yoctoproj=
ect.org/show_bug.cgi?id=3D10054</a><br><br><br></div><div>Please let me kno=
w if I can try anything else or provide more info.<br><br></div><div>In the=
 meantime, I&#39;m going to try to disable multilib, and only build the ARM=
v7 version of the SDK.<br><br></div></div><div><div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Fri, Jul 29, 2016 at 12:07 PM, Khem R=
aj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div style=3D"word-wrap:break-word"><br><div><span><blockquote type=
=3D"cite"><div>On Jul 29, 2016, at 10:48 AM, Nemicolopterus Crypticus &lt;<=
a href=3D"mailto:ncrypticus@gmail.com" target=3D"_blank">ncrypticus@gmail.c=
om</a>&gt; wrote:</div><br><div><div dir=3D"ltr"><div><div>Hello all,<br><b=
r></div>We are having issues with our=20
generated SDK files. We&#39;re using the jethro branch, and have enabled=20
multilib (see relevant portion of local.conf below).<br><br></div><div>I ca=
n succesfully run the command to generate the SDK:<br></div><div>$ bitbake =
&lt;recipe name&gt; -c populate_sdk<br><br></div><div>But the output is inc=
orrect. <b>While
 the aarch sysroots look good, the sysroots for arm are completely=20
missing. The environment setup script ends up pointing to non-existent=20
compilers. </b>Please let me know if you need more information!<br></div></=
div></div></blockquote><div><br></div></span><div>Thanks for report. It wil=
l be good if you can open a bugzilla entry for this. So it can be tracked.<=
/div><br><blockquote type=3D"cite"><div><div><div><div dir=3D"ltr"><div><br=
></div><div>Steps to reproduce:<br></div><div>$ bitbake &lt;recipe name&gt;=
 -c populate_sdk<br></div><div>$ cp tmp/deploy/sdk/&lt;sdk-script&gt;.sh /t=
est/directory<br></div><div>$ cd /test/directory<br></div><div>$ bash &lt;s=
dk-script&gt;.sh<br></div><div>$ ls sysroots/<br>aarch64-poky-linux/=C2=A0=
=C2=A0 x86_64-pokysdk-linux/ <br><br></div><div>Note the missing ARM direct=
ories.<br><br></div><div>Also, the setup script for arm sets this as the co=
mmand for compiler:<br>=C2=A012 export CC=3D&quot;arm-pokymllib32-linux-gnu=
eabi-gcc<br><br></div><div>But that compiler doesn&#39;t exist anywhere in =
the folder where I installed everything, or environment!<br><br></div><div>=
So it appears that it&#39;s not completely or correctly packaging everythin=
g for ARMv7.<br></div><div><br></div><div>The <a href=3D"http://www.yoctopr=
oject.org/docs/2.0/mega-manual/mega-manual.html#sdk-dev-environment" target=
=3D"_blank">documentation does mention some environment variables</a>, but =
it&#39;s not clear how those related to multilib.<br><br></div><div>For
 instance, none of our recipes have &quot;SDKIMAGE_FEATURES&quot; defined, =
but=20
clearly the aarch64 sysroots are getting populated correctly (we=20
succesfully compiled and ran a simple hello world).<br><br></div><div><b>Ca=
n
 anyone point me to an example, or discuss a successful use of=20
&quot;multilib&quot; on the Jethro branch (given desparate brainstorming be=
low),=20
share some more verbose documentation, or ask follow-up questions?</b><br><=
/div><div><br></div><div><br>______________________________________________=
_______________<br></div><div>Desperate brainstorming below:<br></div><div>=
I did find this years-old patch: <a href=3D"https://patchwork.openembedded.=
org/patch/30941/" target=3D"_blank">https://patchwork.openembedded.org/patc=
h/30941/</a><br></div><div>Notably, the do_populate_sdk method in poky/meta=
/classes/populate_sdk_base.bbclass iterates over the values listed in the M=
ULTILIB_VARIANTS variable:<br><br><pre><span>+	variants =3D d.getVar(&quot;=
MULTILIB_VARIANTS&quot;, True) or &quot;&quot;</span>
<span>+	for item in variants.split():</span>
<span>+		# Load overrides from &#39;d&#39; to avoid having to reset the val=
ue...</span>
<span>+		overrides =3D d.getVar(&quot;OVERRIDES&quot;, False) + &quot;:virt=
class-multilib-&quot; + item</span>
<span>+		localdata.setVar(&quot;OVERRIDES&quot;, overrides)</span>
<span>+		bb.data.update_data(localdata)</span>
<span>+		bb.build.exec_func(&quot;create_sdk_files&quot;, localdata)</span>=
</pre><br></div><div><br></div><div>The latest version in Jethro does not h=
ave anything equivalent to that, but I did not dig deeply into the code or =
the commit history.<br></div><div><br><br><br><br>_________________________=
_____________________________________<br></div><div>More data:<br></div><di=
v><br></div>local.conf relevant section:<br>#<br># Multilib configuration<b=
r>#<br># This sets any packages preprended with lib32- to be built with<br>=
# the armv7a tuning (32 bit) instead of 64 bit aarch.<br>#<br>require conf/=
multilib.conf<br>MULTILIBS =3D &quot;multilib:lib32&quot;<br>DEFAULTTUNE_vi=
rtclass-multilib-lib32 =3D &quot;armv7at-neon&quot;</div></div></div><span>=
<font color=3D"#888888">
-- <br>_______________________________________________<br>Openembedded-core=
 mailing list<br><a href=3D"mailto:Openembedded-core@lists.openembedded.org=
" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br><a href=
=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" targe=
t=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-co=
re</a><br></font></span></div></blockquote></div><br></div></blockquote></d=
iv><br></div>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--94eb2c0954e8a8e93405392fc12e--
