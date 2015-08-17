Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 10BE8606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 12:33:19 +0000 (UTC)
Received: by qgj62 with SMTP id 62so92268882qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 05:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ScQOsM5bJOJB9ekMOj5cQgVRIaRTGbcSZi/xpQJwWws=;
	b=K9N1kiCCVYze5N1VrN+heRhB/kmHaBoMFWsxut6Wyn2CoRkp/J2NuiHf0SFIRPsjzy
	Qgpz2eOuxVE+BwQqYDjdqCN/l8BBdMT+UbGT21D++GtifBY1SuJnd1UVjchODatIcqIC
	TC2B+FYFJN4LX60tkYpZFmbNe2hicyZgTLiDGS5HwmyMVcb6qUoosDV8HZyLthgI8wbU
	e7Ub2n3KbJofg3NudjQLwmp/Gd2apOy31npVwvkwdOaW8YtQm0B7as3NJm0pHvmd57/L
	9LqAcLqV6Wzkl2ND9lcaw8/rFwziditcQCBawW4uyMcSUYnlVHiWJuM/QNfgIbn+VafH
	PcnA==
X-Gm-Message-State: ALoCoQkMwNCMEXzMKKduIt1dMf3gIRc2fNvsPj2SdEEXE+jjoq7r16vxk+Ltju/lwKbVy3ulAy/l
X-Received: by 10.140.133.67 with SMTP id 64mr2117168qhf.52.1439814799718;
	Mon, 17 Aug 2015 05:33:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Mon, 17 Aug 2015 05:33:00 -0700 (PDT)
In-Reply-To: <CAMKF1sqVDngrV0zZEzZcCScM+HyV+LC++VzpFtVV9ZBW0M8jSQ@mail.gmail.com>
References: <cover.1436781736.git.liezhi.yang@windriver.com>
	<7c7e76c69064f59ae5b4c6ac44235bee4332d494.1436781736.git.liezhi.yang@windriver.com>
	<CAMKF1sqVDngrV0zZEzZcCScM+HyV+LC++VzpFtVV9ZBW0M8jSQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Aug 2015 13:33:00 +0100
Message-ID: <CAJTo0La9x-ZtY=+FrFL1FPCkg86XGGeL=+FJ+ZARpcN-y58Pww@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glibc: print PN when bbwarn
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
X-List-Received-Date: Mon, 17 Aug 2015 12:33:21 -0000
Content-Type: multipart/alternative; boundary=001a1136fdceae0e62051d8101c0

--001a1136fdceae0e62051d8101c0
Content-Type: text/plain; charset=UTF-8

On 17 July 2015 at 05:45, Khem Raj <raj.khem@gmail.com> wrote:

> it quashes the warning but doesnt fix underlying problem. this doesnt
> seem to be right thing to do in cross builds. We use cross-rpcgen to
> generate these files so this whole rpcgen run should be removed
> instead. Please test such a patch and correct it.
>

There's been a related report on the yocto@ list where it was noticed that
we're executing the host rpcgen during glibc builds, so consider this is a
ping. :)

Ross

--001a1136fdceae0e62051d8101c0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 July 2015 at 05:45, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":21z" class=3D"a3s" style=
=3D"overflow:hidden">it quashes the warning but doesnt fix underlying probl=
em. this doesnt<br>
seem to be right thing to do in cross builds. We use cross-rpcgen to<br>
generate these files so this whole rpcgen run should be removed<br>
instead. Please test such a patch and correct it.</div></blockquote><div><b=
r></div><div>There&#39;s been a related report on the yocto@ list where it =
was noticed that we&#39;re executing the host rpcgen during glibc builds, s=
o consider this is a ping. :)</div><div><br></div><div>Ross</div></div></di=
v></div>

--001a1136fdceae0e62051d8101c0--
