Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 31F9460030
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 17:49:12 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id bm13so10601422qab.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 09:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=obu4wsotv8KiK+P22BQ3sfs4g+gK01rBOs8jXRlDsF8=;
	b=eQ7KSnan/Q6KRxYYlVJCCdlgOviNDOV/8l8k2KlifRDeApEtIfsUEbVsyqzpEV81fW
	7qwgK8Rw2EfND72SE4KP8WXVCCb/MLMmTc47M4iEMvBFZxJpeLajI1/4OOAqcQHLq82N
	zfzIgWCoBjgfFcxoiy9dafpn372SqdBCOSzuLeiCOvMbTmr2QVO9SOKu7vsIdZgpVHTn
	08uMAPusDE+HKS8ExLASjeLfc6KR8xWc1nNwgiwBy8lJ9mGi+o9l98/LtwyMgwEL0Muu
	oHHUs3Xn5ymsfUNHjQz4V8ROKLrUqSN/EzsnjTGipr7IzoWqL/FT9XeHN4R9lipiTbOR
	WwIA==
X-Gm-Message-State: ALoCoQluOhj7q0BaFgKngUnU0whhRN2i97dxFR7NLu2OnWVJYn9JMEvS6DbcIKmFGpaHiQgQMjny
X-Received: by 10.229.190.71 with SMTP id dh7mr9591156qcb.5.1417628953227;
	Wed, 03 Dec 2014 09:49:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 3 Dec 2014 09:48:53 -0800 (PST)
In-Reply-To: <cover.1417593851.git.hongxu.jia@windriver.com>
References: <cover.1417593851.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 17:48:53 +0000
Message-ID: <CAJTo0LYuAKvz6GqJ6V=xf0FwwM2KfCTNxYm8rtyfg7hEK6dvxA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Revert "busybox : fix do_compile failed on qemumips when DEBUG_BUILD (ICE)"
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
X-List-Received-Date: Wed, 03 Dec 2014 17:49:15 -0000
Content-Type: multipart/alternative; boundary=001a11336ab62e54aa0509537696

--001a11336ab62e54aa0509537696
Content-Type: text/plain; charset=UTF-8

On 3 December 2014 at 08:07, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> Hongxu Jia (2):
>   Revert "busybox : fix do_compile failed on qemumips when DEBUG_BUILD
>     (ICE)"
>   Revert "fixup"
>

I think you meant to squash that :)  (I'll do this).

Ross

--001a11336ab62e54aa0509537696
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 December 2014 at 08:07, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":79l" cla=
ss=3D"a3s" style=3D"overflow:hidden">Hongxu Jia (2):<br>
=C2=A0 Revert &quot;busybox : fix do_compile failed on qemumips when DEBUG_=
BUILD<br>
=C2=A0 =C2=A0 (ICE)&quot;<br>
=C2=A0 Revert &quot;fixup&quot;<br></div></blockquote></div><br>I think you=
 meant to squash that :) =C2=A0(I&#39;ll do this).</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11336ab62e54aa0509537696--
