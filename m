Return-Path: <kergoth@gmail.com>
X-Greylist: delayed 470 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 May 2014 17:54:04 UTC
Received: from mail-la0-f47.google.com (unknown [209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id A756C660E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 17:54:03 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id pn19so1711061lab.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 10:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=KSWZz4djNdmZxmzh8GKB9AvkDTQ5oCgDavvm7aApFKM=;
	b=kj6yc7ClzBDG2QhKiQWujI2KB9C1QlZ/uH8SZLZ3KOCBsLzc2j/EMzoIESCs+wyiQK
	PH7YBE6MPHoWHQ2PYGN8ilKs6DzApTc6RlH/j3PhoveGsN/MSHxT1e8XZggcuZDApZPS
	f3BOoM0fUxrheFlRLI1QCziPC21RUBHyAhrbwNMITqxuOwPe7Q79Av9A3E5vb83IpGoC
	1fvigCWRkHXxP3NJeSd8VJa7UNtWiNyhBYTzNkocanSHL1W7XuUik6xOnLtKEHnxLT8Q
	Bg4JfrQnn8R1v0o47E/Hc08Dyox/0yFWpebOWp8v89nz1le9VnigtM4Ja/UTs8wGTjOj
	IhYw==
X-Received: by 10.152.36.134 with SMTP id q6mr3520454laj.29.1400089575126;
	Wed, 14 May 2014 10:46:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.148.170 with HTTP; Wed, 14 May 2014 10:45:54 -0700 (PDT)
In-Reply-To: <1400059849-7711-1-git-send-email-wenlin.kang@windriver.com>
References: <1400059849-7711-1-git-send-email-wenlin.kang@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 14 May 2014 10:45:54 -0700
X-Google-Sender-Auth: DZPeVtouaQe-EcX-fj1USM_hJl8
Message-ID: <CABcZANmJwy2uid_pwHZzt=PHYpW=CetpkB0U3r-c=0EcFUONXg@mail.gmail.com>
To: Wenlin Kang <wenlin.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: fixed bash build error
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
X-List-Received-Date: Wed, 14 May 2014 17:54:09 -0000
Content-Type: multipart/alternative; boundary=047d7b5d91efc77b3204f95fc1d7

--047d7b5d91efc77b3204f95fc1d7
Content-Type: text/plain; charset=UTF-8

On Wed, May 14, 2014 at 2:30 AM, Wenlin Kang <wenlin.kang@windriver.com>wrote:

> When build bash, a error occurs, the cause is that autotools uses
> improper Makefile.in.in which is from path/gettext/po/ but not bash
> itself in bash/po/,so to avoid some error to occur, we should use
> package itself Makefile.in.in file if it has.
>
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>

This will cause breakage when the shipped Makefile.in.in gettext version
mismatches with the gettext-native/gettext we built.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b5d91efc77b3204f95fc1d7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, May 14, 2014 at 2:30 AM, Wenlin Kang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:wenlin.kang@windriver.com" target=3D"_blank">wenlin.kang@windriv=
er.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":lg" class=3D"a3s" style=3D"overf=
low:hidden">When build bash, a error occurs, the cause is that autotools us=
es<br>


improper <a href=3D"http://Makefile.in.in" target=3D"_blank">Makefile.in.in=
</a> which is from path/gettext/po/ but not bash<br>
itself in bash/po/,so to avoid some error to occur, we should use<br>
package itself <a href=3D"http://Makefile.in.in" target=3D"_blank">Makefile=
.in.in</a> file if it has.<br>
<br>
Signed-off-by: Wenlin Kang &lt;<a href=3D"mailto:wenlin.kang@windriver.com"=
>wenlin.kang@windriver.com</a>&gt;</div></blockquote></div><br></div><div c=
lass=3D"gmail_extra">This will cause breakage when the shipped <a href=3D"h=
ttp://Makefile.in.in">Makefile.in.in</a> gettext version mismatches with th=
e gettext-native/gettext we built.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--047d7b5d91efc77b3204f95fc1d7--
