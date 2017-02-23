Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD717300E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 12:10:37 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id u188so29390617qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 04:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8GSrHOdNgij9ZZurlbi2FlixHXkxy1QGCY1jLhrVshE=;
	b=10qPubPwinES6G2DXylsZKF1plX1xipCw3uNr3HP/RVkwgonOxryXydkYZpFcouyWc
	7+OTwGUXpap5YlSukM22A5S/liNE8S3jyT6lYKDKm9pPmOV4RQzes5wVbaw8lLBZDyem
	+ye4Jm4SAh5VmjaJEaerhr6ArmQb2MhwBAd88yPnTz4nCSxPz1QsUF2HntZgkjk2CPEX
	h/rIWt4VZhzPw3CrwKZLFSxvDXSAnfysbWbcNyec9TFzHvqFPMUK8+4C0nPGZeSUWso9
	CwGRZL31gVx8R0gWWP6wP4OjWCMZJdhWA+BKVcYCV19qnU49XXOUw1ksaZFX1+I5ruDu
	SBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8GSrHOdNgij9ZZurlbi2FlixHXkxy1QGCY1jLhrVshE=;
	b=tk5L/C+jV+aXSWUuU4wRRV+ctsDSlDuK2xMQnwUnGdeQGKLFx64nlDFigKv8Qqffyg
	2voWCoik6SyLDlMhKCsTLkFlZBxWkyLr1Nyx1XNW0F5ui0iSC7n+0zD/EonpkCz6SRC2
	IPHX2a2Zqw3RlaZxfdGfcQawjUbi7Oo91aAnd4Ab5MrzSpb2G5X1fxS+zUgb3Bmy0iAG
	64tUpb7x8cd4fUtNFNcDcpSoqWtz9UlFoY94B6A9qnEjxK9r/Lbywaz6mKPXZLsnsXvd
	6MVOaNv6423YMrqMkynhjrzQ7BjuewH8EjdJBjCXjHyhGsAi+sjxb19ha4lIqDUKVwfh
	kcCQ==
X-Gm-Message-State: AMke39n7CF2DEnlg1uJpqP/Q8BBabyVwp54bEN8/OkN9C0Y396F7l61D0YTkAZyV1qBn4pvRrXYAwSnPvY0vo2bT
X-Received: by 10.55.47.4 with SMTP id v4mr35402553qkh.77.1487851839123; Thu,
	23 Feb 2017 04:10:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 23 Feb 2017 04:10:18 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1702230658260.10030@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702230658260.10030@uk63952.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Feb 2017 12:10:18 +0000
Message-ID: <CAJTo0La0BopC29kg5oUc9ZhRLMBvGsLArHo5kVqQyCYG9Wrb-A@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "packagegroup-core-tools-debug.bb" seems kind of skimpy
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
X-List-Received-Date: Thu, 23 Feb 2017 12:10:38 -0000
Content-Type: multipart/alternative; boundary=001a114f4108598c360549318054

--001a114f4108598c360549318054
Content-Type: text/plain; charset=UTF-8

On 23 February 2017 at 12:00, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   was just asked by a colleague about OE debugging tools, and the file
> packagegroup-core-tools-debug.bb seems kind of light on content:
>
>   MTRACE = ""
>   MTRACE_libc-glibc = "libc-mtrace"
>
>   RDEPENDS_${PN} = "\
>     gdb \
>     gdbserver \
>     strace \
>     ${MTRACE} \
>     "
>
> are there no other appropriate debugging tools that belong in that
> packagegroup?
>

If you have any suggestions, feel free to send a patch.

Ross

--001a114f4108598c360549318054
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2017 at 12:00, Robert P. J. Day <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":q2" cla=
ss=3D"a3s aXjCH m15a6ad8aee423c9c">=C2=A0 was just asked by a colleague abo=
ut OE debugging tools, and the file<br>
<a href=3D"http://packagegroup-core-tools-debug.bb" rel=3D"noreferrer" targ=
et=3D"_blank">packagegroup-core-tools-debug.<wbr>bb</a> seems kind of light=
 on content:<br>
<br>
=C2=A0 MTRACE =3D &quot;&quot;<br>
=C2=A0 MTRACE_libc-glibc =3D &quot;libc-mtrace&quot;<br>
<br>
=C2=A0 RDEPENDS_${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 gdb \<br>
=C2=A0 =C2=A0 gdbserver \<br>
=C2=A0 =C2=A0 strace \<br>
=C2=A0 =C2=A0 ${MTRACE} \<br>
=C2=A0 =C2=A0 &quot;<br>
<br>
are there no other appropriate debugging tools that belong in that<br>
packagegroup?<br></div></blockquote></div><div class=3D"gmail_extra"><br></=
div>If you have any suggestions, feel free to send a patch.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114f4108598c360549318054--
