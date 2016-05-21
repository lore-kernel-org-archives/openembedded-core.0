Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id B26F56B6EA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 21:34:03 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id z123so9862736itg.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 14:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mX+TVaejJxZo8D5+TQGNPKLzi3t1gwGYkk073Q2zN20=;
	b=WK+1ucGvWK2hdgcwZrMrVMlvuGFqJyD9Z21wY6z85LLl6SVhAch5QvlVYz3SABLmnX
	EhHai3IkOERP16TdfjEaS50/qT2TazL8OUqm12kt2QO86pHIaPAQpKcY6isxx/6QsvDm
	sWE+yA8BFFRGqnmd7h44u452L5maX3BsjsBTgrGwgovofla/dbtHOe2QGJhtVNBKK0H6
	p63JkLs5PSYPf/PGhStp7bkdYLUzI6dbjoxVrO9gXptCAxsXjq+WOJgMAc6FOqvJNX+D
	62UjHAijeraM6P8G5+psKKsT8/MHdSKktxLQ/9aaaVjIrheCFTjoxWxzBoXND7FRX2er
	QhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mX+TVaejJxZo8D5+TQGNPKLzi3t1gwGYkk073Q2zN20=;
	b=R3U8G2mOcT0jTBQM8hPxYtDNdBlCA29cfxPt2RkZ+bax2Z1zmCtlADG6OgJRP/F6zR
	SHfIbGMSc2T1N96h2Ii4cfByaDw0qfKqePF7+goIQycZI8l3klT+8Jd927uzEIDqDCex
	/AfuEp/H7Nk4R9AviUTJHsZWRGSqYgv2h8uwKl5bpwZs6/GYaX6TpkXYSwZcSBo22XyV
	ECaSLBP+EgN4Sz1J3x61JHvWcY0uBNRAtrbFM7kMiMPCCz5MqK/tdH8j7fwkwcMeQK+B
	YGdJdh9aQ6GnSv2qduAt5pnPTa8YfEaZVMgw+EQKInGFe6Kcrvtg5Lq1YeGQfKgMkAi+
	//0w==
X-Gm-Message-State: AOPr4FUQfDOzOPkW2GuSuRx2/yzeaT3KvAJ68suqK1T+g0eBkgrwfJjSz+jujo9oWzwmhfYXsRllpUAGrTMbkDr0
X-Received: by 10.36.2.71 with SMTP id 68mr8070323itu.38.1463866443936; Sat,
	21 May 2016 14:34:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Sat, 21 May 2016 14:33:44 -0700 (PDT)
In-Reply-To: <CAKmqyKPPRF+AvEShiFopGj-WtzM6Hdr48nBanA4TEwdWKq2ZSg@mail.gmail.com>
References: <1463089059-10156-1-git-send-email-alistair.francis@xilinx.com>
	<CAKmqyKPPRF+AvEShiFopGj-WtzM6Hdr48nBanA4TEwdWKq2ZSg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 21 May 2016 22:33:44 +0100
Message-ID: <CAJTo0LYJuy3vJG_nDp_qA_YTRr62FgN5YUzYcWb5=i6WoAv2Ow@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] runqemu: Add suport for qemuzynqmp
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
X-List-Received-Date: Sat, 21 May 2016 21:34:06 -0000
Content-Type: multipart/alternative; boundary=001a1144b1d063cf20053360f729

--001a1144b1d063cf20053360f729
Content-Type: text/plain; charset=UTF-8

On 19 May 2016 at 17:40, Alistair Francis <alistair.francis@xilinx.com>
wrote:

> On Thu, May 12, 2016 at 2:37 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>
> Ping!
>

Sorry meant to reply to this a lot earlier.  There's a RFC from Robert Yang
which proposes a series of patches to completely rewrite how runqemu works,
so the machine-specific knowledge is contained in the BSP itself.  As a BSP
maintainer who is working on runqemu, would you be able to have a look at
see if it should solve all of your needs?

(this is now marked for my staging branch too)

Ross

--001a1144b1d063cf20053360f729
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2016 at 17:40, Alistair Francis <span dir=3D"ltr">&lt;<a href=3D"=
mailto:alistair.francis@xilinx.com" target=3D"_blank">alistair.francis@xili=
nx.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
f1a" class=3D"a3s aXjCH">On Thu, May 12, 2016 at 2:37 PM, Alistair Francis<=
br>
&lt;<a href=3D"mailto:alistair.francis@xilinx.com">alistair.francis@xilinx.=
com</a>&gt; wrote:<br>
&gt; Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis=
@xilinx.com">alistair.francis@xilinx.com</a>&gt;<br>
<br>
Ping!<div class=3D"yj6qo ajU"><div id=3D":f2z" class=3D"ajR" tabindex=3D"0"=
></div></div></div></blockquote></div><br>Sorry meant to reply to this a lo=
t earlier.=C2=A0 There&#39;s a RFC from Robert Yang which proposes a series=
 of patches to completely rewrite how runqemu works, so the machine-specifi=
c knowledge is contained in the BSP itself.=C2=A0 As a BSP maintainer who i=
s working on runqemu, would you be able to have a look at see if it should =
solve all of your needs?</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">(this is now marked for my staging branch too)</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a1144b1d063cf20053360f729--
