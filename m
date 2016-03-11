Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id B1204731F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 16:02:53 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m184so151116856iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 08:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Dfw8eoKLBiAFUHLFDjdd9YabA0H+92Wlz3OG7zMzZPs=;
	b=o+uu3+erBwV10ovAvUNui+98N0hoBWAU1YYS4xJ3Nn3Yj+CKjAQN69Khmvh1PgI0Xh
	vAtbnldBPw6OtBJ9qJzua6/cK60gJ/Gsr5uGH7mIMpTjmMmZ4z8kPYMo1wYrguqlKP96
	9nHN5AieYr0D91tiBbpHkvMdyB2Vw7+eH2YheJF4bRC9gf/OJb0y8+UqMuaF2hCXPY1d
	D/54RafjV3wJzsOpARePOeVf/+XZlLeJq3kHzjX8pq//4Dp48HpKiz7ZqN1MVUJgYBrm
	r3qr1g3PjyzdNoQ52frdiCfEZp63VyzdRo2tIuotpI//JjVCs0kLiTl/aQo+K6Jt+4Jl
	amyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Dfw8eoKLBiAFUHLFDjdd9YabA0H+92Wlz3OG7zMzZPs=;
	b=QSQb+zCOa0LkPTtQ9TXzsjMQpvI1CJNHZiJyDZotqHFSbFUR+RhqPBajpAssjbPQFh
	96S5PTdaXdmyxIc2Nd72xFXMDfCWf82oi6NKdhk0cJa6d7AGCMJYeq7Q/dHEaA1eJ/IB
	6MkdSPxehvcjdoxrUVb2euhaaq8iEY4bYgm4kWhJ+kf7ccV0hLKQYnxs4FUiPPcphbUB
	xFntSk5KisRAeroTHBWtaCaUnMl6mOKofNAhsvnHYzQHzfFI3Vpd5r9Ow0GGLSZcWx40
	H1OQZLsPy60Zk80N7f/9m/7vjJItt+SooMG2dubNhJeytYFQtIO+zdU88n8VDXcnRGVq
	rSEQ==
X-Gm-Message-State: AD7BkJLsOWTzL7wCCB1t2Diwf7HGiT+ZkiO2GSZm05VsstaZDKdLogExjXen1XLT1DjJ76Yy7eMMqQQTvw6CdCJl
X-Received: by 10.107.16.19 with SMTP id y19mr10504978ioi.148.1457712174328;
	Fri, 11 Mar 2016 08:02:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 11 Mar 2016 08:02:34 -0800 (PST)
In-Reply-To: <1FC09834-DC8A-477D-9C9F-B6D469A7E90E@gmail.com>
References: <1457706284-38023-1-git-send-email-helio.castro@bmw-carit.de>
	<CAJTo0Lb0qJKgAyqb4naHHdE6QfzfmzAw22DUU=srMWdXDm62LA@mail.gmail.com>
	<1FC09834-DC8A-477D-9C9F-B6D469A7E90E@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Mar 2016 16:02:34 +0000
Message-ID: <CAJTo0LaoVn5ixhYy-2cHf-FGSthY3Fa9Z9ryg6j0hLp2KSLLtg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix the license on GNU OpenMP
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
X-List-Received-Date: Fri, 11 Mar 2016 16:02:56 -0000
Content-Type: multipart/alternative; boundary=001a113fd1ea562692052dc8102b

--001a113fd1ea562692052dc8102b
Content-Type: text/plain; charset=UTF-8

2016-03-11 15:58 GMT+00:00 Khem Raj <raj.khem@gmail.com>:

> -----BEGIN PGP MESSAGE-----
> Comment: GPGTools - https://gpgtools.org
>
> hQQOA1XJCHN89ZWPEA//byr/rrxGxNNYYivYsGFBs4h6XrUzdqBCsw2FuyseGKJ1
> XkZUtuH7f39QYY63OoqFhFdVmy3Hil3wscxe38L6/DA8hQV9Csn4cOxEfp9UF5jj
> +3QJg/xqk7cgXTLuoUen9JZQHZgnG6+IfBg6jJARCKTmcs8aCT8WU2DYWycGCGg5
>

Can you send it non-encrypted? :)

Ross

--001a113fd1ea562692052dc8102b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2016-03-11 15:58 GMT+00:00 Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div id=3D":ao7" class=3D"a3s" style=3D"ov=
erflow:hidden">-----BEGIN PGP MESSAGE-----<br>
Comment: GPGTools - <a href=3D"https://gpgtools.org" rel=3D"noreferrer" tar=
get=3D"_blank">https://gpgtools.org</a><br>
<br>
hQQOA1XJCHN89ZWPEA//byr/rrxGxNNYYivYsGFBs4h6XrUzdqBCsw2FuyseGKJ1<br>
XkZUtuH7f39QYY63OoqFhFdVmy3Hil3wscxe38L6/DA8hQV9Csn4cOxEfp9UF5jj<br>
+3QJg/xqk7cgXTLuoUen9JZQHZgnG6+IfBg6jJARCKTmcs8aCT8WU2DYWycGCGg5<br></div><=
/blockquote></div><br>Can you send it non-encrypted? :)</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113fd1ea562692052dc8102b--
