Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id BEFF071B1D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 15:54:00 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id s19so8031789ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 07:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=68vfVu1S75Sgyx9cSvfxiPWm6gBxl9iOtTbAoHDsdfU=;
	b=XSOTvLaak173EWMn3/cHgnj+ItD3FmNxI123B0tr40MkpSlDrEF3gXh7w2ZlKYjP4j
	8HTDx0+SG2AKllFE3J71m0uz2Xu6Kl0iSB9pmeGtunCSrhTdu+OIk3BLYAGFITM99RIG
	Vt0L8ct+a8omtm4bEuZEud5c59DJbIKbCmAAeo3MZTTmPkRroH02VBrY6hihPb+ZBmHq
	V8NXhnMdLc2HP02rW0NAR3Yegs728jRdGiNgb4m+zRgaCj2JQTkRs55Mz6mXwIi/6PMF
	kdUtE+YygzanoLaRfRjejvo7If//l6/TJYxBPXP3TbmPMDP8sukIG0r85mB89sWgu4z1
	jYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=68vfVu1S75Sgyx9cSvfxiPWm6gBxl9iOtTbAoHDsdfU=;
	b=VY/WHqNIfzknUI7+CglU9rYbCfBdYFrNSqEUbZIHx9lyvKHSZQhtC//w1FTPJqvlwO
	/hdYXCXpRVF1jUV0dqIYFMYqRWD5srjf+rydRUFRzQtEbacAn1j7CHY3bxoQl8v9ogm6
	+pruPEcbIAvIsMhl8icvt7LqJrw7DWFxJDlfPBgOJJMY+mckWC0jdo8dg7k/eH3nq8J1
	AYeePrPVntbliu49WqrAKldnNKXCDJNqwCLh2RJCqIJcfB9lEGIHHysfF7al4TZpif2H
	Z2FAmTHzjnb5tcCRJ27H2jOOT9A6YbtZNs0oQX8foZKbZAlrntg/ExI3w8F+7ezasSTX
	zb7Q==
X-Gm-Message-State: AJaThX7UHJxYvF5ttL81yTK3eO0PnBUWuLgEFJYDPoIlaGrs6C+FBXpU
	cHYwh/X+kfnid2NkPDsTjG0O9HEMCD8dzm3xLbKTVT/I
X-Google-Smtp-Source: AGs4zMYnd4/nF/zYRJSVJFxhhMz+aEA0XaS+VE+Jqp5c85nO7I/LxjLhGE1Yx9y7eAz5o+N+ak17tCfUbJOmlHot0RY=
X-Received: by 10.107.133.94 with SMTP id h91mr8278486iod.208.1512057241677;
	Thu, 30 Nov 2017 07:54:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Thu, 30 Nov 2017 07:53:41 -0800 (PST)
In-Reply-To: <CAFeBWL4nTUMB2DDDXc=_hpZ6Aabaygi=_hekGY7ixE7vy1Y+7Q@mail.gmail.com>
References: <CAFeBWL4nTUMB2DDDXc=_hpZ6Aabaygi=_hekGY7ixE7vy1Y+7Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Nov 2017 15:53:41 +0000
Message-ID: <CAJTo0LZ_L6rP-AMKFMM-iPwnA-NVmoT4x7TZCS2=-oqKWmDKRg@mail.gmail.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libopkg header files (opkg.h) no longer installed..?
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
X-List-Received-Date: Thu, 30 Nov 2017 15:54:00 -0000
Content-Type: multipart/alternative; boundary="001a113ffc90c56874055f3542ea"

--001a113ffc90c56874055f3542ea
Content-Type: text/plain; charset="UTF-8"

opkg's configure says:

# The current libopkg API is deprecated so only build it if requested

If you want to install the deprecated API headers, then
pass --enable-libopkg-api.

Ross

On 30 November 2017 at 15:30, Adam Lee <adam.yh.lee@gmail.com> wrote:

> It doesn't look like inclusion of libopkg or libopkg-dev do not put
> headers (such as opkg.h) in the target.
> Can someone guide me on what I might be doing wrong?
>
> Thank you,
>
> Adam
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a113ffc90c56874055f3542ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">opkg&#39;s configure says:<div><br></div><div># The curren=
t libopkg API is deprecated so only build it if requested<br></div><div><br=
></div><div>If you want to install the deprecated API headers, then pass=C2=
=A0--enable-libopkg-api.</div><div><br></div><div>Ross</div></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On 30 November 2017 at 15:=
30, Adam Lee <span dir=3D"ltr">&lt;<a href=3D"mailto:adam.yh.lee@gmail.com"=
 target=3D"_blank">adam.yh.lee@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr">It doesn&#39;t look like inclusion o=
f libopkg or libopkg-dev do not put headers (such as opkg.h) in the target.=
<div>Can someone guide me on what I might be doing wrong?</div><div><br></d=
iv><div>Thank you,</div><div><br></div><div>Adam</div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a113ffc90c56874055f3542ea--
