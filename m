Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id D24F373257
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 19:49:31 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id m9so15885224ige.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iuclpbOwmKo387ivFIqvVzswbg0kFp0tg+Kp8jJOC/A=;
	b=FMfAMlwj+zMcKXk+uMeZE/BbDNpegZn1BGhiScw8+3AUIngR1BkYoGgNu4H7LGyG+q
	XcqcUmoxZGrJA+N7J1oMEDFJluz0t62UgJgBiUa6hw/MoXNmEIB6o8mKX3XE3rqCKgkQ
	DpL0g5oblTyPgo7x+CYTXWl4G3WLQBcaded9V57PtJE3sjKfvsGxJVelb2hV6XZOzAIg
	0nbSqbiTnVK8tV3MhHkQZ/SDI3l/RhZQx5nZkIq7kfjYwVKERD8CM0MgDtH/hkBcRWvm
	j40fYdz5ugJ4d1V47MAN+gjPvI5MmYHmzqOQdgyMX/kIPp76RQBCEsLlG8t8BR9Oe+n9
	y7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iuclpbOwmKo387ivFIqvVzswbg0kFp0tg+Kp8jJOC/A=;
	b=fC46cOawIcs3tvDmR8rCL+680JYDOe69KI6ByYLa6GmCZTc0cJUeSctRN2Z187M/uG
	Hx4aw+5Uh0YO9ktNkt7jjp7DXxV8FJorlAhRhpSKYpBCojODQAcUdrwdbF+ZiwXfIGKV
	w/WtV04ePO2wJfw583zRnq2ipJVDCPNdoXfQ8cS5bsAJOJKRuES7dgdl4/Bjx5DJy5eT
	2BnzOl8IrrfzWcyVx2z4QgW+apufIQRuC4fdVbPWGtEREfPYYVOw9HGqRWJ+Kx+B1iA+
	GXtH9jt5TQwalNN6WLb5GcbNGPTVUn6Lx+282BIojHYkPIwToInQ41/r95L05c3Q/Mzn
	TTlw==
X-Gm-Message-State: AOPr4FXaqdLHKEJuCjJVnqfirG8viIVi+BdU5UpmKUAvB4og5NFMZkY53FXRrfQKDr5kj21alvNSzRPvHo9eDAfZ
X-Received: by 10.50.62.20 with SMTP id u20mr2467899igr.52.1463514571685; Tue,
	17 May 2016 12:49:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 17 May 2016 12:49:12 -0700 (PDT)
In-Reply-To: <1463503054-21927-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
References: <1463503054-21927-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 May 2016 20:49:12 +0100
Message-ID: <CAJTo0LYdyzYCR+MxNPc6S1+SOsBnSjg+fKuNPNobBPeVmgZ5Jw@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] meta:recipes-extended: zip: fix security issues
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
X-List-Received-Date: Tue, 17 May 2016 19:49:32 -0000
Content-Type: multipart/alternative; boundary=047d7bdca6062b7ae005330f0a4f

--047d7bdca6062b7ae005330f0a4f
Content-Type: text/plain; charset=UTF-8

On 17 May 2016 at 17:37, Edwin Plauchu <
edwin.plauchu.camacho@linux.intel.com> wrote:

> This patch avoids zip recipe fails to compile with compiler flags which
> elevate common string formatting issues into an error (-Wformat
> -Wformat-security -Werror=format-security).
>

Can you resend these with correct subject lines, ie just "zip: fix security
issues".

Thanks,
Ross

--047d7bdca6062b7ae005330f0a4f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 May 2016 at 17:37, Edwin Plauchu <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.plauchu.=
camacho@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":7ci" class=3D"">This patch avoids zip recipe fails to compile with com=
piler flags which elevate common string formatting issues into an error (-W=
format -Wformat-security -Werror=3Dformat-security).<br></div></blockquote>=
</div><br>Can you resend these with correct subject lines, ie just &quot;zi=
p: fix security issues&quot;.<br></div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra">Ross</d=
iv></div>

--047d7bdca6062b7ae005330f0a4f--
