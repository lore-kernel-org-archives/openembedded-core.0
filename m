Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7A759601E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 11:23:58 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so2889055qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 04:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=h7B6dJWkdcS6Er9Cx0Vq3wCZMiKHLoWH/lHXzPxyQ4c=;
	b=gd3QTteikY0i5ZsSj1bUU8wsazv0lbL+XbdvUweKrHIaOcHtanS33rZTcqvD4IuVvx
	wD02SrFGbKtK9RMkJ/unh+BSgeoewcdNoJyWCXS2Np9nGGv3sTcQVUSI8yNuE09Va5NT
	iETIT8c7fVnSvEKzu7BexSUKMjZ7YrVy8FZ9f4NYZzG/4F/zcvbJFZYqHknMXJkRTc2N
	Aroq2wlFSrRZhHV6PaG+piYVgZJ/FqRL/C6ZvllhBB1ERIiqE+QpLRv1mK86IjU8Xz1s
	pJQdxx3lVm/RaxFRT2HiHqFLqDoSn3feG68t+0n2UIFee27mUg2oZIWJoDY6w2gses/7
	iEng==
X-Gm-Message-State: ALoCoQlgGFU9tqmu8TVLQZ2EFdyRgQprYFeh/hu83844F3bfR77YKT9WijJKiTOyWG0ZoMxl+wMc
X-Received: by 10.140.196.129 with SMTP id r123mr45397259qha.93.1435058640090; 
	Tue, 23 Jun 2015 04:24:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 23 Jun 2015 04:23:40 -0700 (PDT)
In-Reply-To: <1433294684-10258-1-git-send-email-rongqing.li@windriver.com>
References: <1433294684-10258-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jun 2015 12:23:40 +0100
Message-ID: <CAJTo0LZxzFL=DHq9NxVvcs=VNmPnCe=Z2V6ksAaBmLQ0+FAHxQ@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v4] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Tue, 23 Jun 2015 11:23:59 -0000
Content-Type: multipart/alternative; boundary=001a1143395279916c05192da0db

--001a1143395279916c05192da0db
Content-Type: text/plain; charset=UTF-8

On 3 June 2015 at 02:24, <rongqing.li@windriver.com> wrote:

> +CFLAGS += "-U_FORTIFY_SOURCE"
>

So Richard made the valid point that this is disabling the security flags
in mmc-utils globally to fix builds in the very few cases when DEBUG_BUILD
is enabled.

Would it be sensible to have an include file that enables DEBUG_BUILD and
also tweaks CFLAGS where required?  I'd also like to see what the error is,
and if it can be fixed in the code for good instead.

Ross

--001a1143395279916c05192da0db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 June 2015 at 02:24,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing.=
li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":417" class=3D"a3s" s=
tyle=3D"overflow:hidden">+CFLAGS +=3D &quot;-U_FORTIFY_SOURCE&quot;<br></di=
v></blockquote></div><br>So Richard made the valid point that this is disab=
ling the security flags in mmc-utils globally to fix builds in the very few=
 cases when DEBUG_BUILD is enabled.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Would it be sensible to have an include file =
that enables DEBUG_BUILD and also tweaks CFLAGS where required?=C2=A0 I&#39=
;d also like to see what the error is, and if it can be fixed in the code f=
or good instead.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a1143395279916c05192da0db--
