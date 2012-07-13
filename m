Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Spcq2-0003Zi-OI
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 12:11:06 +0200
Received: by ghbz2 with SMTP id z2so3125767ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=0MjgY5PN0/H/Tzfig2jn0TjN7Wj+i4ZgEIZV1url3kk=;
	b=cSHrelDeHaQrKa76scy6J6Xsp2OegNlPEgcK0zFpuKuQCXP97L/umZxGTa9rvmZc75
	vmCjzJjyFqHbILP9Cp7Nii9HTcc1ymZpu6Q+G5R0y5hRfoULxpwh3qornzC/QgDvu4pX
	XlS73eLG62T6rWV/oNrdyFrrfMrTOWEp8FBCTUrDoGw749mmEhkpqKB6QwwgObld73NO
	5ZHJ4I66KQ2HzVFfno+JJSf+ZRZwwIb1I0c6mqmsUMipFWpBB9T2kdmaMx0gmCL7n/PY
	90XRdni3x8O/bQdBlnRtKQTmRHq8zS+se2s6ctiBnBXNJ2UKyxx2owGbuMxGzIAw/kbA
	3AGw==
Received: by 10.50.11.129 with SMTP id q1mr383860igb.8.1342173592070; Fri, 13
	Jul 2012 02:59:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Fri, 13 Jul 2012 02:59:30 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAAQYJAsNv_R_GXrXY2OjU8Y-ft52V9Wzp6Y24sZX=d-hn=Zcig@mail.gmail.com>
References: <cover.1342116650.git.andrei@gherzan.ro>
	<8586287A-0F78-4778-8491-B8E1C70644B1@dominion.thruhere.net>
	<4FFF23E2.5040007@linux.intel.com>
	<54ABEC81-9673-446D-AD9A-79394DEEA6E8@dominion.thruhere.net>
	<CAAQYJAv0Zigzx2JrqOhd9_jNN8gFryw4ikhqsRK0e74Fim6=wA@mail.gmail.com>
	<CAK18fxErPLi5685HPfL8HtvF7fziHHBc0cc+=MKWnec4Lurgug@mail.gmail.com>
	<CAAQYJAsNv_R_GXrXY2OjU8Y-ft52V9Wzp6Y24sZX=d-hn=Zcig@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 13 Jul 2012 12:59:30 +0300
Message-ID: <CAK18fxGBFDsgXLJ4oDLge-=C9s=KpGN0aBE8hd7fjjBgHd+fKA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkxUyEZCPKrUDu0omnnmvHt5wJj3S4ZqxDx4ImcejpKPaQKfgo5zox78aVUJZQo0/4cyng5
Subject: Re: [PATCH 0/3] Fix xz compression command and optimize compression time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2012 10:11:06 -0000
Content-Type: multipart/alternative; boundary=e89a8f50320c2ea9ed04c4b3247a

--e89a8f50320c2ea9ed04c4b3247a
Content-Type: text/plain; charset=ISO-8859-1

>
>
> Well, in oe-core maybe.
> Upstream they are more conservative, see that man.
>
> "The default preset level in LZMA Utils is -7 while in XZ Utils it is
> -6, so both use 8 MiB dictionary by default."
>
>
So you were talking about upstream. Ok got that.

@g

--e89a8f50320c2ea9ed04c4b3247a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"im"=
><br>
</div>Well, in oe-core maybe.<br>
Upstream they are more conservative, see that man.<br>
<br>
&quot;The default preset level in LZMA Utils is -7 while in XZ Utils it is<=
br>
-6, so both use 8 MiB dictionary by default.&quot;<br><br></blockquote><div=
>=A0</div><div>So you were talking about upstream. Ok got that.=A0</div><di=
v><br></div><div>@g</div></div>

--e89a8f50320c2ea9ed04c4b3247a--
