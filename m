Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8976FF77
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 21:26:40 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id mv3so73665893igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 13:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aklV57XETN6zk6aVFBoYVpSwLNW1orcuPiuQuBwJNKc=;
	b=GYDOxvLJHsNA0EZt0H9pF29eJw91WqltZo7yqG9LLuNw95b7fAWGL+rSSxTmkkH+IJ
	lDiLc0Kz1kJQ7SUvzYQXmliTiLicKUEJhbNOIMyUuYe+ZYA67S1Vze41DAGWgKLRHv9z
	54EDpWHVRpLkZh3wgA8E1dMe2hNBZfNYL0H4MLG1fSN18AJ9tZlIcMlnTEM/n+KXx12j
	1K353cv2OiwZNCl4mCrl+JLRcUMQnSgnvnvA+a0ecGATJIy49cyuC/giKs4MKlOWvydw
	l/8wdwfCh4/W6sNkssISvct5t7hhJHAB/Tv7aidIt8JFJZMPuuIe4NpltLxz83TulGeF
	mclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aklV57XETN6zk6aVFBoYVpSwLNW1orcuPiuQuBwJNKc=;
	b=IlBia/8a67SvMvh7+bl2oXPEftp5lLefRBH8TEf9gtW4UrqxHyv45tUpzSPzkDE1lJ
	nMhSunbpI5DOQaBY69Rf6JNImAzQfkn3AXfwqOA3sgmpwO0RnYwvhVGWmAykSYU9nZ3g
	MeIYWU7zNeGrDiGCEwEzNLyFwJJESeJ08OuAg84upULnzKlb8uqHMv44b3dQk0+tAp3A
	sxmtpuIwLhyR6TbCyj9XeZ6Fm3b2JgDPTfdnlMaw/h7/Q2syl9ICYgXgmFT4/XaESNa7
	0fAMx6LNnbkCWHy6Hq+H2AJYSV9jaXFYFacffs39pJLJyIQbryA0hm1mFnmJ8LTy1O1s
	QQ1A==
X-Gm-Message-State: ALoCoQk42l+ggbx0PuCqLQ8r6iJPKJX3DiE53671yEslwE/r32no4u+9G8WOp/ggdsypGbjxg1jQrCM6BiUrlH9u7rcfvqUe0arUkYJ6+WGzjWEWCRbtp34=
X-Received: by 10.50.126.8 with SMTP id mu8mr31130067igb.52.1450906001551;
	Wed, 23 Dec 2015 13:26:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 23 Dec 2015 13:26:22 -0800 (PST)
In-Reply-To: <CAJ86T=XDVLVzraADPy6O=9SiKpcZai__8m9VY=8DCEC4u=RHrw@mail.gmail.com>
References: <1450827499-32386-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LYLr=Qq1ETPdwTyjGddUNmuZvx+z7GtzTM5-N+EeNcHkQ@mail.gmail.com>
	<CAJ86T=XDVLVzraADPy6O=9SiKpcZai__8m9VY=8DCEC4u=RHrw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Dec 2015 21:26:22 +0000
Message-ID: <CAJTo0Lat-1Zsmn2SAdDfaXbUuSkZyAJT7u9i3-37UZKsEQpZQw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>,
	Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] strace: update 4.10 -> 4.11
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
X-List-Received-Date: Wed, 23 Dec 2015 21:26:41 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bfd34ecb052797602e

--047d7b1635bfd34ecb052797602e
Content-Type: text/plain; charset=UTF-8

CCing Robert as he wrote the patch that introduced the ARCH assignment.

On 23 December 2015 at 20:49, Andre McCurdy <armccurdy@gmail.com> wrote:

> Error is due to do_compile_ptest() forcing ARCH="${TARGET_ARCH}". The
> tests Makefile uses ARCH to setup include paths but there isn't a
> direct mapping between OE's arch values and the ones expected by
> strace. In this case ARCH should be "i386" in order to find the header
> file correctly, not "i586".
>
> Removing ARCH="${TARGET_ARCH}" from do_compile_ptest() and letting
> strace auto detect fixes the build failure.
>
> Forcing ARCH was introduced here:
>
>
> http://git.openembedded.org/openembedded-core/commit/?id=af76eb0405352d66dfd00d7f856f401d892855e1
>
> But I'm not 100% clear what the original problem was though, so I'm
> not sure about just undoing that change without some more
> investigation. Any thoughts?
>

I guess if it autodetects correctly now then the workaround isn't
required.  Robert, what do you think?

Ross

--047d7b1635bfd34ecb052797602e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">CCing Robert as he wrote the pa=
tch that introduced the ARCH assignment.</div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On 23 December 2015 at 20:49, Andre McCurdy <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank=
">armccurdy@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div id=3D":18h" class=3D"a3s" style=3D"overflow:hidden">Error is due to=
 do_compile_ptest() forcing ARCH=3D&quot;${TARGET_ARCH}&quot;. The<br>
tests Makefile uses ARCH to setup include paths but there isn&#39;t a<br>
direct mapping between OE&#39;s arch values and the ones expected by<br>
strace. In this case ARCH should be &quot;i386&quot; in order to find the h=
eader<br>
file correctly, not &quot;i586&quot;.<br>
<br>
Removing ARCH=3D&quot;${TARGET_ARCH}&quot; from do_compile_ptest() and lett=
ing<br>
strace auto detect fixes the build failure.<br>
<br>
Forcing ARCH was introduced here:<br>
<br>
=C2=A0 <a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=
=3Daf76eb0405352d66dfd00d7f856f401d892855e1" rel=3D"noreferrer" target=3D"_=
blank">http://git.openembedded.org/openembedded-core/commit/?id=3Daf76eb040=
5352d66dfd00d7f856f401d892855e1</a><br>
<br>
But I&#39;m not 100% clear what the original problem was though, so I&#39;m=
<br>
not sure about just undoing that change without some more<br>
investigation. Any thoughts?</div></blockquote></div><br>I guess if it auto=
detects correctly now then the workaround isn&#39;t required.=C2=A0 Robert,=
 what do you think?</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--047d7b1635bfd34ecb052797602e--
