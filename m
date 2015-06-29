Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id B61CE75C49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 14:45:03 +0000 (UTC)
Received: by qkei195 with SMTP id i195so57030233qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 07:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/TU54nRhku3AaOJvjhSmsPi4LYj7rdQIFqKJ0GVdGBI=;
	b=k/0sG0PzK5A8hV/bsAOOcw8dz407vTDqAShE/3W1Lvo0gFMPlVXmHT0URc8fpK9wwU
	mQCvgtOnKGpxOT2pbZk6g/MTW9QdQ4FKIiNMzpmEs5iFVr4fpiG7JbLlc4zY+C9X0akY
	5txdhXksvBxdf7ctwc+Ro8+2XkPQfMsOrICJnD1WHRjhS7Wq0cmeZF7/A8Wse1gd29wK
	l8eOH6+Y2Y0PzLEMFYlQfRZePZFr/R6JWi+pLYANKtS3XRsCJ3ibinAeaUH6VRCLlMfK
	cm8X2EnLxjlSu9IolbtikGsyBrTXNflDcyfRumML90TUYRzUGn9WDhTOmQIcKWN+9fPc
	fMcQ==
X-Gm-Message-State: ALoCoQlwp2RuOhuSwCz0qr0HhcA1Zq02RQBHtJgDzzy1foca2SwbWJjKBu0UTtKWv+hFAVrWejYM
X-Received: by 10.55.27.11 with SMTP id b11mr32643104qkb.105.1435589104207;
	Mon, 29 Jun 2015 07:45:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 29 Jun 2015 07:44:44 -0700 (PDT)
In-Reply-To: <1435565217-24812-1-git-send-email-rongqing.li@windriver.com>
References: <1435565217-24812-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jun 2015 15:44:44 +0100
Message-ID: <CAJTo0LZHuiNu0W1N_LU4_L-rsoPzBrm1Ur2nX5No+kogfjqvwg@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] unzip: drop 12-cve-2014-9636-test-compr-eb.patch
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
X-List-Received-Date: Mon, 29 Jun 2015 14:45:06 -0000
Content-Type: multipart/alternative; boundary=001a1147f32e99a33e0519a92297

--001a1147f32e99a33e0519a92297
Content-Type: text/plain; charset=UTF-8

On 29 June 2015 at 09:06, <rongqing.li@windriver.com> wrote:

> 12-cve-2014-9636-test-compr-eb.patch is same as unzip-6.0_overflow3.diff,
> is to fix CVE-2014-9636
>

This is going to be sound really picky, but when a patch fixes a CVE I'd
like to start moving towards the patch naming reflecting that (for CVE
verification purposes).  Can you update this patch so it removes the
overflow3 patch instead?

Ross

--001a1147f32e99a33e0519a92297
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 June 2015 at 09:06,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing=
.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":260" class=3D"a3s" =
style=3D"overflow:hidden">12-cve-2014-9636-test-compr-eb.patch is same as u=
nzip-6.0_overflow3.diff,<br>
is to fix CVE-2014-9636<br></div></blockquote></div><br>This is going to be=
 sound really picky, but when a patch fixes a CVE I&#39;d like to start mov=
ing towards the patch naming reflecting that (for CVE verification purposes=
).=C2=A0 Can you update this patch so it removes the overflow3 patch instea=
d?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a1147f32e99a33e0519a92297--
