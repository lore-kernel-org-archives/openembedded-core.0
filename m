Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id D2BD271C2E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 20:27:12 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n204so101914897qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 13:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZJu/GJJnFhKLZa1cFvHcWX3GQ3nVFXKLrAM4HkoHpEc=;
	b=v/oGNK7Na1KXCmKkO/hgAFW2fvNFRpyGcWIqmFq2yyX3QlqfFFdA6M++wkAOmZpT+5
	L1U+1hFRjM1hfDVaZEKunba6vObA/MMaSTqoV1pW+GEySAsp3W+eFO4kHamPKrxvu2az
	qMmcB52Siz02/ysqkQMaPxWiHtPSZ7VHh9Ra/14TTe/PsKtj1OuKxThfm7CjP2qylxXI
	YgJrJMZFiVqSdvvzkNtfd5/Q8BUWuOW1KOZgKpj5sWXD7NddwXeyeamztjL23r4Cx+wU
	Cgk+qE/IikCcdWvbHQGkdJwBTY1eeq1Wd5qCUVDiJmc1qGfIcVTMmM9uyaQELpTFuCfh
	EMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZJu/GJJnFhKLZa1cFvHcWX3GQ3nVFXKLrAM4HkoHpEc=;
	b=gLA2Mswvi0OQFhvRzwheJ6DYrUyTRUA+0F4nseLioC1RF1tgyKd+NmU+VJt9eXZd+i
	4G/C6GLS4Uqu6QEe7wSO8Q1tO7qFt2GNODapuow3z45BXCd6YSfmUNvpt2CSyvxrn1lt
	I1OOO7dl7df4WW3PXdHDn5zU2yQn9sMqOiVRbFIEKffI2U7QgjRaTJETa3syVaLDq6YU
	eGCmJi8hG3ugzifjMHzmYpGYjGIgkozPlNkJiajyec8F9ZtC9MABApkcmCoG00ueT1mb
	ScsZ7wOFBoZZLKvXTFVXlGUm+GL/DJKb/wmY7Xt5q57zIrnhbw95zAMOZJXdwQh6pj3N
	3VHQ==
X-Gm-Message-State: ABUngvcgQ6O/SjCMuYXiXL9UDV1Xzhlx9ImP4iZvhtjfNsAEXa2iqGjxH2n77H/9iR1T/VkoSC6UZ+4G77a5tA0q
X-Received: by 10.55.8.20 with SMTP id 20mr16615204qki.3.1478291233914; Fri,
	04 Nov 2016 13:27:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Fri, 4 Nov 2016 13:26:53 -0700 (PDT)
In-Reply-To: <44145dc1-a9cf-7191-3c74-ce23b9aa2aaf@linux.intel.com>
References: <1478238808-28688-1-git-send-email-akuster808@gmail.com>
	<44145dc1-a9cf-7191-3c74-ce23b9aa2aaf@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Nov 2016 20:26:53 +0000
Message-ID: <CAJTo0La+=ijE8MdzcZenDGobWbHMrBV1OnnLjrL8rvBTB_2R6A@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Time zone update to 2016i
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
X-List-Received-Date: Fri, 04 Nov 2016 20:27:13 -0000
Content-Type: multipart/alternative; boundary=001a114c9d60df532205407f7f58

--001a114c9d60df532205407f7f58
Content-Type: text/plain; charset=UTF-8

On 4 November 2016 at 16:04, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> git pw mbox 3757 -r 1 | git apply --check
> error: meta/recipes-extended/tzcode/tzcode-native_2016h.bb: No such file
> or directory
> error: meta/recipes-extended/tzdata/tzdata_2016h.bb: No such file or
> directory
>

It depends on the update to 2016h that Armin sent earlier but isn't yet in
master.

Ross

--001a114c9d60df532205407f7f58
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 November 2016 at 16:04, Leonardo Sandoval <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">l=
eonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div id=3D":1s0" class=3D"a3s aXjCH m15830286fa1188f=
1">git pw mbox 3757 -r 1 | git apply --check<br>
error: meta/recipes-extended/tzcode/<a href=3D"http://tzcode-native_2016h.b=
b" rel=3D"noreferrer" target=3D"_blank">t<wbr>zcode-native_2016h.bb</a>: No=
 such file or directory<br>
error: meta/recipes-extended/tzdata/<a href=3D"http://tzdata_2016h.bb" rel=
=3D"noreferrer" target=3D"_blank">t<wbr>zdata_2016h.bb</a>: No such file or=
 directory<br></div></blockquote></div><br>It depends on the update to 2016=
h that Armin sent earlier but isn&#39;t yet in master.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c9d60df532205407f7f58--
