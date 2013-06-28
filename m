Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7F0618B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 12:28:56 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y10so1433575wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MqBiY2M9jME9j2OhEMAZSDvwSCJ3jWocp3MHALVdR7U=;
	b=w3uSBbhxlLmTNY9FrGC2lZYkV3MIcAi5sFqJ+rM6FWyZfwugiJuYwkPcG3L6bcaib0
	lbv/3SoIdWzg/eMQoWvgYUMd//7HrcEoyx2Z6pQBPqUL38GHzZjVi2WEBNBi5cy2XE9H
	qT3rA24BX03x6VA7E5QhkcE8bGaW+99VVpTOZkjvlzXLSCJypB9DI9Cx46gl302WxVmv
	ko1iikdLTKR4Ace560nX7ux2SCh03UAWA2XWENi+sSzvW3hLxNzSEdG4iNVIjXocIxjX
	2wDyJ69JARlrdDCB+S469oZxO3sjL+DdUAfUTVvXRKZ3d2PLkriuadaYKzawHbomz/QC
	yfEQ==
MIME-Version: 1.0
X-Received: by 10.194.234.100 with SMTP id ud4mr901375wjc.44.1372422536654;
	Fri, 28 Jun 2013 05:28:56 -0700 (PDT)
Received: by 10.194.16.136 with HTTP; Fri, 28 Jun 2013 05:28:56 -0700 (PDT)
In-Reply-To: <51CD7C66.3020702@gmail.com>
References: <1371254791-8168-1-git-send-email-net147@gmail.com>
	<51CD7C66.3020702@gmail.com>
Date: Fri, 28 Jun 2013 14:28:56 +0200
Message-ID: <CA+chaQcjeX_y3c7=MOFkp5jndMdo4xKcAmgA7yWjB_bsaBMb3g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4e.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Fri, 28 Jun 2013 12:28:57 -0000
Content-Type: multipart/alternative; boundary=089e01493b68c7791a04e0360549

--089e01493b68c7791a04e0360549
Content-Type: text/plain; charset=UTF-8

It's failing in my world builds too now, you can see log here:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130627_214856.log/bitbake.log

Cheers,


On Fri, Jun 28, 2013 at 2:07 PM, Jonathan Liu <net147@gmail.com> wrote:

> On 15/06/2013 10:06 AM, Jonathan Liu wrote:
>
>> The class is inheriting qmake2.bbclass which exports OE_QMAKE_QT_CONFIG
>> pointing to the qt4 qconfig.pri when it should be pointing to the
>> qt4-embedded qconfig.pri.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta/classes/qt4e.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
>> index de2a68d..13b1050 100644
>> --- a/meta/classes/qt4e.bbclass
>> +++ b/meta/classes/qt4e.bbclass
>> @@ -9,6 +9,7 @@ QT_LIBINFIX = "E"
>>   # override variables set by qmake-base to compile Qt/Embedded apps
>>   #
>>   export QMAKESPEC = "${STAGING_DATADIR}/${QT_DIR_**
>> NAME}/mkspecs/${TARGET_OS}-oe-**g++"
>> +export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/${QT_DIR_**
>> NAME}/mkspecs/qconfig.pri"
>>   export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/${QT_DIR_**NAME}"
>>   export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
>>   export OE_QMAKE_LIBS_QT = "qt"
>>
> Hi Saul,
>
> Do you have a log of the error you had building qt4-embedded with this
> patch?
>
> Regards,
> Jonathan
>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/**mailman/listinfo/openembedded-**core<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>

--089e01493b68c7791a04e0360549
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s failing in my world builds too now, you can see l=
og here:<div><a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-cor=
e-branches/log.world.20130627_214856.log/bitbake.log">http://logs.nslu2-lin=
ux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130627_214856.log/bitb=
ake.log</a><br>
</div><div><br></div><div>Cheers,</div></div><div class=3D"gmail_extra"><br=
><br><div class=3D"gmail_quote">On Fri, Jun 28, 2013 at 2:07 PM, Jonathan L=
iu <span dir=3D"ltr">&lt;<a href=3D"mailto:net147@gmail.com" target=3D"_bla=
nk">net147@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 15/06/2013 10:06 AM, Jo=
nathan Liu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The class is inheriting qmake2.bbclass which exports OE_QMAKE_QT_CONFIG<br>
pointing to the qt4 qconfig.pri when it should be pointing to the<br>
qt4-embedded qconfig.pri.<br>
<br>
Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com" target=
=3D"_blank">net147@gmail.com</a>&gt;<br>
---<br>
=C2=A0 meta/classes/qt4e.bbclass | 1 +<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass<br>
index de2a68d..13b1050 100644<br>
--- a/meta/classes/qt4e.bbclass<br>
+++ b/meta/classes/qt4e.bbclass<br>
@@ -9,6 +9,7 @@ QT_LIBINFIX =3D &quot;E&quot;<br>
=C2=A0 # override variables set by qmake-base to compile Qt/Embedded apps<b=
r>
=C2=A0 #<br>
=C2=A0 export QMAKESPEC =3D &quot;${STAGING_DATADIR}/${QT_DIR_<u></u>NAME}/=
mkspecs/${TARGET_OS}-oe-<u></u>g++&quot;<br>
+export OE_QMAKE_QT_CONFIG =3D &quot;${STAGING_DATADIR}/${QT_DIR_<u></u>NAM=
E}/mkspecs/qconfig.pri&quot;<br>
=C2=A0 export OE_QMAKE_INCDIR_QT =3D &quot;${STAGING_INCDIR}/${QT_DIR_<u></=
u>NAME}&quot;<br>
=C2=A0 export OE_QMAKE_LIBDIR_QT =3D &quot;${STAGING_LIBDIR}&quot;<br>
=C2=A0 export OE_QMAKE_LIBS_QT =3D &quot;qt&quot;<br>
</blockquote></div>
Hi Saul,<br>
<br>
Do you have a log of the error you had building qt4-embedded with this patc=
h?<br>
<br>
Regards,<br>
Jonathan<div class=3D"HOEnZb"><div class=3D"h5"><br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/<u></u>mailman/listinfo/o=
penembedded-<u></u>core</a><br>
</div></div></blockquote></div><br></div>

--089e01493b68c7791a04e0360549--
