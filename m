Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD236E5FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 09:04:07 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id r145so46336689ior.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wCdivIj8gVhmfGUCui4aIzQy+Ppymb0hsgFVFAoi5xE=;
	b=enKiMcXQauwIn5BdhG5k1AeRN5FGqDhhLvthPGANwudpo898ldcFEmj+y2aghJep1D
	SjddpG5Yy6d/OV5OMLKyyAZjljc/EUGa1mAKOAyGdxisozX5LsAuamFgaJ/fBzDey08I
	8kuycc0SBiRa4sNAIzF+AgLoXz/WrpLf95AWtBHoK0XzztO5nRwzwZroj+9WjLPDWK3Y
	D9AdU+5hT7qfrID+gM/S6zGhx137buPwlAC5uqHn5b9V7chiO4NPvpIArkU8F0toFlaf
	zCFFDgNZVOtZYHKx+pSnD5Nu2ECLyuquffPDAcjbPAHZ8etWkN2wqBORUZ1lKQd1AzlM
	Mb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wCdivIj8gVhmfGUCui4aIzQy+Ppymb0hsgFVFAoi5xE=;
	b=T7IkG+wJZzEvya1ThFhFq0nYMX2p5NEhqKnGvgt3HXAzfmQGZb+N8ghPNRSGJOzg0Q
	P1wCoGxvgpNMQJ2xMTH6KUdehj/r7g7beVadZDAVy6znRFQP+Vd6Mu5Mvjn9lCGtqXb0
	0+G3o354N0k21i2wcZp6RtMg9nbn9ZogfF4UI6xuqxD7QdvsooL0IXSKnswhL3wjmtil
	t5bmnLaQjeSy/dnQk6sfouWiTIGseWjmQL0QwsxkBhciRqYV4Z8lSUqmzFZKY5owfGMt
	3HRrPx0EoQJgnKtwHpVDaHGeKI+Ulsauc58GlBlSBRXyHsLvsQ/ZFtCMqXzDsWPxernN
	YU+g==
X-Gm-Message-State: AE9vXwPqKDNBNWR5zjUHOy0pHU+rrT6PN8Q7AZ/UDMBZzct/zks5ztNVgYhi/Xp6p7jtBxyYTvfayy2jbnHyn7tL
X-Received: by 10.107.142.5 with SMTP id q5mr23955823iod.201.1474448649336;
	Wed, 21 Sep 2016 02:04:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Wed, 21 Sep 2016 02:03:48 -0700 (PDT)
In-Reply-To: <1474435844-16942-2-git-send-email-schnitzeltony@googlemail.com>
References: <1474435844-16942-1-git-send-email-schnitzeltony@googlemail.com>
	<1474435844-16942-2-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Sep 2016 10:03:48 +0100
Message-ID: <CAJTo0LY+CezkhQTnck=-xXOvikU6j7W4gSihvcEVN_ZcwEJkEw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] scons.bbclass: reduce build time by adding PARALLEL_MAKEINST to scons install params
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
X-List-Received-Date: Wed, 21 Sep 2016 09:04:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c062710fbeb42053d00d337

--94eb2c062710fbeb42053d00d337
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21 September 2016 at 06:30, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
wrote:

> During install all files are recompiled. This should be investigated
> further
> later. Currently only one file is recompiled at the same time. Reduce
> install
> time significantly by setting PARALLEL_MAKEINST option in do_install task=
.
>

Have you verified this happens for all scons recipes?  If we're hacking the
class in lieu of fixing whatever is causing scons to do this, then why not
just not invoke scons in do_compile?

Ross

--94eb2c062710fbeb42053d00d337
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 September 2016 at 06:30, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelto=
ny@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":ma" class=3D"a3s aXjCH m1574b3a5ec6c63d8">During install all fil=
es are recompiled. This should be investigated further<br>
later. Currently only one file is recompiled at the same time. Reduce insta=
ll<br>
time significantly by setting PARALLEL_MAKEINST option in do_install task.<=
br></div></blockquote></div><br>Have you verified this happens for all scon=
s recipes?=C2=A0 If we&#39;re hacking the class in lieu of fixing whatever =
is causing scons to do this, then why not just not invoke scons in do_compi=
le?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--94eb2c062710fbeb42053d00d337--
