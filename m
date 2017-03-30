Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 575A7719AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:28:23 +0000 (UTC)
Received: by mail-yb0-f172.google.com with SMTP id i124so5710321ybc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nCfWBmpFKamDSxlprvlaXdqSZ6JC5x2L5MjGTTPl3Og=;
	b=zD13+fLfqKOw5JiDcsuLEmpCpheaYRvTFkC5RPaY4QTs15vTK+zHwhdazT9aSEexIJ
	VyAT6XqOJc/6RY19BGNJUBuURIxHLIxV2WNrURpkLC8nnorikU0jBobGN74Ay93plRtA
	7r7EOBSADtEvoZ2T1Cjk8l3akiO90WYMN+0MoLfguwoVkSTXl/7d5DxjbXFguPSpHzxa
	ObMAWNu63muZBJfYrNgKncGWUdImBzl/+x4jErX+RbsD17cO96cdSK+J7af62EZNWcwU
	awMNWXatesIRWQM7BFZCADVxyPl7obW6YvlREbcxWzUik9cSwhfSUFwmqsZXpKmj1EJJ
	LMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nCfWBmpFKamDSxlprvlaXdqSZ6JC5x2L5MjGTTPl3Og=;
	b=b7b5nLGZXRgOGHLaZIYNXu3qsQL2ewITKAlKrUXNkvH99etgNW5sTxoeBoEzhR/5ao
	j/lv6UJ70Kb1LoxLzwyfEjQMXwRwhgbO5Y2lNGwYEfn81CrAS4kESfqhTxyKvYKxCdZl
	86FMzCYZyxF4IK4fYA3Vk6+dXJzd6wxez11Q5Zq+ztL/NwA3mFDVhuoXuC1nHNb7I+5o
	mH4ut6/C1wWDxyxWm0GhJTu/JFcKNNs2r9KLpO3DgzjcFXys/Oaf6yblf/vAKGPPYE3w
	AVJO8+9/rWwXuIUkU6YWDtLwFRL5AC655eQef19HRoocpfOOB9oiSHO4vIBKl70HNZ32
	LLFQ==
X-Gm-Message-State: AFeK/H0zhCz+nPjaG+YNRmmix9jR4OZxFEja3CFzk/dFoGms2AZy1/mj/z3cm/83MAAaM8LzBo8qEj+NsxGtRhvi
X-Received: by 10.37.170.36 with SMTP id s33mr5743663ybi.189.1490862505319;
	Thu, 30 Mar 2017 01:28:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Thu, 30 Mar 2017 01:27:54 -0700 (PDT)
In-Reply-To: <ace950db96fcfe4379dee1fa6c685c94@agner.ch>
References: <1490741109-18909-1-git-send-email-stefan@agner.ch>
	<CAJTo0LZS0OKSGiX2=6Q-dWFgGrKfF0VXhwq88wtHExTSP9iFpw@mail.gmail.com>
	<ace950db96fcfe4379dee1fa6c685c94@agner.ch>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 30 Mar 2017 11:27:54 +0300
Message-ID: <CAHiDW_HBFYrot+z0RekX35MKD6A+q8x2ZZJ47P8Sr-DZ7RP8MA@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] util-linux: make blkdiscard a separate package
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
X-List-Received-Date: Thu, 30 Mar 2017 08:28:24 -0000
Content-Type: multipart/alternative; boundary=94eb2c000cea09fcdb054bee7af4

--94eb2c000cea09fcdb054bee7af4
Content-Type: text/plain; charset=UTF-8

On 29 March 2017 at 20:42, Stefan Agner <stefan@agner.ch> wrote:

> On 2017-03-29 08:41, Burton, Ross wrote:
>
>
> On 28 March 2017 at 23:45, Stefan Agner <stefan@agner.ch> wrote:
>
>> @@ -30,8 +30,8 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk
>> util-linux-cfdisk util-linux-sfd
>>               util-linux-swaponoff util-linux-losetup util-linux-umount \
>>               util-linux-mount util-linux-readprofile util-linux-uuidd \
>>               util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs
>> util-linux-fsck \
>> -             util-linux-blkid util-linux-mkfs util-linux-mcookie
>> util-linux-reset \
>> -             util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \
>> +             util-linux-blkdiscard util-linux-blkid util-linux-mkfs
>> util-linux-mcookie \
>> +             util-linux-reset util-linux-lsblk util-linux-mkfs.cramfs
>> util-linux-fstrim \
>>               util-linux-partx util-linux-hwclock util-linux-mountpoint \
>>               util-linux-findfs util-linux-getopt util-linux-sulogin
>> util-linux-prlimit"
>>
>
> We're growing a lot of packages containing a single binary.  Would it be
> sensible to group them into "file system tools", "process tools", etc?
>
> Not sure if such a high level grouping is helpful. Just because an
> image uses one fs utility, does not mean the others are used too. There
> might be some potential on a lower level (e.g. util-linux-mkfs.cramfs and
> util-linux-fsck.cramfs).
>
> Is having lots of single binary packages an issue? I guess package
> management data adds some space overhead? In my case, I build a image
> without package metadata, so I guess there is no overhead for the final
> image (for the final image).
>

I have no hard data on this but we are struggling with oe-selftests taking
too long (we're talking 4-10 hour runs and personally I think we should be
running many more tests than we currently do).

The time it takes to boot an image and run the test won't be affected by
this patch, but I'm guessing it does increase the packaging and rootfs
generation time by a little bit. Multiply that by the number of images we
build and add it to all the other "little bits" of time...

Would be nice to have some hard data on this though -- I don't really know
if this is the place to optimize.

Jussi

--94eb2c000cea09fcdb054bee7af4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
9 March 2017 at 20:42, Stefan Agner <span dir=3D"ltr">&lt;<a href=3D"mailto=
:stefan@agner.ch" target=3D"_blank">stefan@agner.ch</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div style=3D"font-size:10pt;font-family:V=
erdana,Geneva,sans-serif"><span class=3D"">
<p>On 2017-03-29 08:41, Burton, Ross wrote:</p>
<blockquote type=3D"cite" style=3D"padding:0 0.4em;border-left:#1010ff 2px =
solid;margin:0">
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On 28 March 2017 at 23:45, Stefan Agner <span>&l=
t;<a href=3D"mailto:stefan@agner.ch" target=3D"_blank">stefan@agner.ch</a>&=
gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<div id=3D"m_-8483252579589999036:yn" class=3D"m_-8483252579589999036a3s m_=
-8483252579589999036aXjCH m_-8483252579589999036m15b171ab2ecb0014">@@ -30,8=
 +30,8 @@ PACKAGES =3D+ &quot;util-linux-agetty util-linux-fdisk util-linux=
-cfdisk util-linux-sfd<br> <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 util-linux-swaponoff util-linux-losetup util-linux-umount \<br> =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util-linux-mount util-linux-r=
eadprofile util-linux-uuidd \<br> </span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs u=
til-linux-fsck \<br> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-=
linux-blkid util-linux-mkfs util-linux-mcookie util-linux-reset \<br> -=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linux-lsblk util-linux-mk=
fs.cramfs util-linux-fstrim \<br> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0util-linux-blkdiscard util-linux-blkid util-linux-mkfs util-linux=
-mcookie \<br> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linux-=
reset util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \<br> =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util-linux-partx util-linux-h=
wclock util-linux-mountpoint \<br> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 util-linux-findfs util-linux-getopt util-linux-sulogin util-linu=
x-prlimit&quot;</div>
</blockquote>
</div>
<br>We&#39;re growing a lot of packages containing a single binary.=C2=A0 W=
ould it be sensible to group them into &quot;file system tools&quot;, &quot=
;process tools&quot;, etc?</div>
</div>
</blockquote>
</span><p>Not sure if such a high level grouping is helpful.=C2=A0Just beca=
use an image=C2=A0uses one fs utility, does not mean the others are used to=
o.=C2=A0There might be some=C2=A0potential on a lower level (e.g.=C2=A0<spa=
n>util-linux-mkfs.cramfs and=C2=A0<span>util-linux-fsck.cramfs).</span></sp=
an></p>
<p>Is having lots of single binary packages an issue? I guess package manag=
ement data adds some space overhead? In my case, I build a image without pa=
ckage metadata, so I guess there is no=C2=A0overhead for=C2=A0the final ima=
ge (for the final image).</p></div></blockquote><div><br></div><div>I have =
no hard data on this but we are struggling with oe-selftests taking too lon=
g (we&#39;re talking 4-10 hour runs and personally I think we should be run=
ning many more tests than we currently do).=C2=A0</div><div><br></div><div>=
The time it takes to boot an image and run the test won&#39;t be affected b=
y this patch, but I&#39;m guessing it does increase the packaging and rootf=
s generation time by a little bit. Multiply that by the number of images we=
 build and add it to all the other &quot;little bits&quot; of time...</div>=
<div><br></div><div>Would be nice to have some hard data on this though -- =
I don&#39;t really know if this is the place to optimize.</div><div><br></d=
iv><div>Jussi=C2=A0<br></div><div>=C2=A0</div></div></div></div>

--94eb2c000cea09fcdb054bee7af4--
