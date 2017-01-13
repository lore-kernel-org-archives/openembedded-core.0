Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6042971D9A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:26:17 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id l7so48696574qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WR1ZJGwJpchhZxawT+rbxA8e8Nd58+XRADa3irB0yRo=;
	b=fsDIsgXpRFAIh5oDn5uZn8oQnKhpiFQ+xOo6dND/vNyYKcjCpqyR7xQ8XHwY8OKkQF
	ggvHppTLCKILbcNWnyX42qUJcGpnVsod8ZAieeEnKsOTgcBiHwSvtAL3/S2LWhcjP1r2
	6JYVZtRzuUNfsJS7OC2ojvBF0cyF+2bTvEjDG8qegpqNCtZqwBJVaNHTy629n3oesPW6
	WYjdoG4qmk4Lape0514suACCRzj5eJkDROwPckkJjZrFgf5MkfKtJvvnvjhoSuL/fOw3
	0prboms6eA/7TvO4MGTLWJyycsfPpLxu37tQMXZx7BTXLEcRw7MdP0GppYqt7zzF9Uqp
	SZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WR1ZJGwJpchhZxawT+rbxA8e8Nd58+XRADa3irB0yRo=;
	b=NH5700IUePc9ai61ILmo4MpxLvXaXWCSMYxZbUL+7XXMhnr7i+UxRmX9jQdGukbdl+
	E68KTLhHveVnpFtdTdtFoKP5TTjbJb6+oZUpGHS5J8kQzGLX7gTxKl2/unJXuytiSv1x
	rjA1YK+EJbzR1IsDBGRn6ellPQ/he9AW/LGbJvxhWNWPqLn2CVZn0FPxXE7xwDzx8WMe
	J1929xI1axuGVrX7yDJm/K/BlscipGHNgiEkKGKU28hhFPlsS4hxbHgih+VtnXIlrK26
	Oee0ggRUvuu07mI18zw9FGTVbnSdsrXjxHzmQcyiiPh8uF5Af7Uh2md/KA7PmmLIB4Ly
	k0xg==
X-Gm-Message-State: AIkVDXJ8LxDIunynHRV4qnruuKFE3iRfXsFZNYbLa2TBanOFoyq+E+fmdnJLT7i7Z1G/LFR6v/hiBLPd2OPqtFq4
X-Received: by 10.200.53.247 with SMTP id l52mr12503780qtb.144.1484317577685; 
	Fri, 13 Jan 2017 06:26:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 13 Jan 2017 06:25:57 -0800 (PST)
In-Reply-To: <CADkTA4O0vhL8k+nvvwMsyBGt-YToan0KiSpMtSYOh+Qkwms6SQ@mail.gmail.com>
References: <cover.1484312322.git.ross.burton@intel.com>
	<CADkTA4NpPn78=SB+b2zO=Vd8z2SG+BtBLQi1ciKjXyEruoQ1rQ@mail.gmail.com>
	<CAHiDW_Fs4B1B2qzqsJqVdVuEZa40boKH8zGnON04W7L8=bfgSA@mail.gmail.com>
	<CADkTA4O0vhL8k+nvvwMsyBGt-YToan0KiSpMtSYOh+Qkwms6SQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Jan 2017 14:25:57 +0000
Message-ID: <CAJTo0LZcdu=N99Brb5zocN9w2cROjDU6dgT-1HwXvkJKpxe6cw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/80] Consolidated pull
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
X-List-Received-Date: Fri, 13 Jan 2017 14:26:18 -0000
Content-Type: multipart/alternative; boundary=001a1142ba20f419a10545fa9d49

--001a1142ba20f419a10545fa9d49
Content-Type: text/plain; charset=UTF-8

On 13 January 2017 at 14:19, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> I'm not much good with musl unfortunately, but honestly, I'm wondering how
> long we
> can keep this out with relatively few build issues. In tree, they'll get
> more attention.
>

This is a greater problem - the kernel guys seem to think that glibc is the
only C library worth thinking about.  Khem took the action to talk with
musl and get their headers fixed - which I believe is just adding a new
#define to them.

I'll continue stacking on 4.9 changes until they get sorted out.  I'll
> probably have some
> cycles near the end of next week to get lost in c library #ifdef's, if the
> issues are still
> around.
>

I keep on pushing the kernel bits to mut2, so feel free to send an updated
branch and I can merge that in too.

Ross

--001a1142ba20f419a10545fa9d49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2017 at 14:19, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I&#39;m n=
ot much good with musl unfortunately, but honestly, I&#39;m wondering how l=
ong we<br></div><div>can keep this out with relatively few build issues. In=
 tree, they&#39;ll get more attention.</div></blockquote><div><br></div><di=
v>This is a greater problem - the kernel guys seem to think that glibc is t=
he only C library worth thinking about.=C2=A0 Khem took the action to talk =
with musl and get their headers fixed - which I believe is just adding a ne=
w #define to them.</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>=
I&#39;ll continue stacking on 4.9 changes until they get sorted out.=C2=A0 =
I&#39;ll probably have some<br></div><div>cycles near the end of next week =
to get lost in c library #ifdef&#39;s, if the issues are still<br></div><di=
v>around.</div></blockquote></div><br></div><div class=3D"gmail_extra">I ke=
ep on pushing the kernel bits to mut2, so feel free to send an updated bran=
ch and I can merge that in too.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a1142ba20f419a10545fa9d49--
