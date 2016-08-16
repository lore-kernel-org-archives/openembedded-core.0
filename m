Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 001716E667
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 16:10:43 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 38so111728025iol.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 09:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E478RgYzJxpj5Q8EOdkQcEUg2q3S7T85v00g/hvObCY=;
	b=aO6VTmg+VG7Cz9muEOcPTMd+iXrP+t0uuL5aJsoA5dgxy5vsMCIx1/QAY3lUrkGixi
	fsFDfk34yupL7WsGbBTJrpZRcI/+R8UXFSPFy6Yqf8bYAGzkviKvKGDMEHuWQdXdOA6Y
	LCP+wJ62POGN/w9eTrQ+wrn7BZorCJwL7nuRKYn64mjygVIpWrIGc8Oa1jwb5UDC8lU3
	mgKlB/wnXb3eiYNXcQ8XpseGVAUwAZ9GufkZmKfEmjdHfrZqf5ZglcGCXzhoGIz+PB68
	uNqo44I19nErgom7aAmJBsF3e3411AssIMVqCoWHfWMUt2zblpGHHssjaeQcRzzfJAJ/
	elRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E478RgYzJxpj5Q8EOdkQcEUg2q3S7T85v00g/hvObCY=;
	b=SBwcEo9J5ym/ij47J3t9OqsAaXeawzzSmyv3spkPt4x3znaM3cdlPTelEtYFQe8vcx
	BIBHoDRMQldC/ne9RSuxuLmawt0ly9xw432BrlM0xilVxyn6VTEfQCPAi2Vi3j0Z06Ny
	f7Qk6gT3BuQVdAPbz5Vf+5xSiL3Q4S/EDNzIwxfn3gbNa+96I71mRDSkLfgBQL2c6NqF
	WXZ1m4vUYnx+7tMKu01WcV152QeqVYXozX03FSPQRjqwfPntV6Nd3MpU0T/T3IrPX3ty
	ToaxBi1CYPssJZ7ErZZPQ3yWGlmFU90WBZ1Idr713V7rT6PbLoh+VTfv88tpWBuz/JWl
	oQyg==
X-Gm-Message-State: AEkoouv4oBGepgd86Fp8oqGqu/87WzQHDzyT3pw8gvDDfpZrvO6Ug7ON3xJ+MOvZX+uf4LmMQ5F6V1w4qQTlai7h
X-Received: by 10.107.135.142 with SMTP id r14mr44678945ioi.133.1471363844139; 
	Tue, 16 Aug 2016 09:10:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 09:10:23 -0700 (PDT)
In-Reply-To: <b88d8df0-4e05-3e3d-5202-aa8272b81698@windriver.com>
References: <cover.1471281772.git.bruce@zedd.org>
	<CAJTo0LZC5wZ7yY=bb5EouWZEqR4ta0s4Oe07vkzQXzFGMjOp6w@mail.gmail.com>
	<b88d8df0-4e05-3e3d-5202-aa8272b81698@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 17:10:23 +0100
Message-ID: <CAJTo0Lb2K2Ho0apRVCg70bfT6EBLNf4SCZgYrsj9NXj9XDwfug@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Aug 2016 16:10:44 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc4408a7053a329775

--001a113eccbc4408a7053a329775
Content-Type: text/plain; charset=UTF-8

On 16 August 2016 at 17:01, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> Yep, that was covered in my 0/N:
>

<cough>

I'll get my coat.

Ross

--001a113eccbc4408a7053a329775
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 August 2016 at 17:01, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D=
"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@wind=
river.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":208" class=3D"a3s aXjCH m156941882966a55f">Yep, that was covered in my=
 0/N:<br></div></blockquote><div><br></div><div>&lt;cough&gt;</div><div><br=
></div><div>I&#39;ll get my coat.</div><div><br></div><div>Ross</div></div>=
</div></div>

--001a113eccbc4408a7053a329775--
