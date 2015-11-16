Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 92C31766A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 16:17:39 +0000 (UTC)
Received: by igl9 with SMTP id 9so60389488igl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5OcKcscagCiCRQ7aKe/IZCms1OBCiWlayV6UghMeMhE=;
	b=qsw0nuFZHV4GOH5j2Qjcna1s1HtNmFLt0Fow/FNeUPKixpR0AUArwbZiPN50v6Orrj
	2mHng+CrXIHALpdETM+NEtSUfFEw2nw3H/pH+T8PU6qSFWec+qqfntirCeZ3+q92MQDS
	o3XxXKxrXOnU/Re/ozz+3zjTD7F1H2nTt5RQOYIc9V9FGWs5GBLyxRJgVoo2EVlfdIDb
	vjVE+en7V9X6oWOK1fEHc63/65BlHSq6feY2TbeC8KE7zLRUeiI/xm8aQlI1SL28QOIy
	O25dO0ciCnK+atZsSUFgXWvvk7h0muW5j5PbRgP5gqMXdQk85EPLPhziWHO+LuT0glP4
	t/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5OcKcscagCiCRQ7aKe/IZCms1OBCiWlayV6UghMeMhE=;
	b=Xhc5GuZSPVlpCJ9LPu0vPRSTQiMhVfjUl4rSP2IT0NWxXrY3b0gaZu2cYpu9wHefC/
	zIH+26A+qjeJQvAJYqGCZCYpN2IKVRyYJZIB5P1i7Q9LBQF52qebErePGqQN5H1CpdHm
	7Ey1wR4CPkEp6LeoZheWV5S4IySs8dCFoIHpCiZ3d+CgZkXa7UVTMWSs6y4ZVRcHgoE+
	6nD8fXDC+lhMx7pG2rXooDXs/fytTvRcK2Znpeqr8BHYgJXYxrQ53VDu2phS2O6xe/w/
	dGZpuNECe1wyeGvrTgyzeDc8H95p3A6vcktzyt0jMNcX3dCB8edCi/kukBTyptg+Yp5I
	gxcQ==
X-Gm-Message-State: ALoCoQnZVp9j3ivro2xSJ6kN8J/r3GL8Y5Na12Jh8m7TihWjYnQ3q4rUI/B8T4GE+w8IpdqctUnP
X-Received: by 10.50.64.147 with SMTP id o19mr16137303igs.52.1447690659038;
	Mon, 16 Nov 2015 08:17:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 08:17:19 -0800 (PST)
In-Reply-To: <564528BD.2050705@windriver.com>
References: <1447297446-18024-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LYVnvcYH2NZBtKtupO_bjnr9MKFWYRH5519q8+5xJdY3w@mail.gmail.com>
	<564528BD.2050705@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 16:17:19 +0000
Message-ID: <CAJTo0LZzNmeN3XATTThYezvCfUOsLZbkQZ9vqowYiQHvqiajhA@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v2] e2fsprogs: fix the ptest
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
X-List-Received-Date: Mon, 16 Nov 2015 16:17:39 -0000
Content-Type: multipart/alternative; boundary=047d7bea2f987a237b0524aabf07

--047d7bea2f987a237b0524aabf07
Content-Type: text/plain; charset=UTF-8

On 13 November 2015 at 00:03, Rongqing Li <rongqing.li@windriver.com> wrote:

> Please edit the patch, instead of patching a patch.
>>
>
> I did not patching a patch, I create a new patch
>

Exactly.  You're adding a patch that fixes a patch we created, please just
fix the broken code in the patch itself.

Ross

--047d7bea2f987a237b0524aabf07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 November 2015 at 00:03, Rongqing Li <span dir=3D"ltr">&lt;<a href=3D"=
mailto:rongqing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><span class=3D"">Please edit the patch, instead of patching =
a patch.<br>
</span></blockquote>
<br>
I did not patching a patch, I create a new patch<br></blockquote></div><br>=
Exactly.=C2=A0 You&#39;re adding a patch that fixes a patch we created, ple=
ase just fix the broken code in the patch itself.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bea2f987a237b0524aabf07--
