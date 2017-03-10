Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9B577698
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 10:29:38 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id p64so160868599qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 02:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7BssQPMtQFcvzo9RRfOh/4bG0FRFWgRKCGLWeTCP1rs=;
	b=AOu5EiW2Vj0XClB8mj71MGlt/+Gcu9nbu4O1wVKdQxvQbezPT7VwdZmbTGMCY6fUSZ
	kBp0F9wul3on1/Gew3goA6SzDC3xk3RDk4rZ+KoElm/DYBCTO7GfM7J3rqJywjrXL2VK
	xuixtaCO+Jz5RszhoHp1pG6CJj7i6qQISaHBH+zLVrSkprIAqj7dPOT69UlYHPxvc5it
	doE6vaKTf//+MsPJw4aRzs+oeeTXhi5fImWcLaPr6NSB7bIVnJ43T07EnJkK8Uf609Oq
	qJqOOUtBFC61iULIzrlv6yNPTLdDB3uBrFACqqC3id/koqDuOtV4XgqY4e2k3NTX3ZjM
	ZdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7BssQPMtQFcvzo9RRfOh/4bG0FRFWgRKCGLWeTCP1rs=;
	b=Go5NY5LZBuKeESljfpQwB6/w71hQmsDK3IAACVAgbMncQ2fikdPRFO9Y50OUOkH45B
	gbsM8D0Bfl7v0kuYJyJf4uziqUoS3UQEpzOYtEeEmHCRPH4/htx0uRbmPiCI1uGpKtHe
	kZAfgMn8cfetFwdzt3UX8IzWAAcmXQ5PhqCj3N1hpiXn6UZMqP39X65RJ33WNUMZYH2u
	uEb6HplZWU/GcxsNzB8Ut3Y/PKJffA9d8QZiZgA4PhsE0AFrFS6Hwtbx9eiY+WqSN5A5
	txlA4ZenDJAZgdZi/5UmDCflGV3Aqpe0UennlNCxpFhJ7hCcQK9eYX15B3pU1zw4j4gg
	kUlQ==
X-Gm-Message-State: AMke39nNPWThSG1JJeUsL941X9wFRjykjBBSrspuzPZSkJMcoUo/z/YxL13oN8enlBB5ykGw6ZdL6TWWj17WLXTl
X-Received: by 10.237.34.250 with SMTP id q55mr19501310qtc.144.1489141780164; 
	Fri, 10 Mar 2017 02:29:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 10 Mar 2017 02:29:19 -0800 (PST)
In-Reply-To: <1489118123-17850-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1489118123-17850-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Mar 2017 10:29:19 +0000
Message-ID: <CAJTo0Lbgn3MS1D+D_jr+8bkBQfVzCA615_B_fE1xYTWugUyKrg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pkgconfig: Fix QA issue when upgrade rpm from 5.4.16 to 5.4.17
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
X-List-Received-Date: Fri, 10 Mar 2017 10:29:39 -0000
Content-Type: multipart/alternative; boundary=001a113eea5ad3eb1a054a5dd6ab

--001a113eea5ad3eb1a054a5dd6ab
Content-Type: text/plain; charset=UTF-8

On 10 March 2017 at 03:55, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:

> +RPROVIDES_${PN} += "pkgconfig(pkg-config) pkgconfig"
>

But PN is pkgconfig, so why is this required?

Ross

--001a113eea5ad3eb1a054a5dd6ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 March 2017 at 03:55, Zheng Ruoqin <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.fujitsu=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2e=
u" class=3D"a3s aXjCH m15ab6a5d8424d8e7">+RPROVIDES_${PN} +=3D &quot;pkgcon=
fig(pkg-config) pkgconfig&quot;<br></div></blockquote></div><br>But PN is p=
kgconfig, so why is this required?</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a113eea5ad3eb1a054a5dd6ab--
