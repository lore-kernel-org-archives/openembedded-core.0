Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 579CD606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 14:07:21 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m101so21795513ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 07:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CVic9A23cLFIrlzqwiOnE9hGtFeW6QaXTEmfjytyBro=;
	b=D1Sgfp4l1lAvxbq4rHkTriUobnXl5hO5IckMiDavbuFRUL3dXlSGEWDXJi8RuPTVUi
	YJotQQKma35BZAn/xXMDcdq716lxCk6oDkFca497wEeSdtQcXptU/lI6t0Taj6PnvRdd
	9Z1Vn30twnfhcT4wEZuEX9mjy6BimZczFsqmxPKVn+1k2RhDDDBj16OQm2XRVVE6f0u8
	IBSGIKY0hoGYobeYCgd7v3nwxe4YsFjVQ3Vs+VNBlVe2ud9wZLXuVKkLYM3TlYITGMLS
	YQTqHF0cAebOZG2mWyTJtdNfpWTy4mOfmhEK43wC/ri9ejUvuSEj7QHjuUVcH3/X1oIO
	cYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CVic9A23cLFIrlzqwiOnE9hGtFeW6QaXTEmfjytyBro=;
	b=RfvPYGkoS4bTarEhks9PZGZcW+d0LHiTQjmkj1/6IuR8lzB0d9pToyJkrkxROJcWXw
	gww9C1C/7a5b554r6c5OVY6h6XU0TGanN6b5LX8ewnUYIR7xqf0BIMbhEP/5NRnQPhpp
	5+7yHCoLGM1P7rzGNSNlrlK/AAeP6MYKcIcHn9zYjpnxqefK8FSz7XeM4t3DMYOQLS46
	3mkomPunCWVn6LlOrEyN+AKLdZgqkLzbwTbmm/L4D0/lCc6BXR3GyGrM4iymEu8F0mtb
	TS+jM8qGG0fQSVs+noUBehjx3R+BbcJNb+q9XEFE/r/EyyFQnlj+bSyOO3sjjemlH3qW
	BnNg==
X-Gm-Message-State: AEkoouvuZ6jNltMQD0ohtQotFtx4Dc+yfOrNhc3nnkR0yJfNkdBtRKOMz+TELyzU3pf3IGz89ipLh9iXBt5Q5+OT
X-Received: by 10.107.138.212 with SMTP id c81mr25588587ioj.148.1469542041182; 
	Tue, 26 Jul 2016 07:07:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 26 Jul 2016 07:07:01 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1607261001570.14189@localhost.localdomain>
References: <alpine.LFD.2.20.1607261001570.14189@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jul 2016 15:07:01 +0100
Message-ID: <CAJTo0LZZ_1V_68Pya9EUNT6imRVONTkrMzejFAGG9A8f3GYfTQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: why is "run-postinsts" considered a "development" recipe?
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
X-List-Received-Date: Tue, 26 Jul 2016 14:07:25 -0000
Content-Type: multipart/alternative; boundary=001a113ed93258fa9b05388a6b2b

--001a113ed93258fa9b05388a6b2b
Content-Type: text/plain; charset=UTF-8

On 26 July 2016 at 15:03, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   for the first time, i want to use run-postinsts to run some initial
> system setup, so i'm assuming i need to add that recipe to my image
> and the associated files, but i'm curious as to why run-postinsts
> lives under recipes-devtools. it doesn't strike me as a development
> tool, so what's the reasoning there? thanks.
>

For no reason reason other than it's intimately tied to dpkg/opkg/rpm,
which are also in devtools.

Ross

--001a113ed93258fa9b05388a6b2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 July 2016 at 15:03, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D=
"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ur" class=
=3D"a3s aXjCH m156278669c356ebf">=C2=A0 for the first time, i want to use r=
un-postinsts to run some initial<br>
system setup, so i&#39;m assuming i need to add that recipe to my image<br>
and the associated files, but i&#39;m curious as to why run-postinsts<br>
lives under recipes-devtools. it doesn&#39;t strike me as a development<br>
tool, so what&#39;s the reasoning there? thanks.</div></blockquote></div><b=
r>For no reason reason other than it&#39;s intimately tied to dpkg/opkg/rpm=
, which are also in devtools.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a113ed93258fa9b05388a6b2b--
