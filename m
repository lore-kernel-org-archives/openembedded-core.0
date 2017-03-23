Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id C043F71AB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 11:44:40 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id n21so172721011qta.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 04:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OCah6cUpJ0iYUEO+k1qHmoR3QSd7bqoyqCBUuAdHYsM=;
	b=KFSQuSZVRpDDGAJrHnZwm0NC/qa14Xp65gfwjE+6/IE7u8r/0omr0sbaxQunHjY/7a
	x+27gESUOgN6dbqaWNj4HwEbX5qU5KPba13pi94angulLMvOjUJdNz5+RAyt7uNW0avs
	6QnABhg8woN1mZPBZQFZTjxTUxP6N4iejbAJd8Sb++r8f76jlRVIbnfM70buMyc9MjiT
	/Bk3StjUmeklMjEBa/C6D6m+oPck+BQkx2rY4GNtXNJs8dVYzXNq/A1OtPwjd/D0JVEd
	tnymVRnOkDQGbkVLOylkxUHb6Nf1ejGqdLmlXJ9ruxwSKev9osVCxVs+Sa6GH3YgxngK
	St1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OCah6cUpJ0iYUEO+k1qHmoR3QSd7bqoyqCBUuAdHYsM=;
	b=fDcQuMVF3EvbsixqKzL42h6bF9F/aqR1JOZJCoFXptC11XjVNovfA//gHsgmv6kPW5
	kd2UAIJ99yaf8gkcgIqBTGynDvm+sV99Yu3BfePCLxT7Hh77ZIdT0TLUPnPjlF13NOGw
	c5AVZnqjLdE1/R10W/etq//UJXbtFx1GaDRGgqBSKbGi5WN1kPIaVja2Tf0A/bA+u5oH
	sZsC1FGq+wf9nTptLcSZNXnLgX3XGp7np76NXOtqMUQXTwksEKBk0VQ7WiHdLhxag9Po
	DB0vwIJEeyYgYqfzYZ719grjR2m4auwC8xKuLOr+t8qDH2kdUfmlX6ToFWw/ZuBXoRId
	ypKw==
X-Gm-Message-State: AFeK/H0D5s8ukjlWyzix7HqveXUzO963JPMY/RyYTIUfHjZJjKBb59ZMQnOhSpZ7HDkz9rk+kzOMgCSD0IDmw5iN
X-Received: by 10.237.43.69 with SMTP id p63mr1717486qtd.68.1490269482126;
	Thu, 23 Mar 2017 04:44:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 23 Mar 2017 04:44:21 -0700 (PDT)
In-Reply-To: <CAMKF1srxsxW=1Hc+ONia7uMAuFNPs74w8Wjy9u5G3S2xhKi=Eg@mail.gmail.com>
References: <CAMKF1srxsxW=1Hc+ONia7uMAuFNPs74w8Wjy9u5G3S2xhKi=Eg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Mar 2017 11:44:21 +0000
Message-ID: <CAJTo0LbK+iLbFhgbR3H_gfBxtdh+Ugw5eAOhRoeWCNpE6GCwEA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Fedorahosted.org in SRC_URI
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
X-List-Received-Date: Thu, 23 Mar 2017 11:44:42 -0000
Content-Type: multipart/alternative; boundary=94eb2c124cc41a3cba054b6467cb

--94eb2c124cc41a3cba054b6467cb
Content-Type: text/plain; charset=UTF-8

On 22 March 2017 at 18:24, Khem Raj <raj.khem@gmail.com> wrote:

> meta/lib/oeqa/selftest/recipetool.py:        checkvars['SRC_URI'] =
> 'https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz'
> meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:SRC_URI =
> "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz \
> meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb:SRC_URI =
> "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2 \
> meta/recipes-extended/cronie/cronie_1.5.1.bb:SRC_URI =
> "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
> meta/recipes-extended/libuser/libuser_0.62.bb:SRC_URI =
> "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
> meta/recipes-extended/logrotate/logrotate_3.9.1.bb:SRC_URI =
> "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz
> \
> meta/recipes-extended/newt/libnewt_0.52.19.bb:SRC_URI =
> "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
> meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb:SRC_URI =
> "https://fedorahosted.org/releases/l/i/liberation-fonts/
> liberation-fonts-${PV}.tar.gz
> \
>

I noticed this last week but totally forgot to file a bug or write a mail,
thanks Khem.

I've filed #11226 for oe-core, and hope we can get oe-core sorted before
release.

Ross

--94eb2c124cc41a3cba054b6467cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2017 at 18:24, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":2tl" class=3D"a3s aXjCH =
m15af7452209e0cc4">meta/lib/oeqa/selftest/<wbr>recipetool.py:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 checkvars[&#39;SRC_URI&#39;] =3D<br>
&#39;<a href=3D"https://fedorahosted.org/releases/l/o/logrotate/logrotate-$=
{PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://fedorahosted.org/=
<wbr>releases/l/o/logrotate/<wbr>logrotate-${PV}.tar.gz</a>&#39;<br>
meta/recipes-devtools/xmlto/<wbr>xmlto_0.0.28.bb:SRC_URI =3D<br>
&quot;<a href=3D"https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.ta=
r.gz" rel=3D"noreferrer" target=3D"_blank">https://fedorahosted.org/<wbr>re=
leases/x/m/xmlto/xmlto-${PV}<wbr>.tar.gz</a> \<br>
meta/recipes-extended/<wbr>chkconfig/<a href=3D"http://chkconfig_1.3.58.bb"=
>chkconfig_1.3.58.bb</a>:<wbr>SRC_URI =3D<br>
&quot;<a href=3D"http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV=
}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://fedorahosted.org/<wb=
r>releases/c/h/chkconfig/${BPN}-<wbr>${PV}.tar.bz2</a> \<br>
meta/recipes-extended/cronie/<wbr>cronie_1.5.1.bb:SRC_URI =3D<br>
&quot;<a href=3D"https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.=
tar.gz" rel=3D"noreferrer" target=3D"_blank">https://fedorahosted.org/<wbr>=
releases/c/r/cronie/cronie-${<wbr>PV}.tar.gz</a> \<br>
meta/recipes-extended/libuser/<wbr>libuser_0.62.bb:SRC_URI =3D<br>
&quot;<a href=3D"https://fedorahosted.org/releases/l/i/libuser/libuser-${PV=
}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://fedorahosted.org/<wb=
r>releases/l/i/libuser/libuser-$<wbr>{PV}.tar.xz</a> \<br>
meta/recipes-extended/<wbr>logrotate/logrotate_3.9.1.bb:S<wbr>RC_URI =3D<br=
>
&quot;<a href=3D"https://fedorahosted.org/releases/l/o/logrotate/logrotate-=
${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://fedorahosted.org=
/<wbr>releases/l/o/logrotate/<wbr>logrotate-${PV}.tar.gz</a><br>
\<br>
meta/recipes-extended/newt/<wbr>libnewt_0.52.19.bb:SRC_URI =3D<br>
&quot;<a href=3D"https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.=
gz" rel=3D"noreferrer" target=3D"_blank">https://fedorahosted.org/<wbr>rele=
ases/n/e/newt/newt-${PV}.<wbr>tar.gz</a> \<br>
meta/recipes-graphics/ttf-<wbr>fonts/liberation-fonts_1.04.<wbr>bb:SRC_URI =
=3D<br>
&quot;<a href=3D"https://fedorahosted.org/releases/l/i/liberation-fonts/lib=
eration-fonts-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://fe=
dorahosted.org/<wbr>releases/l/i/liberation-fonts/<wbr>liberation-fonts-${P=
V}.tar.gz</a><br>
\<br></div></blockquote></div><br>I noticed this last week but totally forg=
ot to file a bug or write a mail, thanks Khem.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">I&#39;ve filed #11226 for oe-core,=
 and hope we can get oe-core sorted before release.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c124cc41a3cba054b6467cb--
