Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id EE60276E4A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 15:17:58 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 38so273844379iol.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SJ8bINDe01n48f+UtSJ/BQrCUwnwIiCIPryIie0jDzA=;
	b=DLG7iPs8cg0VFZ29I8zr77sXz8v2bkZA/UCpJeFQQRVLO7TM5HNre304MJV2Wh5iNk
	ldrXFFKzKC11hWVR+lW0WB0K8CNxjY/2i1C5t7FLmaRt8OmKQoUxYwnlUvdluByTxXMc
	mt28OnZD5/EuBs/1KWTaee67gDTgW/UnqOzg/iVVf1CYVRyMInz8HvAGAOz4eN9l2NyG
	2NDbrAFhHn54SpUNb66gJqo9FAhJwwfotmRCfglWcFaUCNLNf4jd2TRlLRodwpWIb4w8
	HZ5nnA9r5rL8TlG2CXDI+RnoTPKYtN402iOLVpXfBo8ntAN5+p1lZ8AvEJMSIfjVcS9L
	2mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SJ8bINDe01n48f+UtSJ/BQrCUwnwIiCIPryIie0jDzA=;
	b=g+ihS80+0ufLERLqg8XbDaYwb0vwY9MKqZHwPkdBZSPXVBlBthPfcE3+zItznSNbGu
	J+P2HM9+JTwyW/Wdc/I3pnLsQWwqyORZE/U+0kyrBFDAgPcB974VU2Fz/W0FgOniaGJv
	O2kYD8xsqOngGGwzDsOdO5v4t38W87P0Kkt+5cY8EHq3/E1cHhu3qKsJnlnszOjWBXlz
	KprGlZQYKnXEL5kNAwv3keYv/+ebhbKypjWVItvJl/AroEQFpi+vcGVyAx6deK8g2+69
	LGZ46Uv2tl8oWf6svl9kcHUdzJC9Ez84ftoCJ+hz+NPJNVTpnKK9i1krsmoJQEjxzfot
	P86w==
X-Gm-Message-State: AEkoouvPS1m4mX/EX+xVnqVNyRzj9/zzeADurO1Cx9icR9j34SYM/+Eqf1tatn4/+6IWMcTZiXn2nr/kWyX8ymwa
X-Received: by 10.107.138.212 with SMTP id c81mr71476657ioj.148.1470323879244; 
	Thu, 04 Aug 2016 08:17:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 4 Aug 2016 08:17:38 -0700 (PDT)
In-Reply-To: <BF50BCD4-DC5E-478D-9AF3-24C9E99C36A7@gmail.com>
References: <cover.1469337362.git.liezhi.yang@windriver.com>
	<07cae7b73779e89d5e038bf48fbfa204d51b4b68.1469337362.git.liezhi.yang@windriver.com>
	<CAJTo0LYCEP1nkeZ9-1i+K3YsK0OMAt+axx-4ezQsbxu+VwvyVA@mail.gmail.com>
	<57980BC4.80208@windriver.com>
	<BF50BCD4-DC5E-478D-9AF3-24C9E99C36A7@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Aug 2016 16:17:38 +0100
Message-ID: <CAJTo0LZ_9sp6+tWgoY1NSeh3H-KVWrCJfyCp0LW1YaF6AMS1tg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] epiphany: inherit perlnative
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
X-List-Received-Date: Thu, 04 Aug 2016 15:17:59 -0000
Content-Type: multipart/alternative; boundary=001a113ed932872c2105394074a7

--001a113ed932872c2105394074a7
Content-Type: text/plain; charset=UTF-8

On 27 July 2016 at 10:34, Khem Raj <raj.khem@gmail.com> wrote:

> > I still get the same error after your patch applied:
> >
> > configure:16513: checking for perl
> > configure:16531: found /usr/bin/perl
> > configure:16543: result: /usr/bin/perl
> > configure:16554: checking for perl >= 5.8.1
> > configure:16561: result: 5.18.2
> > configure:16565: checking for XML::Parser
> > configure:16571: error: XML::Parser perl module is required for intltool
>
> same here
>
> http://errors.yoctoproject.org/Errors/Details/73330/


I don't understand how as my patch literally removes that block of code
from the intltool macros.  Can you still replicate this, and if so can you
save the build tree?

Ross

--001a113ed932872c2105394074a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 July 2016 at 10:34, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; I still get the=
 same error after your patch applied:<br>
&gt;<br>
&gt; configure:16513: checking for perl<br>
&gt; configure:16531: found /usr/bin/perl<br>
&gt; configure:16543: result: /usr/bin/perl<br>
&gt; configure:16554: checking for perl &gt;=3D 5.8.1<br>
&gt; configure:16561: result: 5.18.2<br>
&gt; configure:16565: checking for XML::Parser<br>
&gt; configure:16571: error: XML::Parser perl module is required for <span =
class=3D"il">intltool</span><br>
<br>
</span>same here<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/73330/" rel=3D"nor=
eferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/73=
330/</a></blockquote></div><br>I don&#39;t understand how as my patch liter=
ally removes that block of code from the intltool macros.=C2=A0 Can you sti=
ll replicate this, and if so can you save the build tree?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed932872c2105394074a7--
