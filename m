Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B77F478B10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:22:47 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h15-v6so1907578wrs.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 07:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5Eydp+bvCCcpPt89mE5tJg7kgTLNxNsF8UE81uQ7xLA=;
	b=pVW/CZEMGni7MmNU8rr8PRUV+zY+MIuZ6iT1hMsbSK0G9QTE009V4sR7cDFxw2xp+T
	tT9JvHERusOF/7YKywiAWs0n5F13FaYoTmxjDvgA2hmiWK8yDetio/3C71Vk0NgYTD7L
	ty+XezCuL7M49Pac3MV18BQxXNaGrwafrUJ5I4N/kCJtX7NKPtCOJEc8x7k7uwVcrq06
	rc2Ct8EX0UQ0WWXeXsIb8ro5E6cwHMBfHxmmkWmA+bTUkuotVH5VSQHBQxGEa0foHwk+
	iv8lv5hb3iFjX7+HAaFC0PcG3y47VCRiM8trO+ZbsEmJ8BED/dEAT+mA0N1nUr3D3UgW
	KOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5Eydp+bvCCcpPt89mE5tJg7kgTLNxNsF8UE81uQ7xLA=;
	b=VHBeNrwWgaF7r9nyoxisbGgzMZWEh2VslXe+sPZn+8vOqqGCqPZu0wI9RGakwvAswJ
	XU75LAIGQVb4YM6yvJrNJS3ZKhqqWQ7yJuHWpkZPqhb/ERTM9pFyZX0wN7Owb+QNxEZR
	ccPISvHQzmlcB3tTAaq9v4/hVpQmIJxmZtkNKwj1bbouj0BIaWbd+ZU5+dWEWCdnqG3H
	YnFkxYoipP1u1vFSKGKXm8reeE9qsYgJb96B48sektYEwgFEQL4bEN2YVkij57+YN5MD
	VkV3lAXJyvSjI9UkoAY/wx85l9Cqp2pQJVgllymmoKR8vjP4beNEU94WtVDzkSYMJfo9
	+xSw==
X-Gm-Message-State: AOUpUlH2xtUHWRLovqFh0WfQakZIQhP1cmChOe7RQATAvzWtHTfBfbnO
	7ytzE+fsfVtozfzAEj+378VZadjlwKi39LboHkk8w2gX
X-Google-Smtp-Source: AAOMgpfNwA5O8VAFJwG7iPWcMajxfhTpqfipCikN0iTuhC0CPW+6S/6/6xQJ6jYWmr2XYU6Sv8cm5UkY6qo/26C186Q=
X-Received: by 2002:adf:fa45:: with SMTP id
	y5-v6mr1892302wrr.138.1532614968509; 
	Thu, 26 Jul 2018 07:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180726135835.17632-1-adrian.ratiu@ni.com>
	<CA+chaQfGatvA-7UQSvrBZXG58QNLf0M0UcNbSNp+9JJ==GuQ2g@mail.gmail.com>
In-Reply-To: <CA+chaQfGatvA-7UQSvrBZXG58QNLf0M0UcNbSNp+9JJ==GuQ2g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Jul 2018 16:22:38 +0200
Message-ID: <CA+chaQfwS7VFTYwR+LfiSV1xGfmdSVY8fuNJ0+Kkdfi3g8nbMw@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux.inc: add fallocate only for class-target
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
X-List-Received-Date: Thu, 26 Jul 2018 14:22:48 -0000
Content-Type: multipart/alternative; boundary="000000000000c68aca0571e7ba22"

--000000000000c68aca0571e7ba22
Content-Type: text/plain; charset="UTF-8"

I went ahead and sent v2 with the fix as I had it locally already anyway.

To illustrate what was wrong with using the override, see following output
from bitbake -e:

env.util-linux.append+override:ALTERNATIVE_util-linux="dmesg kill more
mkswap blockdev pivot_root switch_root hexdump last lastb logger mesg
renice wall unshare setsid chrt flock utmpdump eject nologin taskset
fallocate"
env.util-linux.before:ALTERNATIVE_util-linux="dmesg kill more mkswap
blockdev pivot_root switch_root hexdump last lastb logger mesg renice wall
fallocate unshare setsid chrt flock utmpdump eject nologin taskset"
env.util-linux.override:ALTERNATIVE_util-linux=" fallocate"

# $ALTERNATIVE_util-linux [2 operations]
#   rename from ALTERNATIVE_${PN} data.py:116 [expandKeys]
#     "dmesg kill more mkswap blockdev pivot_root switch_root hexdump last
lastb logger mesg renice wall unshare setsid chrt flock utmpdump eject
nologin taskset"
#   override[class-target]:rename from ALTERNATIVE_${PN}_class-target
data_smart.py:641 [renameVar]
#     " fallocate"
# pre-expansion value:
#   " fallocate"
ALTERNATIVE_util-linux=" fallocate"

# $ALTERNATIVE_util-linux_class-target
#   rename from ALTERNATIVE_${PN}_class-target data_smart.py:641 [renameVar]
#     " fallocate"
ALTERNATIVE_util-linux_class-target=" fallocate"

# $ALTERNATIVE [19 operations]
#   set /OE/build/oe-core/openembedded-core/meta/conf/documentation.conf:63
#     [doc] "Lists commands in a package that need an alternative binary
naming scheme."
#   override[util-linux-hwclock]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:245
#     "hwclock"
#   override[util-linux-fdisk]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:248
#     "fdisk"
#   override[util-linux-fstrim]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:251
#     "fstrim"
#   override[util-linux-agetty]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:254
#     "getty"
#   override[util-linux-mount]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:258
#     "mount"
#   override[util-linux-umount]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:261
#     "umount"
#   override[util-linux-readprofile]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:264
#     "readprofile"
#   override[util-linux-losetup]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:267
#     "losetup"
#   override[util-linux-swaponoff]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:270
#     "swapoff swapon"
#   override[util-linux-fsck]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:274
#     "fsck"
#   override[util-linux-blkid]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:277
#     "blkid"
#   override[util-linux-rfkill]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:280
#     "rfkill"
#   override[util-linux-getopt]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:283
#     "getopt"
#   override[util-linux-sulogin]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:286
#     "sulogin"
#   override[util-linux-mountpoint]:set
/OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:289
#     "mountpoint"
#   override[util-linux]:rename from ALTERNATIVE_${PN} data.py:116
[expandKeys]
#     "dmesg kill more mkswap blockdev pivot_root switch_root hexdump last
lastb logger mesg renice wall unshare setsid chrt flock utmpdump eject
nologin taskset"
#   override[util-linux_class-target]:rename from
ALTERNATIVE_${PN}_class-target data_smart.py:641 [renameVar]
#     " fallocate"
#   override[util-linux-doc]:rename from ALTERNATIVE_${PN}-doc data.py:116
[expandKeys]
#     "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8
utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3
eject.1 logger.1"
# pre-expansion value:
#   "None"

On Thu, Jul 26, 2018 at 4:00 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> This probably doesn't do what you're expecting it to do, use
> ALTERNATIVE_${PN}_append_class-target = " fallocate"
>
> You can check with bitbake -e to see what's the difference between these 2.
>
> On Thu, Jul 26, 2018 at 3:56 PM Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> wrote:
>
>> Because the util-linux_2.32.bb recipe explicitely disables fallocate
>> for nativesdk triggering build warnings:
>>
>> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux:
>> alternative target (sdk/usr/bin/fallocate or
>> sdk/usr/bin/fallocate.util-linux)
>> does not exist, skipping...
>> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: NOT adding
>> alternative provide sdk/usr/bin/fallocate:
>> sdk/usr/bin/fallocate.util-linux
>> does not exist
>> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: alt_link ==
>> alt_target: sdk/usr/bin/fallocate == sdk/usr/bin/fallocate
>>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>>  meta/recipes-core/util-linux/util-linux.inc | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc
>> b/meta/recipes-core/util-linux/util-linux.inc
>> index ed5c618750..504f3c5b61 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -206,8 +206,9 @@ do_install_append_class-native () {
>>  ALTERNATIVE_PRIORITY = "80"
>>
>>  ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root
>> switch_root"
>> -ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall
>> fallocate unshare"
>> +ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall unshare"
>>  ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin taskset"
>> +ALTERNATIVE_${PN}_class-target += "fallocate"
>>
>>  ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
>>  ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
>> --
>> 2.18.0
>>
>>

--000000000000c68aca0571e7ba22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I went ahead and sent v2 with the fix as I had it locally =
already anyway.<div><br></div><div>To illustrate what was wrong with using =
the override, see following output from bitbake -e:</div><div><br></div><di=
v><div>env.util-linux.append+override:ALTERNATIVE_util-linux=3D&quot;dmesg =
kill more mkswap blockdev pivot_root switch_root hexdump last lastb logger =
mesg renice wall unshare setsid chrt flock utmpdump eject nologin taskset f=
allocate&quot;</div><div>env.util-linux.before:ALTERNATIVE_util-linux=3D&qu=
ot;dmesg kill more mkswap blockdev pivot_root switch_root hexdump last last=
b logger mesg renice wall fallocate unshare setsid chrt flock utmpdump ejec=
t nologin taskset&quot;</div><div>env.util-linux.override:ALTERNATIVE_util-=
linux=3D&quot; fallocate&quot;</div><div><br></div><div><div># $ALTERNATIVE=
_util-linux [2 operations]</div><div>#=C2=A0 =C2=A0rename from ALTERNATIVE_=
${PN} data.py:116 [expandKeys]</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;dmesg k=
ill more mkswap blockdev pivot_root switch_root hexdump last lastb logger m=
esg renice wall unshare setsid chrt flock utmpdump eject nologin taskset&qu=
ot;</div><div>#=C2=A0 =C2=A0override[class-target]:rename from ALTERNATIVE_=
${PN}_class-target data_smart.py:641 [renameVar]</div><div>#=C2=A0 =C2=A0 =
=C2=A0&quot; fallocate&quot;</div><div># pre-expansion value:</div><div>#=
=C2=A0 =C2=A0&quot; fallocate&quot;</div><div>ALTERNATIVE_util-linux=3D&quo=
t; fallocate&quot;</div></div><div><br></div><div><div># $ALTERNATIVE_util-=
linux_class-target</div><div>#=C2=A0 =C2=A0rename from ALTERNATIVE_${PN}_cl=
ass-target data_smart.py:641 [renameVar]</div><div>#=C2=A0 =C2=A0 =C2=A0&qu=
ot; fallocate&quot;</div><div>ALTERNATIVE_util-linux_class-target=3D&quot; =
fallocate&quot;</div></div><div><br></div><div><div># $ALTERNATIVE [19 oper=
ations]</div><div>#=C2=A0 =C2=A0set /OE/build/oe-core/openembedded-core/met=
a/conf/documentation.conf:63</div><div>#=C2=A0 =C2=A0 =C2=A0[doc] &quot;Lis=
ts commands in a package that need an alternative binary naming scheme.&quo=
t;</div><div>#=C2=A0 =C2=A0override[util-linux-hwclock]:set /OE/build/oe-co=
re/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:245</div><=
div>#=C2=A0 =C2=A0 =C2=A0&quot;hwclock&quot;</div><div>#=C2=A0 =C2=A0overri=
de[util-linux-fdisk]:set /OE/build/oe-core/openembedded-core/meta/recipes-c=
ore/util-linux/util-linux.inc:248</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;fdis=
k&quot;</div><div>#=C2=A0 =C2=A0override[util-linux-fstrim]:set /OE/build/o=
e-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:251</d=
iv><div>#=C2=A0 =C2=A0 =C2=A0&quot;fstrim&quot;</div><div>#=C2=A0 =C2=A0ove=
rride[util-linux-agetty]:set /OE/build/oe-core/openembedded-core/meta/recip=
es-core/util-linux/util-linux.inc:254</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;=
getty&quot;</div><div>#=C2=A0 =C2=A0override[util-linux-mount]:set /OE/buil=
d/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:258=
</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;mount&quot;</div><div>#=C2=A0 =C2=A0o=
verride[util-linux-umount]:set /OE/build/oe-core/openembedded-core/meta/rec=
ipes-core/util-linux/util-linux.inc:261</div><div>#=C2=A0 =C2=A0 =C2=A0&quo=
t;umount&quot;</div><div>#=C2=A0 =C2=A0override[util-linux-readprofile]:set=
 /OE/build/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linu=
x.inc:264</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;readprofile&quot;</div><div>=
#=C2=A0 =C2=A0override[util-linux-losetup]:set /OE/build/oe-core/openembedd=
ed-core/meta/recipes-core/util-linux/util-linux.inc:267</div><div>#=C2=A0 =
=C2=A0 =C2=A0&quot;losetup&quot;</div><div>#=C2=A0 =C2=A0override[util-linu=
x-swaponoff]:set /OE/build/oe-core/openembedded-core/meta/recipes-core/util=
-linux/util-linux.inc:270</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;swapoff swap=
on&quot;</div><div>#=C2=A0 =C2=A0override[util-linux-fsck]:set /OE/build/oe=
-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:274</di=
v><div>#=C2=A0 =C2=A0 =C2=A0&quot;fsck&quot;</div><div>#=C2=A0 =C2=A0overri=
de[util-linux-blkid]:set /OE/build/oe-core/openembedded-core/meta/recipes-c=
ore/util-linux/util-linux.inc:277</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;blki=
d&quot;</div><div>#=C2=A0 =C2=A0override[util-linux-rfkill]:set /OE/build/o=
e-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:280</d=
iv><div>#=C2=A0 =C2=A0 =C2=A0&quot;rfkill&quot;</div><div>#=C2=A0 =C2=A0ove=
rride[util-linux-getopt]:set /OE/build/oe-core/openembedded-core/meta/recip=
es-core/util-linux/util-linux.inc:283</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;=
getopt&quot;</div><div>#=C2=A0 =C2=A0override[util-linux-sulogin]:set /OE/b=
uild/oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux.inc:=
286</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;sulogin&quot;</div><div>#=C2=A0 =
=C2=A0override[util-linux-mountpoint]:set /OE/build/oe-core/openembedded-co=
re/meta/recipes-core/util-linux/util-linux.inc:289</div><div>#=C2=A0 =C2=A0=
 =C2=A0&quot;mountpoint&quot;</div><div>#=C2=A0 =C2=A0override[util-linux]:=
rename from ALTERNATIVE_${PN} data.py:116 [expandKeys]</div><div>#=C2=A0 =
=C2=A0 =C2=A0&quot;dmesg kill more mkswap blockdev pivot_root switch_root h=
exdump last lastb logger mesg renice wall unshare setsid chrt flock utmpdum=
p eject nologin taskset&quot;</div><div>#=C2=A0 =C2=A0override[util-linux_c=
lass-target]:rename from ALTERNATIVE_${PN}_class-target data_smart.py:641 [=
renameVar]</div><div>#=C2=A0 =C2=A0 =C2=A0&quot; fallocate&quot;</div><div>=
#=C2=A0 =C2=A0override[util-linux-doc]:rename from ALTERNATIVE_${PN}-doc da=
ta.py:116 [expandKeys]</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;mountpoint.1 la=
st.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 rfkill.8 kill.1 l=
ibblkid.3 blkid.8 findfs.8 fsck.8 uuid.3 eject.1 logger.1&quot;</div><div>#=
 pre-expansion value:</div><div>#=C2=A0 =C2=A0&quot;None&quot;</div></div><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jul 26, =
2018 at 4:00 PM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">=
martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"ltr">This probably doesn&#39;t do what you&#39;re expecting =
it to do, use<div><span style=3D"font-size:small;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">ALTERNATIVE_${PN}_append_class-targe</span><span style=
=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">t =3D &qu=
ot; fallocate&quot;</span><br></div><div><span style=3D"font-size:small;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline"><br></span></div><div><span styl=
e=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">You can =
check with bitbake -e to see what&#39;s the difference between these 2.</sp=
an></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jul =
26, 2018 at 3:56 PM Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni=
.com" target=3D"_blank">adrian.ratiu@ni.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Because the <a href=3D"http://util-linux_2.32.bb" r=
el=3D"noreferrer" target=3D"_blank">util-linux_2.32.bb</a> recipe explicite=
ly disables fallocate<br>
for nativesdk triggering build warnings:<br>
<br>
WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux:<br>
alternative target (sdk/usr/bin/fallocate or sdk/usr/bin/fallocate.util-lin=
ux)<br>
does not exist, skipping...<br>
WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: NOT adding<br=
>
alternative provide sdk/usr/bin/fallocate: sdk/usr/bin/fallocate.util-linux=
<br>
does not exist<br>
WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: alt_link =3D=
=3D<br>
alt_target: sdk/usr/bin/fallocate =3D=3D sdk/usr/bin/fallocate<br>
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
 target=3D"_blank">adrian.ratiu@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc<br>
index ed5c618750..504f3c5b61 100644<br>
--- a/meta/recipes-core/util-linux/util-linux.inc<br>
+++ b/meta/recipes-core/util-linux/util-linux.inc<br>
@@ -206,8 +206,9 @@ do_install_append_class-native () {<br>
=C2=A0ALTERNATIVE_PRIORITY =3D &quot;80&quot;<br>
<br>
=C2=A0ALTERNATIVE_${PN}=C2=A0 =3D &quot;dmesg kill more mkswap blockdev piv=
ot_root switch_root&quot;<br>
-ALTERNATIVE_${PN} +=3D &quot;hexdump last lastb logger mesg renice wall fa=
llocate unshare&quot;<br>
+ALTERNATIVE_${PN} +=3D &quot;hexdump last lastb logger mesg renice wall un=
share&quot;<br>
=C2=A0ALTERNATIVE_${PN} +=3D &quot;setsid chrt flock utmpdump eject nologin=
 taskset&quot;<br>
+ALTERNATIVE_${PN}_class-target +=3D &quot;fallocate&quot;<br>
<br>
=C2=A0ALTERNATIVE_LINK_NAME[dmesg] =3D &quot;${base_bindir}/dmesg&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[kill] =3D &quot;${base_bindir}/kill&quot;<br>
-- <br>
2.18.0<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000c68aca0571e7ba22--
