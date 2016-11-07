Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 22E056FF73
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 09:31:04 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id n204so158293129qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 01:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1ApUok9gTSYl8mn/q7suHIz9ruD5nfuWw5Hi/GU+TfM=;
	b=m0+Fu72TZsXmG3GRa39NimdDq1bxGNehARTrnXUG9gpHfdGvWJ5Sh4WcxWen0cMSK5
	NjPTDp78V0jcbxnAQlqgDNByvICNS5vMetuKq5JB8KQ8Nc+aYsYyV2+54XIIKz8A7YDJ
	ZKq8lj6a2Fg88LNhDcEq2dNk8XQqdiXtFK4UHyssOGOemmbik8/7rRIUjJX+a2DoxD0a
	Iqx1l4Cd0PGczBff0SeCIHy7FPCrYm7nquTp+Q7FcDC8KQI59zrzoR/Gv9zMNfR0bIBy
	P6af+WoeEJUg7YnIqssOv1QwGbeyru6Bo6QytdvEh50d9spcyieK+TVmyKVVYGBPV65u
	EpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1ApUok9gTSYl8mn/q7suHIz9ruD5nfuWw5Hi/GU+TfM=;
	b=JdOcaGKIdop5P6ujuL1xvuweKKYkSQ81MMmbRmliDBUznRFdJan3ryvMVRKxd+kVu6
	E/37xrURvdJW3VyFttAGIrfgq18jJSX8IozivzO7lcWjtvBoIr3knl36uiFc95laD6DU
	3LYcCXOFMRAXte22Z+zSxO/RVnva6zx+pdeomS+2GTe/4N3+qAO4RFULENLQ5U5InwEF
	+GjAxeuIIJrY8oOrqV6cuEEbsqZi2eIK9W5zJ9meG3MVCheOA8oBUTjT+CkJLZ/5/VJl
	6KijuJaBjxH5CpCabvMHKA6ggwq5tCk+TSpRp9XeITPfdcHSZn/0cG0pGCB84k5NZFT4
	0k2A==
X-Gm-Message-State: ABUngve8RjMR6a54xuofH03/klP/51WEasKIcJD7qS/Oc8qyGplU8vziHC/itBstLHuQBIgX+iVTKdzjfcXflJlI
X-Received: by 10.55.106.134 with SMTP id f128mr2593875qkc.121.1478511065920; 
	Mon, 07 Nov 2016 01:31:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 7 Nov 2016 01:30:45 -0800 (PST)
In-Reply-To: <CAJTo0LaKjNiFY3Z41Zk0Ln1fH_mLBF+hjKhr46+f3tewO5bTow@mail.gmail.com>
References: <1476952202-8842-1-git-send-email-koen.kooi@linaro.org>
	<CAJTo0LaC2t1BN9VpKRx4W7fMT88mDdmCBYhzgBgvsdDJXhNk_w@mail.gmail.com>
	<CAP71Wjyy-qQH+nE34FTKUhqgRqGZocpfQ4CrkmTPh+OOMGK6jg@mail.gmail.com>
	<CAJTo0LZAGq8szm0vL0wyyR_rFVe1LBoMWYcoZh+VBMBcw5kW-Q@mail.gmail.com>
	<1478304597.3662.28.camel@pbcl.net>
	<CAJTo0LaKjNiFY3Z41Zk0Ln1fH_mLBF+hjKhr46+f3tewO5bTow@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Nov 2016 09:30:45 +0000
Message-ID: <CAJTo0LbiSBPq3ZHKmmHYpoM+GZWcOgDNyJy3-Cd4XhRxF9Lt1w@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Mon, 07 Nov 2016 09:31:05 -0000
Content-Type: multipart/alternative; boundary=001a114fddf6e19cbe0540b2aef5

--001a114fddf6e19cbe0540b2aef5
Content-Type: text/plain; charset=UTF-8

On 7 November 2016 at 09:28, Burton, Ross <ross.burton@intel.com> wrote:

> Ah.  I might (cough) have a hybrid stable/testing setup as I needed a
> newer kernel.  I'll have a look.
>

$ grep -r getrandom
x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
x86_64-linux-gnu/asm/unistd_x32.h:#define __NR_getrandom (__X32_SYSCALL_BIT
+ 318)
x86_64-linux-gnu/asm/unistd_64.h:#define __NR_getrandom 318
x86_64-linux-gnu/asm/unistd_32.h:#define __NR_getrandom 355

That's better.  Thanks Phil.

Ross

--001a114fddf6e19cbe0540b2aef5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2016 at 09:28, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div>Ah.=C2=A0 I might (cough) have a =
hybrid stable/testing setup as I needed a newer kernel.=C2=A0 I&#39;ll have=
 a look.</div></blockquote><div><br></div><div>$ grep -r getrandom</div><di=
v>x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom<br><=
/div><div>x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getran=
dom</div><div>x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_ge=
trandom</div><div>x86_64-linux-gnu/asm/unistd_x32.h:#define __NR_getrandom =
(__X32_SYSCALL_BIT + 318)</div><div>x86_64-linux-gnu/asm/unistd_64.h:#defin=
e __NR_getrandom 318</div><div>x86_64-linux-gnu/asm/unistd_32.h:#define __N=
R_getrandom 355=C2=A0</div></div><br></div><div class=3D"gmail_extra">That&=
#39;s better.=C2=A0 Thanks Phil.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a114fddf6e19cbe0540b2aef5--
