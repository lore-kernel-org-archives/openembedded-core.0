Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TaOoh-0005zH-L3
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 11:43:03 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so2974444pad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 02:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=aRpyzh/5p1axBEC0VXENypK9/KTO3nchdSu7v5f0LIo=;
	b=Rpzh/HRd24l+dwtVtXH1yXBszGioZg19pThJZ7xbIuQoF3Y8vElighG/OBrVHOqud5
	+1ksiH3D9PcafwKr/kLrc72DJNAxuHzej0GNEe/IDXRb/BVL2FHn+ndAGvdOfuh85zZq
	aPOyu13t6Vjw7YrvZ+TASI1jlXp3FbgU58odPQizUXKdDPtG9dwAyMepCa/vxXNwRyqa
	HwfcNkXqAv0ZUwFSAL6jhjP9LAcOLqmX+tR5S1XyaQckA3GRkZutuITw2Cs22UK9LWKp
	uoSAr49OI9pMw5lNdcJKEiriPP9uDKk1iwk0LzlkWVw1TihaWxJH7jg0HJa4xAt0AsQi
	BwrA==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr38423058pbc.24.1353320940908; Mon,
	19 Nov 2012 02:29:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 19 Nov 2012 02:29:00 -0800 (PST)
In-Reply-To: <cac75b0cd951792ef32d23bb8534b2b0e72644b4.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
	<cac75b0cd951792ef32d23bb8534b2b0e72644b4.1353304234.git.sgw@linux.intel.com>
Date: Mon, 19 Nov 2012 08:29:00 -0200
X-Google-Sender-Auth: YrbNbc2G6OXaWw-rtdtqbPC3-Pg
Message-ID: <CAP9ODKo9mUGd3tZbX5DWUTqcXM4R61mnk0jNC8qMxYLZ-M5Mfg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 17/17] libproxy: set LIBEXEC_INSTALL_DIR
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
X-List-Received-Date: Mon, 19 Nov 2012 10:43:03 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c99cf3308804ced69578

--e89a8ff1c99cf3308804ced69578
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 19, 2012 at 3:54 AM, Saul Wold <sgw@linux.intel.com> wrote:

> WARNING: QA Issue: libproxy: Files/directories were installed but not
> shipped
>   /usr/libexec
>   /usr/libexec/pxgsettings
>   /usr/libexec/.debug
>   /usr/libexec/.debug/pxgsettings
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>


The commit log is confusing. What those warnings means in this context?
Those has been add by your change or it fixes it?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c99cf3308804ced69578
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Mon, Nov 19, 2012 at 3:54 AM, Saul Wo=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_=
blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
WARNING: QA Issue: libproxy: Files/directories were installed but not shipp=
ed<br>
=A0 /usr/libexec<br>
=A0 /usr/libexec/pxgsettings<br>
=A0 /usr/libexec/.debug<br>
=A0 /usr/libexec/.debug/pxgsettings<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br></blockquote><div><br></div><div><br></div><div>The=
 commit log is confusing. What those warnings means in this context? Those =
has been add by your change or it fixes it?</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e89a8ff1c99cf3308804ced69578--
