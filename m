Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 86165731E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:43:44 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id g73so88660254ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 04:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=A8IP+YRmcoNbY//J6PhxJvLbqyCobwiSiJxjzD9//IA=;
	b=CVkb76GLGr5DJ4SBmSG3Of3c+66WtXQ1A9Un0xwiFQaCAPb4TmbhX4rFq8/gEsjfbs
	YjcXmRrNX9s2EGB6Sr71kMUNeF2wo78UCBhJ7uee6TAQ9e+k7ykMxqmwPmdQD7GFAE3t
	tiVcOoyzeAzknPdE1ptpK5DBP4KgEw/NnncdG5PSE4ALjy6wlH/jfUFuZf2RGIaYWVoA
	b0uxhBapege+bNrFaZ6if0QWXb25qeLuzhFsbJ9YXNzeYLOfFL3CEXAonQM+VyFyomch
	KxE7Zq/9I3SfvQS3u4cq83aBNKWUA89o0W7tNbp1yiWV002io3Ip8vLIZwr82/bQCKng
	NsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=A8IP+YRmcoNbY//J6PhxJvLbqyCobwiSiJxjzD9//IA=;
	b=SZcxvrQKNqS0ayWGAZLNduDyQmsfN2zv5KsakNW2jHK4Yc0xtEJctbI0Etrc/spCay
	dFnNuYtEL3keUzHdaACXMBl95PDCAupwHTag6hrkobAAsXuBNTuiUIgYd8mLOjifiR1y
	7uMmBSoSTlJTveNT1T4trTlqfeA9bnCzuVg7bfO1/dJL7ivFXcv+Kh52gRZ2FvJNrFU9
	+TgjhDKf95GFXnGQFquQuT0h7hreG4Qqyqa6lq/7g+IxeL1tZzbhqZn8C5RRR/0gGUKI
	dfZHaWqwe15NfW8E2u+uf4DcEx4cMAdkcbvWoNrDSCtvr8S+zW4wD254wbSDnrHoB8U3
	LiUQ==
X-Gm-Message-State: AG10YOSiJ7LAaxEYAU2+FzeA790JyD2Ol/NK7FsD3P2WCHPtVH7gyD6JVNhji5gCCvtz8b/rX0unSm0E+ZsUB7JM
X-Received: by 10.107.3.154 with SMTP id e26mr3144158ioi.99.1453466625793;
	Fri, 22 Jan 2016 04:43:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 22 Jan 2016 04:43:26 -0800 (PST)
In-Reply-To: <d4925a4659964507e08b4b9e67c88f3913fbc860.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<d4925a4659964507e08b4b9e67c88f3913fbc860.1453029952.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jan 2016 12:43:26 +0000
Message-ID: <CAJTo0LaFqUeC9+qWrovAcahz93aHgWvem2BRHXKgEz0_KYom5Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 64/73] acpid: Fix build on musl
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
X-List-Received-Date: Fri, 22 Jan 2016 12:43:45 -0000
Content-Type: multipart/alternative; boundary=001a113ec10aec6eaa0529eb91e3

--001a113ec10aec6eaa0529eb91e3
Content-Type: text/plain; charset=UTF-8

On 17 January 2016 at 11:36, Khem Raj <raj.khem@gmail.com> wrote:

> implement isfdtype() if libc does not provide it
>
> Fix build when S != B
>
> use top_builddir instead of top_srcdir
>

This and Maxin's upgrade are conflicting:

NOTE: Applying patch '0001-Define-isfdtype-if-libc-doesn-t-have-it.patch'
(../meta/recipes-bsp/acpid/acpid/0001-Define-isfdtype-if-libc-doesn-t-have-it.patch)
ERROR: Command Error: exit status: 1  Output:
Applying patch 0001-Define-isfdtype-if-libc-doesn-t-have-it.patch
patching file configure.ac
Hunk #1 FAILED at 41.
1 out of 1 hunk FAILED -- rejects in file configure.ac
patching file sock.c
Hunk #1 succeeded at 61 with fuzz 2 (offset 11 lines).
Patch 0001-Define-isfdtype-if-libc-doesn-t-have-it.patch does not apply
(enforce with -f)

Can you see if anything else is required beyond Maxin's upgrade?

Ross

--001a113ec10aec6eaa0529eb91e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 January 2016 at 11:36, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D":v0i" class=3D"" style=3D"overflow:hi=
dden">implement isfdtype() if libc does not provide it<br>
<br>
Fix build when S !=3D B<br>
<br>
use top_builddir instead of top_srcdir</div></blockquote></div><br></div><d=
iv class=3D"gmail_extra">This and Maxin&#39;s upgrade are conflicting:</div=
><div class=3D"gmail_extra"><br>NOTE: Applying patch &#39;0001-Define-isfdt=
ype-if-libc-doesn-t-have-it.patch&#39; (../meta/recipes-bsp/acpid/acpid/000=
1-Define-isfdtype-if-libc-doesn-t-have-it.patch)<br>ERROR: Command Error: e=
xit status: 1 =C2=A0Output:<br>Applying patch 0001-Define-isfdtype-if-libc-=
doesn-t-have-it.patch<br>patching file <a href=3D"http://configure.ac">conf=
igure.ac</a><br>Hunk #1 FAILED at 41.<br>1 out of 1 hunk FAILED -- rejects =
in file <a href=3D"http://configure.ac">configure.ac</a><br>patching file s=
ock.c<br>Hunk #1 succeeded at 61 with fuzz 2 (offset 11 lines).<br>Patch 00=
01-Define-isfdtype-if-libc-doesn-t-have-it.patch does not apply (enforce wi=
th -f)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Can you see if anything else is required beyond Maxin&#39;s upgrade?</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a113ec10aec6eaa0529eb91e3--
