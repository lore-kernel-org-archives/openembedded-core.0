Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id C67DD6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 19:14:15 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id b62so84568777iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 12:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qV0LICVtNWCdxoAdinBo8JScwnGFyTcqiA2iOYCfAic=;
	b=dqcURjPsYQXC8urQNTSJ/sSfUnh3ERz2V/guHXWGiT5B3fS6UmKmvkx/HPy7q4us8d
	fUOS7L694bhcNgYyGJYV876UIWaGvUrMXh+kImm4Lwty/YRYsiYYxnhTEkMAn97PP+MT
	8oPrI1EVPdvN9hYk2jodzO/w87/6BTM/hnB5eCnL1MQKA+q6S41RTTxlJA4qCuf2ozvX
	Br9Xg1MdJ+iebGtxYEEq6+CpMqcs1sA17N7CQgfex09M6hS2woaTVNtDxuDT0PbO6K4V
	fFtegvidz9b5ZypMRLv+FPOASHRwtolf2RhC5HfOJZ8HR8uzcDnOXiWWYeFOASBcEfmp
	wIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qV0LICVtNWCdxoAdinBo8JScwnGFyTcqiA2iOYCfAic=;
	b=mji4ujepvIxWwlxxw3pfDJ7Ii6pX4NAVIMX8F2xb0j5AgXTGyQb829G5dD0zlnilGv
	jnS/HuR9r8rLgeawVGUs9pkQXHthEiKwQ3nfRxaEha2S0hiLZq16CYx+rIHMuDTRUAPQ
	eKwV+zxneGFW8yGpGg/N8AJbGW3d9Q829io1fFqCjR5rVzksJcrq8IAaMkppkPVF3BMQ
	nXE4zAo2liJAXbhN8Xuzp4wWAi2JCFh5Aecwp8YZxpa5fKpZ7ERL5Zjw9AnPzgjiKE7L
	HsnzeON+y/6+P8TnVsXI9bpe6dpmH2jynaNkooHJmfOu/RsTVmKKPm6cqvLCt1OCmKmz
	uwLA==
X-Gm-Message-State: ALyK8tJOYI3ovXoohgmsd4POGkFPWQpZBlFFpsx2IOGHtPerxt8R4lkuibfPKlHnihfYBHGDlJFT1wgNX5vwdMvL
X-Received: by 10.107.154.210 with SMTP id c201mr15767942ioe.99.1468523656145; 
	Thu, 14 Jul 2016 12:14:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 14 Jul 2016 12:13:56 -0700 (PDT)
In-Reply-To: <CAJTo0La0jY021zwJOOQnZeX_2dHwVD-FvJpXGgX-fZrh82giqQ@mail.gmail.com>
References: <1468514260-5560-1-git-send-email-ross.burton@intel.com>
	<1ce58e9f-a312-dd9a-d1b2-d787773fa18e@windriver.com>
	<CAJTo0La0jY021zwJOOQnZeX_2dHwVD-FvJpXGgX-fZrh82giqQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Jul 2016 20:13:56 +0100
Message-ID: <CAJTo0LZRQExoMedd6Vm_hDbY9ULjuogiCEz0sKsR4arga=P69g@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: use the host locale archive in nativesdk builds
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
X-List-Received-Date: Thu, 14 Jul 2016 19:14:18 -0000
Content-Type: multipart/alternative; boundary=001a1140fab6de859705379d4e4f

--001a1140fab6de859705379d4e4f
Content-Type: text/plain; charset=UTF-8

On 14 July 2016 at 20:11, Burton, Ross <ross.burton@intel.com> wrote:

> The problem for buildtools shipping just C.UTF-8 is that the moment you
> have a system that needs buildtools and use them, you're forced into using
> C.UTF-8 for everything in that session unless you keep that terminal for
> just bitbake invocations.  If you're like me and often run
> git/emacs/meld/etc in the same terminal as bitbake and don't speak English
> then your experience is going to suffer.


Clarification: whilst bitbake currently enforces en_US.UTF-8 internally to
ensure that it has a UTF-8 locale this is internal only.  The moment you
use buildtools then a number of binaries - such as git - now link to our
libc and if that doesn't understand your locale then you don't get
translations.

Ross

--001a1140fab6de859705379d4e4f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 July 2016 at 20:11, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">The problem for buildtools =
shipping just C.UTF-8 is that the moment you have a system that needs build=
tools and use them, you&#39;re forced into using C.UTF-8 for everything in =
that session unless you keep that terminal for just bitbake invocations.=C2=
=A0 If you&#39;re like me and often run git/emacs/meld/etc in the same term=
inal as bitbake and don&#39;t speak English then your experience is going t=
o suffer.</blockquote></div><br>Clarification: whilst bitbake currently enf=
orces en_US.UTF-8 internally to ensure that it has a UTF-8 locale this is i=
nternal only.=C2=A0 The moment you use buildtools then a number of binaries=
 - such as git - now link to our libc and if that doesn&#39;t understand yo=
ur locale then you don&#39;t get translations.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1140fab6de859705379d4e4f--
