Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0111173A77
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 14:13:58 +0000 (UTC)
Received: by qcay5 with SMTP id y5so3678832qca.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 07:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wqw/hsSnwO7me+PEVIdJ123vgX1ze8TMAhT+WgbdTGE=;
	b=OOBnZdwWiL3QGO1pyLU65VHbQ8U31QeB3eCAgQYHdolvdoj81zgRIGDVkr6PHvMpMv
	5bu8OAbOQPDQLGiq7w7sLIaQtdXIZO0Rtlv0a+jIE3cYsbPvGSDEy4JD49Dc6bPmB9xt
	mpkEsC8Ix1XeKChmaP4J1H6f/KIr5tykkaxPH+ArfHmvXo6UlnwyVE27KzDmtDtw1YNH
	kegu3p6DPDcccbQr0JeJE2JcxGbFm4Na0eiyOZ9AIRLoomAzkThUIiUa5Q04nEOAFmxs
	Yc5E3XZykHFQ7/gSTsEX5tzn3dFK9Q5ZcqZHpfVtYcVL0NxYqoEiebb03xiYGgqbniQ2
	R5eA==
X-Gm-Message-State: ALoCoQmWfv7gg+bf2zNzgEfVG0DvOU5hJa5LvlWi/CAaD3JdZsqzzlStQteuOJP4CrXVH4zz1BmC
X-Received: by 10.55.23.84 with SMTP id i81mr100313877qkh.51.1426860839631;
	Fri, 20 Mar 2015 07:13:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 20 Mar 2015 07:13:39 -0700 (PDT)
In-Reply-To: <166EFF25-177B-4897-8346-F6C0BB68D49A@gmail.com>
References: <1426681293-30112-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<CAMKF1spV93W=+jfSvC_7JsuC8xokm5V=4PB3y4TUEO03iCow-g@mail.gmail.com>
	<CAJTo0LZDFj=TXUyj9XAkK8yciQOXvhrU-eYDyVu96hv+xQg1Fg@mail.gmail.com>
	<166EFF25-177B-4897-8346-F6C0BB68D49A@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Mar 2015 16:13:39 +0200
Message-ID: <CAJTo0LZSHZ6ZeDwo-kEt9q2vBu4+UdYbtSeBm47QQz-wKc+O0g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Khemraj Sharma <khem.raj@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: avoid configure stall by feeding prompt
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
X-List-Received-Date: Fri, 20 Mar 2015 14:14:00 -0000
Content-Type: multipart/alternative; boundary=001a1146fe627d926b0511b8edf3

--001a1146fe627d926b0511b8edf3
Content-Type: text/plain; charset=UTF-8

On 20 March 2015 at 01:44, Khem Raj <raj.khem@gmail.com> wrote:

> it replaces mine and is a better fix.
>

Thanks Khem.

Ross

--001a1146fe627d926b0511b8edf3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 March 2015 at 01:44, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div>it replaces mine and is a bette=
r fix.</div></blockquote></div><br>Thanks Khem.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1146fe627d926b0511b8edf3--
