Received: from moutng.kundenserver.de ([212.227.17.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve.english@navetas.com>) id 1ShJ2O-0000xg-5A
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 13:25:28 +0200
Received: from mail-yx0-f175.google.com (mail-yx0-f175.google.com
	[209.85.213.175])
	by mrelayeu.kundenserver.de (node=mrbap4) with ESMTP (Nemesis)
	id 0M8QOg-1RvP5T1BuU-00vy4X; Wed, 20 Jun 2012 13:02:05 +0200
Received: by yenl13 with SMTP id l13so5180136yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 04:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=AX0Lwc4sxbA4WfuhOX09BEeFr2V/+5psLm+cIB/uLS0=;
	b=j1h+mncfB1xEnmy6FXA1SaE8U6ttJudQ+TZ2OYXQ805NuSuK25FV1msY88fObZX4Kw
	lGDVAJYj+2nZlPmDox0iBnblJzipL9Y7LPnSqiTuCRgR2IFtcs68Ra7+AMdHeJeKm8+k
	fSyZuIbBp0s8emtjJzMaZlXrG48LYXrfuGQsPa/+Hw9mgyoe7fz3zDI6xewwriohZZHA
	eEw9T2G2rbkwyFOL+W2jJNJS9PTNfMNBsWajkhl3BTxjA3ZmOAvT+PG1IGVh8QR5yRYm
	Yo0vge/Gm4d3MSMnjSiHAUAcWI4nmcahTxw8NUfmxN7rTJYziFuBhMFObThWzf9oMi5U
	Pdog==
MIME-Version: 1.0
Received: by 10.50.184.227 with SMTP id ex3mr3996751igc.26.1340190123775; Wed,
	20 Jun 2012 04:02:03 -0700 (PDT)
Received: by 10.64.77.130 with HTTP; Wed, 20 Jun 2012 04:02:03 -0700 (PDT)
In-Reply-To: <4FE167B4.3020802@gmail.com>
References: <CANrdZLjpmXK5j+jr=fTD43je2Ni6exWGcrCkejKgE1ZZXe5TGQ@mail.gmail.com>
	<CAMKF1spWqFCoXRbnevoKz+ftThQf41nObpMQ6N46YQ6_fucznQ@mail.gmail.com>
	<4FE167B4.3020802@gmail.com>
Date: Wed, 20 Jun 2012 12:02:03 +0100
Message-ID: <CANrdZLgHDF+HuVRtdBP+SHchT3XTCwaRgXyXgRVZ68o2ZSkDVg@mail.gmail.com>
From: Steve English <steve.english@navetas.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnChbJyB2a+ixWG8tipOBTXqzvkVhgi2l3m1Gd/raFrl3sFdW2yohyBcfcy3QLtWTPPFFkF
X-Provags-ID: V02:K0:C0uTeGf5TQKTKLIgWHJIQPdej291Ft/b5fQp6P+ka8O
	fG7HBd5wr5Au0zIo5Y9VMcwVHHdeLlaN/I8LzeDpDjP3M/vxwd
	ozwOM9sateuz/g+qWqMRN8Fp5XMg+xDTJLvFoi4PpMGMoTmjia
	2u+f83ae8gIC2crYg9CO+thMwJRFyrLHnbUufQ5gQfVG+pn7RZ
	W/z+0jJTzNoQAzFWPtSuyIL/TUR6eWmUr5lG+Im1IGWsL6OXhN
	2XKdytVSdOqxPKZg3pDVigoXzOMXV7qzdF7uJlWFiwij1xFW7A
	8cWNc7parL8Mba5vVS8pwlrQjQ72N4E9yWsOnBbZRGJqeX5ZHO
	MpmurSZz/eFVZDOUuf3CeEDhm1jPi6GRdV8dTVAfTOwbdeyak0
	LHixCJh0RI/zWylEaFkng9pnYJRC3bMi5I78TDBculfiq4bY6t kevd0
Subject: Re: Generating a movable SDK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2012 11:25:28 -0000
Content-Type: multipart/alternative; boundary=14dae9340d8142573704c2e55498

--14dae9340d8142573704c2e55498
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 20, 2012 at 7:03 AM, Tasslehoff Kjappfot <tasskjapp@gmail.com>wrote:

> On 06/19/2012 10:33 PM, Khem Raj wrote:
>
>> Sdk is not install time relocatable yet there is a feature enhancement
>> request in yo to bugzilla for the same
>>
>>  That request is mine, I think. I have gotten around this by making
> /usr/local/oecore-i686 a symlink to where I want to keep the toolchain (in
> a vcs). Works like a charm.
>

I've got it to run by:
1. Changing the dynamic loader to the system loader and making RPATH
directives use relative paths in the elf files in:
*
x86_64-angstromsdk-linux/usr/libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/
* x86_64-angstromsdk-linux/usr/bin/armv7a-angstrom-linux-gnueabi

with patchelf (http://nixos.org/patchelf.html):

for x in *; do echo $x; patchelf --set-interpreter
/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 $x; patchelf --set-rpath
"\$ORIGIN/../../lib/armv7a-angstrom-linux-gnueabi/:\$ORIGIN/../../../lib/:\$ORIGIN/../../lib"
$x; done

2. Making the symlinks in
x86_64-angstromsdk-linux/usr/libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/
use relative paths:

x86_64-angstromsdk-linux/usr/libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4$
cat tweak_target.sh
#!/bin/bash
FILE=`basename $1`
ln -f -s ../../../../../bin/armv7a-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-$FILE
$FILE
x86_64-angstromsdk-linux/usr/libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4$
find . -type l -exec ./tweak_target.sh {} \;

This feels like a rather unpleasant hack so I'm going to use the
codesourcery compiler for now, but this does appear to work.

Thanks,

Steve

--14dae9340d8142573704c2e55498
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Jun 20, 2012 at 7:03 AM, Tasslehoff Kjap=
pfot <span dir=3D"ltr">&lt;<a href=3D"mailto:tasskjapp@gmail.com" target=3D=
"_blank">tasskjapp@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<div class=3D"im">On 06/19/2012 10:33 PM, Khem Raj wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Sdk is not install time relocatable ye=
t there is a feature enhancement<br><div class=3D"im">
request in yo to bugzilla for the same<br>
<br>
</div></blockquote>
That request is mine, I think. I have gotten around this by making /usr/loc=
al/oecore-i686 a symlink to where I want to keep the toolchain (in a vcs). =
Works like a charm.<br></blockquote></div><br>I&#39;ve got it to run by:<br=
>
1. Changing the dynamic loader to the system loader and making RPATH direct=
ives use relative paths in the elf files in:<br>* x86_64-angstromsdk-linux/=
usr/libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.=
5.4/<br>
* x86_64-angstromsdk-linux/usr/bin/armv7a-angstrom-linux-gnueabi<br><br>wit=
h patchelf (<a href=3D"http://nixos.org/patchelf.html">http://nixos.org/pat=
chelf.html</a>):<br><pre>for x in *; do echo $x; patchelf --set-interpreter=
 /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 $x; patchelf --set-rpath &quot;=
\$ORIGIN/../../lib/armv7a-angstrom-linux-gnueabi/:\$ORIGIN/../../../lib/:\$=
ORIGIN/../../lib&quot; $x; done</pre>
2. Making the symlinks in x86_64-angstromsdk-linux/usr/libexec/armv7a-angst=
rom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/ use relative paths:=
<br><pre>x86_64-angstromsdk-linux/usr/libexec/armv7a-angstrom-linux-gnueabi=
/gcc/arm-angstrom-linux-gnueabi/4.5.4$ cat tweak_target.sh=20
#!/bin/bash
FILE=3D`basename $1`
ln -f -s ../../../../../bin/armv7a-angstrom-linux-gnueabi/arm-angstrom-linu=
x-gnueabi-$FILE $FILE
x86_64-angstromsdk-linux/usr/libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-=
angstrom-linux-gnueabi/4.5.4$ find . -type l -exec ./tweak_target.sh {} \;<=
/pre>This feels like a rather unpleasant hack so I&#39;m going to use the c=
odesourcery compiler for now, but this does appear to work.<br>
<br>Thanks,<br><br>Steve<br><br>

--14dae9340d8142573704c2e55498--
