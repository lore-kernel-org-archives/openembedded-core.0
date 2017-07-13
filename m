Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0E162781DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 09:50:35 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id v202so34058882itb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 02:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3suV4Z9InboF2zgqOrqqqbxFafeDqRciz0fbU7MTpk4=;
	b=1hg8TSFCFgYKFy71JR3Fe3w1NVYaWa0VDeOkl71Fd42OhnXcbVSF5zPZ92r9FDqINE
	RyPcr/Sx5Hao6rz7hBp7EdUUPapMXm72rmkSSgZClkIfJFrKhHP6P/lvg+sEQg7+a2J8
	XNpeeTq50/tbG9NlJw1TRptHU71QdDyS5oZXU0MQ1ye28g2SN610T7i1FdXxvqS2iva7
	+5v+R4osolwOl2s3AJtw1b8PSzE6TyHNZcow/hfTtABwToOTFFbJtyV088uTmJB5IgRx
	3WkEzeZrQw5SXua9oa3I9TmeT6cdiXzMO/vvm+p5d2CIahMMRWto5AttJawNLMxoH8C8
	3Pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3suV4Z9InboF2zgqOrqqqbxFafeDqRciz0fbU7MTpk4=;
	b=m4iQQXB5SKXssoc1gjJ3v4uDFzGdVa/uHJwGAJDEgLnOF5/YR5RjYuztOgGmsEQrbs
	H2akHdbEHJV+3YfOu7fa2R1nSKDkJMZK2zluteydjrjgNCZJ+OmEv6Vx2v2KkYoGbr+d
	giMWY8NaJb6OR+nYvpb7LRHZiwCapnFUm+nhi8g0r9uWgBlbOlKm/RJ1QdZ7+s1vWEts
	g4rBWYeWLF2FGDbh4KkIR0OePKUMHxCl8KFh8rZ7O1WHNKlThXeH4hFLc+9ZhJ99w8ry
	oklNf6ErT8nTQES+D2ya0Zxj5nXTJwJDdVDLkZMjtLVSNMaroI1CrHKrId2nCChGwTwD
	FkDQ==
X-Gm-Message-State: AIVw111KoE7o2EE7yC4UGs+3iqyJPikzGTNop7fna9I9/lE/DLJm5mZ3
	ZSupYjLb5fo/61oHlB9UiCITgvhxSHML
X-Received: by 10.36.246.2 with SMTP id u2mr25316703ith.23.1499939436640; Thu,
	13 Jul 2017 02:50:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Thu, 13 Jul 2017 02:50:16 -0700 (PDT)
In-Reply-To: <a75792ff-4291-1f5c-dca3-0a97ce64639b@windriver.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
	<3afb134341c5cfde7c0f72fda35d6d94bad24704.1499854502.git.liezhi.yang@windriver.com>
	<CAJTo0LYUwPxW_0aLGwmwANyNv5sCovXijF-XrMCzTjGSr_V=Nw@mail.gmail.com>
	<dcbc00ff-666c-ce9a-9884-42224e2701e8@windriver.com>
	<CAJTo0LanadueCFtjEZXDrk3-jkv2+Y3kBO6FsSBC-9t-Ey1GWg@mail.gmail.com>
	<a75792ff-4291-1f5c-dca3-0a97ce64639b@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Jul 2017 10:50:16 +0100
Message-ID: <CAJTo0LYV+oyEwE15JQ7+wyRAAWFqorcrAcCRGZOqLdoyY40w_g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] cryptodev: 1.8 -> 1.9
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
X-List-Received-Date: Thu, 13 Jul 2017 09:50:46 -0000
Content-Type: multipart/alternative; boundary="94eb2c11ca244e54bc05542fdd3c"

--94eb2c11ca244e54bc05542fdd3c
Content-Type: text/plain; charset="UTF-8"

On 13 July 2017 at 03:51, Robert Yang <liezhi.yang@windriver.com> wrote:

> BTW, I sent a meta-gplv2 patch to poky@yoctoproject.org two days ago, but
> I didn't find it in poky@yoctoproject.org, Ross, did you see it, please ?
> Maybe I should send it again.
>

The list is yocto@yoctoproject.org.  Please resend to the list.

Cheer,
Ross

--94eb2c11ca244e54bc05542fdd3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 July 2017 at 03:51, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_2756424=
210676141993:15j" class=3D"m_2756424210676141993a3s m_2756424210676141993aX=
jCH m_2756424210676141993m15d39dba164a8f60">BTW, I sent a meta-gplv2 patch =
to <a href=3D"mailto:poky@yoctoproject.org" target=3D"_blank">poky@yoctopro=
ject.org</a> two days ago, but<br>
I didn&#39;t find it in <a href=3D"mailto:poky@yoctoproject.org" target=3D"=
_blank">poky@yoctoproject.org</a>, Ross, did you see it, please ?<br>
Maybe I should send it again.<div class=3D"m_2756424210676141993yj6qo m_275=
6424210676141993ajU"><div id=3D"m_2756424210676141993:16d" class=3D"m_27564=
24210676141993ajR"></div></div></div></blockquote></div><br>The list is <a =
href=3D"mailto:yocto@yoctoproject.org">yocto@yoctoproject.org</a>.=C2=A0 Pl=
ease resend to the list.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Cheer,</div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c11ca244e54bc05542fdd3c--
