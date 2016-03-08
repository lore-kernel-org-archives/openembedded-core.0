Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 438A96212F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 15:24:42 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id z8so20169237ige.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 07:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=abYujJhP7/ykdBpTWldiKB/ivvJshTp9iRiZgP8z5TU=;
	b=wLVAEkkDyk3YO3tgKETILi21KbPW+9LsaR65OjIMH2fAmnRwYXDjw5QZYRmSFtMHjn
	qkRjdH7K1H/A/YPvrBxtHUcpPHTXbGJojcjbF83sEaMu0rOJxhPR8szsMHMPIoL53l4P
	q876TQhWM9X3lfT+ju5JOLXH/UtXhvu11P/z/s4fYA1O2qComoD9X/wSRaYYN9sLxqYl
	nS0tegaNGdxScm7e+E+kB1wbh2RYUKkPpZwIs/WN1Q9848Zdpstjmo4CxSiXAvODoeya
	u+Qj13dmRZ7aBPdGbsP/wBiUbMfIOO8YRCLTmnZvIFv3zbKnoJzJ9xAy8KSP0eWUmr7C
	wC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=abYujJhP7/ykdBpTWldiKB/ivvJshTp9iRiZgP8z5TU=;
	b=SoAVh8aWwxOuaByUJtkWnOwJG/LfXVz/VGAIRF5P2ysyJDaF4Irzm6s4gYp37jMHZ3
	UsrteZZWmM8z8lemkddxceQa5Lg7ghnoQZ+g9RaBV+BGsyRDCVcDw8Mjl0sTeTfQHolI
	L1vOKOOOTJ0F3iEtjLOngsvVY6m+h9Q2GvXnVkpmek3rj7oeMi2MHyY+9sT+MjynvG15
	+SqP6dcy50Pe4EIXvzpwuc2hQGmCWq76jZwbsthU7HL8EzpOGIR3ts7X1tTtPa/ZM2Qa
	X+CjXeXXjX5cR7zaliW2pmMjZ+buWU423fSHiDy/r+yL0ePnvHTn8KgfHkMtQZAV8Ibc
	10Uw==
X-Gm-Message-State: AD7BkJKPENE03qolyNNbHExRs3E/YXCcID9WeoUUG/I7uhYzzpfN4RcC1F+myixWlHau9/7I4vUcJsl0F56tpqh7
X-Received: by 10.50.112.101 with SMTP id ip5mr18097996igb.52.1457450682726;
	Tue, 08 Mar 2016 07:24:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 8 Mar 2016 07:24:23 -0800 (PST)
In-Reply-To: <05c06ed8ffad83ab3bf492ef793f33f2a5d346e3.1456449257.git.hongxu.jia@windriver.com>
References: <cover.1456449257.git.hongxu.jia@windriver.com>
	<05c06ed8ffad83ab3bf492ef793f33f2a5d346e3.1456449257.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Mar 2016 15:24:23 +0000
Message-ID: <CAJTo0LYNcQTcB9tLgYO0gRak4cLV3feaQJGautCBFyxVTQwBaQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/15] python-pygobject: fix buildpath QA issue
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
X-List-Received-Date: Tue, 08 Mar 2016 15:24:42 -0000
Content-Type: multipart/alternative; boundary=047d7b3a845838d433052d8b2e50

--047d7b3a845838d433052d8b2e50
Content-Type: text/plain; charset=UTF-8

On 26 February 2016 at 01:45, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> +do_install_append_class-target() {
> +       sed -i -e "s:${PYTHON}:\`which python\`:g" \
> +           ${D}${bindir}/pygobject-codegen-2.0
> +}
>

If you're going to expect the shell to find the right python on the target
there's no need to use `which python` as exec will search $PATH.  However,
we do know where Python on the target it: ${bindir}/python.

Ross

--047d7b3a845838d433052d8b2e50
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 February 2016 at 01:45, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5h4" cl=
ass=3D"a3s" style=3D"overflow:hidden">+do_install_append_class-target() {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s:${PYTHON}:\`which python\`:g&=
quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${bindir}/pygobject-codegen-2=
.0<br>
+}</div></blockquote></div><br>If you&#39;re going to expect the shell to f=
ind the right python on the target there&#39;s no need to use `which python=
` as exec will search $PATH.=C2=A0 However, we do know where Python on the =
target it: ${bindir}/python.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--047d7b3a845838d433052d8b2e50--
