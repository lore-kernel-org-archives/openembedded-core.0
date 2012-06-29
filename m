Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkjI7-0001MY-Ax
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 00:03:51 +0200
Received: by eaal1 with SMTP id l1so1547612eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 14:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=xe97pTlIcEynJYHwtPFaqorJX1z5w3u4oK8gA8g7V3Y=;
	b=R/Uaexyl/DSRj3bsuF98Svg7R9Hq2ydRoS2ZXod6/j57sdM8g9ZNaOF4+Iq7W3heRQ
	K6bt4t+6tCYm4gbffA0q7qYUA+fMDovZvRtdzsC7rbuVWRR/gOTtAThd3x4JfK9Oer7Q
	0D8UekZIkWhmaL/5QgJWhs/BXo/5KUdYL6HCpcz2L74O/z63liw1rgmUpKe0TFEf0elH
	z1pBRmhUlZWCNy8ivJqgQobrZZrB3aFWbW74DKpeISHUAL6VCGxx0ASkgLEadGxUQTuS
	pHxnRYcOg/oezVdCGGeyGhqBkBfHnVc0FjiE+pOhAGW0Nc+qij6/9ynXmXaRoXh0zHCb
	BvGQ==
MIME-Version: 1.0
Received: by 10.14.37.206 with SMTP id y54mr1039787eea.218.1341006774767; Fri,
	29 Jun 2012 14:52:54 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Fri, 29 Jun 2012 14:52:54 -0700 (PDT)
In-Reply-To: <d273d0ea0fd0059499c54b68ba420043a31f2bb7.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
	<d273d0ea0fd0059499c54b68ba420043a31f2bb7.1341004548.git.sgw@linux.intel.com>
Date: Fri, 29 Jun 2012 14:52:54 -0700
Message-ID: <CAMKF1so_1JQY-4eRWZ8Xkq4ixQ7cCmCSVAEohtjRJEFd9KoZiA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] bitbake.conf: Add PACKAGE_BEFORE_PN to PACKAGES
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
X-List-Received-Date: Fri, 29 Jun 2012 22:03:51 -0000
Content-Type: multipart/alternative; boundary=bcaec517a71c73920704c3a37885

--bcaec517a71c73920704c3a37885
Content-Type: text/plain; charset=UTF-8

On Friday, June 29, 2012, Saul Wold <sgw@linux.intel.com> wrote:
> By doing this we can easily add addtional packages that can be
> greedy before PN, but after some of the other standard packages.
>
> This will also allow us to simplify the lib_package class to set
> this variable.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/bitbake.conf |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9377ee6..df4907e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -254,7 +254,8 @@ SOLIBSDEV_darwin = ".dylib"
>  SOLIBSDEV_darwin8 = ".dylib"
>  SOLIBSDEV_darwin9 = ".dylib"
>
> -PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale
${PN}"
> +PACKAGE_BEFORE_PN ?= ""
> +PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale
${PACKAGE_BEFORE_PN} ${PN}"
>  PACKAGES_DYNAMIC = "${PN}-locale-*"
>  FILES = ""
>


Can it appear at the beginning before pn-dbg?
Then you could just prepend I don't think any of those predefined packages
will have anything of interest that's in pn-bin
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec517a71c73920704c3a37885
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, June 29, 2012, Saul Wold &lt;<a href=3D"mailto:sgw@linux=
.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>&gt; By doing this we can=
 easily add addtional packages that can be<br>&gt; greedy before PN, but af=
ter some of the other standard packages.<br>
&gt;<br>&gt; This will also allow us to simplify the lib_package class to s=
et<br>&gt; this variable.<br>&gt;<br>&gt; Signed-off-by: Saul Wold &lt;<a h=
ref=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a>&gt;<br>&gt; ---<=
br>
&gt; =C2=A0meta/conf/bitbake.conf | =C2=A0 =C2=A03 ++-<br>&gt; =C2=A01 file=
 changed, 2 insertions(+), 1 deletion(-)<br>&gt;<br>&gt; diff --git a/meta/=
conf/bitbake.conf b/meta/conf/bitbake.conf<br>&gt; index 9377ee6..df4907e 1=
00644<br>&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>&gt; @@ -254,7 +254,8 @@ SOLIBSDEV_dar=
win =3D &quot;.dylib&quot;<br>&gt; =C2=A0SOLIBSDEV_darwin8 =3D &quot;.dylib=
&quot;<br>&gt; =C2=A0SOLIBSDEV_darwin9 =3D &quot;.dylib&quot;<br>&gt;<br>&g=
t; -PACKAGES =3D &quot;${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-=
locale ${PN}&quot;<br>
&gt; +PACKAGE_BEFORE_PN ?=3D &quot;&quot;<br>&gt; +PACKAGES =3D &quot;${PN}=
-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} =
${PN}&quot;<br>&gt; =C2=A0PACKAGES_DYNAMIC =3D &quot;${PN}-locale-*&quot;<b=
r>&gt; =C2=A0FILES =3D &quot;&quot;<br>
&gt;<br><br><br>Can it appear at the beginning before pn-dbg?<br>Then you c=
ould just prepend I don&#39;t think any of those predefined packages will h=
ave anything of interest that&#39;s in pn-bin<br>&gt; --<br>&gt; 1.7.10.4<b=
r>
&gt;<br>&gt;<br>&gt; _______________________________________________<br>&gt=
; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-cor=
e@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--bcaec517a71c73920704c3a37885--
