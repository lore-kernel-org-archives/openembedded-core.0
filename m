Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2CAD672F7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 16:30:25 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id n127so2529364qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 08:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z4HNLbnLVrUw+8UNT43VHC/lbInAHt44vM39n1sBPGo=;
	b=oA28hC1LAiApUVTLy5IS/v7yfRdW5MlJZ+sH2FlfQd8dqPcpJdwmJBoQeq/ZPj15YX
	xTcV5s7ch4nURaDOcfDjGQ+imLyxouy3M1+Qpi8eEK7MFqiBNaiNcYZz+b5bg1GMrGAs
	rYCmAHE4AX1ZFB1863JfsVyCRa130HeDTdJlpMD1+NM3//zgH95iLspx+VsE2xdVU38x
	ErW+xf6bXWB36yIoOk/IetNtuZMaMeWxTmOdA5S1aLPwC0xc7cqUN1s2BQFLJYrC45be
	nXYHnFncYab8gZJBxuVXAHw/Ker0BA2jfpazL2p3snoGfJO8oJ5FEpTLB3iDr2inIE3r
	356A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z4HNLbnLVrUw+8UNT43VHC/lbInAHt44vM39n1sBPGo=;
	b=iFP4fjl6JKZ7ewHAn8DU86mycY5zNjqlh3h5HltFCAhowc0+PLEzKksw7wxXNWYgC4
	6Vl8Q0Oz/nl3CNI/Cr1qwW8zs9x9GhZV4lszhEXY/2EF+DC9pcbnUJO/+mYdT/CF7QyB
	szWoh6VhwJhJShpTbMlOTzFpfxfWntkLGIM6CO1hX7yRyDGabMr0xiYSs+JiBkcZRqL8
	1W72hvF4kv6bxnDNdDTnO9jZ192LD7YqZjsbD2F8h81G4zZsrZAk980SQnBmqusj82tJ
	a7dYcrx49dUrHJ5BhjuMhDTku4NLM7QHq90wtVHcSLGoNUzXKN6RgC2qdDysOE/Miwyz
	fGtA==
X-Gm-Message-State: AMke39mcisc9HaYwThkMIwbSum0wOyRqLwv7ryvcRlv6lYxpkBhYWpkwIbVw3VVIZFyO+sLAonl03kC2Z7LMk8zd
X-Received: by 10.55.40.27 with SMTP id o27mr24380345qkh.221.1487694627203;
	Tue, 21 Feb 2017 08:30:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 21 Feb 2017 08:30:06 -0800 (PST)
In-Reply-To: <CAJTo0LY6dKcGdwEqYhGx0KgiTpcGqn=zz57MaGc8JMybwOkMcQ@mail.gmail.com>
References: <cover.1487055395.git.hongxu.jia@windriver.com>
	<247659408552f6a0edba461a59a3cc53e85012ae.1487055395.git.hongxu.jia@windriver.com>
	<lyefz12gkp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYqkQfvgboQ5+wPuz2tVa8s=xDis_dX00ApAcHeLTNDrQ@mail.gmail.com>
	<CAJTo0LZyoG0qMwYYVM2wq7SRkz52QVQ3-CxZovNsiOXC6BVngw@mail.gmail.com>
	<lypoic1ho1.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<3d7395a3-90d4-c7d3-0e1f-066df6de70ba@windriver.com>
	<CAJTo0LY6dKcGdwEqYhGx0KgiTpcGqn=zz57MaGc8JMybwOkMcQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 16:30:06 +0000
Message-ID: <CAJTo0LbY_N1A8=TWULFtnZw28A6Ze__NPGV2qJHqYrF+XpzssQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 21 Feb 2017 16:30:26 -0000
Content-Type: multipart/alternative; boundary=001a11441144ca3a8f05490ce59a

--001a11441144ca3a8f05490ce59a
Content-Type: text/plain; charset=UTF-8

On 21 February 2017 at 13:50, Burton, Ross <ross.burton@intel.com> wrote:

> I'm a big fan of fixing upstream so we don't have to carry a patch
> forever.  Their rationale I don't understand, but the implementation is
> clearly broken.
>

Here's my current fix:

+      cf_flags=`echo "$CC" | awk  'BEGIN{ORS=" ";RS=" "} /^-.+/ {print
$1}'`
+      CC=`echo "$CC " | awk  'BEGIN{ORS=" ";RS=" "} /^[^-].+/ {print $1}'`

Works for ccache, and doesn't involve a long/horrible sed.  I've also sent
it upstream.

Ross

--001a11441144ca3a8f05490ce59a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 February 2017 at 13:50, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div class=3D"gmail_extra">I&#39;m a =
big fan of fixing upstream so we don&#39;t have to carry a patch forever.=
=C2=A0 Their rationale I don&#39;t understand, but the implementation is cl=
early broken.</div></blockquote><div><br></div><div>Here&#39;s my current f=
ix:</div><div><br></div><div>+ =C2=A0 =C2=A0 =C2=A0cf_flags=3D`echo &quot;$=
CC&quot; | awk =C2=A0&#39;BEGIN{ORS=3D&quot; &quot;;RS=3D&quot; &quot;} /^-=
.+/ {print $1}&#39;`</div><div>+ =C2=A0 =C2=A0 =C2=A0CC=3D`echo &quot;$CC &=
quot; | awk =C2=A0&#39;BEGIN{ORS=3D&quot; &quot;;RS=3D&quot; &quot;} /^[^-]=
.+/ {print $1}&#39;`=C2=A0</div></div><br></div><div class=3D"gmail_extra">=
Works for ccache, and doesn&#39;t involve a long/horrible sed.=C2=A0 I&#39;=
ve also sent it upstream.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a11441144ca3a8f05490ce59a--
