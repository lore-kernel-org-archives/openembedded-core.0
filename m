Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9958F610CA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 14:10:11 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id m1so3458484oag.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 06:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=+CHMcH7KJaBUCiyqZxgHkvhlsASEmztGnnXlDx2sX+A=;
	b=fInO4piQwLvc2UKbhQHLfh60/ZgfaxZt+jLxVkSnAcFbW8fqkGr4xnbL33BzhaSple
	udxQjxjUgvG4TKpAd0khKBKrNqOJaefhFZBCC8B8hzjVN0Iga/VRVYE1JJ4DkbGY/0QO
	4sDSowLc6GaxYzBJtG1oBqq4a9yGrY1Nnxle1EwOZPJXfgJPEfdWU+thhrN8lB6BVHr0
	yYH6Tm/Nxkt/ssIJE5bLYJmi9KyRAlx+ZfanvpDHMXucTtqocgXM3ssNgot3UZFC17lY
	B5DZWTQ+ecOp1jmTdT89D1yzlohGZjx73ziQ0RChAYELDM6E7HMvRzb7OpNJlkXNRzik
	6xSw==
MIME-Version: 1.0
X-Received: by 10.182.78.68 with SMTP id z4mr2395667obw.29.1389276612407; Thu,
	09 Jan 2014 06:10:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 9 Jan 2014 06:10:12 -0800 (PST)
In-Reply-To: <1389266170.9182.122.camel@phil-desktop.brightsign>
References: <1389266170.9182.122.camel@phil-desktop.brightsign>
Date: Thu, 9 Jan 2014 12:10:12 -0200
X-Google-Sender-Auth: tf4mZoyfzCSHIB4HWY9TAFF6NyQ
Message-ID: <CAP9ODKo1LCoGuUG=0mpRMwctq06RwpaX_B=goEoO55b6YQwXHg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsoup: Remove libproxy from DEPENDS
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
X-List-Received-Date: Thu, 09 Jan 2014 14:10:11 -0000
Content-Type: multipart/alternative; boundary=047d7b2e4d52fa38e204ef8a2a45

--047d7b2e4d52fa38e204ef8a2a45
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 9, 2014 at 9:16 AM, Phil Blundell <pb@pbcl.net> wrote:

> Although libsoup did use to support direct usage of libproxy, it hasn't
> done so for some time.  Worse, if libsoup depends on libproxy then it
> is impossible to build libproxy against webkit since webkit itself
> depends on libsoup in some configurations.  Fix this by removing the
> extraneous entry from DEPENDS.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
>

Does it need a --disable-libproxy or so?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b2e4d52fa38e204ef8a2a45
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jan 9, 2014 at 9:16 AM, Phil Blundell <span dir=3D"ltr">&lt=
;<a href=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span=
> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Although libsoup did use to support direct u=
sage of libproxy, it hasn&#39;t<br>
done so for some time. =A0Worse, if libsoup depends on libproxy then it<br>
is impossible to build libproxy against webkit since webkit itself<br>
depends on libsoup in some configurations. =A0Fix this by removing the<br>
extraneous entry from DEPENDS.<br>
<br>
Signed-off-by: Phil Blundell &lt;<a href=3D"mailto:pb@pbcl.net">pb@pbcl.net=
</a>&gt;<br></blockquote><div><br></div><div>Does it need a --disable-libpr=
oxy or so?=A0</div></div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://code.ossystems.com.br" targ=
et=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9981-785=
4 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750<br>

</div></div>

--047d7b2e4d52fa38e204ef8a2a45--
