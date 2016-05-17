Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id DED2B6FF4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 14:22:25 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id d62so25118233iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 07:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7gENbr82Pf4QzVCoi3QCCnBfktBLq/zUN4HRR2Rrlns=;
	b=RfTzHrxebLLTZPwJhCVwAiB2GnNuWl6ZWl+weNg9fy5FDajRWUpBIyNfxXOwV7NVcO
	i1qaXAnL16CJfP7UXTL6I1UMqpYIn/mFncUePbS68DTz+40PHBC+2AoyP7Asmm+evCSq
	udzz42vQvWN2FnW/qmuVofW+RsZc4/1kTIX47taozLt9boc7Gsdhdb1DeIAbL1SrGS02
	ZkmGprh1rihCw+82aqIZ4iGpMOxxuK9hZUnzznNSE7ov35eZFLs2VrYmZX+Mxnvu398l
	aCu0+TD9X0XQJpY1XEbxp3e93wVTIYc0aAG+4LHqbVxLGysD7bHuXsxLte9C3lROqA+h
	8NlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7gENbr82Pf4QzVCoi3QCCnBfktBLq/zUN4HRR2Rrlns=;
	b=VIWBiiyTUYiE7S+3+U+gvzgGBRIm1R8HpS0kGLT+Snffkz8QHcq9cMdoQG0tXq0JXp
	jSKjZUO371YgvAJB2bG52zNWd9yICh0RnMpC5xABpqreRVapdI07HQ4ar1YDX5/R9dIN
	Gv4XA/g/8gcRwwAQmNDlwcEJD/EKVGlnYAOjf2imDYHBWvs3dC9nQmac2/kECeJGZQXs
	x5LDDvJK8hcUFizvegdirONMWNUv2Faw+fV3ZM4eZuW3fhmPRQWmKQtv+pisvhPnhfkT
	9WjEPYd0EaLFmK/oAy17bfuBVu2WdijwZAiNyneR0jff3OfG+lFZx72DUr50RcQf4soq
	irWw==
X-Gm-Message-State: AOPr4FXLnxtOj95/O6OaKhF9q9vIJSO6AyY8LtSLoyw5o5DxliuFu0YK1ZA0Z4yTqO8wQYLMl7jlByF2EDoFA7ev
X-Received: by 10.36.160.136 with SMTP id o130mr14474011ite.38.1463494946194; 
	Tue, 17 May 2016 07:22:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 17 May 2016 07:22:06 -0700 (PDT)
In-Reply-To: <573B1A78.7070907@gmail.com>
References: <1463415451-21779-1-git-send-email-akuster808@gmail.com>
	<C6187355-EA77-4B31-8638-C5D64613DE0E@gmail.com>
	<573A8171.50002@gmail.com>
	<9A2A2982-674F-4453-935D-DFA3FDD3DB4B@gmail.com>
	<73863eef-56c3-9085-7aa2-7408d52a5355@gmail.com>
	<FA10CE49-93CB-4CB9-9F20-F8F5396020DC@gmail.com>
	<573B1A78.7070907@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 May 2016 15:22:06 +0100
Message-ID: <CAJTo0Layx=y-gVv0vVFTKTKu7pud81+ExzKKC7GT1mBZeBcj3g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][krogoth][PATCH] python-numpy: fix build failure with python-matplotlib
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
X-List-Received-Date: Tue, 17 May 2016 14:22:26 -0000
Content-Type: multipart/alternative; boundary=94eb2c04a1486641a605330a781d

--94eb2c04a1486641a605330a781d
Content-Type: text/plain; charset=UTF-8

On 17 May 2016 at 14:19, akuster808 <akuster808@gmail.com> wrote:

> Sorry, missed this email last night.
>
> Not sure what you mean by generated. Both config and _numpyconfig.h are
> files that reside under an "arch" dir and brought in when building. I
> don't know why this needed to be done this way. Don't you recall, you
> did a patch for this package too ; ) Maybe Ross remembers,  his
> fingerprints are all over this package.
>

I just beat it into submission when it moved from meta-oe to oe-core.  The
config and numpyconfig crazy already existed and yes it's hideous but I was
worried about changing something so fundamental.

Ross

--94eb2c04a1486641a605330a781d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 May 2016 at 14:19, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto=
:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":1qf" class=3D"a3s aX=
jCH">Sorry, missed this email last night.<br>
<br>
Not sure what you mean by generated. Both config and _numpyconfig.h are<br>
files that reside under an &quot;arch&quot; dir and brought in when buildin=
g. I<br>
don&#39;t know why this needed to be done this way. Don&#39;t you recall, y=
ou<br>
did a patch for this package too ; ) Maybe Ross remembers,=C2=A0 his<br>
fingerprints are all over this package.<br></div></blockquote><div><br></di=
v><div>I just beat it into submission when it moved from meta-oe to oe-core=
.=C2=A0 The config and numpyconfig crazy already existed and yes it&#39;s h=
ideous but I was worried about changing something so fundamental.</div><div=
><br></div><div>Ross</div></div></div></div>

--94eb2c04a1486641a605330a781d--
