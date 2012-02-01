Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rsem5-0008DL-Rb
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 19:19:18 +0100
Received: by lahc1 with SMTP id c1so806049lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 10:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=2l3J9ec0fT37amS3I1RxK01FgwgLo1UG4AIA2JQTjL0=;
	b=wK3XJZOxTMXjkkpiv8TN6qDanTFZPRMLGRYyyrm6XIwkS84rp6XMb5B6HxEXiyi1Kf
	ovqHvht8VdamddIMH79fgSNCM2+rsdS6fHX8RMX88owo9rxUM5jJIrkA1AmN75AqKk33
	mQUW2L9hqifAMnJ5nylUM1q/21Z7kH3ZeSd0k=
MIME-Version: 1.0
Received: by 10.112.36.34 with SMTP id n2mr4646384lbj.24.1328119882629; Wed,
	01 Feb 2012 10:11:22 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Wed, 1 Feb 2012 10:11:22 -0800 (PST)
In-Reply-To: <1328114151.13744.95.camel@ted>
References: <cover.1327975625.git.otavio@ossystems.com.br>
	<ddaf0e6f05439011bf5f04950922d0a6d5cd60b6.1327975625.git.otavio@ossystems.com.br>
	<1328114151.13744.95.camel@ted>
Date: Wed, 1 Feb 2012 16:11:22 -0200
X-Google-Sender-Auth: i-2gWKECEZG4gslfTIrN6xMJHCg
Message-ID: <CAP9ODKpaPoA8EfOtMpG_4TnOfzpXPns7zjCFm=DbYyGRbQLGDQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] udev: improve udev-cache robustness
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
X-List-Received-Date: Wed, 01 Feb 2012 18:19:18 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe34ecd2c26304b7eb01d7

--e0cb4efe34ecd2c26304b7eb01d7
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 1, 2012 at 14:35, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> This still forks much more than I'd like or than is necessary. In the
> interests of getting this resolved, you could do something like my
> example below which doesn't fork. It does mangle newlines in the data
> but in this case I don't think that matters.
>

I am making a new patch version using your proposal as base.


> Could we get away with /proc/version instead of uname -mrpsv ?


Sure. Good catch.

New version of patch will come soon.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e0cb4efe34ecd2c26304b7eb01d7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 1, 2012 at 14:35, Richard Purdie <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">This still forks much more than I&#=
39;d like or than is necessary. In the</div></div>
interests of getting this resolved, you could do something like my<br>
example below which doesn&#39;t fork. It does mangle newlines in the data<b=
r>
but in this case I don&#39;t think that matters.<br></blockquote><div><br><=
/div><div>I am making a new patch version using your proposal as base.</div=
><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">

Could we get away with /proc/version instead of uname -mrpsv ?</blockquote>=
<div><br></div><div>Sure. Good catch.</div><div><br></div><div>New version =
of patch will come soon.</div><div>=A0</div></div>-- <br>Otavio Salvador=A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--e0cb4efe34ecd2c26304b7eb01d7--
