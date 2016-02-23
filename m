Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6307727F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 12:20:39 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id hb3so97687028igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 04:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1W4XK9PHJkS9KKPwmOE6O0hkBGRZxP04jNd2zICac0w=;
	b=pzzKaxfLl8CPNZ9+bDy5OASmWVhZOPezevkIw1TR9SPMJ/lkshKQ/dBmex9NlOJcBR
	prCf/J+OxipFp73u9pmmcZA0/5dMlK3UD678G6YmRh6jn2qkSfyD8Su271xnfg9N+JfD
	u6hyKXxE8IRQWaLWOEB5YlIfxX9tSfNGEBmh6YuRCyvBQrsqr4LbcbXgteWyUzLdBRTX
	N3qQxlMxRa7ENtOqSI+e2/fxWMSPzue3WGMx3oNTPEF9q/5i+5Ug1a+HS39Y/fohgRZG
	rHkqNV2f8TICzius//8JWpImK6c/MqWjbmgTdYWFG+N/RHm+UIw4PHe6jx1KGM4fpTvu
	TmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1W4XK9PHJkS9KKPwmOE6O0hkBGRZxP04jNd2zICac0w=;
	b=Ib6gBEaTlBdXDhn3pbheayGIIgF3Z+9pWXa0vh1l2mMn3IG985izb+L8p8dPVLaiKG
	4eAdAGsb/hduhFqY4GihbbLCyOZ23CFxsQSdQ4i3BPjLLy1hEVAfB81+D7OJ8Zx3NtQM
	QiRDZskDQLfaArJ28jOLtVNgoeRFOhUbqVWSuq9uJraneY1s+24snGB6b8Ym8NPFApwr
	ad3W74RNLeho3eq2OqukqO/odv7CD48E8/z60gXQFeUp/bTWkciecSc3k2zOCIBTN/jr
	WlWIeb8S3h/xFp3RjnZfdo0HPrfHVmhTOubqg7WqbXcORLxt9QwnAOogDVSEIDMjFRYd
	+4+g==
X-Gm-Message-State: AG10YORERKorpSx+GnukdMmk30ZKnv9PJksMxpFZqe/FRyEhGI8ErwkHm54tQiPIrZxvv2Xw/s7FbnpP4o0MrgUM
X-Received: by 10.50.78.227 with SMTP id e3mr15618702igx.64.1456230040618;
	Tue, 23 Feb 2016 04:20:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 23 Feb 2016 04:20:21 -0800 (PST)
In-Reply-To: <1456228061-17206-2-git-send-email-guojian.zhou@windriver.com>
References: <1456228061-17206-1-git-send-email-guojian.zhou@windriver.com>
	<1456228061-17206-2-git-send-email-guojian.zhou@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Feb 2016 12:20:21 +0000
Message-ID: <CAJTo0LZFXvE2t-3azEnjLDvFm8J1osmLDygTyPYtzRGAvX476w@mail.gmail.com>
To: guojian.zhou@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oe-core: Update alternatives of info pages
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
X-List-Received-Date: Tue, 23 Feb 2016 12:20:40 -0000
Content-Type: multipart/alternative; boundary=089e0111b73448695d052c6efa7a

--089e0111b73448695d052c6efa7a
Content-Type: text/plain; charset=UTF-8

On 23 February 2016 at 11:47, <guojian.zhou@windriver.com> wrote:

> From: Guojian Zhou <guojian.zhou@windriver.com>
>
> Update alternatives of info pages in several packages.
>
> Signed-off-by: Guojian Zhou <guojian.zhou@windriver.com>
>

Presumably these files are all identical, so would it be simpler to delete
the conflicting files in gdb and autoconf, leaving binutils (which will
generally be installed if gdb or autoconf is) to ship the documentation?

Ross

--089e0111b73448695d052c6efa7a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2016 at 11:47,  <span dir=3D"ltr">&lt;<a href=3D"mailto:guoj=
ian.zhou@windriver.com" target=3D"_blank">guojian.zhou@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":xf" class=3D"=
a3s" style=3D"overflow:hidden">From: Guojian Zhou &lt;<a href=3D"mailto:guo=
jian.zhou@windriver.com">guojian.zhou@windriver.com</a>&gt;<br>
<br>
Update alternatives of info pages in several packages.<br>
<br>
Signed-off-by: Guojian Zhou &lt;<a href=3D"mailto:guojian.zhou@windriver.co=
m">guojian.zhou@windriver.com</a>&gt;</div></blockquote></div><br>Presumabl=
y these files are all identical, so would it be simpler to delete the confl=
icting files in gdb and autoconf, leaving binutils (which will generally be=
 installed if gdb or autoconf is) to ship the documentation?</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e0111b73448695d052c6efa7a--
