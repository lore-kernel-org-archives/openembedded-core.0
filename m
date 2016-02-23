Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0E77737B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 17:10:35 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id xg9so103278306igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 09:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UT5qkSVo85oZPI72IPLsgM4IkQB2JZvvLUFjaULPysU=;
	b=dEYdWwtCodwdgvW2L37a4dkCotXRuRyM5huhSvQQStSGGeUfLAWs2fLio9oh8lTQWV
	iL/EfBRDtQd/q1qEWET+UzOW8Wrwumt6KCHZYIXC772/ovPiAvY0GNIdQ9769sCxKvrV
	UC/OgCrG2cLuZ9VnGFVskNhe6RYgH2dlVpFqtRQg1HonflM3mX4Icl/LfPUhacke6Ad6
	3xU8ZI0JN1kh+oWQZbBzxbMIgBX7FNkstFGM8cHSWuf0je2PgBj3SkB8ok+XJjLa8nxG
	vpxyVPUtTBDwucUvyvxBeNsAN2glTWPVOtibmdzozdObNTIjGxAEzLkxNWTTkiS5al1g
	8mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UT5qkSVo85oZPI72IPLsgM4IkQB2JZvvLUFjaULPysU=;
	b=PBFKE7+uyC4i/5P4pbXeJVKufWr/38TXaeswijeaW4ZB/yIneMBgVaCx4VgAhfGcUf
	XW2e9gG+us14VV5o5PUbUMwPWPp73/RXpwulAdWGqFkSrp49rZwKrp3U8lMBhHI7uWL/
	S7KBfTj0zDlgZbGk9GWPwq/Hjh0mg5j0E7ZQLZ7KIHlfK7U5ijxdwvZcqfHk/APa8Jm/
	491xbhv43hOZ2JKpRIqytyIx+HIq/yPBW9j4tlKDGPPkd0FDbThGDWWBjy0w6MsXO/9e
	U+ge8oQCAAjP7zxerlFD09/+K5dJyUKIjiiIB3416BJF09NJidSWEk3kwiW8TGwM51zh
	ysmQ==
X-Gm-Message-State: AG10YOQwI0AuxyefjcmanJGhon9z6c0hLJzlLTpE58JVjHPB/478ZTaFBIxUUvg+iNPX7rXIrc4rF8z1fM1mlBLG
X-Received: by 10.50.126.8 with SMTP id mu8mr17461624igb.52.1456247435947;
	Tue, 23 Feb 2016 09:10:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 23 Feb 2016 09:10:16 -0800 (PST)
In-Reply-To: <CAJTo0LbCLQDSEHi+MHz-+=RoHmkvFinEPTZWEdA0GzWQOp03Zw@mail.gmail.com>
References: <cover.1456195451.git.kai.kang@windriver.com>
	<72d89d471771ecffc8eecc923581d3dcdcfdfa5e.1456195451.git.kai.kang@windriver.com>
	<CAJTo0LZStmCCA_ibNnxWO66CR+G3k51+bYVX2PrujJ2XD6mk2w@mail.gmail.com>
	<CAJTo0LbCLQDSEHi+MHz-+=RoHmkvFinEPTZWEdA0GzWQOp03Zw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Feb 2016 17:10:16 +0000
Message-ID: <CAJTo0Lbs50h0=46rp2ZV6cv=OgcyBCpfPJh6nvhEFB8HpMQzsA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd_base.bbclass: fix simultaneous with flock
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
X-List-Received-Date: Tue, 23 Feb 2016 17:10:36 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf200c19052c730711

--047d7b1635bf200c19052c730711
Content-Type: text/plain; charset=UTF-8

On 23 February 2016 at 17:01, Burton, Ross <ross.burton@intel.com> wrote:

> The *amazing* BB_VERBOSE_LOGS option (set to 1 in local.conf to get all
> shell scripts to do set -x) tells me this is due to missing quotes around
> the opts assignment:
>

Why do some of the opts assignments just do opts=$2, and others do a sed?

Ross

--047d7b1635bf200c19052c730711
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2016 at 17:01, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_ext=
ra">The *amazing* BB_VERBOSE_LOGS option (set to 1 in local.conf to get all=
 shell scripts to do set -x) tells me this is due to missing quotes around =
the opts assignment:</div><div class=3D"gmail_extra"></div></blockquote></d=
iv><br>Why do some of the opts assignments just do opts=3D$2, and others do=
 a sed?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--047d7b1635bf200c19052c730711--
