Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id D703377D60
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 09:58:03 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id m91so761192qte.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 May 2017 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KZZpGjjC18VPGKkLBvv9MRB/ssWX/bDyCSUvQoeXg7E=;
	b=j/Pf8Hfln2Brf3iT6lWbn00qfUtARjYkdNZd1nlzeAqIUvLVOs9vtkN948KL81D2bT
	c3Yjk4hj/OrwhIrwi9ghmIhviaFyQo17chiYltKISxVwVd/5xl+0xE1GVVLqBV70s89u
	aY97CJ2NH3zUUZBzXAFIKScM0iRcMMYba0rmNgQJcUuWS7CglhzCQBghMlj2ADEFEFbu
	JJLuzEbYCIhds9Dzo39U9CGE8C9sYgUawvMpj2cGj3ICDHH/3UlI5tcXVHVAfFkHU6tU
	pHSOi7QvYtwROHXzi0oV7rHb+vHCYH23o7nuPpx0eerfvPLkwyLM/iPzJyy0uzbwu0Gq
	uYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KZZpGjjC18VPGKkLBvv9MRB/ssWX/bDyCSUvQoeXg7E=;
	b=qeiEOEV5olV1H5LH535kpDiBShiRItLh4Nsj2Lb2je0RZ9pBYtg6ItM3wOu0Rk2ygz
	e7848eGsde1SgrFlmuxu/Bj/FAwRdCrVdOz6w671zdd0sDsOYB6wzi3pPeglCoMhE6Dh
	rECcH3qOK/vgQHSi8pCnFe9tE5ODLcBn6tlt/iXib9ZuRMMhKsdhQTq9RnSXeXLlofJ6
	4cy/60jBIs8y+UQazhUOb+CgU9A0IlQjUtgcMPV6kSRaW4j7WCNBTfnKxWIxQswgdP2D
	lVDdIn8CEQl71U9C923wFjKKYL5xDzwjE9E40UXSHKXEpvY94vsBSwQk/rD5zw/lazn8
	0r3A==
X-Gm-Message-State: AN3rC/4N260GwEeXXM8CsIPCQkAiMfZELEdAWFdgaEX9M28jsR/PTFVi
	Kgk3IlLO394lwWaNAn1Chbdf8Jc6AMLO
X-Received: by 10.200.46.26 with SMTP id r26mr43963509qta.197.1493978284798;
	Fri, 05 May 2017 02:58:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Fri, 5 May 2017 02:57:44 -0700 (PDT)
In-Reply-To: <1493918803.1761.53.camel@linux.intel.com>
References: <20170502173735.11700-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LbVxh8udLko405=dm9G1o20rXpSsP_ohWcB3SpvEYo5PQ@mail.gmail.com>
	<1493918803.1761.53.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 May 2017 10:57:44 +0100
Message-ID: <CAJTo0LYkmBR+XKccQOgVjM=gh2RMnzMXz1Ew-jX-ZQ1TDkM7wQ@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/oe-selftest: avoid deprecated imp.reload function
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
X-List-Received-Date: Fri, 05 May 2017 09:58:04 -0000
Content-Type: multipart/alternative; boundary=001a114708ccf7ea12054ec3ec63

--001a114708ccf7ea12054ec3ec63
Content-Type: text/plain; charset=UTF-8

On 4 May 2017 at 18:26, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> I saw the error also. The strange thing is that the import importlib has
> global scope but the interpreter does not have it visible at the 'main'
> function. any idea? will send a v2 once I figure out the latter.
>

I had a ten second look before mailing and decided that it was sufficiently
weird to let you figure it out ;)

Ross

--001a114708ccf7ea12054ec3ec63
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 May 2017 at 18:26, Leonardo Sandoval <span dir=3D"ltr">&lt;<a href=3D"=
mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonar=
do.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div id=3D":54g" class=3D"a3s aXjCH m15bd482263a83114">I =
saw the error also. The strange thing is that the import importlib has<br>
global scope but the interpreter does not have it visible at the &#39;main&=
#39;<br>
function. any idea? will send a v2 once I figure out the latter.<br></div><=
/blockquote></div><br>I had a ten second look before mailing and decided th=
at it was sufficiently weird to let you figure it out ;)</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114708ccf7ea12054ec3ec63--
