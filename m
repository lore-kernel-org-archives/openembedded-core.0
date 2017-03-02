Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id B05E37300C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 11:53:01 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id n186so115806535qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 03:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uvFWoP1r05iXT6zZyHafRZrL8adA8PqRa4mXcesBSuA=;
	b=f8vKTIKm2pOPVsgLLJHGtIrEvEvCR0ZG4KGtxY7CIsJWB663flhZ03Izz0gj6MmW4U
	WC2QFXs7Gk9KbsGZqvX2QUicU943r4jDgE7leSKyotTOnQKeRNLiD+0TIdWye5nXL/4V
	o3/096homyu9wYOTLtSXjYnR4VRTpojn8U83q1luBfVMpbIjYWVvDx4lVIn5ckJkMUSn
	Vl61PC1ts1dhqRz6n5oi5YJrqrWgKzlPgEVLx87h4CpAGc2Pxt9qM9In+zMLHhYCHH02
	kLDWO913VzezY9qklNRocfgqdj3IKTGsCL3uiad9n/97uS/i1rEldHC7b1QvIgtjfnL5
	ynJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uvFWoP1r05iXT6zZyHafRZrL8adA8PqRa4mXcesBSuA=;
	b=qWzW/49DOfxfKowq1366QJpQeAmD7rSKg9cgqrnyRdwJJ5Ae0DofMgobJLN7QoFShL
	jq/BkURDtWT0UCQ6lEaZqb0iX3HophhKOhUgtyozkoGF7R+Z0na6ZMjsxvUIDTxKv0M3
	DOHymKbSlth+G8adMFupkSGT5hb4xPqoMZXb6fKzfT5dwOKmG/cNlIJoK3VsqnMiOJTV
	RQAuz6+oERiBl/PqN8pQm8F5ieNRPDFO9AsQ4C2JZSAERLc84dB8+UxteCchTjq+gqNV
	woA+ZxMtDcHzdmxAQcetuAujwuDmJCgm1ijPSRj92wDojCaoD3B7On6ns0GIZr5fvOWp
	AVwQ==
X-Gm-Message-State: AMke39kF1z5nVzaWgOVfcF3WsurINy5bKBDUYbrqkwL9GEjZCpj89iN1ZxaKl4hdiI0PQXVtFSUVq9de/nhOq5Li
X-Received: by 10.55.3.151 with SMTP id 145mr15662848qkd.244.1488455582831;
	Thu, 02 Mar 2017 03:53:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 2 Mar 2017 03:52:42 -0800 (PST)
In-Reply-To: <1486622223-32848-1-git-send-email-li.zhou@windriver.com>
References: <1486622223-32848-1-git-send-email-li.zhou@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Mar 2017 11:52:42 +0000
Message-ID: <CAJTo0La12Z7aj=WK1_ExjkKvOiY=vjb8w7fxvw23sbbE-a01MQ@mail.gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: Add choice for "with ddns" and "no ddns".
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
X-List-Received-Date: Thu, 02 Mar 2017 11:53:02 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b93a04777e30549be12e9

--94eb2c0b93a04777e30549be12e9
Content-Type: text/plain; charset=UTF-8

On 9 February 2017 at 06:37, Li Zhou <li.zhou@windriver.com> wrote:

> +-#define NSUPDATE
> ++/* #define NSUPDATE */
>

Instead of having a patch that is conditional on PACKAGECONFIG (so prone to
being left out of testing), can the patch be rewritten so that it exposes
an option or respects a variable that is set by the recipe itself?

Ross

--94eb2c0b93a04777e30549be12e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2017 at 06:37, Li Zhou <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:li.zhou@windriver.com" target=3D"_blank">li.zhou@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":239" class=3D"a3s=
 aXjCH m15a219822fe7b282">+-#define NSUPDATE<br>
++/* #define NSUPDATE */</div></blockquote></div><br>Instead of having a pa=
tch that is conditional on PACKAGECONFIG (so prone to being left out of tes=
ting), can the patch be rewritten so that it exposes an option or respects =
a variable that is set by the recipe itself?</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0b93a04777e30549be12e9--
