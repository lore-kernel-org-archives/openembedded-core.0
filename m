Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7434D710EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 20:40:30 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id l4so2065700lbv.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 13:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=lpGWu/NE226JLnOM6r4N2jCPPDoo4+jyUjIOY14HDN0=;
	b=n+ivxmj1r10N4LwSNlLVvhoRW6bk/lyUQ/j3A+iZB81mfwuA6+o3OEUuhAcZEATMaE
	ObIUVLNT4jKZcMFYZXDeNH6XtuUz/sLsPo3bjrB3Di+92Dvndnf+3A0hoHW7EnAKftbR
	faXpusZS423qJIc7prEyTt6hRUsQKigyvaeIcNOp4UHsDwbp2nFY+hIvCKhbo8SGctZA
	yLxnMVHq/wff4pMH3O79SSdv2LzUOayIFTnv7xzmdPDWsX62wNhnY1cud6+vtZR4Ejga
	+KiTJfZUTJQ1sMmQv6tUaaWZAq8oyCdMtjxwmHWXct105ZUkUW/ujzGDJkRiELXYf9yZ
	Fi7A==
X-Received: by 10.112.55.238 with SMTP id v14mr4699975lbp.93.1409085630586;
	Tue, 26 Aug 2014 13:40:30 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Tue, 26 Aug 2014 13:40:10 -0700 (PDT)
In-Reply-To: <53FCE823.9050800@mlbassoc.com>
References: <53FCE823.9050800@mlbassoc.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 26 Aug 2014 13:40:10 -0700
X-Google-Sender-Auth: -S4bcuvtwHVgMqGRsXvBO4kZKmo
Message-ID: <CABcZANnq=U5u-tuEbhAZj_nQ_kh84XntTS-greDFnMuamLUwAw@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: own-mirrors broken
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
X-List-Received-Date: Tue, 26 Aug 2014 20:40:35 -0000
Content-Type: multipart/alternative; boundary=001a1133c96678248305018e5028

--001a1133c96678248305018e5028
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 26, 2014 at 1:03 PM, Gary Thomas <gary@mlbassoc.com> wrote:

> This commit breaks "own-mirrors"
>
> commit 0ae7b58060f1ee7914dd45d462e48d4b8a3751ad  (Poky/Yocto)
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Fri Aug 22 01:31:27 2014 -0700
>
>     sanity.bbclass: check the format of MIRRORS
>
> Since this change, use of "own-mirrors" produces this error:
>

One of the commits in the series I sent to oe-core yesterday fixes it (just
makes it first replace \\n with \n, then split on \n).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1133c96678248305018e5028
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Aug 26, 2014 at 1:03 PM, Gary Thomas <span dir=3D"ltr">&lt;<a href=
=3D"mailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</=
span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":c7" class=3D"a3s" style=3D"overf=
low:hidden">This commit breaks &quot;own-mirrors&quot;<br>
<br>
commit 0ae7b58060f1ee7914dd45d462e48d<u></u>4b8a3751ad=C2=A0 (Poky/Yocto)<b=
r>
Author: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=
=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Fri Aug 22 01:31:27 2014 -0700<br>
<br>
=C2=A0 =C2=A0 sanity.bbclass: check the format of MIRRORS<br>
<br>
Since this change, use of &quot;own-mirrors&quot; produces this error:</div=
></blockquote></div><br></div><div class=3D"gmail_extra">One of the commits=
 in the series I sent to oe-core yesterday fixes it (just makes it first re=
place \\n with \n, then split on \n).<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a1133c96678248305018e5028--
