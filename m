Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TfylX-0004jo-45
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 21:06:58 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so3344948iad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 11:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=91R+c6k1w3KcO4roVa+rntZAmJ+w0KhMyUQrxr7LXiA=;
	b=bx+Q+Xlx8pEBxU2bP93KPbl/2mCvjOEX496kqkpd37aKjZI6cof84HDFnB1A2Do3wh
	W8bWeDfb7J7eo8E84hjAwW2CjLLvrw1OwL+Cs1uuKyWWMveYi7amvfWUxve1mhLOQsUR
	5fVTbB6wlh+SelVR3FbdcbN3dckahSvF1JOx4fBhF4m3pjnPhyNv0n0ENS0UKJIXeiG4
	CRBGmMnlgdBMcYbRd8KuF3jyNrxsPC1Ho7ar8h2Z0ZgfSGUGCQ2lJart/UkOvxlzMABd
	jjZwrG2jY+BosQHtbLrEw9GBIn6TD/MKvk9WMGTVv+kfgg8g0gVRQy9UpPa/tBk9G1tU
	pa4g==
Received: by 10.50.173.34 with SMTP id bh2mr3841121igc.70.1354650747794; Tue,
	04 Dec 2012 11:52:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Tue, 4 Dec 2012 11:51:57 -0800 (PST)
In-Reply-To: <50BC5750.6080300@linux.intel.com>
References: <59c6eb39edcf9308a81c9ad84f248e30e526f6ba.1354480962.git.raj.khem@gmail.com>
	<778e45862ea1d877e03abf4b29468fddbe388107.1354480962.git.raj.khem@gmail.com>
	<50BC2C87.9090905@linux.intel.com>
	<CAMKF1spM=0zDXLdpO0WReiidVk29n7UUew3sOngA3ce23PHinQ@mail.gmail.com>
	<50BC5750.6080300@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Dec 2012 11:51:57 -0800
Message-ID: <CAMKF1spbfKdKm8J4mVktMAsV6xV1Yf8Q8+uWd=d7=ZjSiKXeVA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] util-linux: Update from 2.21 -> 2.22
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 20:06:58 -0000
Content-Type: multipart/alternative; boundary=e89a8f647b3b9df64b04d00c3423

--e89a8f647b3b9df64b04d00c3423
Content-Type: text/plain; charset=UTF-8

I always build with OE-core standalone


On Sun, Dec 2, 2012 at 11:40 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 12/02/2012 09:57 PM, Khem Raj wrote:
>
>>
>>
>> On Sun, Dec 2, 2012 at 8:37 PM, Saul Wold <sgw@linux.intel.com
>> <mailto:sgw@linux.intel.com>> wrote:
>>
>>         2.21 has some linking issues with gold on uclibc where mount
>>         program does not work. Its some sort of underlinking.
>>
>>         2.22 did not solve that problem completely either
>>
>>         Signed-off-by: Khem Raj <raj.khem@gmail.com
>>         <mailto:raj.khem@gmail.com>>
>>         ---
>>            meta/recipes-core/util-linux/_**_util-linux.inc        |   18
>>         +++++++++++-------
>>            .../util-linux/add-aarch64-__**support.patch           |    4
>> ++--
>>            .../util-linux/uclibc-____**progname-conflict.patch    |   14
>>         +++++++-------
>>            .../util-linux-ng-replace-__**siginterrupt.patch       |   14
>>         +++++++-------
>>            .../{util-linux_2.21.2.bb <http://util-linux_2.21.2.bb> =>
>>         util-linux_2.22.bb <http://util-linux_2.22.bb>}   |    8 +++-----
>>
>>            5 files changed, 30 insertions(+), 28 deletions(-)
>>            rename meta/recipes-core/util-linux/{**__util-linux_2.21.2.bb
>>         <http://util-linux_2.21.2.bb> => util-linux_2.22.bb
>>         <http://util-linux_2.22.bb>} (88%)
>>
>>         diff --git a/meta/recipes-core/util-__**linux/util-linux.inc
>>         b/meta/recipes-core/util-__**linux/util-linux.inc
>>         index f2f9a04..00b332a 100644
>>         --- a/meta/recipes-core/util-__**linux/util-linux.inc
>>         +++ b/meta/recipes-core/util-__**linux/util-linux.inc
>>
>>         @@ -8,16 +8,16 @@ SECTION = "base"
>>            LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
>>
>>            LIC_FILES_CHKSUM =
>>         "file://README.licensing;md5=_**_**9c920d811858a74b67a36ba23cbaa9
>> **__5f \
>>         -
>>           file://COPYING;md5=__**59530bdf33659b29e73d4adb9f9f65**__52 \
>>         -
>>           file://Documentation/licenses/**__COPYING.GPLv2;md5=__**
>> 8ca43cbc842c2336e835926c2166c2**__8b \
>>         -
>>           file://Documentation/licenses/**__COPYING.LGPLv2.1;md5=__**
>> bbb461211a33b134d42ed5ee802b37**__ff \
>>         +
>>           file://COPYING;md5=__**b234ee4d69f5fce4486a80fdaf4a42**__63 \
>>         +
>>           file://Documentation/licenses/**__COPYING.GPLv2;md5=__**
>> b234ee4d69f5fce4486a80fdaf4a42**__63 \
>>         +
>>           file://Documentation/licenses/**__COPYING.LGPLv2.1;md5=__**
>> 4fbd65380cdd255951079008b36451**__6c \
>>
>>         file://Documentation/licenses/**__COPYING.BSD-3;md5=__**
>> 58dcd8452651fc8b07d1f65ce07ca8**__af
>>         \
>>         -
>>           file://Documentation/licenses/**__COPYING.UCB;md5=__**
>> 263860f8968d8bafa5392cab742852**__62 \
>>         -
>>           file://getopt/COPYING;md5=__**c3a41733416fb80af7ba1b7e1f7125**
>> __51"
>>         +
>>           file://Documentation/licenses/**__COPYING.UCB;md5=__**
>> 263860f8968d8bafa5392cab742852**__62"
>>
>>
>>            inherit autotools gettext pkgconfig
>>            DEPENDS = "zlib ncurses"
>>            DEPENDS_append_class-native = " lzo-native"
>>         +DEPENDS_append_class-target = " libpam"
>>
>>
>>     Forgot to ask in my other email, why the dependency on libpam here?
>>     Should this not be under a check for pam in DISTRO_FEATURES?
>>
>>
>> it did not build without pam. Try it out may be I was wrong.
>>
>
> Seemed to work fine for me with Poky, was this a non-distro setting?
>
> Sau!
>
>

--e89a8f647b3b9df64b04d00c3423
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<font><font face=3D"courier new,monospace">I always build with OE-core stan=
dalone</font></font><div class=3D"gmail_extra"><br><br><div class=3D"gmail_=
quote">On Sun, Dec 2, 2012 at 11:40 PM, Saul Wold <span dir=3D"ltr">&lt;<a =
href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 12/02/2012 09:57 PM, Kh=
em Raj wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"im">
<br>
<br>
On Sun, Dec 2, 2012 at 8:37 PM, Saul Wold &lt;<a href=3D"mailto:sgw@linux.i=
ntel.com" target=3D"_blank">sgw@linux.intel.com</a><br></div><div class=3D"=
im">
&lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@lin=
ux.intel.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2.21 has some linking issues with gold on uclib=
c where mount<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 program does not work. Its some sort of underli=
nking.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2.22 did not solve that problem completely eith=
er<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a><br></div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-core/util-linux/_<u><=
/u>_util-linux.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 18<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++++++++++-------<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.../util-linux/add-aarch64-__<u></=
u>support.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 ++--<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.../util-linux/uclibc-____<u></u>p=
rogname-conflict.patch =C2=A0 =C2=A0| =C2=A0 14<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++++++-------<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.../util-linux-ng-replace-__<u></u=
>siginterrupt.patch =C2=A0 =C2=A0 =C2=A0 | =C2=A0 14<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++++++-------<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.../{<a href=3D"http://util-linux_=
2.21.2.bb" target=3D"_blank">util-linux_2.21.2.bb</a> &lt;<a href=3D"http:/=
/util-linux_2.21.2.bb" target=3D"_blank">http://util-linux_2.21.2.bb</a>&gt=
; =3D&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://util-linux_2.22.bb" target=3D=
"_blank">util-linux_2.22.bb</a> &lt;<a href=3D"http://util-linux_2.22.bb" t=
arget=3D"_blank">http://util-linux_2.22.bb</a>&gt;} =C2=A0 | =C2=A0 =C2=A08=
 +++-----<div class=3D"im"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05 files changed, 30 insertions(+),=
 28 deletions(-)<br></div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename meta/recipes-core/util-linu=
x/{<u></u>__<a href=3D"http://util-linux_2.21.2.bb" target=3D"_blank">util-=
linux_2.21.2.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://util-linux_2.21.2.bb" tar=
get=3D"_blank">http://util-linux_2.21.2.bb</a>&gt; =3D&gt; <a href=3D"http:=
//util-linux_2.22.bb" target=3D"_blank">util-linux_2.22.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://util-linux_2.22.bb" targe=
t=3D"_blank">http://util-linux_2.22.bb</a>&gt;} (88%)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 diff --git a/meta/recipes-core/util-__<u></u>li=
nux/util-linux.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b/meta/recipes-core/util-__<u></u>linux/util-li=
nux.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 index f2f9a04..00b332a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --- a/meta/recipes-core/util-__<u></u>linux/uti=
l-linux.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++ b/meta/recipes-core/util-__<u></u>linux/uti=
l-linux.inc<div class=3D"im"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -8,16 +8,16 @@ SECTION =3D &quot;base&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSE =3D &quot;GPLv2+ &amp; LGP=
Lv2.1+ &amp; BSD&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIC_FILES_CHKSUM =3D<br></div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;file://README.licensing;md5=3D_<u></u>_<u=
></u>9c920d811858a74b67a36ba23cbaa9<u></u>__5f \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://COPYING;md5=3D__<u></u>59530bdf33=
659b29e73d4adb9f9f65<u></u>__52 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Documentation/licenses/<u></u>__C=
OPYING.GPLv2;md5=3D__<u></u>8ca43cbc842c2336e835926c2166c2<u></u>__8b \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Documentation/licenses/<u></u>__C=
OPYING.LGPLv2.1;md5=3D__<u></u>bbb461211a33b134d42ed5ee802b37<u></u>__ff \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://COPYING;md5=3D__<u></u>b234ee4d69=
f5fce4486a80fdaf4a42<u></u>__63 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Documentation/licenses/<u></u>__C=
OPYING.GPLv2;md5=3D__<u></u>b234ee4d69f5fce4486a80fdaf4a42<u></u>__63 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Documentation/licenses/<u></u>__C=
OPYING.LGPLv2.1;md5=3D__<u></u>4fbd65380cdd255951079008b36451<u></u>__6c \<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Documentation/licenses/<u></u>__COPYING.=
BSD-3;md5=3D__<u></u>58dcd8452651fc8b07d1f65ce07ca8<u></u>__af<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Documentation/licenses/<u></u>__C=
OPYING.UCB;md5=3D__<u></u>263860f8968d8bafa5392cab742852<u></u>__62 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://getopt/COPYING;md5=3D__<u></u>c3a=
41733416fb80af7ba1b7e1f7125<u></u>__51&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Documentation/licenses/<u></u>__C=
OPYING.UCB;md5=3D__<u></u>263860f8968d8bafa5392cab742852<u></u>__62&quot;<d=
iv class=3D"im"><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inherit autotools gettext pkgconfi=
g<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEPENDS =3D &quot;zlib ncurses&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEPENDS_append_class-native =3D &q=
uot; lzo-native&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +DEPENDS_append_class-target =3D &quot; libpam&=
quot;<br>
<br>
<br>
=C2=A0 =C2=A0 Forgot to ask in my other email, why the dependency on libpam=
 here?<br>
=C2=A0 =C2=A0 Should this not be under a check for pam in DISTRO_FEATURES?<=
br>
<br>
<br>
it did not build without pam. Try it out may be I was wrong.<br>
</div></blockquote>
<br>
Seemed to work fine for me with Poky, was this a non-distro setting?<br>
<br>
Sau!<br>
<br>
</blockquote></div><br></div>

--e89a8f647b3b9df64b04d00c3423--
