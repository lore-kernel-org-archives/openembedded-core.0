Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id E8C8E78369
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 08:39:08 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id h199so4399024ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ymSpodxyfRy6Y/vzld9hHUrrBRNn1uzwxrHLdST4yD8=;
	b=NbTg3GuNPCZbTDxIqiOb/xtZfkM1C2wMaqwTBynJWtifEp/3O6m4mCtpoSFVOcSYBi
	76RjcSGxzmXdtmvaHnMxPfKmfbHGeFCfkXlgl9RdoffJy/Whh4WCMwBkWm30g4C/rNwj
	GqOwATCe/IN1vOhWNpa1pGtLCsadXpmRG0p0b+JZ+UyCHNVvWYTlOzWEFZig9IuvfBuC
	lWhhB1M3qNc6Z0z8A0uW5kLRQzlICynkoXWq2R4EXQ4+q8SMtJRwIZOtUk9HpPJggLFM
	cWLUHMCuChpXKYcyLANPb1l4yPwsijUc4kct1ZLKx8kSer2BHETX/Vl/IzCqaO8HXj14
	8s2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ymSpodxyfRy6Y/vzld9hHUrrBRNn1uzwxrHLdST4yD8=;
	b=K61p4fFaoFizcOYKhkA/hkIqeqD7jOTYQ9JakrERz08iXzY5wMeWhY7atXVYBlvE1+
	McaUQkTw31KIGsN220gRSi7rxLJ6HM/W9Y8M5Nf2QtuDgZJ3vZhKZxUTtL5FW8HEmNxa
	B8I1gwlIfU/xH3VaVZwE226fgEjmyAj9wXCn/hzLSZohUPvukowgcUVDkUNrs1psWksk
	sdyK6GzJSf5EKpON1E9GRBUm6op2qTeL2VwgIerxsH9KLfv1lvNCKhRg85FTht8gbSsO
	aTEfPsDJNv2ZphIRou573CyW9wIZY0VEyKvgy5XSTukiwNxthCKmpcVMvfcFxd6cxJBL
	8FKA==
X-Gm-Message-State: AIVw112yGTcpPvFitys0RcKT9mqxSgo8ZTk/p1R46+kFTtolPsSoK9Bz
	LxoE6BoMDSuX1hN4cV1w/iGgeshJCB2G
X-Received: by 10.36.201.198 with SMTP id h189mr930366itg.113.1501576750218;
	Tue, 01 Aug 2017 01:39:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Tue, 1 Aug 2017 01:38:49 -0700 (PDT)
In-Reply-To: <20170801002347.23800-1-raj.khem@gmail.com>
References: <20170801002347.23800-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Aug 2017 09:38:49 +0100
Message-ID: <CAJTo0LZBDMXyoVmpiABqOWc3UYA=UTF18_t_GZE4Ua-mxh-seQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] mesa, llvm: Use native version of llvm-config
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
X-List-Received-Date: Tue, 01 Aug 2017 08:39:09 -0000
Content-Type: multipart/alternative; boundary="94eb2c089360ccd3810555ad1438"

--94eb2c089360ccd3810555ad1438
Content-Type: text/plain; charset="UTF-8"

On 1 August 2017 at 01:23, Khem Raj <raj.khem@gmail.com> wrote:

> We have a variable YOCTO_ALTERNATE_EXE_PATH to point to
> target sysroot, utilize this in mesa to use native version
> of llvm-config to report values from target sysroot.
>
> Its in a way similar to --sysroot option
>
> strip out rpath since its absolute path and incorrect thusly
>

I'd say that this needs to be three commits.  One to llvm, one to mesa to
use llvm-native, and one to mesa to chrpath.

Ross

--94eb2c089360ccd3810555ad1438
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
 August 2017 at 01:23, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"">We have a variable YOCT=
O_ALTERNATE_EXE_PATH to point to<br>
target sysroot, utilize this in mesa to use native version<br>
of llvm-config to report values from target sysroot.<br>
<br>
Its in a way similar to --sysroot option<br>
<br>
</span>strip out rpath since its absolute path and incorrect thusly<br></bl=
ockquote><div><br></div><div>I&#39;d say that this needs to be three commit=
s.=C2=A0 One to llvm, one to mesa to use llvm-native, and one to mesa to ch=
rpath.</div><div><br></div><div>Ross</div></div></div></div>

--94eb2c089360ccd3810555ad1438--
