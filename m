Return-Path: <krussell7711@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id C4CBF7197A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 16:44:57 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id w3so992660ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=fCzqioPl20Owtu5MM0nMlfuT3w0WmGxkQyDcUiNUUL4=;
	b=HSnPVDAGv9wI62KsnWRaSZMXDReBiGbfUk6Wf4MmfRr1WBo1aJ80CY1L8n5PEB5vTN
	I8id06KajGukRIXPSWvzQpiViv6e3iPKMh+59Hzeu8wH4OBLTZTpY3tNHaSLfByJsfdN
	oowtAmD1V482A6lHvfTXFw0K7RxwHwyru3H0RyAPzwHalaN4O9s7x34S6Zp43W7R0f+F
	BtGYuNgU+wdpKj2iZ30SyG7cGiIOddQ4ubu/5lILwNkaUzlBuQ+9N3v2Vco/+E0tY3Db
	fO9N06eaEmZPWkTQIE0Q8/vyKVg/WknAl+vXY1IVDV+Tb9aTu2FQwLhnjuE3DZa3Frh3
	qoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=fCzqioPl20Owtu5MM0nMlfuT3w0WmGxkQyDcUiNUUL4=;
	b=lQ3Hy8rOPBoB9lt38eTDVMJQMJ63VeUUvKxo2bIAYrhXD0K012xqEh57M2ij+Q6zOP
	HETRSichbepYhyyJgOiVIV+jNVbOlzVoUxdQvuBjEfgEXvK1Qs5SpaSWMQg3m70nWZyA
	3EdWKJGzdEpWC12eFVPijrpdYWYae5iVQfTWk25016PQwMxi79KpWCEq/h3JfG8LT+1f
	y518+IIs+u0ladZM8DcKQfBicgBSJkM/yPX2aXb1NsKce/C2jGXGuBYsGq0nszD84XlO
	+sydEGCbGeiJVgxMHKHGqdMp2THUtNLLUgfxm1NfvmgLpjwRrCTOZQCA5Mx6wjdAFUAg
	h7QA==
X-Gm-Message-State: AA6/9RnIbAD1fl8WilYCWvwdUjOJyKpW2RnLmo77co3GjqmtTfYHDrH2zMlDxNw7Odhp1qb29OAlFzUtZg/Q0A==
X-Received: by 10.129.130.197 with SMTP id s188mr4122026ywf.209.1476204298909; 
	Tue, 11 Oct 2016 09:44:58 -0700 (PDT)
MIME-Version: 1.0
Sender: krussell7711@gmail.com
Received: by 10.129.155.145 with HTTP; Tue, 11 Oct 2016 09:44:38 -0700 (PDT)
In-Reply-To: <CAJTo0LahAKipF1Dz9TQw8TVM3vp361ZATtVPHjXy5ZupRDdZkQ@mail.gmail.com>
References: <1476195437-24040-1-git-send-email-bkylerussell@gmail.com>
	<1476195437-24040-2-git-send-email-bkylerussell@gmail.com>
	<CAJTo0LahAKipF1Dz9TQw8TVM3vp361ZATtVPHjXy5ZupRDdZkQ@mail.gmail.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Tue, 11 Oct 2016 12:44:38 -0400
X-Google-Sender-Auth: 0UmSb7wCaIdo1g2FVwdpyfAhD5o
Message-ID: <CAFrQVPPXkV_dy9G7qWhGNd-5AFY-pVhG33sYUjMVPupaXxyd1A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] librsvg: Add missing pixbufcache dependencies
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
X-List-Received-Date: Tue, 11 Oct 2016 16:44:58 -0000
Content-Type: multipart/alternative; boundary=94eb2c07c180da5b1f053e999834

--94eb2c07c180da5b1f053e999834
Content-Type: text/plain; charset=UTF-8

No, I haven't been able to reproduce it on demand, so there appears to be
some race scenario.  I have only seen the failure about libXdmcp a couple
of times.  It does look like libpixbufloader-svg.so depends on libxcb.so as
well, so if libxcb-native would be more appropriate here I can use that
instead (or in addition to libxdmcp?).

I suspect this list may still not be entirely complete, because ldd shows
several dependencies for libpixbufloader-svg.so.  However, I'm not really
that familiar with all the dependencies going on here; we are definitely
seeing sporadic failures for various native libraries during the
pixbufcache postinst task though.  Best I could tell, it looked like the
PIXBUFCACHE_SYSROOT_DEPS functionality was accidentally removed from the
pixbufcache.bbclass a while back (hence, my first patch).  Adding that hunk
back in has seemed to help most of the failures, but we still see lingering
failures for pixman and libXdmcp on occasion.

If PIXBUFCACHE_SYSROOT_DEPS is supposed to be satisfied another way, I'll
be glad to reevaluate.

On Tue, Oct 11, 2016 at 10:57 AM, Burton, Ross <ross.burton@intel.com>
wrote:

>
> On 11 October 2016 at 15:17, Kyle Russell <bkylerussell@gmail.com> wrote:
>
>> g_module_open() failed for libpixbufloader-svg.so: libXdmcp.so.6:
>> cannot open shared object file: No such file or directory
>>
>
> Can you replicate this failure on demand?  I can't see why eg xdmcp needs
> to be in this list but say libxcb doesn't, which is presumably there that
> linkage is coming from.
>
> One solution for xdmcp would be to remove it entirely...
>
> Ross
>

--94eb2c07c180da5b1f053e999834
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No, I haven&#39;t been able to reproduce it on demand, so =
there appears to be some race scenario.=C2=A0 I have only seen the failure =
about libXdmcp a couple of times.=C2=A0 It does look like libpixbufloader-s=
vg.so depends on libxcb.so as well, so if libxcb-native would be more appro=
priate here I can use that instead (or in addition to libxdmcp?).<div><br><=
/div><div>I suspect this list may still not be entirely complete, because l=
dd shows several dependencies for libpixbufloader-svg.so.=C2=A0 However, I&=
#39;m not really that familiar with all the dependencies going on here; we =
are definitely seeing sporadic failures for various native libraries during=
 the pixbufcache postinst task though.=C2=A0 Best I could tell, it looked l=
ike the PIXBUFCACHE_SYSROOT_DEPS functionality was accidentally removed fro=
m the pixbufcache.bbclass a while back (hence, my first patch).=C2=A0 Addin=
g that hunk back in has seemed to help most of the failures, but we still s=
ee lingering failures for pixman and libXdmcp on occasion.</div><div><br></=
div><div>If PIXBUFCACHE_SYSROOT_DEPS is supposed to be satisfied another wa=
y, I&#39;ll be glad to reevaluate.</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Tue, Oct 11, 2016 at 10:57 AM, Burton, Ross=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_=
blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br>=
<div class=3D"gmail_quote">On 11 October 2016 at 15:17, Kyle Russell <span =
dir=3D"ltr">&lt;<a href=3D"mailto:bkylerussell@gmail.com" target=3D"_blank"=
>bkylerussell@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div>g_module_open() failed for libpixbufloader-svg.so: libXdmcp.so.6:=
<br>
cannot open shared object file: No such file or directory<br></div></blockq=
uote></div><br></span>Can you replicate this failure on demand?=C2=A0 I can=
&#39;t see why eg xdmcp needs to be in this list but say libxcb doesn&#39;t=
, which is presumably there that linkage is coming from.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">One solution for xdmcp w=
ould be to remove it entirely...</div><span class=3D"HOEnZb"><font color=3D=
"#888888"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></font></span></div>
</blockquote></div><br></div>

--94eb2c07c180da5b1f053e999834--
