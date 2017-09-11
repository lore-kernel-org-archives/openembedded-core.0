Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id D3F9873097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 10:52:08 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id g32so5849838ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 03:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GNh0raIV18eutBrX8NMiRZwRlFpXMeVIMBKBeYTjR1w=;
	b=lBWXAOW5PGxRfJnf45vnppHSsbIA6HlglL20oKQnZiQlqH+M2OVy2e1j9tfKrY2+JD
	wEokpun5PjayWieYckzBgkD6+Tg36lZyNtZJxVAar6Z3aR65J5IRXJUqlV6y46YPl3m/
	Dwz1jeHSJmqkXtHa28lRhWPwvEPmkYkAy2+8pM+NT2LVsbDa/PA71C/X5lm3ADugoXSe
	Gq8j46HOS6+mWFGGJaylitLuTIDeYR6PkU3xjWe7SVVfWUVA/Q2sv9yo9yJCPx83p0II
	9eBHquL/SptvmIRy28vXxufltg33h8qzUNulTf2vGJMNmhR6zNdrOwdYQo1JP3JOHkUG
	fkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GNh0raIV18eutBrX8NMiRZwRlFpXMeVIMBKBeYTjR1w=;
	b=OEjRsCTwp/lshd8mTtySXBlBTRxBGiSbL7Po8hUH8FYGiGElboZk7l+lA/i3uj+9Rc
	u8QRV2in2I2295cYICKIqGct3AxmukVn8rir1CqGH5Ck1mKyWfAWso0qtxII3XzFEMzO
	AZZHHyqAaWjVtTLryn+yKKlVjzkejN2jQvK7cx3SPkUk7OeSS1kYhH21QZHv9ehsRFSA
	xP3NzV/QLDwu4isJdLwSkAPb6WBJfL2IY7GUXMjFZLTJrRwyC27g4Fn2NedkG9I7DX5i
	EBcT6Xe8Rct010ou7i7BjRD01fv8VUFbkGBnYq2AESdPsEAhy1v8zCiUg/YK4bcJ6KOi
	ckpQ==
X-Gm-Message-State: AHPjjUjuQ/schsyzVAOkcD0Zx3l6nIANxlr1Q+PeUTfuz7BPS6+AD9W1
	/8wArjqPzxYcV45A6pJUHNxD8sYJ+BdyjUk=
X-Google-Smtp-Source: AOwi7QDAQj8rcqkGHJuiBbL7kBsnxFFFDjs66qeyUljeNa9EO6GFaL/ijyeo6QcLx0hyiBmUDlUPxO3wdMwVkNQX/wU=
X-Received: by 10.107.135.72 with SMTP id j69mr1136172iod.210.1505127129972;
	Mon, 11 Sep 2017 03:52:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 11 Sep 2017 03:51:49 -0700 (PDT)
In-Reply-To: <426c9f986646adcd1dbcb601f81ae08f87cbee9d.1505114394.git.dengke.du@windriver.com>
References: <cover.1505114394.git.dengke.du@windriver.com>
	<426c9f986646adcd1dbcb601f81ae08f87cbee9d.1505114394.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Sep 2017 11:51:49 +0100
Message-ID: <CAJTo0LaSerr07urbRCe_Nxbx1mfKxBD-Wje2P9wqJLtc+tS-uQ@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ovmf: fix do_compile error when len(tmp)=410
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
X-List-Received-Date: Mon, 11 Sep 2017 10:52:09 -0000
Content-Type: multipart/alternative; boundary="001a113f8e70ec8bb10558e7b732"

--001a113f8e70ec8bb10558e7b732
Content-Type: text/plain; charset="UTF-8"

On 11 September 2017 at 08:29, Dengke Du <dengke.du@windriver.com> wrote:

> +-#define MAX_LONG_FILE_PATH 500
> ++#define MAX_LONG_FILE_PATH 800
>

Making this limit a little bigger seems like a great way to hit it with a
slightly longer path.  The other patch
(VfrCompile-increase-path-length-limit.patch)
increases it to 1023 which seems to be a more future-proof solution (and
consistent).

Ross

--001a113f8e70ec8bb10558e7b732
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 September 2017 at 08:29, Dengke Du <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:dengke.du@windriver.com" target=3D"_blank">dengke.du=
@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color=
:rgb(204,204,204);padding-left:1ex">+-#define MAX_LONG_FILE_PATH 500<br>
++#define MAX_LONG_FILE_PATH 800<br></blockquote><div><br></div><div>Making=
 this limit a little bigger seems like a great way to hit it with a slightl=
y longer path.=C2=A0 The other patch (<span style=3D"font-size:12.800000190=
734863px">VfrCompile-increase-</span><wbr style=3D"font-size:12.80000019073=
4863px"><span style=3D"font-size:12.800000190734863px">path-length-limit.pa=
tch) increases it to 1023 which seems to be a more future-proof solution (a=
nd consistent).</span></div><div><span style=3D"font-size:12.80000019073486=
3px"><br></span></div><div><span style=3D"font-size:12.800000190734863px">R=
oss</span></div></div></div></div>

--001a113f8e70ec8bb10558e7b732--
