Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7B871DB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 20:50:18 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id t184so27727425qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 12:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q2LlFruRqA9XKYY2SbofeUsFb+5U5C/Ig0vuyF7BSks=;
	b=Wgddr0C7z//VusMObmnaqy30+0lK3+3XXxn5tQ5wZhMUZQa1VEQtAwBQXjGFIhca31
	3VAHoXCWPet/sg87ZpWFp8VgFI53FcLWuS09NgofxQWXuee6coird8Wwh34VsIb3RuLu
	EBXwjRpKfsJyR8qVtobFMWpOV1GLbtVHC559lWpO30nzlFkUfzxKhrl5PJIDaTcndW7/
	D8DWBm8MS78ECEKaI/TdVw9YaReYPr1aFIWldurak/zDGFds1tkj1Ng/68h8Av7USD5t
	FS8yxUV/UBqPrNXKT2a53l1xf4s4ATnq3wTvXL4vGJHDg5Y38iO6UA8krwhvWv9AyYB+
	KA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q2LlFruRqA9XKYY2SbofeUsFb+5U5C/Ig0vuyF7BSks=;
	b=j7RKJNpwdICz1asUiF2vBgP12wJKN4W9prEruw9XCkE6v/Ef8l4uTpynWOQoxoFO6T
	yRVsM1MOCWNLZeetQnv7a+7jp+S67CrDIkwBPNbkCVSTd/1Wx6DxRvd8dCpB2uQJOUG0
	Bg7Qhg9c0ANg0c3hDgbHWSgbIiMNkyar6szPoCHX/DHSKx8Ns68kIWQ6jFOYesIPqxnF
	ZvLEu5EFivqJXCc8GjE5V5bQv1o0drW+5yUmz5mJ3ygDR9ZRxdvJ1ykoiYu1PwvryOGi
	RoOCGCSxNwA9IDroAItzmHq+eBgKPDQQ2laSOWWBcMQLvuXr8I00gkszrsFe+MYeuLBw
	jBxA==
X-Gm-Message-State: AIkVDXJeZE9F2yCcYRr28JSEmmGoEyRne0J5YIC+LnoZlsyk1PUvqdYyMfdfx6DOBsb5hKMsGdErTytvVUrz2q46
X-Received: by 10.55.106.134 with SMTP id f128mr2477988qkc.121.1482180620080; 
	Mon, 19 Dec 2016 12:50:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 12:49:59 -0800 (PST)
In-Reply-To: <1482138565-4120-4-git-send-email-kristian.amlie@mender.io>
References: <20161216144423.GB6398@linux.intel.com>
	<1482138565-4120-1-git-send-email-kristian.amlie@mender.io>
	<1482138565-4120-4-git-send-email-kristian.amlie@mender.io>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 20:49:59 +0000
Message-ID: <CAJTo0LZ4S6FWzR6u2Kek_KjcXD48qTWbVLn5Vm2j20fJtyts9A@mail.gmail.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/3] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Mon, 19 Dec 2016 20:50:19 -0000
Content-Type: multipart/alternative; boundary=001a114fddf65a688c0544091155

--001a114fddf65a688c0544091155
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 09:09, Kristian Amlie <kristian.amlie@mender.io>
wrote:

> +        res = runCmd("e2ls %s" % os.path.join(self.resultdir,
> "selftest_img.part1"))
>

To avoid adding recipes for software that hasn't been touched for about a
decade, can this be done using debugfs from util-linux?

Ross

--001a114fddf65a688c0544091155
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 09:09, Kristian Amlie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kristian.amlie@mender.io" target=3D"_blank">kristian.amlie@mende=
r.io</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"=
">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D runCmd(&quot;e2ls %s&quot; % os.path=
.join(self.resultdir, &quot;selftest_img.part1&quot;))<br></div></blockquot=
e></div><br>To avoid adding recipes for software that hasn&#39;t been touch=
ed for about a decade, can this be done using debugfs from util-linux?</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a114fddf65a688c0544091155--
