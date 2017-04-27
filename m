Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 92DF677D60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 15:42:40 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id c45so29273394qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 08:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LTrlM3x2XpZGLBud7uptIU8amLScBKL6hXJFYt2c3XM=;
	b=FwsFydMpGv2/0T/ipZuGbs3CSp3pF+71oAkYIgJ2iVEhJ1Tf81ner02QAQL527KL9R
	/cuzHYIaEtoI1bNeKiy02ZMjj03oe/Ep8ajxhSb4LXMMTZc6OE7zYIpfiNfSMkpriBc9
	9WAyQGnYdVy34o7d1pRHNlH9u2e8HJwKmOfnVn+Igi//Y8EyYjLosyVmpszSsHE7u1AG
	ufBxaDzHUoXfsbd0lcdK+WhvBag8Dgy9rbBD6MbExcULYZEkdqgydM7r2OW2MBy9Xm+7
	1RRMZbk7kl8Rkmc5dEIkK4HI/sOrpazKXE6gl4J12tmYzrdVtzPMcxq8YgaOOX1aCOyL
	osGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LTrlM3x2XpZGLBud7uptIU8amLScBKL6hXJFYt2c3XM=;
	b=At7yQYsOtdMqUyse8an7RyhLkra2a5s+8XE3LdEkI3lVGWkMnX4MZ1yOWtb+zrUHdu
	o8kL0HC9+c/a1YdPdAJZ5Oj9hnT4QRBQ1eEq0loflaMKuX62HHZaXuqjScXk2ZnzIrfN
	Q9chp21VPhUBIWaRlq4KCVQ+l+noKiAEqu3HWhaoFG8CWGCwpEYZPWLJHPGLRN6LTAZG
	shBC2MecKk30VI39oAGlGBIXa9SEdA6yOEHaZWrynZifvwrFzMDNVOjRT+Xl7/GbyQXD
	SFObZxXprYxWj2lMmAMAgxiUr8wWe3VweOXjUVUMcfWhEo/yTCAZV57Vp4D63yVYWK9n
	AMMg==
X-Gm-Message-State: AN3rC/4txFRfjmHYISrwfSKm/IF6xNcW61uRxo4XPlajFV+BM9FvXLrL
	5JqDyloVxBcLkv4it7YB0lW6q9aiGGwL
X-Received: by 10.200.3.105 with SMTP id w41mr5478504qtg.188.1493307761317;
	Thu, 27 Apr 2017 08:42:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 27 Apr 2017 08:42:20 -0700 (PDT)
In-Reply-To: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
References: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Apr 2017 16:42:20 +0100
Message-ID: <CAJTo0Lay8VDcjGx=PEhi-6Rb3wBZu=orqpj2Gb6GiPrE9eMKiw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/13] Reduce (but not completely eliminate yet) Python 2.x dependencies
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
X-List-Received-Date: Thu, 27 Apr 2017 15:42:40 -0000
Content-Type: multipart/alternative; boundary=f4030435cf58a781c5054e27ceed

--f4030435cf58a781c5054e27ceed
Content-Type: text/plain; charset=UTF-8

On 27 April 2017 at 15:27, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> And a couple of packagegroups list python 2 as well:
> - packagegroup-self-hosted
> - packagegroup-core-lsb
>

selfhosted will need it as long as we need it, and I can't imagine LSB has
dropped py2...

Ross

--f4030435cf58a781c5054e27ceed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 April 2017 at 15:27, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":17q" class=3D"a3s aXjCH m15bafd0a44696548">And a couple of =
packagegroups list python 2 as well:<br>
- packagegroup-self-hosted<br>
- packagegroup-core-lsb<br></div></blockquote></div><br>selfhosted will nee=
d it as long as we need it, and I can&#39;t imagine LSB has dropped py2...<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--f4030435cf58a781c5054e27ceed--
