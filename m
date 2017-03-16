Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id A725660620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 18:48:09 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id y76so47317334qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jh/TKbkh9m9sHp7Bfeaq2sxtZ1jqIXzEi8N8GqFDc+0=;
	b=bFfHl+NKNeAHRWhzVj3iKVcRUElei3S2mQCZD1K0pb9N6a8dNB7eAlLDM0rboMz1OD
	jtiAcj1+MB+2s9TBjJD1dELIXJCPfHjEVKtkVLsczo+tvNMWFWmhN0vHz846NSz0xLWs
	E7TIgUHYKCvebGII7H5AW/ASn2iv9AaHXoLo4UmSMCus0/XacvDyBI9a8VMWjg8MZtxy
	TQVdGuKsF3nPHnDyFXyg0YFbUzZ62yo1PKROnZXl8pfl2NGy+0SDbg/3yOL20FB8bqh2
	6zWUoePzt6ZalpoXALsprpFz6TvoPQ5nEiQqEx0psrchd4SL+k+od5DllLpiKn/SrrN0
	IbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jh/TKbkh9m9sHp7Bfeaq2sxtZ1jqIXzEi8N8GqFDc+0=;
	b=fB6arioEFhAM/l4VSnPrS12Ybj/c702dwWVudknXohwCbfLROYVn0elnKirxGCTVx6
	blEBgdWqI2Ziu+28EihmlJXaAgfFNV71RXlzXeZGNbfr4PV3dJjwpULKcPut5cWHU9Vi
	7d0LR+LR7T7K85k9nzvGrD8rWzekwsjdg+9XAMuwBpDBhLifgwc3+enAiRgPdfh1YMSH
	jKYXCXlZ5j8+ek49+whoyXovGNAOpgl6QHiAeSDeLCgDSu9L4UmjTLaCchaLxmHQUAYk
	8MmsBCOytVKEeUvDf4xz4/1kKhqge760lVb568K/th/5yBf9Acvgl6pKd26zJIQDusyp
	ExCw==
X-Gm-Message-State: AFeK/H0IgZQ/h/qlG+hT53FB4asxlit+t20cgYHjKoWM7wDOJVPWxGmy1Yc1krmZqALawv3c4TaalacNWoYzXuQd
X-Received: by 10.55.221.1 with SMTP id n1mr8884003qki.221.1489690090523; Thu,
	16 Mar 2017 11:48:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 16 Mar 2017 11:47:49 -0700 (PDT)
In-Reply-To: <1489689734-10232-1-git-send-email-paul.gortmaker@windriver.com>
References: <1489689734-10232-1-git-send-email-paul.gortmaker@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Mar 2017 18:47:49 +0000
Message-ID: <CAJTo0LY8Wp7owMzBwmX-cwF72Nq3VsRyNfGfbvFYHLsZ5cTJGQ@mail.gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Christos Zoulas <christos@zoulas.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] file: update SRCREV for 5.30 to fix fetch fail on missing commit
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
X-List-Received-Date: Thu, 16 Mar 2017 18:48:10 -0000
Content-Type: multipart/alternative; boundary=001a1149d7dcac45c3054add8047

--001a1149d7dcac45c3054add8047
Content-Type: text/plain; charset=UTF-8

On 16 March 2017 at 18:42, Paul Gortmaker <paul.gortmaker@windriver.com>
wrote:

> Machines that cloned a while ago will have the commit, but new
> deployments won't because it seems the upstream changed/rebased
> and the old commit ID has been garbage-collected away.  Hence
> the fetch fails to check out the named commit ID.
>

<explodes>

--001a1149d7dcac45c3054add8047
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2017 at 18:42, Paul Gortmaker <span dir=3D"ltr">&lt;<a href=3D"=
mailto:paul.gortmaker@windriver.com" target=3D"_blank">paul.gortmaker@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":c9" class=3D"a3s aXjCH m15ad86e3a5130a4d">Machines that cloned a while=
 ago will have the commit, but new<br>
deployments won&#39;t because it seems the upstream changed/rebased<br>
and the old commit ID has been garbage-collected away.=C2=A0 Hence<br>
the fetch fails to check out the named commit ID.</div></blockquote></div><=
br>&lt;explodes&gt;</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra"><br></div></div>

--001a1149d7dcac45c3054add8047--
