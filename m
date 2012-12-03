Received: from mail-ie0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TfPGP-0006kk-RE
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 07:12:27 +0100
Received: by mail-ie0-f174.google.com with SMTP id c11so4001749ieb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2012 21:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cFcEeey34m/JjxT6+ctT4xd54nDoIEpnfa5ObWme4yY=;
	b=fiTmF3ytn1zLVN1+uw/G0P/jV95h/kkCOqW1uXguABo+s5qqc0PROELu3qePZS28ma
	UBac2T0VuoTrZftj2xOZhRYb9K/BmTI0A6KQKw+1ufwcTKqUdywQ5FvUQMkr3LW/gXLN
	zcs5f+FQhD3/ibPmnget2QVHSXYAe0IfvWC05V9Ax4FWtna185hP3wNsTcV2jsOSfNrR
	s0Yyq974MqX4wxhV5tww0WJYG4+LqDcK2a7pAY5hxhTKacykA6ZoXiX/2TCQtwMBkKeb
	ga5x2/BmzkEFt4Xq4Sz2Yq22ugTFYw7m4D14gllz5k6cxcE0jf/QrREhh9husQqGrShr
	zpuA==
Received: by 10.50.213.69 with SMTP id nq5mr5054996igc.70.1354514280477; Sun,
	02 Dec 2012 21:58:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Sun, 2 Dec 2012 21:57:30 -0800 (PST)
In-Reply-To: <50BC2C87.9090905@linux.intel.com>
References: <59c6eb39edcf9308a81c9ad84f248e30e526f6ba.1354480962.git.raj.khem@gmail.com>
	<778e45862ea1d877e03abf4b29468fddbe388107.1354480962.git.raj.khem@gmail.com>
	<50BC2C87.9090905@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Dec 2012 21:57:30 -0800
Message-ID: <CAMKF1spM=0zDXLdpO0WReiidVk29n7UUew3sOngA3ce23PHinQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 03 Dec 2012 06:12:28 -0000
Content-Type: multipart/alternative; boundary=14dae9340b5187f4a704cfec6e4f

--14dae9340b5187f4a704cfec6e4f
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 2, 2012 at 8:37 PM, Saul Wold <sgw@linux.intel.com> wrote:

>  2.21 has some linking issues with gold on uclibc where mount
>> program does not work. Its some sort of underlinking.
>>
>> 2.22 did not solve that problem completely either
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-core/util-linux/**util-linux.inc        |   18
>> +++++++++++-------
>>   .../util-linux/add-aarch64-**support.patch           |    4 ++--
>>   .../util-linux/uclibc-__**progname-conflict.patch    |   14
>> +++++++-------
>>   .../util-linux-ng-replace-**siginterrupt.patch       |   14
>> +++++++-------
>>   .../{util-linux_2.21.2.bb => util-linux_2.22.bb}   |    8 +++-----
>>   5 files changed, 30 insertions(+), 28 deletions(-)
>>   rename meta/recipes-core/util-linux/{**util-linux_2.21.2.bb<http://util-linux_2.21.2.bb>=>
>> util-linux_2.22.bb} (88%)
>>
>> diff --git a/meta/recipes-core/util-**linux/util-linux.inc
>> b/meta/recipes-core/util-**linux/util-linux.inc
>> index f2f9a04..00b332a 100644
>> --- a/meta/recipes-core/util-**linux/util-linux.inc
>> +++ b/meta/recipes-core/util-**linux/util-linux.inc
>> @@ -8,16 +8,16 @@ SECTION = "base"
>>   LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
>>
>>   LIC_FILES_CHKSUM = "file://README.licensing;md5=**
>> 9c920d811858a74b67a36ba23cbaa9**5f \
>> -                    file://COPYING;md5=**59530bdf33659b29e73d4adb9f9f65*
>> *52 \
>> -                    file://Documentation/licenses/**COPYING.GPLv2;md5=**
>> 8ca43cbc842c2336e835926c2166c2**8b \
>> -                    file://Documentation/licenses/**
>> COPYING.LGPLv2.1;md5=**bbb461211a33b134d42ed5ee802b37**ff \
>> +                    file://COPYING;md5=**b234ee4d69f5fce4486a80fdaf4a42*
>> *63 \
>> +                    file://Documentation/licenses/**COPYING.GPLv2;md5=**
>> b234ee4d69f5fce4486a80fdaf4a42**63 \
>> +                    file://Documentation/licenses/**
>> COPYING.LGPLv2.1;md5=**4fbd65380cdd255951079008b36451**6c \
>>                       file://Documentation/licenses/**COPYING.BSD-3;md5=*
>> *58dcd8452651fc8b07d1f65ce07ca8**af \
>> -                    file://Documentation/licenses/**COPYING.UCB;md5=**
>> 263860f8968d8bafa5392cab742852**62 \
>> -                    file://getopt/COPYING;md5=**
>> c3a41733416fb80af7ba1b7e1f7125**51"
>> +                    file://Documentation/licenses/**COPYING.UCB;md5=**
>> 263860f8968d8bafa5392cab742852**62"
>>
>>   inherit autotools gettext pkgconfig
>>   DEPENDS = "zlib ncurses"
>>   DEPENDS_append_class-native = " lzo-native"
>> +DEPENDS_append_class-target = " libpam"
>>
>>
> Forgot to ask in my other email, why the dependency on libpam here? Should
> this not be under a check for pam in DISTRO_FEATURES?


it did not build without pam. Try it out may be I was wrong.

--14dae9340b5187f4a704cfec6e4f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Sun, Dec 2=
, 2012 at 8:37 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@li=
nux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">

<div><div class=3D"h5"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
2.21 has some linking issues with gold on uclibc where mount<br>
program does not work. Its some sort of underlinking.<br>
<br>
2.22 did not solve that problem completely either<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-core/util-linux/<u></u>util-linux.inc =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 18 +++++++++++-------<br>
=C2=A0 .../util-linux/add-aarch64-<u></u>support.patch =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 ++--<br>
=C2=A0 .../util-linux/uclibc-__<u></u>progname-conflict.patch =C2=A0 =C2=A0=
| =C2=A0 14 +++++++-------<br>
=C2=A0 .../util-linux-ng-replace-<u></u>siginterrupt.patch =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 14 +++++++-------<br>
=C2=A0 .../{<a href=3D"http://util-linux_2.21.2.bb" target=3D"_blank">util-=
linux_2.21.2.bb</a> =3D&gt; <a href=3D"http://util-linux_2.22.bb" target=3D=
"_blank">util-linux_2.22.bb</a>} =C2=A0 | =C2=A0 =C2=A08 +++-----<br>
=C2=A0 5 files changed, 30 insertions(+), 28 deletions(-)<br>
=C2=A0 rename meta/recipes-core/util-linux/{<a href=3D"http://util-linux_2.=
21.2.bb" target=3D"_blank"><u></u>util-linux_2.21.2.bb</a> =3D&gt; <a href=
=3D"http://util-linux_2.22.bb" target=3D"_blank">util-linux_2.22.bb</a>} (8=
8%)<br>
<br>
diff --git a/meta/recipes-core/util-<u></u>linux/util-linux.inc b/meta/reci=
pes-core/util-<u></u>linux/util-linux.inc<br>
index f2f9a04..00b332a 100644<br>
--- a/meta/recipes-core/util-<u></u>linux/util-linux.inc<br>
+++ b/meta/recipes-core/util-<u></u>linux/util-linux.inc<br>
@@ -8,16 +8,16 @@ SECTION =3D &quot;base&quot;<br>
=C2=A0 LICENSE =3D &quot;GPLv2+ &amp; LGPLv2.1+ &amp; BSD&quot;<br>
<br>
=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://README.licensing;md5=3D<u></u>9c92=
0d811858a74b67a36ba23cbaa9<u></u>5f \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://COPYING;md5=3D<u></u>59530bdf33659b29e73d4adb9f9f65<u></u>52 \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://Documentation/licenses/<u></u>COPYING.GPLv2;md5=3D<u></u>8ca43cbc842c233=
6e835926c2166c2<u></u>8b \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://Documentation/licenses/<u></u>COPYING.LGPLv2.1;md5=3D<u></u>bbb461211a33=
b134d42ed5ee802b37<u></u>ff \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://COPYING;md5=3D<u></u>b234ee4d69f5fce4486a80fdaf4a42<u></u>63 \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://Documentation/licenses/<u></u>COPYING.GPLv2;md5=3D<u></u>b234ee4d69f5fce=
4486a80fdaf4a42<u></u>63 \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://Documentation/licenses/<u></u>COPYING.LGPLv2.1;md5=3D<u></u>4fbd65380cdd=
255951079008b36451<u></u>6c \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://Documentation/licenses/<u></u>COPYING.BSD-3;md5=3D<u></u>58dcd84=
52651fc8b07d1f65ce07ca8<u></u>af \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://Documentation/licenses/<u></u>COPYING.UCB;md5=3D<u></u>263860f8968d8bafa=
5392cab742852<u></u>62 \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://getopt/COPYING;md5=3D<u></u>c3a41733416fb80af7ba1b7e1f7125<u></u>51&quot=
;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://Documentation/licenses/<u></u>COPYING.UCB;md5=3D<u></u>263860f8968d8bafa=
5392cab742852<u></u>62&quot;<br>
<br>
=C2=A0 inherit autotools gettext pkgconfig<br>
=C2=A0 DEPENDS =3D &quot;zlib ncurses&quot;<br>
=C2=A0 DEPENDS_append_class-native =3D &quot; lzo-native&quot;<br>
+DEPENDS_append_class-target =3D &quot; libpam&quot;<br>
<br>
</blockquote>
<br></div></div>
Forgot to ask in my other email, why the dependency on libpam here? Should =
this not be under a check for pam in DISTRO_FEATURES?</blockquote></div><br=
>it did not build without pam. Try it out may be I was wrong.<br></div>


--14dae9340b5187f4a704cfec6e4f--
