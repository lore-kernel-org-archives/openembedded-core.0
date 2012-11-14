Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TYfdz-0002vX-8a
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 17:16:51 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so416825pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 08:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=kIUAYEkDsPwWqXLr3LIg9/mgSUZysPkwqrHk7sB4L4s=;
	b=KyO56Bu80kNOcvrG7sN6pkx/7OQGYy79um1dGvlrHBmDFHkQykODHndspQQk2xQilv
	PC13K103oww9p1Zw6UY1gCZT5Qltyz71F/lC5BnpGL1sL/BoK6BbQTmnA9mBzk0sPyke
	XvoX/x+JxNNeC8oKqH42ljYF9XWZyT/YyiKRpRTslmEBt/nYFrlOuRzLeYuBpWXr3gVC
	WeokxspN8vmQC+FE4QmT3Q0DYBrvh+ijW1/+dH2h+8xK+C0cAFCR9vhld/ukQ0IQwH7q
	yRHP7A5TgezfE0isN1RUMZp/hs7ZkaitxEEf4Dp+bqhJXTfKScsYsbPoMo/8qfE3KXv0
	dAkA==
MIME-Version: 1.0
Received: by 10.68.254.10 with SMTP id ae10mr73681626pbd.126.1352908974931;
	Wed, 14 Nov 2012 08:02:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 14 Nov 2012 08:02:54 -0800 (PST)
In-Reply-To: <20121114124239.GB6908@ad.chargestorm.se>
References: <20121114124239.GB6908@ad.chargestorm.se>
Date: Wed, 14 Nov 2012 14:02:54 -0200
X-Google-Sender-Auth: 9_bGAGykqbQEhJv1sxgiyWBTA-8
Message-ID: <CAP9ODKpiPpUMSsOuStLepKt03gwY1EHxkRc+pLxrsSTdmVAGyA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Subject: Re: License of xz
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
X-List-Received-Date: Wed, 14 Nov 2012 16:16:51 -0000
Content-Type: multipart/alternative; boundary=047d7b2e0da1dd401d04ce76aa03

--047d7b2e0da1dd401d04ce76aa03
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 14, 2012 at 10:42 AM, Anders Darander <anders@chargestorm.se>wrote:

> ...

If my interpretation is correct, I'll try to find more time to look into
> the actual source files a bit more closely.
> ...

      - The build system contains public domain files, and files that
>         are under GNU GPLv2+ or GNU GPLv3+. None of these files end up
>         in the binaries being built.
>

From my understanding, if you remove the generated files from the source
and rebuild those you'd be GPLv2 compatible.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b2e0da1dd401d04ce76aa03
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Nov 14, 2012 at 10:42 AM, Anders=
 Darander <span dir=3D"ltr">&lt;<a href=3D"mailto:anders@chargestorm.se" ta=
rget=3D"_blank">anders@chargestorm.se</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
...=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">If my interpretation is c=
orrect, I&#39;ll try to find more time to look into<br>
the actual source files a bit more closely.<br>...=A0</blockquote><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
=A0 =A0 =A0 - The build system contains public domain files, and files that=
<br>
=A0 =A0 =A0 =A0 are under GNU GPLv2+ or GNU GPLv3+. None of these files end=
 up<br>
=A0 =A0 =A0 =A0 in the binaries being built.<br></blockquote><div><br></div=
><div>From my understanding, if you remove the generated files from the sou=
rce and rebuild those you&#39;d be GPLv2 compatible.</div></div><div><br></=
div>
-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" t=
arget=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b2e0da1dd401d04ce76aa03--
