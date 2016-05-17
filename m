Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 453B0731ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 02:40:26 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id d62so988761iof.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=3mr1LysrcPBqWpmWEMp3pfbyh3h9JCZ6OBNVUnFV0BU=;
	b=zDc72phE7m5a1qr2sMcxe13YjGqOOMw+JS/HNWOLmX6/SqbkPWUgfyhzcQJsRNJiVW
	ctKAPo/+McCtAgJxvanLlR8AJ1utoNTlMTtgrXcAANvDiITs6K4FquRvsYoqgQYSASPY
	RljpjSg1/NcSGLt8r/4s9en6pKYAz+hvh5v0SBSbcCEnw33yRQfYslJ5UOSSHg8hx15o
	T/fihSDL9yhPr4S5Bp+XiqNKNOBBTbuH0PXEellGqwEA+Fxn18vgzpI9DElZKy6tUi66
	0+a204LH1wO+/ZhvAq/19LFjb2piJ9HB88iSVzbchBOs6MBp/ky45RnXmpK0Q11vVKE2
	/Qqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=3mr1LysrcPBqWpmWEMp3pfbyh3h9JCZ6OBNVUnFV0BU=;
	b=z4jWO8MgQWxab3B0s7U8138r6QHwaALKQzbmYFOq2Gl/d1556M0vGgcbDhsXDXFbrY
	rNNtpM3bDem9LxmaJPtCUmBQKmB3+NMRxaVq73bD56OUsk1iFZzYYStqo9wfRnSGnRiC
	4jlQ4MjxGf97ChFqCgBZGiC76g3aDRdSDA/L0jFIy2uBOD5yqcnG0wL/DwH61Hn/zhmW
	H1VnqEXGb4nGVNRfLz4/2zHjNI3VTFo1M8fYtpUAuK0rvs+HCjHXkMpnXJni37qi2sD/
	mO8WH1UVpc0MLeLVU589PBPwObjPwf3OoURgrelZltYoMIl/VO4h0lfmqrt4LZaCP5WE
	C5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=3mr1LysrcPBqWpmWEMp3pfbyh3h9JCZ6OBNVUnFV0BU=;
	b=kkRYpuJfVARZ3WOHWVLnB8Q+/Z0cIqE2duxqhD5ZbKeQ88TL6OV+SHby9FPCcYYibb
	iKrrDUrnGL2UK24wCFX3zti/I8TBbsSU7l21k0PJIXyeN/OvQ35T5bQdf6IbRYLZpJwa
	JdTRlc1sxFULfnGD/ncQ7bfC5SxfFNSj824hBWXdaHWiOU+sUWIwaAvsWXktG3nryhu0
	G2fZK+juIh9eTlKXEPbn+OCfTj0nfuTufgkjwXqg8Ba2PAf26OZfZatJ2ikYJpLj6eTB
	RT5RRZm6YT7MlFtRISS38LnqsiY1httO9MP5S7fCEXArfSr0yVXu4d5pAD/f3YkW1zXh
	kP/Q==
X-Gm-Message-State: AOPr4FXFtptb7ipVXFkWJPRiHKCqVedeEFeJBvDUVZvA2D6u0xYJifwzo9ZsKy3mPFHe/pESYO22MpYYHqj3WA==
X-Received: by 10.36.20.136 with SMTP id 130mr11876605itg.66.1463452827315;
	Mon, 16 May 2016 19:40:27 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Mon, 16 May 2016 19:40:07 -0700 (PDT)
In-Reply-To: <1463451177-15247-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
References: <1463451177-15247-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 16 May 2016 19:40:07 -0700
X-Google-Sender-Auth: hlbgVJkQznJnQz35hGOoPxED9HU
Message-ID: <CABcZANmFN8EJ53vMniL7a0byPYQ4DOi2q8_iWBfbeG7xjSSxXA@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta:recipes-extended: stat fix security gaps
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
X-List-Received-Date: Tue, 17 May 2016 02:40:30 -0000
Content-Type: multipart/alternative; boundary=001a11437c6ceb46f6053300a914

--001a11437c6ceb46f6053300a914
Content-Type: text/plain; charset=UTF-8

On Mon, May 16, 2016 at 7:12 PM, Edwin Plauchu <
edwin.plauchu.camacho@linux.intel.com> wrote:

> From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>
> This patch avoids stat fails to compile with compiler flags which elevate
> common string formatting issues into an error (-Wformat -Wformat-security
> -Werror=format-security).
>
> [YOCTO #9550]
>
> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>

This commit message summary violates project policy. The summary is
prefixed by the recipe or file, not its full path.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11437c6ceb46f6053300a914
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, May 16, 2016 at 7:12 PM, Edwin Plauchu <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.=
plauchu.camacho@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div>From: Edwin Plauchu &lt;<a href=3D"mailto:edwin.plauchu.=
camacho@intel.com" target=3D"_blank">edwin.plauchu.camacho@intel.com</a>&gt=
;<br>
<br>
This patch avoids stat fails to compile with compiler flags which elevate c=
ommon string formatting issues into an error (-Wformat -Wformat-security -W=
error=3Dformat-security).<br>
<br>
[YOCTO #9550]<br>
<br>
Signed-off-by: Edwin Plauchu &lt;<a href=3D"mailto:edwin.plauchu.camacho@in=
tel.com" target=3D"_blank">edwin.plauchu.camacho@intel.com</a>&gt;</div></b=
lockquote></div><br>This commit message summary violates project policy. Th=
e summary is prefixed by the recipe or file, not its full path.<br>-- <br><=
div>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, =
OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer,=
 Mentor Graphics</div>
</div></div>

--001a11437c6ceb46f6053300a914--
