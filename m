Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3C17360CEA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 11:34:21 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id jw12so3787382veb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 04:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=zjONTlPXz2mMx8zVn+FmJWYrPKwFEVjqv1VBYB5t4fw=;
	b=kuHqoJkGP5dOHmV63KvZv7maf6QYiwBIqlRwTpKMgcMCQc/2PQvtnjGXES4OILn7GG
	QAugXyICq0h6KuNcBRyF+3Ccjrti0y3ITAL91SND+vAv/tZMffTR645LeuPmeZ0xT/Km
	tiZMps7TP/sbQpqKx2zBV5nsCyH8QHK1dRax2hSSxXO2zBCm75Ui8JkcEIUvfVULP6jE
	y1kGTi58s9Kp+DSiBBiSEV3B3svq4aQgv74cU+EZ676NXEchXJKddYjah0sk1eY8jMW2
	KojcbS9wJ7u9VkW5pRdKQOAVdBe+zBhWPqoWBJwhwVO6y7pBk+tOKnIK52/rAyRBq9TK
	T/kg==
X-Gm-Message-State: ALoCoQlMn5gCh0xPKjhxR34FIU7umr2+jVX3QyGnOpNNSUU/GAk8OcNckLt7ZwkLi9E+uYG1yMeW
X-Received: by 10.52.161.231 with SMTP id xv7mr22190330vdb.1.1381145662725;
	Mon, 07 Oct 2013 04:34:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 7 Oct 2013 04:34:02 -0700 (PDT)
In-Reply-To: <1380967879-2902-1-git-send-email-eric@eukrea.com>
References: <1380967879-2902-1-git-send-email-eric@eukrea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Oct 2013 12:34:02 +0100
Message-ID: <CAJTo0LbSycGjd3WGX5bpvv538=hfe1g05FY5dy4vj-P5mfxxnw@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: fix nativesdk build without x11
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
X-List-Received-Date: Mon, 07 Oct 2013 11:34:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5 October 2013 11:11, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> when x11 is not defined in DISTRO_FEATURES, there are no x11 headers
> so True is not defined leading to :
> | ui/sdl.c:62:8: warning: type defaults to 'int' in declaration of 'doing=
_grabs' [-Wimplicit-int]
> |  static doing_grabs =3D True;
> |         ^
> | ui/sdl.c:62:22: error: 'True' undeclared here (not in a function)
> |  static doing_grabs =3D True;
> |                       ^

Does qemu on SDL on framebuffer actually work?  I'd assumed that
people using qemu without x11 were using it without SDL, so maybe this
is a bug in the build configuration for nativesdk.

A better fix would be to use 1/0 instead of True/False, I was assuming
that SDL meant X was being used.

Ross

