Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 531D66CAC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 09:58:42 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id n16so7778748oag.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 01:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=zsfVgAvpedHY99mCKQjjv40a/VA2hGDt+I+UWwPfA+I=;
	b=SmJ3boQ5V2RQAkKgKOmOe+EwfAP83waipTe5O0awtx8lEfWdqN4KevcXX+/HzHSnss
	lg69FZ6Q7qRj8N8/feYijM+HGzb5eMHYEPLZKDrqCtkiYHg6szRfsjldYoyWGUAfEOan
	QCfU7W/p9ZWRosTupOxHEUeaIz6m8vaNsYORa7boU3OhhLeaXLRiVhnG8KLgPnFijHhr
	CDU5nUpe95Xt/lyo579IZEsAILAKXuUqLF7bbupDZJnjpLC9sq+8+mKd9jSgc1UeYSDh
	JrT+m44lVELHnaeO8OKusgwWoP2Kwh19dbXoWUo02eXYoUtQJ/5f2g47P0z7+sGvrpjI
	bIgA==
X-Gm-Message-State: ALoCoQn5uvfEbQKj9av6L+MJbuUa5aOqJLnZPzMWjx75o0e5W3Q3/+mMMK+Uy9QnuXf6ggy4oPne
X-Received: by 10.60.137.201 with SMTP id qk9mr6895305oeb.41.1389607123084;
	Mon, 13 Jan 2014 01:58:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.84.233 with HTTP; Mon, 13 Jan 2014 01:58:23 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 13 Jan 2014 10:58:23 +0100
Message-ID: <CAP71WjwVdruoAvkjtO7mPTVE0bNQfCWYUrEC2TZdjagXCBRkrQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: libsdl and opengl DISTRO_FEATURE
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
X-List-Received-Date: Mon, 13 Jan 2014 09:58:42 -0000
Content-Type: multipart/alternative; boundary=047d7b33cdfcf2fe5e04efd71e05

--047d7b33cdfcf2fe5e04efd71e05
Content-Type: text/plain; charset=ISO-8859-1

hi there,

it has been brought to the list already, at least in [1], but libsdl recipe
implicitely assumes that 'opengl' distro feature means GL/GLX support.

the recipe does this:

${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl',
'--disable-video-opengl', d)} \


and the configure checks for GL/gl.h, GL/glx.h and GL/glu.h.

this is quite an issue on ARM platforms with no such support. Based on
previous discussions i understand that nobody should assume that 'opengl'
in distro feature means GL or GLES, so I am tempted to conclude that this
is a bug in the SDL recipe. is that correct?

if we make it a PACKAGECONFIG instead, would that be considered the right
fix for this bug?

thanks



[1] http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/42830

--047d7b33cdfcf2fe5e04efd71e05
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi there,<div><br></div><div>it has been brought to the li=
st already, at least in [1], but libsdl recipe implicitely assumes that &#3=
9;opengl&#39; distro feature means GL/GLX support.=A0</div><div><br></div><=
div>

the recipe does this:</div><div><br></div><div>${@base_contains(&#39;DISTRO=
_FEATURES&#39;, &#39;opengl&#39;, &#39;--enable-video-opengl&#39;, &#39;--d=
isable-video-opengl&#39;, d)} \ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0<br>

</div><div><br></div><div>and the configure checks for GL/gl.h, GL/glx.h an=
d GL/glu.h.</div><div><br></div><div>this is quite an issue on ARM platform=
s with no such support. Based on previous discussions i understand that nob=
ody should assume that &#39;opengl&#39; in distro feature means GL or GLES,=
 so I am tempted to conclude that this is a bug in the SDL recipe. is that =
correct?</div>

<div><br></div><div>if we make it a PACKAGECONFIG instead, would that be co=
nsidered the right fix for this bug?</div><div><br></div><div>thanks</div><=
div><br></div><div><br></div><div><br></div><div>[1]=A0<a href=3D"http://co=
mments.gmane.org/gmane.comp.handhelds.openembedded.core/42830">http://comme=
nts.gmane.org/gmane.comp.handhelds.openembedded.core/42830</a></div>

</div>

--047d7b33cdfcf2fe5e04efd71e05--
