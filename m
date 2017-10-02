Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 76D86606CA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 12:19:46 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id d192so7029624itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 05:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=49i8+/Dn+s5IUP0yfh8SHIejZZgqI6mZRZCr8ESZMdQ=;
	b=QjXhpyaB12PtejAQt7AaUWUcS/zAZzrUru744Z5rDlX02YCVjCJ6ddBt0n5P8NY5tB
	k8poojfA6ND8yrTy3YD3rPhqTRMPf9KVdsPenbNlBfQmYL4atLcs1WtD+Uc9oVpUve1z
	Cqw1AXjVK6nqvzfo3pFdDUuo1BvGqswxhYLepOVhGsYYhQnvcdiyGelpbuD6vbTbwa25
	+HsJC8fC6YSVisPKS4GmkDjsviJOsQMGtJgmLPGvyA6n5rvK8OSrFMVBCKW14JtlcD9+
	QJ/BTjnYvpfWahYsroYBUap+GvcyO4UapArQIXWmoBwpMRN75Rr+Ma9HYVAreyuyJcIA
	StZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=49i8+/Dn+s5IUP0yfh8SHIejZZgqI6mZRZCr8ESZMdQ=;
	b=ZvxFMRFa5LG3tk/LvKiGnfu/nXa4Ilv0AtIWmiZxImz/AR6Vf4A3+/8uzc9sx7n4Qx
	KOWtuEKNylz/suwoF+4Tz69aY1XDWK7iAVaGbEZ0eknZwqp13d+baHCslgLuSAMtSSLd
	LcKPKoZzL1mNB+wpX32ZoFtbU5jDG/TGj6M+ZsDvmljdbj2fAvynlRlXCMXtAgAi8YIN
	fzZdyvzHunt7CRnj5wn9g+j7XL/5I1l7g6d0EqFAs26iaCBGEea+RjSLkIhEi7vOKnuK
	CSxYsU3bADizWA7dvY3ucfKTEKbC2AT+EvQYurUzR7kiK1PLrnB5DtHwZiM/tzJimX8n
	jueQ==
X-Gm-Message-State: AMCzsaVy5/5pt2cdrWuZgJ6HW0CN1qJ7yvhM9Fwzrg40Rno+XkSKqvQl
	HAfuuFrLnPV5UZVJaqdSzYDIuYhYR0AS5OFW3voV7Q==
X-Google-Smtp-Source: AOwi7QDt73HSIshyjPR+jKRW5K2U5pO+ezpMyU2ZfDEDVE+1lCJlkJe82h3Zox12l/LoQVy+EmeIO1ixSHgSIEmnht8=
X-Received: by 10.36.167.79 with SMTP id s15mr11406824iti.6.1506946787587;
	Mon, 02 Oct 2017 05:19:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 2 Oct 2017 05:19:27 -0700 (PDT)
In-Reply-To: <1506644875-30179-1-git-send-email-yi.zhao@windriver.com>
References: <1506644875-30179-1-git-send-email-yi.zhao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Oct 2017 13:19:27 +0100
Message-ID: <CAJTo0LaM_D3862Yuq3Y6vQkMa3bwBjgozYZd93r1nv=dV=F2wQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] watchdog: install wd_keepalive service file to its own package
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
X-List-Received-Date: Mon, 02 Oct 2017 12:19:47 -0000
Content-Type: multipart/alternative; boundary="f403045fb218f84dae055a8f63b8"

--f403045fb218f84dae055a8f63b8
Content-Type: text/plain; charset="UTF-8"

On 29 September 2017 at 01:27, Yi Zhao <yi.zhao@windriver.com> wrote:

> Move wd_keepalive.service from watchdog package to watchdog-keepalive
> package. Also remove debian specific code from the service file.
>

Remember to say *why*.  Reading the diff tells us that you are putting
wd-keepalive into a separate package, but doesn't explain *why*.

I suspect its because you should only be running one of them and if they
both start then they'll race.  I also suspect the real solution is to have
them either one or both disabled by default instead, as it appears to be
perfectly reasonable to start with one and then swap to the other.

Ross

--f403045fb218f84dae055a8f63b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 29 September 2017 at 01:27, Yi Zhao <span dir=3D"ltr">&=
lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windr=
iver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Move wd_keepalive.service from =
watchdog package to watchdog-keepalive<br>
package. Also remove debian specific code from the service file.<br></block=
quote><div><br></div><div>Remember to say *why*.=C2=A0 Reading the diff tel=
ls us that you are putting wd-keepalive into a separate package, but doesn&=
#39;t explain *why*.</div><div><br></div><div>I suspect its because you sho=
uld only be running one of them and if they both start then they&#39;ll rac=
e.=C2=A0 I also suspect the real solution is to have them either one or bot=
h disabled by default instead, as it appears to be perfectly reasonable to =
start with one and then swap to the other.</div><div><br></div><div>Ross</d=
iv></div></div></div>

--f403045fb218f84dae055a8f63b8--
