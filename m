Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 97194605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 09:06:51 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so35327885qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 02:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oCmrZy79YieZAfafVQhUpivRfrOujlq+zNm3qdDX1dY=;
	b=E1BX3/L1ssVYU93l+jzQ6LAX02VbeadU8DLrBIWHZ1ceXX/oRD8MpG2N5KbIqY6StC
	MiOujjcS1h3/Vf1MWpNcSjjFdQPrHmuqJ07LEPXq9oy4F3idOJQIbZo4ta/xUhcwmWNh
	WoRQFeF13hEdM2NxS9mHarDbAlBvFUXNqIoi9IxeckyGCfBgZ4A7Hko+kNlByiePNW50
	1D5Zzt5BGQjQb0rzDntq2qHLQFa3o8xJM7aS7uDlyJDV1Zq6ljTjNFqfS9amHCbY3Ifz
	E20sdfIAj/ZygZ9wlLnUbUjfc2g/ORTK7AAy7KpmQTy+XtZMCjf2MUHUUA91FQPIJeDr
	N1Kw==
X-Gm-Message-State: ALoCoQmHndtO7C/11FysCMO6WTVkmE8Ayks/1JNG70wNzh7I8OhuMl4LKpmtvDHh94xxoIjSr8Ji
X-Received: by 10.140.43.199 with SMTP id e65mr23571653qga.80.1435223212652;
	Thu, 25 Jun 2015 02:06:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 25 Jun 2015 02:06:33 -0700 (PDT)
In-Reply-To: <558B6646.2050809@windriver.com>
References: <cover.1435135356.git.liezhi.yang@windriver.com>
	<bf978a7894f51c909ede7f64c28b6da5495d981a.1435135356.git.liezhi.yang@windriver.com>
	<CAJTo0LZBzMKzzswgtsk0o3uohK+03a4kPB0niwhvyYqxpQBhYg@mail.gmail.com>
	<558B6646.2050809@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Jun 2015 10:06:33 +0100
Message-ID: <CAJTo0LbE33NkdmiA_+=NmHAS3hRJY6tdsoGHSQKo2ARAsCgpqA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] file: 5.22 -> 5.23
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
X-List-Received-Date: Thu, 25 Jun 2015 09:06:55 -0000
Content-Type: multipart/alternative; boundary=001a113a9baac39a1d051953f185

--001a113a9baac39a1d051953f185
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25 June 2015 at 03:24, Robert Yang <liezhi.yang@windriver.com> wrote:

> It works now, I think that it should be a transient failure. And I think
> that
> it is still the best source location since it is suggested by the homepag=
e.
>

$ wget ftp://ftp.astron.com/pub/file/file-5.23.tar.gz
--2015-06-25 09:58:02--  ftp://ftp.astron.com/pub/file/file-5.23.tar.gz
           =3D> =E2=80=98file-5.23.tar.gz=E2=80=99
Resolving ftp.astron.com (ftp.astron.com)... 38.117.134.18
Connecting to ftp.astron.com (ftp.astron.com)|38.117.134.18|:21...
connected.
Logging in as anonymous ...
Login incorrect.

Still doesn't work for me.  Anyway, 5.23 is moderately broken (long options
don't work) so we probably want to wait for 5.24 or take the patch from
upstream.

Ross

--001a113a9baac39a1d051953f185
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 June 2015 at 03:24, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":1vf" class=3D"" style=
=3D"overflow:hidden">It works now, I think that it should be a transient fa=
ilure. And I think that<br>
it is still the best source location since it is suggested by the homepage.=
<br></div></blockquote></div><br><div class=3D"gmail_extra">$ wget <a href=
=3D"ftp://ftp.astron.com/pub/file/file-5.23.tar.gz">ftp://ftp.astron.com/pu=
b/file/file-5.23.tar.gz</a></div><div class=3D"gmail_extra">--2015-06-25 09=
:58:02-- =C2=A0<a href=3D"ftp://ftp.astron.com/pub/file/file-5.23.tar.gz">f=
tp://ftp.astron.com/pub/file/file-5.23.tar.gz</a></div><div class=3D"gmail_=
extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D&gt; =E2=80=98file-5.23.=
tar.gz=E2=80=99</div><div class=3D"gmail_extra">Resolving <a href=3D"http:/=
/ftp.astron.com">ftp.astron.com</a> (<a href=3D"http://ftp.astron.com">ftp.=
astron.com</a>)... 38.117.134.18</div><div class=3D"gmail_extra">Connecting=
 to <a href=3D"http://ftp.astron.com">ftp.astron.com</a> (<a href=3D"http:/=
/ftp.astron.com">ftp.astron.com</a>)|38.117.134.18|:21... connected.</div><=
div class=3D"gmail_extra">Logging in as anonymous ...</div><div class=3D"gm=
ail_extra">Login incorrect.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Still doesn&#39;t work for me.=C2=A0 Anyway, 5.23 is =
moderately broken (long options don&#39;t work) so we probably want to wait=
 for 5.24 or take the patch from upstream.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a113a9baac39a1d051953f185--
