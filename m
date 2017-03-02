Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7E86E775DD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 14:50:59 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id 1so7895960qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 06:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z3YxJQ/0Z7EbedUUM73uKlCAH+poZygtSlgDNBou39g=;
	b=xasWWw4CqXGt40AXn3Kl71pgx1/+fXZ/KbUdYbOZHsLKFOu0kewSyauXV78HbPhT/F
	jgn2Z2KTxTKbHvw/UAT9arr0caGovhYEz0vHAJxTlN4VtuHbFeeA2MDzQ2MsJN7l+DAu
	vcCR86O2hvHZ7IRs0Or3MReV7p9mG0vwtOPEopJeFYCzEhHnKMj4VpYoOgKzzqgUAF7T
	tZKTMQRK8i/M5IVVsPAXWfFN+5tseZjxy+fIdIp68HA3tBdGUpF1tnmO212SfeLeTGzP
	tu1bHdwnivGx62ExuNXqOorFvfGl6HxNHY2ISGwHnT4XU69yQLgCnNCFScdQSSAjEiJ1
	Exeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z3YxJQ/0Z7EbedUUM73uKlCAH+poZygtSlgDNBou39g=;
	b=Inxxf5f9iQJvGjLw5bTZU9y5Cw257Z9Mp+bz2cg1tgoWeqOW34M0yeQ16RC26GUkPb
	j7m1vJyyXKtSz4YfPpG5oVSiULgpbR1SnKnXzCdpnMXng+DQLAEfTkB7Nln59Ajgyh0X
	0cH9H3CkyVM+AqvCvGxCLhd3mDTkC3JfBTHIW81FhPjydcV50w/k2A5KqRizjlS/YIg8
	eBSKkfD+rRq4gIXhQVMMeeywQICEWLq30ESAuqvraVrY/fMLYu20M42CC/xY6TCJhkk2
	3XuSa8y4Wjm8SsY0Nn7bqW3J3YX5t3inz5AOMNDqqYM6Q9ON87vRQ73xsOXXcV7XYv+9
	8XEw==
X-Gm-Message-State: AMke39nkZTWf+5Rg+CBsV8y6foQK6DUpJO5Y5LDLmlM6p+w/bmc4dUV+8JYJ8Qqp+z2Kf52YQMd7MQ54wGurwhkm
X-Received: by 10.200.2.150 with SMTP id p22mr18148188qtg.197.1488466260848;
	Thu, 02 Mar 2017 06:51:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 2 Mar 2017 06:50:40 -0800 (PST)
In-Reply-To: <20170302133630.2958-1-Zubair.Kakakhel@imgtec.com>
References: <20170302133630.2958-1-Zubair.Kakakhel@imgtec.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Mar 2017 14:50:40 +0000
Message-ID: <CAJTo0LY=adJY25h=weJyz5PK9JzSE+UMvMK98TpMvv-DzZmCJA@mail.gmail.com>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch] autoconf: Add configurations for MIPS R6
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
X-List-Received-Date: Thu, 02 Mar 2017 14:51:02 -0000
Content-Type: multipart/alternative; boundary=f4030435c234bd41200549c08e9a

--f4030435c234bd41200549c08e9a
Content-Type: text/plain; charset=UTF-8

On 2 March 2017 at 13:36, Zubair Lutfullah Kakakhel <
Zubair.Kakakhel@imgtec.com> wrote:

> Is this the right way?
>
> Ideally should fetch a new file from
>
> http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_
> plain;f=config.sub;hb=HEAD
>

One other way would be to copy that file instead of patching, and use
subdir=${S}/build-aux in the SRC_URI to put it in the right place.

A patch works fine, although you need to include a Signed-off-by and
Upstream-Status (in this case, Backport and mention the commit hash it came
from) in the patch header.

Ross

--f4030435c234bd41200549c08e9a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 March 2017 at 13:36, Zubair Lutfullah Kakakhel <span dir=3D"ltr">&lt;<=
a href=3D"mailto:Zubair.Kakakhel@imgtec.com" target=3D"_blank">Zubair.Kakak=
hel@imgtec.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":1ha" class=3D"a3s aXjCH m15a8f4b3bf292378">Is this the right way?<b=
r>
<br>
Ideally should fetch a new file from<br>
<br>
<a href=3D"http://git.savannah.gnu.org/gitweb/?p=3Dconfig.git;a=3Dblob_plai=
n;f=3Dconfig.sub;hb=3DHEAD" rel=3D"noreferrer" target=3D"_blank">http://git=
.savannah.gnu.org/<wbr>gitweb/?p=3Dconfig.git;a=3Dblob_<wbr>plain;f=3Dconfi=
g.sub;hb=3DHEAD</a></div></blockquote></div><br></div><div class=3D"gmail_e=
xtra">One other way would be to copy that file instead of patching, and use=
 subdir=3D${S}/build-aux in the SRC_URI to put it in the right place.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">A patch wor=
ks fine, although you need to include a Signed-off-by and Upstream-Status (=
in this case, Backport and mention the commit hash it came from) in the pat=
ch header.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--f4030435c234bd41200549c08e9a--
