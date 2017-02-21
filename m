Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4C89472F09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 13:50:48 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id u188so46389290qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 05:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vwDqJDpfC18dvuBZ5lLuf3A1IDv3D34ekJ7jJAVv4z4=;
	b=ZmdvoeHTfxoGVstkAWJygB+lPE6mnV+j97qPk/Z5F6nYFpipAT8m72yBlSr2HmEThj
	WhVGoFXMjwPLeJjMkfFKFzy/Cf+hUn1jW/dtXNQYAZOKJFH1QoVWVrOEMe19RA/DqYwe
	w4hYfhxpBVzPh29q34FRu5NnKjWegXwPtd8vLX7Rvs3U69HL+rWWEL3sXANAiN64rNbG
	co6+GdCGKp6Bxdxfoi3sTPj4h6WYNPxMZkYxggvjy5TISh8/c9bS3aWAOivVrBom653u
	vxhlYMI4vI3Dj7fHvtYWjDh/V7B3HN6v6nysvFa+BhzG2Dw4c0LLZ3vbDGR667bzTGjO
	wqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vwDqJDpfC18dvuBZ5lLuf3A1IDv3D34ekJ7jJAVv4z4=;
	b=Y25YCaSA2ryGH+lF4IcqOxht7dsjPSAkXKhu5j+cY1ZEnWTk7kWYCjSlttHEtIrfk4
	4DRx9zkWjAR2XJpZSOFfKjYuVl2VM4CaRcs76GcRAPCtNTFU+UPcAahCdcpd4NxhJt4i
	kRV9qgiKsCqIueGCPwd5fA90VfSr6t8jVWchBhhb+OgjKHpK0/1ELhJ+6JWKVhVsgtnn
	6v34nsW4RV+hezZzNj3TUkKJR75QTxjsGvn8/IQL7by9FTsw7yBbJ4zLowtL2HuLHNbl
	WHHHuXlcfHWxWqftvT2QRz/WIPBGthtIkiOFwGTuR/e/O63t66MzVMcHTDXFYDICIpkI
	6TDw==
X-Gm-Message-State: AMke39nMkzJkFjljo8GVTYaXcD1BQ1Ie1OPVYLPsVvTx3x/dPpQp2LNFM5GfEbXYLG64eR1ax1OL427W92EiiWkz
X-Received: by 10.55.40.67 with SMTP id o64mr28036095qkh.3.1487685050034; Tue,
	21 Feb 2017 05:50:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 21 Feb 2017 05:50:29 -0800 (PST)
In-Reply-To: <3d7395a3-90d4-c7d3-0e1f-066df6de70ba@windriver.com>
References: <cover.1487055395.git.hongxu.jia@windriver.com>
	<247659408552f6a0edba461a59a3cc53e85012ae.1487055395.git.hongxu.jia@windriver.com>
	<lyefz12gkp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYqkQfvgboQ5+wPuz2tVa8s=xDis_dX00ApAcHeLTNDrQ@mail.gmail.com>
	<CAJTo0LZyoG0qMwYYVM2wq7SRkz52QVQ3-CxZovNsiOXC6BVngw@mail.gmail.com>
	<lypoic1ho1.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<3d7395a3-90d4-c7d3-0e1f-066df6de70ba@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 13:50:29 +0000
Message-ID: <CAJTo0LY6dKcGdwEqYhGx0KgiTpcGqn=zz57MaGc8JMybwOkMcQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Feb 2017 13:50:49 -0000
Content-Type: multipart/alternative; boundary=001a1140af28f23b3b05490aaa2a

--001a1140af28f23b3b05490aaa2a
Content-Type: text/plain; charset=UTF-8

On 21 February 2017 at 01:34, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> How about directly remove the cf_flags assigning? Because our OE have
> correctly assigned it in bitbake.conf.
>

I'm a big fan of fixing upstream so we don't have to carry a patch
forever.  Their rationale I don't understand, but the implementation is
clearly broken.

Ross

--001a1140af28f23b3b05490aaa2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 February 2017 at 01:34, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ou" cl=
ass=3D"a3s aXjCH m15a5e4ecddac1bb3">How about directly remove the cf_flags =
assigning? Because our OE have<br>
correctly assigned it in bitbake.conf.<br></div></blockquote></div><br>I&#3=
9;m a big fan of fixing upstream so we don&#39;t have to carry a patch fore=
ver.=C2=A0 Their rationale I don&#39;t understand, but the implementation i=
s clearly broken.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a1140af28f23b3b05490aaa2a--
