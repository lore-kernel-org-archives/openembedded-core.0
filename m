Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id A8B4871633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 15:49:57 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id i50so6191873qgf.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 07:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HjC9Gh8scXLQIXg/wfATUIsv6dcqxMFa7+y+I6TOSMA=;
	b=FPfUr1UUzVWiJUXL7n/Elwmy6Am4AbOoaWcUQJgGzJLUdysr7LVqzlKJM8RC6vmxYg
	7q2tjsbD2aa2GMq03Gp7Xa1RKFKOny+5SAQX57xjfhexYhCZzLUQ0BtH50PYOpKKhPrh
	mGVcL/L66tWcPvJzLMpyIl1ELLRHjPJeBkxrGREPKB8XZFDiYMTNfMFK5cz6rJEzOpza
	9KdK1hGRZmTd9SEcmAiFgJ2mTIhC6tM/HqhbFvaHUFtvB/gOMB+2Hx/aETWperGn9lIY
	2u72SrTpo+bS+ktZao6e0z6FSJ6FDio1IgRFSiFzQWm4XeTceeegn9A1GoPm+GECmSkL
	lNMw==
X-Gm-Message-State: ALoCoQlBZZ1hGQbJAMZbjMakZLX5eJhM18I1SJTfvXDaEYep+YRgL5JHXdXBNdCBtV+5+Xu5IzuN
X-Received: by 10.140.49.5 with SMTP id p5mr56111241qga.15.1421768997779; Tue,
	20 Jan 2015 07:49:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 20 Jan 2015 07:49:37 -0800 (PST)
In-Reply-To: <1421677219-27316-1-git-send-email-gary@mlbassoc.com>
References: <1421677219-27316-1-git-send-email-gary@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Jan 2015 15:49:37 +0000
Message-ID: <CAJTo0LaKbxT+9p=Er9wQvy_4Agd9R6vCoCJKaTdx+qH2vwhWqg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl: Backport fix for bug #123591
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
X-List-Received-Date: Tue, 20 Jan 2015 15:50:04 -0000
Content-Type: multipart/alternative; boundary=001a1135194410d905050d1764fb

--001a1135194410d905050d1764fb
Content-Type: text/plain; charset=UTF-8

On 19 January 2015 at 14:20, Gary Thomas <gary@mlbassoc.com> wrote:

> @@ -0,0 +1,21 @@
> +Upstream-Status: Backport
> +Reference: https://rt.perl.org/Public/Bug/Display.html?id=123591
>

This needs to be Signed-off-by.

Ross

--001a1135194410d905050d1764fb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 January 2015 at 14:20, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":1wr" class=3D"a3s" st=
yle=3D"overflow:hidden">@@ -0,0 +1,21 @@<br>
+Upstream-Status: Backport<br>
+Reference: <a href=3D"https://rt.perl.org/Public/Bug/Display.html?id=3D123=
591" target=3D"_blank">https://rt.perl.org/Public/Bug/Display.html?id=3D123=
591</a></div></blockquote></div><br>This needs to be Signed-off-by.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a1135194410d905050d1764fb--
