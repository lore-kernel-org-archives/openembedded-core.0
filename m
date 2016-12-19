Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id B912277326
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 16:41:52 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 2so2643634uax.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 08:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8YjvExnMo16aAGk9i/6VWLMkZzNI0QAkWGhFG/N6944=;
	b=BZXyLhL0KoXyVBJr2C0Uvj973e5jFNZUGxtCiNwHVfyhPPLd66F9cJl26i3E0TEXK9
	DERBNBNXT3cIpqvOm1nIZQtxz+c7/Jn88r78RxrBKSl1HutWtGBoFVu9jTlDx1nLxp4Y
	HWHkIbI6u4F0cc+SqhpAbWBsH0G7Py4EjGG5tbIb0EgHIbm3XjDt5CIVC88mTe/KoQUK
	RxD6OWppVkukGxNeHcCRxl+v65jVNw8aJfEiuFSe5IaPIO29NckkH1egqtZpGCOsbjRS
	EoUAG5YUwWC9T97ro1g3KgsYpwaDIbqfuu4MY6670pYJDLLvODEW4FCXFMlqxudF4xJt
	WbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8YjvExnMo16aAGk9i/6VWLMkZzNI0QAkWGhFG/N6944=;
	b=g1tML5d3vn90/Xam+cB9b5yjQRlqMW64epdDBKoXHIAKnwSBGebyFpsYYXysDCY8pZ
	Ju3Rr20rUHHEPNfvLS4v4b9/1lHX7NgzHovJK0excUem7w+NdWhf0JQR2vOlKsSdIXPo
	6SSSEa7Q7OzQgZv8b1bGND3ZJJCGvpCiWXQk0ltjmNkg22LbQGvoSDdW/NpzpSwyF+py
	TCVPR+Sckvx66xojfSOB+f1IvaD1F9nYXi4sPVdo9wlh8F5HxNXTYD44hgGpNy5eFfT9
	nZpiVpqZV4X7ELoyCNroOfTKxWT9kCfkpQAcPN/yzMJwVrpPILtJhUcegX/0tXq7194O
	HM7A==
X-Gm-Message-State: AKaTC00Q9tmUcJi6xr9VHDm0KA2+SkLrsZel2TjSmBrya7qGbwuck/83ryzJTDk2NOXXKzWbIHaIVP/cPiVppA==
X-Received: by 10.159.55.142 with SMTP id q14mr13869422uaq.107.1482165713417; 
	Mon, 19 Dec 2016 08:41:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 19 Dec 2016 08:41:23 -0800 (PST)
In-Reply-To: <CAHiDW_FRxBzxYbfq9ci9YDu3R-WZW5Qz_5qXXhtXp8F5XUDQOA@mail.gmail.com>
References: <20161219063957.18716-1-raj.khem@gmail.com>
	<20161219063957.18716-10-raj.khem@gmail.com>
	<CAHiDW_FRxBzxYbfq9ci9YDu3R-WZW5Qz_5qXXhtXp8F5XUDQOA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2016 08:41:23 -0800
Message-ID: <CAMKF1soX8thEYOkwY=d8O99+k+d4jbOtTyB6+xYdGpZG3Yyu8g@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V2 10/10] gdk-pixbuf: Update to 2.36.1
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
X-List-Received-Date: Mon, 19 Dec 2016 16:41:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 1:13 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 19 December 2016 at 08:39, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../gdk-pixbuf/{gdk-pixbuf_2.36.0.bb => gdk-pixbuf_2.36.1.bb}      | 7
>> +++----
>
>
> I'm pretty sure this breaks debian renaming because of the added thumbnailer
> binary.
>
> I've got this upgrade (with an added ${PN}-bin package) in a branch that I
> plan to send after a quick test so no need to fix.


Ok Sounds good.

>
> Jussi
>
>
>>
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>  rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.0.bb =>
>> gdk-pixbuf_2.36.1.bb} (95%)
>>
>> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
>> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
>> similarity index 95%
>> rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
>> rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
>> index 9efe374c0d..debc2d706a 100644
>> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
>> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
>> @@ -18,9 +18,8 @@ SRC_URI =
>> "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
>>             file://run-ptest \
>>             file://fatal-loader.patch \
>>             "
>> -
>> -SRC_URI[md5sum] = "1a3baf91956c7923dab49ee3de100ce1"
>> -SRC_URI[sha256sum] =
>> "85ab52ce9f2c26327141b3dcf21cca3da6a3f8de84b95fa1e727d8871a23245c"
>> +SRC_URI[md5sum] = "fe30b0420e013f2c4590ae6226d895d4"
>> +SRC_URI[sha256sum] =
>> "9d5ba72070460c1b5b74115d395a3e33daeb7b7b67fb256cdccc9d7187c42a38"
>>
>>  inherit autotools pkgconfig gettext pixbufcache ptest-gnome
>> upstream-version-is-even gobject-introspection gtk-doc
>>
>> @@ -46,7 +45,7 @@ PACKAGES =+ "${PN}-xlib"
>>  FILES_${PN}-xlib = "${libdir}/*pixbuf_xlib*${SOLIBS}"
>>  ALLOW_EMPTY_${PN}-xlib = "1"
>>
>> -FILES_${PN} += "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
>> +FILES_${PN} += "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
>> ${datadir}/thumbnailers"
>>
>>  FILES_${PN}-dev += " \
>>         ${bindir}/gdk-pixbuf-csource \
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

