Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5406C71ADD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 17:09:52 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id v23so167806849qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 09:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sOBBHz8q77/hr7fOyyKYcaXs8146tGh2gN8ISb+CRoY=;
	b=GbEqybnENM64lGfYfrt1EtijP4o8NrPrKFDezh57QI4fCD8vQNTqFjIvj308oip+K1
	N8ZZAyItY/sq6FZAXyT7VNOqU6+DELLc+xTB2vnx0F8nJ2KT05PpKYrbXdC/oYTZN3Lw
	tnmgjEsV0TxZ2Aw7V3JA7z36brveYgm3MngUWO1/7LH1etPgcHnjP0M1CUTwNLAVddD6
	9pjnaFNDmOSHdFDzwnK/Z5UrajFHDQ4EvWnL8gB/aKC2A+H5Ke8Fz2ktsf5ptl3cIhVd
	lMn16UcNVBa0AK1pWF6+dHbIf5ih1qUa42CM6ou+thJFAkJcEivEu9APVvdkql1GElM5
	r8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sOBBHz8q77/hr7fOyyKYcaXs8146tGh2gN8ISb+CRoY=;
	b=c0lC/5j69IeNClG2RGt1GcQ8lrZbww+3Hy5DeXVOEhclRZebxTkmtHlZXrza6hafIB
	2NtS22ep6asSKvvYZhon7SrMMuWn9pKLkOOcUHCvj/i9Gcx6qKai2M3eKq+aqjspnJ77
	cx+U3RU05t2LhKO1cpBY/reJT5qAdaJ8hhdTepNYCyiZFUnWh3LpjudLX27hsQQCVsam
	qKpjBH/ctJ2IXMnqfhTBJosU+d8gfue1aTH8yv2V8FD1ilUjB+3zEFB8QfVDFwTYzhcr
	dYTJfcyObiIkgol7kam43g+4aoSu2DcBCgStZMQj9jBB7dgUToA0bwAO0SjgD3kjR3ru
	Tt7A==
X-Gm-Message-State: AIkVDXJYp2E7kOcORzHKcNJiyBwaIMm6dO/5Jr/Z33oSpVBx7OPPws3Qxqkn4uJ2bEVn5WqN1Akzz97cRkf/DC5Z
X-Received: by 10.55.47.4 with SMTP id v4mr36290905qkh.77.1484672993291; Tue,
	17 Jan 2017 09:09:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 17 Jan 2017 09:09:32 -0800 (PST)
In-Reply-To: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jan 2017 17:09:32 +0000
Message-ID: <CAJTo0LbUEbYjNkGT=pZzNYJcn7vCoBdWVFEctEoqMCMb0Sq66g@mail.gmail.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] distutils3: add egg files to path
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
X-List-Received-Date: Tue, 17 Jan 2017 17:09:53 -0000
Content-Type: multipart/alternative; boundary=001a114f41085fde3305464d5e5d

--001a114f41085fde3305464d5e5d
Content-Type: text/plain; charset=UTF-8

On 17 January 2017 at 15:42, Jose Lamego <jose.a.lamego@linux.intel.com>
wrote:

> Packages that use egg files or directories for installation may
> not be found when imported at the python3 interpreter.
> egg files/directories path must be included in a pth file to
> be appropriately included in python path.
>

Do we understand why pip and distutils are installing as eggs, instead of
the traditional format?  I thought we
passed --single-version-externally-managed to setuptools to handle this but
I can't see this anywhere (Khem removed it from distutils back in 2013).
For reference, python3-mako just installs the metadata to the egg folder
and installs the Python code in the traditional way.

Ross

--001a114f41085fde3305464d5e5d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 January 2017 at 15:42, Jose Lamego <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jose.a.lamego@linux.intel.com" target=3D"_blank">jose.a.lamego@linux.=
intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1gz"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m159ad18e419c80ae">Packages that use =
egg files or directories for installation may<br>
not be found when imported at the python3 interpreter.<br>
egg files/directories path must be included in a pth file to<br>
be appropriately included in python path.<br></div></blockquote></div><br>D=
o we understand why pip and distutils are installing as eggs, instead of th=
e traditional format?=C2=A0 I thought we passed=C2=A0--single-version-exter=
nally-managed to setuptools to handle this but I can&#39;t see this anywher=
e (Khem removed it from distutils back in 2013).=C2=A0 For reference, pytho=
n3-mako just installs the metadata to the egg folder and installs the Pytho=
n code in the traditional way.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a114f41085fde3305464d5e5d--
