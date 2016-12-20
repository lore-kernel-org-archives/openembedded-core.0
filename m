Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 60167772E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 14:41:40 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id u25so39582031qki.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 06:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2tapqI+a/C1h3tPIsUcyaku4uljp02I0SvnJsnnO/7E=;
	b=OeJtTzE6yXJOgOk0g3KqaNll1U0VkNMb89akH5QJIrsjRWSF1ayGpg+4Zjb7xKSMsr
	CoufkyaZVw4hUgim3CKb6b+jKGSl981YYmjJ+U5VdIdxkf+FvEkx3e2hbh1avICN2ylP
	rASbydIuR7dA7kUdZCZpmIvmH39u1z/ZbMfYI4Weertd8rk5gcGVsQQGKvYj0j4t33ce
	hMKvSJOg3BO4HY9nZ2vJO+29M5wqZbVQHcdPzKrjuXaIb8Z6POrY0CBzznY9ex93WiR0
	d36KPLbSxSHVZ/TCvnNsYIwiL14iep/kADvotnVg8kLqyu+J7OXIyRbbocZfG7SCFkH0
	pWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2tapqI+a/C1h3tPIsUcyaku4uljp02I0SvnJsnnO/7E=;
	b=PsTLi8ak5OysjbLSWHkKDy/N+IdONipehdDpUV+fKwhB9vjA//keIzzSClnnFa1Z5s
	N5xcGzm5uv5fH5XRm/tNVK7FEo5NEN/cp5us86Z3qE0iGdcXnbRTstFspPFaiXlR1alo
	6VcU0sqtPT1nqHjEMpdimF5DzkL5bMKiig1IJhp0bl26u2kXC2koBLuVv4BwpvtpB1Ya
	t7ou78ASqdp3i16o70KRDcnmx0niCEgn5i0NrHWXibo0jCfejNwRZQD/6LDNiMYLvQw+
	g8wVDsMcUq5E5ty0+bO6nCyRe0yV0zp/k1gBrKTULKfN3QrOMp8YJF/GiCqg21tqBX38
	gInA==
X-Gm-Message-State: AIkVDXKUBcqr30/TqRrhDKMeIxtLc8mUBpPqBlLzuFe4tilJeru5Khx4KmjKe00neEtxIBut/px+yrAfiYj4Emi/
X-Received: by 10.55.5.145 with SMTP id 139mr6039461qkf.77.1482244902195; Tue,
	20 Dec 2016 06:41:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 20 Dec 2016 06:41:21 -0800 (PST)
In-Reply-To: <CAMKF1sq7fePZCEaZdcN1P_VmZ3Sb8UNmAcCyUDALaRy0p7yfeg@mail.gmail.com>
References: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20161219152324.GA1056@openSUSE-i7.site>
	<CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
	<20161219214258.GA16333@openSUSE-i7.site>
	<CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
	<CAJTo0LYuH==F4jbo3chSbaJHkCu8VWmOS+PxT3A6qwTzJoxwXA@mail.gmail.com>
	<CAHUNapSAEd4zuvQCna+QOMxaGDFck5OQbjvsVe6hr9voN7o1=w@mail.gmail.com>
	<CAMKF1sq7fePZCEaZdcN1P_VmZ3Sb8UNmAcCyUDALaRy0p7yfeg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 14:41:21 +0000
Message-ID: <CAJTo0LbZYcPK-9E=+pw9ZB-H9Yb7gNxeQMxLQsoRsZ1CWU4pgQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Tue, 20 Dec 2016 14:41:41 -0000
Content-Type: multipart/alternative; boundary=001a114c8f84de207e0544180822

--001a114c8f84de207e0544180822
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 22:12, Khem Raj <raj.khem@gmail.com> wrote:

> checking ncursesw... (v6) yes
>

I'm pretty sure this indicates that it found a ncursesw-config binary,
which we disable. So it must be running the host tool.  I'm seeing if we
can force it to use the sysroot easily now.

Ross

--001a114c8f84de207e0544180822
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 22:12, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":1so" class=3D"a3s aXj=
CH m1591925ac876651e">checking ncursesw... (v6) yes<br></div></blockquote><=
/div><br>I&#39;m pretty sure this indicates that it found a ncursesw-config=
 binary, which we disable. So it must be running the host tool.=C2=A0 I&#39=
;m seeing if we can force it to use the sysroot easily now.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c8f84de207e0544180822--
