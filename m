Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QjVRN-00089I-DK
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 13:59:49 +0200
Received: by gyd12 with SMTP id 12so53743gyd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 04:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gsN3nzI60gFfOEOXZAP3cZXtYG/lOMVF5IHUrIJ70Eo=;
	b=MI3tAOoeIKc+zuxvaE86u9SfzDnxdm5nxshTf1t69GFlLGLNvM8ef2CaIV87yzMkO1
	KZq29AFpQUB124vZSF33XHMKwfsQ7xtHZYD9/LiI2gJFWZES/ggNZQjSmeyeIPiPG1Xv
	vhaFZ5sa60C14WBFEsLnsr/I5fTQYRUVzha9g=
MIME-Version: 1.0
Received: by 10.91.186.19 with SMTP id n19mr8157511agp.48.1311162942306; Wed,
	20 Jul 2011 04:55:42 -0700 (PDT)
Received: by 10.90.223.19 with HTTP; Wed, 20 Jul 2011 04:55:42 -0700 (PDT)
In-Reply-To: <1311154909.30326.51.camel@phil-desktop>
References: <1311154909.30326.51.camel@phil-desktop>
Date: Wed, 20 Jul 2011 13:55:42 +0200
Message-ID: <CACW_hTYXboQ+Zzkt3PXBuA_=uMDVovTgt7g7BNJSxbCdjuoS2A@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libiconv checksum wrong
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
X-List-Received-Date: Wed, 20 Jul 2011 11:59:49 -0000
Content-Type: multipart/alternative; boundary=0016e68db8826b3b6404a87ee936

--0016e68db8826b3b6404a87ee936
Content-Type: text/plain; charset=ISO-8859-1

2011/7/20 Phil Blundell <philb@gnu.org>

> Since updating this morning I'm getting
>
> | ERROR: Function 'File: '/home/pb/sources/libiconv-1.13.1.tar.gz' has
> md5 checksum 7ab33ebd26687c744a37264a330bbe9a when
> d42b97f6ef5dd0ba4469d520ed732fed was expected (from URL:
> 'ftp://ftp.gnu.org/gnu/libiconv/libiconv-1.13.1.tar.gz')' failed
> NOTE: package libiconv-1.13.1-r0: task do_fetch: Failed
>
> The offending commit appears to be
> bd1e627bef29830f9346b4b984905fd8fcf2e716.  As far as I can tell from a
> quick inspection of the files, the checksum that was added for
> libiconv-1.13.1.tar.gz in that commit is actually the md5sum of the
> earlier version 1.11.1.
>
> This seems to indicate that the added 1.13.1 recipe has not been build by
neither the submitter nor the committer (let alone tested by someone).
is that the kind of quality we want to achieve in oe-core ?

Frans.

--0016e68db8826b3b6404a87ee936
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/20 Phil Blundell <span dir=3D"ltr=
">&lt;<a href=3D"mailto:philb@gnu.org">philb@gnu.org</a>&gt;</span><br><blo=
ckquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-le=
ft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
Since updating this morning I&#39;m getting<br>
<br>
| ERROR: Function &#39;File: &#39;/home/pb/sources/libiconv-1.13.1.tar.gz&#=
39; has<br>
md5 checksum 7ab33ebd26687c744a37264a330bbe9a when<br>
d42b97f6ef5dd0ba4469d520ed732fed was expected (from URL:<br>
&#39;<a href=3D"ftp://ftp.gnu.org/gnu/libiconv/libiconv-1.13.1.tar.gz%27" t=
arget=3D"_blank">ftp://ftp.gnu.org/gnu/libiconv/libiconv-1.13.1.tar.gz&#39;=
</a>)&#39; failed<br>
NOTE: package libiconv-1.13.1-r0: task do_fetch: Failed<br>
<br>
The offending commit appears to be<br>
bd1e627bef29830f9346b4b984905fd8fcf2e716. =A0As far as I can tell from a<br=
>
quick inspection of the files, the checksum that was added for<br>
libiconv-1.13.1.tar.gz in that commit is actually the md5sum of the<br>
earlier version 1.11.1.<br>
<br></blockquote><div>This seems to indicate that the added 1.13.1 recipe h=
as not been build by neither the submitter nor the committer (let alone tes=
ted by someone).<br>is that the kind of quality we want to achieve in oe-co=
re ?<br>
<br>Frans. <br></div></div>

--0016e68db8826b3b6404a87ee936--
