Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 99D36771B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 21:16:32 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id z14so45470788igp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 13:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kR8DbpR8EsC7NvjWQa2yjiIE5hXRC3lHWKLqHMM/hd8=;
	b=m6I3OmB0CZxhEk9/P9rZBTNePrtwRLdn88RumqVSSDK63c60EF/UEBCE323Zw4WNwy
	MYUZABD8FvPJ57hfzVLglDo8Y8ByyCktrUKBPLfQrSR3Dqw6TUq8crLvwMrbEKWXfRIT
	Xd7JX+qh0F1+9q1F86JR2XoERaeMbjnptx/4Zh+NOyAZcZPSPKgBGLtCqREto0SKDYk2
	CbQ+Y7e/EQdzeAsIunUQKG9YRxsu9wAaicVj4y1q6AmpNrFaf3cM2tJ930TK4wJCi6Gf
	vCwU/dt1TJE1XkjExhnwJflPg1wVoMxL3otx0MzSc/erJtN+4I9NdFuvUU9IJt0Mr3lr
	LWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kR8DbpR8EsC7NvjWQa2yjiIE5hXRC3lHWKLqHMM/hd8=;
	b=VLUXJBZXpG0s8Gpu0+Fly4bGIxlg/HUXzl2zovdRrXm+R6kDL0A2Du9Wh0F1WyWsL7
	ZiZv+HexDEqvm1kjuXFMUEZdFhSIQZg9ZKBdCOWP8aBOSNEMNjQbPUCyOeQG90Suhyf5
	G/jmAlLwSSgUagSX+fUSR+PeKB18/ijAuE/MhQjxUerTMAkU+w9vHZ9eftQSyAAKGjiU
	O0DaptddbNzS8jN3aY+u9a52zzwvC94vUVHz8PcT8hgQ2eJRFQz86CRjYHmciqNeBP6H
	HItM/C18HW+/Yel6Ubd0q/CJbtQQrGw9LGRXpjzeZwvdhCJWL8EKVuuYqJyDeKiWiEDy
	xGOA==
X-Gm-Message-State: AG10YOQRsWF0IGK6lcgkMAOJpbPwSDS8mYKOn4prIDOMD8/wyQufYpPPYW37lWa+9zVdTQFIAzsNJlhVTx1Q4HQy
X-Received: by 10.50.126.8 with SMTP id mu8mr12499072igb.52.1454361392890;
	Mon, 01 Feb 2016 13:16:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 1 Feb 2016 13:16:13 -0800 (PST)
In-Reply-To: <1454264875-15715-1-git-send-email-paul.gortmaker@windriver.com>
References: <1454264875-15715-1-git-send-email-paul.gortmaker@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Feb 2016 21:16:13 +0000
Message-ID: <CAJTo0LaEyrNUZGwVOtSbWB4RbbwNAk4rjqm39mBLe4k+Cpwe9w@mail.gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] git: add site_perl to packaged files to fix QA install error
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
X-List-Received-Date: Mon, 01 Feb 2016 21:16:32 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf32e4b0052abbe6f0

--047d7b1635bf32e4b0052abbe6f0
Content-Type: text/plain; charset=UTF-8

On 31 January 2016 at 18:27, Paul Gortmaker <paul.gortmaker@windriver.com>
wrote:

> ERROR: QA Issue: git: Files/directories were installed but not shipped in
> any package:
>   /usr/lib64
>   /usr/lib64/site_perl
>   /usr/lib64/site_perl/5.22.1
>   /usr/lib64/site_perl/5.22.1/Git.pm
>   /usr/lib64/site_perl/5.22.1/Error.pm
>

Interestingly I'm seeing this:

git-perltools:
        /usr/bin/git-cvsserver
        /usr/lib/perl/site_perl/5.22.1/Error.pm
        /usr/lib/perl/site_perl/5.22.1/Git.pm

So my git is installing into site_perl too, but obviously multilib is
breaking something.

Ross

--047d7b1635bf32e4b0052abbe6f0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 January 2016 at 18:27, Paul Gortmaker <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.gortmaker@windriver.com" target=3D"_blank">paul.gortmaker@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(=
204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":21l" cla=
ss=3D"" style=3D"overflow:hidden">ERROR: QA Issue: git: Files/directories w=
ere installed but not shipped in any package:<br>
=C2=A0 /usr/lib64<br>
=C2=A0 /usr/lib64/site_perl<br>
=C2=A0 /usr/lib64/site_perl/5.22.1<br>
=C2=A0 /usr/lib64/site_perl/5.22.1/Git.pm<br>
=C2=A0 /usr/lib64/site_perl/5.22.1/Error.pm</div></blockquote></div><br>Int=
erestingly I&#39;m seeing this:</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra"><div class=3D"gmail_extra">git-perltools:</div><d=
iv class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/git-cvsserver=
</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/perl/=
site_perl/5.22.1/Error.pm</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /usr/lib/perl/site_perl/5.22.1/Git.pm</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">So my git is installing into sit=
e_perl too, but obviously multilib is breaking something.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div=
>

--047d7b1635bf32e4b0052abbe6f0--
