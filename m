Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id A5A4C6078D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 11:26:14 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id z65so67308863itc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 04:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uwtp/mWb9zIy4ojP+VsLDp0vrkZJN/Qd/2zqq0AgNIQ=;
	b=h4R95suhmV8jd+O6YkDl5G0/jXB5ZV/ulUn2QvIYCLsqXKQ/u/IzinRXmkaHahrOLc
	ASpTjK6/AAc3cWUSXr4uG8FffKZT9vgcWLpDeacHFV+B0cb5ImORoTHHtXF4MO1FQPu6
	NXec/en6a3P2N8IfosDIdg4//4dXoFyjb2LKcaSfFFUbRj3tq4RBxZunacgxVBYr8uTu
	J483uv8j/P7kr7aYiObwWD+lmkAcELBij/uCyfaqTTioskMc3IKf0oV0XzGPoopFlC3b
	RFnCTH+yQigiHZ9ys8S7AJ6Sq1RVMZV2qBMgBxpiPr8PAqt6GIwz9VFrvYjG5mXUpvp0
	vXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uwtp/mWb9zIy4ojP+VsLDp0vrkZJN/Qd/2zqq0AgNIQ=;
	b=KyeDkBMnOrE7MJR3BugEnz5ERpS31BT4KrOglFFdcZdgggyCQ5E+gDYdfbca94xYgh
	Efy/ax2WPWlSOE6o1g1rAvYfri9gpquPceeyeS5iyVDhPdGz+QcmPvoxG4iSIesMFfQc
	GJRTkmgSD8yqea+an4ho+MBdrZ6pSvSxaufEBF0Bb3WEv/0i4Jlb7TgHgxhr5nPLyAuV
	8zx6wnwH8cI8GPtqlKlJWCnM3r+0nHUoLoLL+FjhSMlAtFH8NzmlG+vhPwJSbFsY0OcI
	CAvkZ8QEe2CWZbbDBeSiTcEEor9RDTzqivj2dDC+ZtEl63cWUGu6cGW8iUVYR/SEWWgV
	ea/g==
X-Gm-Message-State: AA6/9RnwSsnP1921SV7KdfIBtcJqXilm/Pjs7R4eOXd3Nbenh+ZEFQtNdN04F5EGDS0qbSnNUHI7HrLsgPlI1p+7
X-Received: by 10.36.109.3 with SMTP id m3mr10104944itc.20.1476098775433; Mon,
	10 Oct 2016 04:26:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Mon, 10 Oct 2016 04:25:55 -0700 (PDT)
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48ABE4A7CF@SESTOEX04.enea.se>
References: <3230301C09DEF9499B442BBE162C5E48ABE4A7CF@SESTOEX04.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Oct 2016 12:25:55 +0100
Message-ID: <CAJTo0LY6StdX90T1WF+7z4PDQHNjZYv6wf8ba3vF_=LJ9aLgJA@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: CVE-2016-0634 -- bash prompt expanding $HOSTNAME patch for krogoth
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
X-List-Received-Date: Mon, 10 Oct 2016 11:26:15 -0000
Content-Type: multipart/alternative; boundary=001a1146f5d829dcdc053e81079f

--001a1146f5d829dcdc053e81079f
Content-Type: text/plain; charset=UTF-8

On 10 October 2016 at 10:49, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> ERROR: bash-4.3.30-r0 do_patch: Command Error: 'quilt --quiltrc
> /data/fb/hopo/6.0/poky/build-qemuppc/tmp/sysroots/x86_64-linux/etc/quiltrc
> push' exited with 1  Output:
> Applying patch CVE-2016-0634.patch
> can't find file to patch at input line 25
> Perhaps you used the wrong -p or --strip option?
>

If the patch needs -p0 then you need to tell bitbake this with the
;stripnum=0 parameter in SRC_URI.

Ross

--001a1146f5d829dcdc053e81079f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 October 2016 at 10:49, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D"=
mailto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>ERROR: bash-4.3.30-=
r0 do_patch: Command Error: &#39;quilt --quiltrc /data/fb/hopo/6.0/poky/bui=
ld-<wbr>qemuppc/tmp/sysroots/x86_64-<wbr>linux/etc/quiltrc push&#39; exited=
 with 1=C2=A0 Output:</div>
<div>Applying patch CVE-2016-0634.patch</div>
<div>can&#39;t find file to patch at input line 25</div>
<div>Perhaps you used the wrong -p or --strip option?</div>
<div></div></blockquote></div><br>If the patch needs -p0 then you need to t=
ell bitbake this with the ;stripnum=3D0 parameter in SRC_URI.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1146f5d829dcdc053e81079f--
