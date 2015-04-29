Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 94A7A7169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:32:58 +0000 (UTC)
Received: by qgeb100 with SMTP id b100so9206553qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 03:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VL1i9z1Js07qz8bY1UzVcE7cTokOlIH5oHhI6G09mVw=;
	b=ORyd501OrNkSr9lUwOtGsmvsxQhTeYt7R6PxPXm1ee+8zPtex5mjkrU+PGdknfz0M0
	Q4I/oRwChR8dIlbdDMyamvE45CAR221xf298+nqjv540XwQEfyCXXdRm8pke4RD+T8na
	bvsy92VkQZwQxicLvwuS1yad8EXKzrbqLBNfyadQIBlhzbMdLICrgC1k2QllJ8mo4Ofv
	RCMJcIftANsY2E19aADQC/d+XLNefkLrW3JZqCoVOY+EcjakVZWW3QrcvYEgEcfYueAw
	pW1DAbvnp36aOGx0xd8/rtArcsfsv2zlkMqIRqlILjONZZzUwnZ14LQnZEhqQnU9mtIr
	JeaQ==
X-Gm-Message-State: ALoCoQm5h+nFQIndB8yiijFxVNmBiYY4jWmT4RitP3/dgitMZkPG6iJw2xmySUI6OBMXKHy1l1ch
X-Received: by 10.140.235.77 with SMTP id g74mr17257705qhc.64.1430303579965;
	Wed, 29 Apr 2015 03:32:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 29 Apr 2015 03:32:39 -0700 (PDT)
In-Reply-To: <CAMKF1spa7T5vg9xSsN5tBxj-VZP7=y8pF9sVKoJY8qUMibtcFA@mail.gmail.com>
References: <1430218691-6679-1-git-send-email-ross.burton@intel.com>
	<CAMKF1spa7T5vg9xSsN5tBxj-VZP7=y8pF9sVKoJY8qUMibtcFA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Apr 2015 11:32:39 +0100
Message-ID: <CAJTo0LaLCtw29Sq_QCuQ-LYU5j=7P6x=XC_udnS+EP8NeSZVBg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xorg: use GCC 5 patch from upstream
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
X-List-Received-Date: Wed, 29 Apr 2015 10:33:01 -0000
Content-Type: multipart/alternative; boundary=001a11354a00ce3cc70514da802e

--001a11354a00ce3cc70514da802e
Content-Type: text/plain; charset=UTF-8

On 28 April 2015 at 15:33, Khem Raj <raj.khem@gmail.com> wrote:

> looks good. You need to remove the CPPFLAGS change from recipe now
> with this patch
>

Either I can't see what you're referring to, or you're confusing this with
a different recipe...

Ross

--001a11354a00ce3cc70514da802e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 April 2015 at 15:33, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":3pc" class=3D"a3s" style=
=3D"overflow:hidden">looks good. You need to remove the CPPFLAGS change fro=
m recipe now<br>
with this patch</div></blockquote><div><br></div><div>Either I can&#39;t se=
e what you&#39;re referring to, or you&#39;re confusing this with a differe=
nt recipe...</div><div><br></div><div>Ross</div></div><br></div></div>

--001a11354a00ce3cc70514da802e--
