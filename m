Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id C7AAB760AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 08:07:00 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id n128so27206363ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 01:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2p83FUTjVWCPBz5HTsgFuQ6jskkYp4LqeFQZYlszZNc=;
	b=tme/M+MX7oNdPkVKbkTicxP0ilflkz8Ic81A+uMVkkC5vQE003nxM17dDhZ5rvdr+b
	odyjZ91ObZZ0uHAAaRMos90ME3Jc1LW6zYwGbiiJ+Fyu17kyyTBOurswzwiHe8eBqsM0
	L/pvXiACSrdvwJz8t+oVK2sCK8ubC6EjwtNo/aziVMaA6jIoBd/PV91i+of5/bR91tGR
	njdw0xr4Q5OXGlflddagbswWd7ncPaqxFzm+FJY6WxKG/Z6g2FhJ+m7IB9pDyCkezr6x
	9ns+uyxCbr3hAfYNqLUpbgQ8mDEfoDrfsq2p+c47zFYLlAtJHwBPKKF94GkS7uQBK6eN
	0gRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2p83FUTjVWCPBz5HTsgFuQ6jskkYp4LqeFQZYlszZNc=;
	b=L+dZF0pBq1ETWTCMhLFll9v7uJjZBIi1uMnPuB8ro3XFnpuDKfbQzxsaDfs8oDCH96
	0E/GFGD3hrfmZvJ1sHGXB8jI6GVGVfsKf6MvO55Ph24B5TAWwyJEm5moO1Ar4f30FepE
	mDsXXAJH9waxzEt1LCDCS1Hae7k/R1BGvXDs6ty/R+nYUGVXGo7dHE69qHrxb14rr8Pc
	QmD8fMJvZS7CPNgsaRTZO+cQR02Ftp71K0QOvevUUGO1w7xLG/g40V5ld7mWeEy1tRsi
	gwbehpMySsaCvVxEm3i/Qca3e1eMFLHsgdsQsx9db3OdBNnOuuJctV15nVp7ns/Zhg7/
	WCBQ==
X-Gm-Message-State: AEkoous2OJD0TCehNkzmLgbi7BsvLVgwDXa8zxuaNxD24JqrxO6xKZrIx2LJWk66vRm/KR2Y8CT1PBO3khHDI2W9
X-Received: by 10.36.121.206 with SMTP id z197mr9155976itc.22.1471334821615;
	Tue, 16 Aug 2016 01:07:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 01:06:41 -0700 (PDT)
In-Reply-To: <71ff8110-6bf7-8bbf-619f-fd2177048a13@windriver.com>
References: <1471322686-1783-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<71ff8110-6bf7-8bbf-619f-fd2177048a13@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 09:06:41 +0100
Message-ID: <CAJTo0LYFyyKiPBQyy3TPGCnJCpbO_Nrf6=XvPFBpcv3ZNGBr0Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] createrepo: 0.4.11 -> 0.10.4
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
X-List-Received-Date: Tue, 16 Aug 2016 08:07:01 -0000
Content-Type: multipart/alternative; boundary=001a114aa820637180053a2bd567

--001a114aa820637180053a2bd567
Content-Type: text/plain; charset=UTF-8

On 16 August 2016 at 06:49, Robert Yang <liezhi.yang@windriver.com> wrote:

> I think that we don't have yum in oe-core ?
>

That's right, and that is why we have this line in the recipe:

RECIPE_NO_UPDATE_REASON = "Versions after 0.9.* use YUM, so we hold at
0.4.11"

Ross

--001a114aa820637180053a2bd567
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 August 2016 at 06:49, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex"><div id=3D":1vv" class=3D"">I th=
ink that we don&#39;t have yum in oe-core ?<br></div></blockquote><div><br>=
</div><div>That&#39;s right, and that is why we have this line in the recip=
e:</div><div><br></div><div>RECIPE_NO_UPDATE_REASON =3D &quot;Versions afte=
r 0.9.* use YUM, so we hold at 0.4.11&quot;</div><div><br></div><div>Ross=
=C2=A0</div></div><br></div></div>

--001a114aa820637180053a2bd567--
