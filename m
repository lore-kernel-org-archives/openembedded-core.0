Return-Path: <twoerner@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7A991745AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 21:04:58 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id m84-v6so10489563lje.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 14:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eiLtgx3Vu+Of4loa0lDGfGf8JlaUmd6iVIv67Uvns7A=;
	b=pUO0G0h5QLuB6eSpGxDjvW5zQhQ79KfcZUHiRjR1OjJPhZDwXSx6qeGUjr4Ses2aBc
	Nm9OvG6DVhxtP5k3HcRSO2BrgneaV++OPYJGOvGohdZl/NGmc/ytGIQGjdhSYRTakzsi
	kf7TTe1vcWuKmViIjrWkulIwF80ifCAKMvjjJJ7xpfTH6i+/ZBXB54+o92RBnT47IgA2
	Nh5+nLxu4FTJ1J8C6/MVuTo1Tbl4lSVCMyQabrC/L8tfxhsVg4LSPwP/RXCQyQW6Lld5
	QaBj9Ckpk05tzXAPtq2X7CAUJDGYG47HouDHYDAzMoVg/7BBbni1zHBV50ZmYutpA9Uj
	2gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eiLtgx3Vu+Of4loa0lDGfGf8JlaUmd6iVIv67Uvns7A=;
	b=S9HhO/CwESrYNcgL//0V9brraLg++2spH5Pm+lmNn5YfkZwwFPM1loBIsnHhTPTluS
	rLDAya660m5GiUNKFL7NiAnr0uKljP/i9OIV1dqcc1i9EJdOpcYWCzoFEeioRwlFB1QZ
	oKzaNErykTBwoC/2kkorB5gxQUEcF/bwB3oC53R2iMnYX0TWflt6kUhYmS2jsNEgX4RJ
	/9QcLevSF4XQsozAO82LKkAHTurZqf3dvvvPNUUFUpmm4ZXr+kOAGMfbT4G0yAHa2MLQ
	+MK5SK9jFLbhAR0Kam6F6wqkNfCR36+lwnJXrxCyEbKSEPa8mAjyiecUvMyamR2RF+I6
	AbDw==
X-Gm-Message-State: APzg51BRTb60HmEHWeXm5UJu3bapa4V2MbqfWR1rJPqwghqqT1fviw2r
	Y5l9stkwMhAQEhK59eVg61uHi9mMbx67sJ06Pfc=
X-Google-Smtp-Source: ANB0VdbSXz2Dw4cVsE+Ke6PbzpU7NKbkC1Kl1fdt5y9xbhz+rc1V8DNOgt3FyeQ1QgXt1Dy0BLaSIrMSXYi7s6WIDRU=
X-Received: by 2002:a2e:2bd3:: with SMTP id
	r80-v6mr3086457ljr.57.1536267898934; 
	Thu, 06 Sep 2018 14:04:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:1585:0:0:0:0:0 with HTTP;
	Thu, 6 Sep 2018 14:04:58 -0700 (PDT)
In-Reply-To: <CAJ86T=W4pbBfk2GxKz4dGdXptd2ndfezHdgqEWh4yN5PQo_8Xw@mail.gmail.com>
References: <0D62475714C01347BCA118AE7A61400376B2C64D@FMSMSX109.amr.corp.intel.com>
	<5e8c54728e6990907fa60f2454ab7961c7561a93.camel@linuxfoundation.org>
	<0D62475714C01347BCA118AE7A61400376B2C8A3@FMSMSX109.amr.corp.intel.com>
	<CAJ86T=W4pbBfk2GxKz4dGdXptd2ndfezHdgqEWh4yN5PQo_8Xw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 6 Sep 2018 17:04:58 -0400
Message-ID: <CAHUNapQ7s-GGYkGOp=ehd0EZCas7mtD=vqsdycWQVPSY1-R5Fw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: "Ocampo Coronado, Omar" <omar.ocampo.coronado@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Strip kernel modules and signatures
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
X-List-Received-Date: Thu, 06 Sep 2018 21:04:59 -0000
Content-Type: multipart/alternative; boundary="000000000000655b4c05753a3e8d"

--000000000000655b4c05753a3e8d
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 3, 2018 at 4:16 AM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Aug 2, 2018 at 9:54 AM, Ocampo Coronado, Omar
> <omar.ocampo.coronado@intel.com> wrote:
> > Neither 'nm' or 'readelf' provide a symbol that we can use to strip.
> > I'm having a hard time reading kernel-source/scripts/sign-file.c and
> how exactly how the sign works and what bytes are being added, so we can
> avoid stripping them.
> >
> > Looking into dracut, they simple avoid strip signed modules:
> >         From dracut.sh:1671 # strip kernel modules, but do not touch
> signed modules
> >
> > Perhaps we can do the same as dracut within meta/lib/oe/package.py.
>
> Some more information here:
>
>   https://www.kernel.org/doc/html/v4.17/admin-guide/module-
> signing.html#signed-modules-and-stripping
>
>
Reading the above "between the lines", could the module be stripped /then/
signed?

--000000000000655b4c05753a3e8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Aug 3, 2018 at 4:16 AM, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"=
mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, Aug=
 2, 2018 at 9:54 AM, Ocampo Coronado, Omar<br>
&lt;<a href=3D"mailto:omar.ocampo.coronado@intel.com">omar.ocampo.coronado@=
intel.<wbr>com</a>&gt; wrote:<br>
&gt; Neither &#39;nm&#39; or &#39;readelf&#39; provide a symbol that we can=
 use to strip.<br>
&gt; I&#39;m having a hard time reading kernel-source/scripts/sign-<wbr>fil=
e.c and how exactly how the sign works and what bytes are being added, so w=
e can avoid stripping them.<br>
&gt;<br>
&gt; Looking into dracut, they simple avoid strip signed modules:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0From dracut.sh:1671 # strip kernel mo=
dules, but do not touch signed modules<br>
&gt;<br>
&gt; Perhaps we can do the same as dracut within meta/lib/oe/package.py.<br=
>
<br>
</span>Some more information here:<br>
<br>
=C2=A0 <a href=3D"https://www.kernel.org/doc/html/v4.17/admin-guide/module-=
signing.html#signed-modules-and-stripping" rel=3D"noreferrer" target=3D"_bl=
ank">https://www.kernel.org/doc/<wbr>html/v4.17/admin-guide/module-<wbr>sig=
ning.html#signed-modules-<wbr>and-stripping</a><br>
<br></blockquote><div><br></div><div>Reading the above &quot;between the li=
nes&quot;, could the module be stripped /then/ signed? <br></div></div><br>=
</div></div>

--000000000000655b4c05753a3e8d--
