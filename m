Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1UPaBI-0006nk-VF
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 17:09:57 +0200
Received: by mail-ob0-f174.google.com with SMTP id wm15so4416810obc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:x-gm-message-state;
	bh=nMMz0p6X0nSu2EN9aiE7NZ8aHxy+ecN42fJesy0NGgc=;
	b=hm4/14xZYUDHjH/4vY7LNT11y5IuQKsUnjhHFCTu7tXbD7dsCDOYHre9A2MjDUr26F
	59WVfrH3tnOHzIUFkJNLYHoRoGFuHOt2eS9StpVS4zbPje8LlEYY4k+05k7N11P5hjjL
	x16gx3/26rLtiYK+9PEGTYP44Hqfl2nP7NfiD0SwcPjdViGLSIM8ccxZJeY0hqPGzbcj
	35cRYVnQXlQOd4x/FaMGZohVOfoeCwUMAldZ1nO0oW4m7vQlgjm2G4v1vZhPIZh4ewuO
	zWV9UrmwrXGzI50N2+pTIRhDTu762aF5S0cTad/JhnvZMdKLmpqppt+EASzBosqaihEF
	hYJQ==
MIME-Version: 1.0
X-Received: by 10.60.29.37 with SMTP id g5mr18458291oeh.140.1365519156125;
	Tue, 09 Apr 2013 07:52:36 -0700 (PDT)
Received: by 10.76.94.176 with HTTP; Tue, 9 Apr 2013 07:52:35 -0700 (PDT)
In-Reply-To: <51630510.7080105@linux.intel.com>
References: <1365425799-25357-1-git-send-email-alexandru.damian@intel.com>
	<51630510.7080105@linux.intel.com>
Date: Tue, 9 Apr 2013 17:52:35 +0300
Message-ID: <CAJ2CSBtXbDgz76Ryt8tqR+dbeLvLXsWL_F1W8WWVnJyDE=g8WA@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQnVxEqu+cJIRBouY/kxRpOz9K1eeUBgwg5+iWCoFQDI9/pj1/9xaPzxkHZiB+BQ4EIDu6bR
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez4: add readline dependency
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
X-List-Received-Date: Tue, 09 Apr 2013 15:09:57 -0000
Content-Type: multipart/alternative; boundary=e89a8fb1f8183c301f04d9eeb49e

--e89a8fb1f8183c301f04d9eeb49e
Content-Type: text/plain; charset=UTF-8

I guess it's up to the patch maintainer to decide :).

Alex

On Mon, Apr 8, 2013 at 8:57 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 04/08/2013 05:56 AM, Alex DAMIAN wrote:
>
>> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>>
>> bluez4 uses readline to be build, but the dependency is not listed
>> This is listed in the configuration log.
>> So we add it.
>>
>>  As far as I can tell it's needed only for gatttool, is this a tool that
> we need / want to provide for bluez?
>
> This seems to be a tools for viewing the Generic Attribute Profile (GATT).
>
> It can be disabled by setting "ac_cv_lib_readline_main=no"
>
>
> Sau!
>
>
>
>  Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
>> ---
>>   meta/recipes-connectivity/**bluez/bluez4.inc |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/**bluez/bluez4.inc
>> b/meta/recipes-connectivity/**bluez/bluez4.inc
>> index bff24d3..42d82b0 100644
>> --- a/meta/recipes-connectivity/**bluez/bluez4.inc
>> +++ b/meta/recipes-connectivity/**bluez/bluez4.inc
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=**
>> 12f884d2ae1ff87c09e5b7ccc2c4ca**7e \
>>                       file://COPYING.LIB;md5=**
>> fb504b67c50331fc78734fed90fb0e**09 \
>>                       file://src/main.c;beginline=1;**endline=24;md5=**
>> 9bc54b93cd7e17bf03f52513f39f92**6e \
>>                       file://sbc/sbc.c;beginline=1;**endline=25;md5=**
>> 1a40781ed30d50d8639323a184aeb1**91"
>> -DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck"
>> +DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
>>   RDEPENDS_${PN}-dev = "bluez-hcidump"
>>
>>   PACKAGECONFIG ??= "\
>>
>>

--e89a8fb1f8183c301f04d9eeb49e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I guess it&#39;s up to the patch maintainer to decide :).<=
div><br></div><div>Alex<div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On Mon, Apr 8, 2013 at 8:57 PM, Saul Wold <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>=
&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 04/08/2013 05:56 AM, Al=
ex DAMIAN wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@intel.com" ta=
rget=3D"_blank">alexandru.damian@intel.com</a>&gt;<br>
<br>
bluez4 uses readline to be build, but the dependency is not listed<br>
This is listed in the configuration log.<br>
So we add it.<br>
<br>
</blockquote></div>
As far as I can tell it&#39;s needed only for gatttool, is this a tool that=
 we need / want to provide for bluez?<br>
<br>
This seems to be a tools for viewing the Generic Attribute Profile (GATT).<=
br>
<br>
It can be disabled by setting &quot;ac_cv_lib_readline_main=3Dno&quot;<br>
<br>
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@inte=
l.com" target=3D"_blank">alexandru.damian@intel.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-connectivity/<u></u>bluez/bluez4.inc | =C2=A0 =C2=A02 +=
-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/<u></u>bluez/bluez4.inc b/meta/recip=
es-connectivity/<u></u>bluez/bluez4.inc<br>
index bff24d3..42d82b0 100644<br>
--- a/meta/recipes-connectivity/<u></u>bluez/bluez4.inc<br>
+++ b/meta/recipes-connectivity/<u></u>bluez/bluez4.inc<br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>12f8=
84d2ae1ff87c09e5b7ccc2c4ca<u></u>7e \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://COPYING.LIB;md5=3D<u></u>fb504b67c50331fc78734fed90fb0e<u></u>09=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://src/main.c;beginline=3D1;<u></u>endline=3D24;md5=3D<u></u>9bc54b=
93cd7e17bf03f52513f39f92<u></u>6e \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://sbc/sbc.c;beginline=3D1;<u></u>endline=3D25;md5=3D<u></u>1a40781=
ed30d50d8639323a184aeb1<u></u>91&quot;<br>
-DEPENDS =3D &quot;udev libusb dbus-glib glib-2.0 libcheck&quot;<br>
+DEPENDS =3D &quot;udev libusb dbus-glib glib-2.0 libcheck readline&quot;<b=
r>
=C2=A0 RDEPENDS_${PN}-dev =3D &quot;bluez-hcidump&quot;<br>
<br>
=C2=A0 PACKAGECONFIG ??=3D &quot;\<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div></div>

--e89a8fb1f8183c301f04d9eeb49e--
