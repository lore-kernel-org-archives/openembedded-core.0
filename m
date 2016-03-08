Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3A9607F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 10:24:46 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id z8so14081039ige.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 02:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+HLMPdgbi5Fe2Uq3lDYr3FLe80Irmu3I3eZ0qcA+z6Q=;
	b=kcniIspptHwtKxPDVY2RXOQGHUCnZivLf0lkfk7zxgxkMihLG6/IrdZ+QZniNpw/3Z
	knrIB/WgBKzYpV74CNflrmirCXeMdblojzDIrAxIJmFkCkXj/ZoXKsVVH8hXwPGQINci
	VjYmUs8IP5r0zxeGDSs96kKuT5ZtGNBXJk5adZLsYHxJWL1WYkxOLJPwSk9mVIeldaFc
	YgrsojxPDsEPp5igXkLxe777hCq5L4inAGZSRZ03W4m3vPf5/b7A7BxIiRaNdbU8FQWM
	9ARqNpIvO92+Oxha0lVv3pCp0ydvileDL+HJKVHHIMOrxXLbxOdzbHJmhQ80Bczv8QdC
	NfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+HLMPdgbi5Fe2Uq3lDYr3FLe80Irmu3I3eZ0qcA+z6Q=;
	b=hGFi1Nn0jAglexjBIy3MwbgUPEYpHcoyM1F0651B81W80yFfW5/sW4acxdGa6bqojf
	euIvDZB3Hqo6BAA6e3uM2G9vR9YcGtctO0axkm/E8EtW5WtdJNDAjy/o+sV/JOkwlaHj
	K5vBaxvhkZ00jg/uCTu94snQ/EDPNl3GJ6+I1h0BXnNswUR93n398mnloESs2SAcQ0jN
	1VptuCTZLa8ELm62bnkouhczxOEegH5c6Xvj0Wxdh+uXjG3eOkn52ZO5fmQ6ggwQMyQw
	UM+cBn7ZeA/kV51agXolvnbC6KSb+t1B73oIAeCgx0iNPQpFjj6RIMQc8+k+3xx7BHYZ
	bUZg==
X-Gm-Message-State: AD7BkJLXxX1nes3DPRRFPefqxBlEcmhapfHagiVtddE2mqF0+4rRevj5/xxRaWyR91LEXh/jZc7g8EYnJmQA30l2
X-Received: by 10.50.97.71 with SMTP id dy7mr17959989igb.78.1457432686819;
	Tue, 08 Mar 2016 02:24:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 8 Mar 2016 02:24:27 -0800 (PST)
In-Reply-To: <CALbNGRQbfu45fM=kijvTnx4sY2SzjiVSCtGXhyt0xM+akP1sSQ@mail.gmail.com>
References: <56CC6832.90506@siemens.com>
	<1457090416.2804.19.camel@linuxfoundation.org>
	<CALbNGRQbfu45fM=kijvTnx4sY2SzjiVSCtGXhyt0xM+akP1sSQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Mar 2016 10:24:27 +0000
Message-ID: <CAJTo0LYivFU_mOJuwKffbwe1KjKCZT4HDOX+6Smv=AegrRAmBQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Debugging using sysroots and GDB
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
X-List-Received-Date: Tue, 08 Mar 2016 10:24:47 -0000
Content-Type: multipart/alternative; boundary=047d7b10cfc1951632052d86fd57

--047d7b10cfc1951632052d86fd57
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8 March 2016 at 10:01, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
>
wrote:

> How much time is really saved by stripping sysroot?
>

It was more about reducing the size of the sstate than build performance.
It's a toggle for precisely this reason: some users may not care about the
space saving but want to use the sysroot for gdb.

Ross

--047d7b10cfc1951632052d86fd57
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 March 2016 at 10:01, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=
=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@go=
oglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":5is" class=3D"a3s" style=3D"overflow:hidden">How much time is really =
saved by stripping sysroot?<br></div></blockquote><div><br></div><div>It wa=
s more about reducing the size of the sstate than build performance.=C2=A0 =
It&#39;s a toggle for precisely this reason: some users may not care about =
the space saving but want to use the sysroot for gdb.</div><div><br></div><=
div>Ross=C2=A0</div></div><br></div></div>

--047d7b10cfc1951632052d86fd57--
