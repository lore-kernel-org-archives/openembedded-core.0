Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id C132F71D9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 23:21:28 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id x35so25195114qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 15:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YetyRs/v4tnYs15fCuXm4K/npJ6nAgAUhP2IVqtywgA=;
	b=pp4+Uy+c7jJ8g6iEdbkY3ymNC4MnGLZ2dd/zqXrakeYWvJxyEVg+YZACZ0G97eUMVB
	1KCq4XgsNKC8Owk3QWzL2Tta1bJtcIQ+agU2Q8ZpjP0ry1EtKieS1kMLM3+pcjRkwQ2Q
	Ashxvnzi78kieG9z358sywZKZs5jw/+Tak0nISYPRRN3mYgSEYEojskDZ0VzbZKER4L3
	L9Mh3fbI1oP3xpr3FJy0qT5zg//Vnhha/wM0a5tR8mFolk7zFClIznZx02Qru5z7HZ9J
	WuuOoRQLZltcZm6dmsSebzGaxrU/3LblO+mxXQUEu/BTTA1cGLiWxa9z8vwJNdujM9r8
	s8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YetyRs/v4tnYs15fCuXm4K/npJ6nAgAUhP2IVqtywgA=;
	b=LvuLDE5791mbW7MsLDsaDSLbw5l0ZXVDIyUD0wUvrmv197f/B3wfcG0/FsAo1W5o0q
	IKoj58sFHeaaO6kOxcdpP5PoMuSPbfc6ZveUpKuvEEWC5xhnH5vABRa49OSx34yyzSUi
	SAA8slIFYRUKp66eSCPf1DLy44ahJ+C4V1sUUJmGBY/pXG9U2j0hrFKPLZdexh0JLBvO
	YV9PUqLy/438rDuXNp3M+7xjO1ATpwUrDGzIOQF4GMQoFLwe6QnFAuBtUXMvA56ObYt0
	iserDCFoGJdbVvu9NNwVfNX4NExuYrDqa3TdG0DhfmflT6x3DLPlcaedPxKoo5mAvaVl
	z/TQ==
X-Gm-Message-State: AMke39k4IojiE3XiMAIGIpnNeDkFn8kw8oK6Q8+V7uiwenfe2RVNHS/rJ8P3HV7nJ5fKcJPj/tmxge9bp6yoCEr8
X-Received: by 10.237.32.230 with SMTP id 93mr9949325qtb.144.1487632889093;
	Mon, 20 Feb 2017 15:21:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 20 Feb 2017 15:21:08 -0800 (PST)
In-Reply-To: <lyefz12gkp.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1487055395.git.hongxu.jia@windriver.com>
	<247659408552f6a0edba461a59a3cc53e85012ae.1487055395.git.hongxu.jia@windriver.com>
	<lyefz12gkp.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Feb 2017 23:21:08 +0000
Message-ID: <CAJTo0LYqkQfvgboQ5+wPuz2tVa8s=xDis_dX00ApAcHeLTNDrQ@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] ncurses: fix beaglebone do_configure failure
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
X-List-Received-Date: Mon, 20 Feb 2017 23:21:34 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c9b9ce9719f0548fe85a2

--94eb2c0c9b9ce9719f0548fe85a2
Content-Type: text/plain; charset=UTF-8

On 14 February 2017 at 10:48, Enrico Scholz <enrico.scholz@sigma-chemnitz.de
> wrote:

> a) bother the ncurses author to remove the stupid CC sanity check, or
>
> b) create a wrapper around CC like in
>

c) fix the function that detects the "broken" use of CC as it should be
extracting the flags and moving them to CFLAGS.  Clearly this isn't working
somewhere.

Ross

--94eb2c0c9b9ce9719f0548fe85a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 February 2017 at 10:48, Enrico Scholz <span dir=3D"ltr">&lt;<a href=
=3D"mailto:enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.scholz=
@sigma-chemnitz.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":3zo" class=3D"a3s aXjCH m15a3c3df9bd4e40d">a) bother the ncurse=
s author to remove the stupid CC sanity check, or<br>
<br>
b) create a wrapper around CC like in</div></blockquote></div><br>c) fix th=
e function that detects the &quot;broken&quot; use of CC as it should be ex=
tracting the flags and moving them to CFLAGS.=C2=A0 Clearly this isn&#39;t =
working somewhere.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--94eb2c0c9b9ce9719f0548fe85a2--
