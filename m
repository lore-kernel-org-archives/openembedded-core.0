Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0FEF4784C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 11:11:03 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id d66so13221146ioe.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 03:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=49WQg9yyYTTp/pjJZ9dSL9Sy01tyQURT8drr4lnmJMM=;
	b=VU+JlOrQ0UFQAprF0aslOARB3aZoqjtRqoOt4z3y78nSaDjQjAQo4NIBo2yFG3vkCB
	c3tLkJQrlZr4FvK2RmS7k4tnLujXOdiCdLq8TEGBmnCAdLSqsyn7GD7GhjWPHwkt161/
	pG8faAVwic7Art51EBrlplBtZPuNUZ+Hf/nbytSmwGQxLMgeuFDF7vsP/BdPIQt/LA5e
	MTljoOmpiq8YgkTMDwBviSnQE5Gh8pG9d+l9aFipbH6LODmbS6YW6Otu/uAysaFuV62D
	ataEBJg5g3hqMS8X0KnvDgqL3jJGCxxvzHUvCXHOmZ972xOcY0fMS9hZU89jZpGxhWa9
	9LFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=49WQg9yyYTTp/pjJZ9dSL9Sy01tyQURT8drr4lnmJMM=;
	b=uXynsZE4J3bWIlFSWR2wtotKobSWnsKoWeimxuTTJBzEFOPKXByxJse7w3RqTRdQgt
	qTVb1SPC45OOhSKTULVLS4Gvm9xX0cBeuCaUrRoIgrQPy9LMcsvK8aJpjtlHb0j1nEgM
	y6vpF5pWYzl36fX6KVJcQPmJxFkxCVucvzK0gcDMczIYKv/v2CWtOVboBIhJ0VA326zu
	MTcAmVZny2yJkbvpmLMb27Q2mF4yrWJ1qVKQZrJZJ9g6Rkw8CNDU6xvDyxKKWuYHMcPT
	fdjcrfrTT1p7xKtGPiGX/mCAaQ51Ym2zOLUZWgSZA4hPGrKtxVTHPU6NCxG4hWZFXS4W
	Ymvw==
X-Gm-Message-State: AJaThX5Lr+oAi6qVs5qa6ODg7PB8fMr2pSqvnzs7e0lR7oxhwsUviD+0
	R0htJSwPVWUAliVxLFX1/rT0cNhH4441O9jgzvZe6g==
X-Google-Smtp-Source: ABhQp+S3P5z9NwWuty4xOjx/tKvZduss9Ioh7Bs42X1Xc5CjgU1jRQ5gcMBFDtYWX2auHREDhfIgfRCPEJaORYRBU2Q=
X-Received: by 10.107.12.233 with SMTP id 102mr4175175iom.227.1510312264763;
	Fri, 10 Nov 2017 03:11:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Fri, 10 Nov 2017 03:10:44 -0800 (PST)
In-Reply-To: <1510311749-14198-1-git-send-email-radek.dostal@streamunlimited.com>
References: <1510311749-14198-1-git-send-email-radek.dostal@streamunlimited.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Nov 2017 11:10:44 +0000
Message-ID: <CAJTo0LaBthRjJ_v9v8KrunCEQypOrMYiMOpLRv+nZb2mm25_eg@mail.gmail.com>
To: =?UTF-8?Q?Radek_Dost=C3=A1l?= <radek.dostal@streamunlimited.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sbc: fix license
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
X-List-Received-Date: Fri, 10 Nov 2017 11:11:04 -0000
Content-Type: multipart/alternative; boundary="001a113f997e0aaaca055d9efa1f"

--001a113f997e0aaaca055d9efa1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 10 November 2017 at 11:02, Radek Dost=C3=A1l <radek.dostal@streamunlimit=
ed.com
> wrote:

> sbc library itself is licensed under LGPLv2.1 or higher as mentioned in
> sbc/sbc.h or any other file in sbc directory.
>
> sbc test applications are licensed under GPLv2 or higher as mentioned in
> src/sbcenc.c or any other file in src directory
>

Are the test applications packaged?  If you split the packaging into two
packages then you could set the right license per-package.

Ross

--001a113f997e0aaaca055d9efa1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 10 November 2017 at 11:02, Radek Dost=C3=A1l <span dir=
=3D"ltr">&lt;<a href=3D"mailto:radek.dostal@streamunlimited.com" target=3D"=
_blank">radek.dostal@streamunlimited.com</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>sbc library itself is licensed under LGPLv2.1 or higher as mentioned in<br=
>
sbc/sbc.h or any other file in sbc directory.<br>
<br>
sbc test applications are licensed under GPLv2 or higher as mentioned in<br=
>
src/sbcenc.c or any other file in src directory<br></blockquote><div><br></=
div><div>Are the test applications packaged?=C2=A0 If you split the packagi=
ng into two packages then you could set the right license per-package.</div=
><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113f997e0aaaca055d9efa1f--
