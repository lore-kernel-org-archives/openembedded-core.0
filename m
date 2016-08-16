Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 240CC6E667
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 16:15:28 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id e63so38287735ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u7K4azCDQCMCJIOsoxz3Dp1LIVps73D+ay9xluhFzYc=;
	b=SKDw2gALl+8FXjn9e4SuSWuJtWGiolFVnNSI62o9zkdqFxXtxSLvgZUSTEGV64cMDW
	H3nB3Eh28ZZUhSvp4dlA6qV/uq28Fkn5O41ryfy+b6DBUNJb64x6SRlsonNkAHSrMLPI
	YqhrJIrBiWL9QVSoPcjyYXeS4ig/Pk38sW8cXcm7O6xx7VHMzgTVB4npjElsXST2zqrT
	e4SI4iQacq3hQ05lU894g18VV3GiZ+0EMhVYlKcW/EuUx+zXOyZ7+Vbsrcva7+Ghs2rt
	+PLUTM+hSSdoG3ow8KpflfnTj2V0ge/Nx3QbT8F8uFptwETOdwDNONQ71rf01ujlmQBB
	ihiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u7K4azCDQCMCJIOsoxz3Dp1LIVps73D+ay9xluhFzYc=;
	b=cWa2w2Ri24kgpo/SormxlKK9dHyDMaVV+qF4tcEZzJfywZ9Hw7XUlyhsUpHwYBSSi/
	TzC4ycj6PfOt7sgKoiUJTkNWpqPWVSRXq6T7ksP5FqPtZJzO3M2bxsIyz77VKB8E6L1w
	9KanjnclSAGWIsipZXhVt9O5JziuGcTaV1crEvfHT6B7HNTRgPwtFrUypmecDIIICB9p
	5Hh/jmMvl+3I0Sgm3AX3SCc6H2K0SkOkvw7xiJbAKfG9dsoRkvGTh9Pv9uAwb9uff2S2
	aas3T0pnYX1BmmkYqbZ3cljyGNqkmCVRqGH/h+6HddMn/Z5TMixhXlqndLJCBZ4i0Q0t
	PRTA==
X-Gm-Message-State: AEkoouuTU0JlA3XfaPKVuSRtMymeC49nZ89xv2shjS3fYGPnL7KpfmjYN/v/+r6D+InCNXxAj3P9pDjcwRlVQR8c
X-Received: by 10.36.129.213 with SMTP id q204mr23108719itd.38.1471364129547; 
	Tue, 16 Aug 2016 09:15:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 09:15:09 -0700 (PDT)
In-Reply-To: <ac8cf9a2-7f70-f3cf-258d-b4483d6a3b3f@windriver.com>
References: <cover.1471281772.git.bruce@zedd.org>
	<CAJTo0LZC5wZ7yY=bb5EouWZEqR4ta0s4Oe07vkzQXzFGMjOp6w@mail.gmail.com>
	<b88d8df0-4e05-3e3d-5202-aa8272b81698@windriver.com>
	<CAJTo0Lb2K2Ho0apRVCg70bfT6EBLNf4SCZgYrsj9NXj9XDwfug@mail.gmail.com>
	<ac8cf9a2-7f70-f3cf-258d-b4483d6a3b3f@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 17:15:09 +0100
Message-ID: <CAJTo0La8JO=TwypbnDCsqMpCDPZWORDnxjfsjwg83QeaC=GvTA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 16 Aug 2016 16:15:29 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fc470322053a32a88f

--94eb2c08b1fc470322053a32a88f
Content-Type: text/plain; charset=UTF-8

On 16 August 2016 at 17:11, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> ... and hopefully hit me with it for hiding that note way down in a
> TL;DR 0/N message.
>

Oh it was definitely sensible, you covered everything in the cover letter
that I only skimmed last week and promptly forgot...

Ross

--94eb2c08b1fc470322053a32a88f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 August 2016 at 17:11, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D=
"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@wind=
river.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2ws" class=3D"a3s aXjCH m1569421b1f0c2717">... and hopefully hit me wi=
th it for hiding that note way down in a<br>
TL;DR 0/N message.</div></blockquote></div><br>Oh it was definitely sensibl=
e, you covered everything in the cover letter that I only skimmed last week=
 and promptly forgot...</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--94eb2c08b1fc470322053a32a88f--
