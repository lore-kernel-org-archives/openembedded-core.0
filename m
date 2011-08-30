Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QyFI9-0001do-4d
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 05:47:13 +0200
Received: by bkbzu17 with SMTP id zu17so4650020bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 20:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=PpTQFKSg8CSug3XIjxyq7JPP943Ml6lriI5DrQkR960=;
	b=JYTW+KKumTKZ9iiiVC2+iOMI+xvQSGR+eZX9D7BBi/01mW7wvNrMg/5HFnRFSV4hsv
	zGS48WPGVfJyzSCqcM/dI/rcR8dPu26A9cJhgwH5twY9dZcAykJPKIv3wWdugyqd80i4
	efIA/ZlmpKB5iEj5YQRB9YpQH2jrsO0G6lA64=
MIME-Version: 1.0
Received: by 10.204.154.194 with SMTP id p2mr2617508bkw.56.1314675740338; Mon,
	29 Aug 2011 20:42:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.156.217 with HTTP; Mon, 29 Aug 2011 20:42:20 -0700 (PDT)
Date: Tue, 30 Aug 2011 00:42:20 -0300
X-Google-Sender-Auth: aidIpBsiQs0nXALKDrxu1ULdxhE
Message-ID: <CAP9ODKoi8==q2w__QkHm_PhkC-iWYnS5MCA5F+W_SdsTTXuBjQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Fail to build of clutter
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
X-List-Received-Date: Tue, 30 Aug 2011 03:47:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

With today's tip of OpenEmbedded-Core, Clutter fails to build as can
be seen bellow:


| checking for CLUTTER_DEPS... no
| configure: error: Package requirements (cairo-gobject >=3D 1.10 atk >=3D
1.17 pangocairo >=3D 1.20 json-glib-1.0 >=3D 0.12.0 gdk-pixbuf-2.0 >=3D 2.0
gl libdrm x11 xext xfixes >=3D 3 xdamage xcomposite >=3D 0.4 xi) were not
met:
|
| Requested 'json-glib-1.0 >=3D 0.12.0' but version of JSON-GLib is 0.10.4
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables CLUTTER_DEPS_CFLAGS
| and CLUTTER_DEPS_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| + bbfatal 'oe_runconf failed'
| + echo 'ERROR: oe_runconf failed'
| ERROR: oe_runconf failed
| + exit 1
| ERROR: Function 'do_configure' failed (see
/home/otavio/hacking/ossystems/embedded-linux/tmp-eglibc-eglibc/work/i586-o=
e-linux/clutter-1.6-1.6.14-r2/temp/log.do_configure.7656
for further information)

Can someone reproduce it?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


