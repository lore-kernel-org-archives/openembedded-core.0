Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id CBFE160670
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 08:54:45 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 77so178504084ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 00:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QU3p4/OoDk4NssjM+E6P+TnN4nBTj5tq/Cjmzz/1a4c=;
	b=scdbxsyafysKQ/sEPT+d0wegGp15+zoyp5PqDPW4x5OCIbl/Yag0AsMfw1uVzjPPVm
	Uz7oq1Q8GSxDEWrH2dKGP9yK6NF2cn+ZDuw2CoV1XUQjOkzt7zHOX/QNI/Wrn0KH4lyn
	V1T5ELxwGTJe5nvrk/3mx8FtgOrHzmIYAj0Ld/LVgh+NCz+mC0kjJXm5UAxGiEWIpKN0
	0C/44EH5u2387/NfdgDhYJct/TYARUfu7eXOXd8xAXB6pZ3nv+kqKlkiNQTEzwCz6l/I
	hCiDUPrcvl1hmeb1wGPJtMx2IbGNl1ldgNHKO8R2BSaKLr2bbSxvFgwmVVO6h8Vfr5Dv
	ZfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QU3p4/OoDk4NssjM+E6P+TnN4nBTj5tq/Cjmzz/1a4c=;
	b=SQfeGaQYJr40/nWsVhfydlBJTxCKQfM9yhGRYOooAM6g2rC3/07x4bSMx2D/usJMDY
	FZBGlpfJWaILYDe3uLkKMe7EKGfklNybk9jCJYOiQgq9iPyQQ3/3baaj21jDPPSVr4gM
	gkEzTw4aN65YDUdprodS3CssRXQUP63epmjpXFT/Qq1clfCn45V2TwyBDXRVyciZMtoq
	BfyV+DlVZd4gKz8ChOH6ZeRlPJjH6nDVsZY/Zlq/SBNmAbpPIBFz3HdcFP1oJaAgeYD+
	7sDMdvFyTop0pRBx+CJP3+3NulkvAr9M9q3Ov42+LtMXkRa2dHA0BOe4YxeCY93b5hny
	F/xw==
X-Gm-Message-State: AG10YOQ72BlAJPrtARV6/ILEwTQC6FZxs/zTPlcOmGguSSzhr3lA3d3E+lP+c3moxjeW0wGWu/m+J3Pnv7PwKuNh
X-Received: by 10.107.135.104 with SMTP id j101mr24199016iod.133.1453798486612;
	Tue, 26 Jan 2016 00:54:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 26 Jan 2016 00:54:27 -0800 (PST)
In-Reply-To: <56A6F861.9000101@windriver.com>
References: <1453764577-26470-1-git-send-email-anibal.limon@linux.intel.com>
	<56A6F861.9000101@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jan 2016 08:54:27 +0000
Message-ID: <CAJTo0Lb=VfoUnVWdfc9UuQbBzgGBBRshTc5bwpQ5CJfAs6zr0A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] ptest-runner_2.0: Add ptest-runner_2.0 recipe.
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
X-List-Received-Date: Tue, 26 Jan 2016 08:54:48 -0000
Content-Type: multipart/alternative; boundary=001a113ebe925ebcd9052a38d65b

--001a113ebe925ebcd9052a38d65b
Content-Type: text/plain; charset=UTF-8

On 26 January 2016 at 04:38, Robert Yang <liezhi.yang@windriver.com> wrote:

> If it is fully compatible with 1.0, how about remove 1.0, please ?
>

Agreed, I squashed that into the patch when merging it into my staging
branch.

Ross

--001a113ebe925ebcd9052a38d65b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 January 2016 at 04:38, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1al7"=
 class=3D"a3s" style=3D"overflow:hidden">If it is fully compatible with 1.0=
, how about remove 1.0, please ?<br></div></blockquote></div><br>Agreed, I =
squashed that into the patch when merging it into my staging branch.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113ebe925ebcd9052a38d65b--
