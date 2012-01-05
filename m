Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RivaY-0004KU-4M
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 23:15:11 +0100
Received: by werm13 with SMTP id m13so800289wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 14:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=HDBHANguXgR2O6AYcKH9zXd/pXhoER8HGS3dkJsl0ms=;
	b=uCOuWCzyzvjFfUUIiK+WBU6HzEfmamfpqIb1x08x3pshi0UNqg1eGERsptCjb7dk0o
	QvkS3kVLF+y3PxuH1egbaMqNwKGeThysx6yLWAH7DY70KvWdbfo4Z8lAKl+fIcROvgPv
	LIbTcekBNINIClZ8DKhTxB0ZdWDFKqnOnJdQM=
MIME-Version: 1.0
Received: by 10.216.131.13 with SMTP id l13mr1823862wei.45.1325801266858; Thu,
	05 Jan 2012 14:07:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.216.73.67 with HTTP; Thu, 5 Jan 2012 14:07:46 -0800 (PST)
In-Reply-To: <4F061E22.6030506@linux.intel.com>
References: <cover.1325792209.git.otavio@ossystems.com.br>
	<268ead6ebfc8fbfdb9f6bf55352103b984bdf341.1325792209.git.otavio@ossystems.com.br>
	<4F061E22.6030506@linux.intel.com>
Date: Thu, 5 Jan 2012 20:07:46 -0200
X-Google-Sender-Auth: O4X5k4EZLWzyoMe-2V2fdPk6BsE
Message-ID: <CAP9ODKq8gn5-FvHstr8VBauOP5BCvELvZW-RDBswsTD-QmCuQw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/10] qt4-graphics-system: add
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
X-List-Received-Date: Thu, 05 Jan 2012 22:15:11 -0000
Content-Type: multipart/alternative; boundary=0016e6da98d38dcbca04b5cf298f

--0016e6da98d38dcbca04b5cf298f
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 5, 2012 at 20:03, Saul Wold <sgw@linux.intel.com> wrote:

> On 01/05/2012 11:37 AM, Otavio Salvador wrote:
>
>> Allow setting default runtime graphics system engine for Qt4
>> applications per machine.
>>
>> Depending on the GPU and Xorg driver, this can boost and impact
>> significantly the drawing performance. The default setting is to
>> 'raster' as this offer best performance for most machines GPUs.
>>
>> Signed-off-by: Otavio Salvador<otavio@ossystems.com.**br<otavio@ossystems.com.br>
>> >
>> ---
>>  .../qt4-graphics-system/qt4-**graphics-system_1.0.bb<http://qt4-graphics-system_1.0.bb>|   27 ++++++++++++++++++++
>>  1 files changed, 27 insertions(+), 0 deletions(-)
>>  create mode 100644 meta/recipes-qt/qt4-graphics-**system/
>> qt4-graphics-system_1.**0.bb <http://qt4-graphics-system_1.0.bb>
>>
>> diff --git a/meta/recipes-qt/qt4-**graphics-system/qt4-graphics-**
>> system_1.0.bb <http://qt4-graphics-system_1.0.bb> b/meta/recipes-qt/qt4-*
>> *graphics-system/qt4-graphics-**system_1.0.bb<http://qt4-graphics-system_1.0.bb>
>> new file mode 100644
>> index 0000000..b3aa1e5
>> --- /dev/null
>> +++ b/meta/recipes-qt/qt4-**graphics-system/qt4-graphics-**system_1.0.bb<http://qt4-graphics-system_1.0.bb>
>> @@ -0,0 +1,27 @@
>> +DESCRIPTION = "Set default Qt4 Graphics System to ${QT_GRAPHICS_SYSTEM}"
>> +SECTION = "x11/base"
>> +LICENSE = "MIT-X"
>> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/**COPYING.MIT;md5=**
>> 3da9cfbcb788c80a0384361b4de204**20"
>> +
>> +QT_GRAPHICS_SYSTEM ?= "raster"
>> +
>> +# xserver-common, x11-common
>> +VIRTUAL-RUNTIME_xserver_**common ?= "x11-common"
>> +
>>
> Should the be initialized here or in one of the Qt tasks?


Here or I'd be busted as I don't use the tasks ;-)


>  +def _get_extra_rdepends(d):
>> +    gs = d.getVar('QT_GRAPHICS_SYSTEM', 1)
>> +    if gs == "opengl":
>> +        return "qt4-plugin-graphicssystems-**glgraphicssystem"
>> +
>>
> Is this package available in OE-Core?


Yes.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0016e6da98d38dcbca04b5cf298f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Jan 5, 2012 at 20:03, Saul Wold <span di=
r=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On 01/05/2012 11:37 AM, Otavio Salv=
ador wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Allow setting default runtime graphics system engine for Qt4<br>
applications per machine.<br>
<br>
Depending on the GPU and Xorg driver, this can boost and impact<br>
significantly the drawing performance. The default setting is to<br>
&#39;raster&#39; as this offer best performance for most machines GPUs.<br>
<br>
Signed-off-by: Otavio Salvador&lt;<a href=3D"mailto:otavio@ossystems.com.br=
" target=3D"_blank">otavio@ossystems.com.<u></u>br</a>&gt;<br>
---<br>
 =A0.../qt4-graphics-system/<a href=3D"http://qt4-graphics-system_1.0.bb" t=
arget=3D"_blank">qt4-<u></u>graphics-system_1.0.bb</a> | =A0 27 +++++++++++=
+++++++++<br>
 =A01 files changed, 27 insertions(+), 0 deletions(-)<br>
 =A0create mode 100644 meta/recipes-qt/qt4-graphics-<u></u>system/<a href=
=3D"http://qt4-graphics-system_1.0.bb" target=3D"_blank">qt4-graphics-syste=
m_1.<u></u>0.bb</a><br>
<br>
diff --git a/meta/recipes-qt/qt4-<u></u>graphics-system/<a href=3D"http://q=
t4-graphics-system_1.0.bb" target=3D"_blank">qt4-graphics-<u></u>system_1.0=
.bb</a> b/meta/recipes-qt/qt4-<u></u>graphics-system/<a href=3D"http://qt4-=
graphics-system_1.0.bb" target=3D"_blank">qt4-graphics-<u></u>system_1.0.bb=
</a><br>

new file mode 100644<br>
index 0000000..b3aa1e5<br>
--- /dev/null<br>
+++ b/meta/recipes-qt/qt4-<u></u>graphics-system/<a href=3D"http://qt4-grap=
hics-system_1.0.bb" target=3D"_blank">qt4-graphics-<u></u>system_1.0.bb</a>=
<br>
@@ -0,0 +1,27 @@<br>
+DESCRIPTION =3D &quot;Set default Qt4 Graphics System to ${QT_GRAPHICS_SYS=
TEM}&quot;<br>
+SECTION =3D &quot;x11/base&quot;<br>
+LICENSE =3D &quot;MIT-X&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/<u></u>COPYING.MIT;md5=
=3D<u></u>3da9cfbcb788c80a0384361b4de204<u></u>20&quot;<br>
+<br>
+QT_GRAPHICS_SYSTEM ?=3D &quot;raster&quot;<br>
+<br>
+# xserver-common, x11-common<br>
+VIRTUAL-RUNTIME_xserver_<u></u>common ?=3D &quot;x11-common&quot;<br>
+<br>
</blockquote></div></div>
Should the be initialized here or in one of the Qt tasks?</blockquote><div>=
<br></div><div>Here or I&#39;d be busted as I don&#39;t use the tasks ;-)</=
div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+def _get_extra_rdepends(d):<br>
+ =A0 =A0gs =3D d.getVar(&#39;QT_GRAPHICS_SYSTEM&#39;, 1)<br>
+ =A0 =A0if gs =3D=3D &quot;opengl&quot;:<br>
+ =A0 =A0 =A0 =A0return &quot;qt4-plugin-graphicssystems-<u></u>glgraphicss=
ystem&quot;<br>
+<br>
</blockquote></div>
Is this package available in OE-Core?</blockquote><div><br></div><div>Yes.<=
/div><div><br></div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:o=
tavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a=
 href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystem=
s.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0016e6da98d38dcbca04b5cf298f--
