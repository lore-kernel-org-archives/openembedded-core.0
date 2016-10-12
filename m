Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id B02A46B6EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 09:27:14 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id k64so24519537itb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YBwR0Ixi3RgQXZDOznmGkILdFditEqCevI4+t1jwo7Q=;
	b=WK05V98pSshw6V+ppQmUlkw3RCxdE/nN4h6AJbxJElfRu5RsN+QP0H3DdSb9b0OUxL
	Ex17/RgEbYShPFYuVnW8Rjvzt1nM45zW5qXwKtdsNub7H2s6io9NPwqFN2yqEd8MmvAk
	JW3kpQeiQUgsgzRV72J3IyZQgr1Qrxasg7i66VN3S+wUvUbk9ANLZ60w0I2Oj+4WDXoq
	ux3nrkAWT5W8ommVD45HRtwj64WQfkGAwm2WwR0n1TYKWuy46USyyPXd+m9mG2Vj1gvj
	buQJ6KrfC3cC0+2dTb3eF3WBOs51+qA/WlTxwGPnFNjnIdH47l7rE/hmospWbE0QsZlx
	BY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YBwR0Ixi3RgQXZDOznmGkILdFditEqCevI4+t1jwo7Q=;
	b=cGeD+1YSaMSZ4TFMhbKewrOtNPqgOmD5yFVTvvnHIQixYCoPflzHiass8Y/C8DV4er
	EqYFG+HD/f33gR7PafXCU9tnm8UHMNkg+Fvzv0T5w3TPVnR0Cq8V6trwz0/fXNnJfYVz
	pF/jP5NhaWdK94laYM9MZUJM3SjXX+2OTiTC46Q4AUYx4VPOjf8Tg0f7P/NKx7sItbLM
	yRFU54N+Cgu8eGXtKspOJLbvUjQkeEJ/lLFg5801qNKdpQhEPCIa1iwUmn2EKvzJ5VVh
	UwCevyR+mDqwANFqKlSZvhROFlziCQzTWkesCR7LZGGeN6A5IxKux5ZeGiS5iRzL9ACA
	O8aQ==
X-Gm-Message-State: AA6/9RlvZsT+EEe+SRwG4MV9UkHYZBqED18c1bLEB8EkQoVZrztue5ew0x+X+OAfXx9+BNCZk/A/aZbRLujeaRiW
X-Received: by 10.36.181.78 with SMTP id j14mr1624883iti.20.1476264435630;
	Wed, 12 Oct 2016 02:27:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Wed, 12 Oct 2016 02:26:55 -0700 (PDT)
In-Reply-To: <20161012023734.11991-1-kai.kang@windriver.com>
References: <20161012023734.11991-1-kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Oct 2016 10:26:55 +0100
Message-ID: <CAJTo0LbhDO+ijOerKVao+s+fruJK98VqQTeMSzxir3_eYWLMbw@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-sanitizers: allow empty for lsan and tsan packages
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
X-List-Received-Date: Wed, 12 Oct 2016 09:27:15 -0000
Content-Type: multipart/alternative; boundary=f403045d9aaa47d6aa053ea799a8

--f403045d9aaa47d6aa053ea799a8
Content-Type: text/plain; charset=UTF-8

On 12 October 2016 at 03:37, <kai.kang@windriver.com> wrote:

> gcc checks threads and leak sanitizers support when do configure. If not
> supported, packages of tsan and lsan are empty. If add such package to
> image it fails to build:
>
> | ERROR: core-image-minimal-1.0-r0 do_rootfs: libtsan-dev not found in the
> feeds
> | ERROR: core-image-minimal-1.0-r0 do_rootfs: This is often caused by an
> empty
> | package declared in a recipe's PACKAGES variable. (Empty packages are not
> | constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)
>

Not sure I'm understand where those dependencies are coming from, how would
I replicate this?

Ross

--f403045d9aaa47d6aa053ea799a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 October 2016 at 03:37,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.k=
ang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":78s" class=3D"a3s aXjC=
H m157b6cadd316c3fb">gcc checks threads and leak sanitizers support when do=
 configure. If not<br>
supported, packages of tsan and lsan are empty. If add such package to<br>
image it fails to build:<br>
<br>
| ERROR: core-image-minimal-1.0-r0 do_rootfs: libtsan-dev not found in the =
feeds<br>
| ERROR: core-image-minimal-1.0-r0 do_rootfs: This is often caused by an em=
pty<br>
| package declared in a recipe&#39;s PACKAGES variable. (Empty packages are=
 not<br>
| constructed unless ALLOW_EMPTY_&lt;pkg&gt; =3D &#39;1&#39; is used.)<br><=
/div></blockquote></div><br>Not sure I&#39;m understand where those depende=
ncies are coming from, how would I replicate this?</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--f403045d9aaa47d6aa053ea799a8--
