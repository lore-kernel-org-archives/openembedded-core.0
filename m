Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD9760721
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 09:32:20 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id f6so73439379ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 02:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dUfl1Gs0TOmLBzZyYgNvThr/3tP7yPmHfSFz1H3RjdY=;
	b=fzgHJnSXVDAkTkTR3I6Dga6f/bcIElZAdf8ToL9qgbGjnAx67jt9lnFyQAvQFn9kYN
	g8y8iX9bQhoZA7zBEE719qR/LuuPJ82yckVkm/SzEuHtezo9H0Lbal20DoD44Pbl6FQx
	Ub4MKdbV7g0qEpG5wzatShrucTSrpF7lYPNlgf3kI+uaok5GdMi2QreShKDQT3jaB0sK
	bFxh/r5UvGXkmD1dCQtSf9dGmRxH5oZsxvSYdAasBq5e8Xjt0QQceOsdxLpVqFgY3p5a
	WKdgXLf8GSgA5hjPw787gt6iEO388eouDCIZH9vAFzbuVlAHv3XBxmNmiMjY+3O42A+N
	hhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dUfl1Gs0TOmLBzZyYgNvThr/3tP7yPmHfSFz1H3RjdY=;
	b=OjRUK1w9QPtMjSrvJiah7qRozJj7N8Ma8Fin9CvqmAzZQ+PPIGfqXjLiNITJnl4n+e
	ZQua6RCLapGITt3/zoj8BFLN1krTQGYIbSd9UedMrzogx3W/pWwWexk3QxBFVfBwPIGv
	/87mcQ7XWVWN10rEJafp1ufif89P/XcP7fcVFG/7g0Dg8khXctR7+zbaSimo3KIFb1Q7
	FSGHAYzETeHIUwVOYTPvpbQcxOQQxZOLZRWtnBhdTlyjzCNya6cfFe6eqQMrfWqNjCo+
	QBdFWnex9bqXLb573Zo2QGg2Q6u9fn/5ehL9CDxTLv8yIDpry0dJOcIK46dgzbB2DPGN
	uxKg==
X-Gm-Message-State: ALyK8tJ1kBDEi5ZWH4VRRmK+/g6JOrpznZntyiQ1LTvzME3rj9zEhUEk2ZR4VmJGnvNPprZ0ihYIxGbLiIGfZCWI
X-Received: by 10.36.131.194 with SMTP id d185mr104024418ite.38.1469698341422; 
	Thu, 28 Jul 2016 02:32:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 28 Jul 2016 02:32:02 -0700 (PDT)
In-Reply-To: <88b4356a525164bda1717489d2051205f8a9fd17.1469656341.git.alejandro.hernandez@linux.intel.com>
References: <cover.1469656341.git.alejandro.hernandez@linux.intel.com>
	<88b4356a525164bda1717489d2051205f8a9fd17.1469656341.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jul 2016 10:32:02 +0100
Message-ID: <CAJTo0LZsoRkedOP+HHXt7kTOjVt3jdYfs9nrkP32TTrNL8r2hQ@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] python-pexpect: Upgrade to 4.2.0
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
X-List-Received-Date: Thu, 28 Jul 2016 09:32:21 -0000
Content-Type: multipart/alternative; boundary=94eb2c049652915ad00538aecf70

--94eb2c049652915ad00538aecf70
Content-Type: text/plain; charset=UTF-8

On 27 July 2016 at 22:52, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> -LIC_FILES_CHKSUM = "file://LICENSE;md5=66c2378a96b307d56bfb3a9e58edafa8"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
>

Please state why the license checksum changed.

Ross

--94eb2c049652915ad00538aecf70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 July 2016 at 22:52, Alejandro Hernandez <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandro=
.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":1z4" class=3D"a3s aXjCH m1562e5c70966bf64">-LIC_FILES_C=
HKSUM =3D &quot;file://LICENSE;md5=3D66c2378a96b307d56bfb3a9e58edafa8&quot;=
<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1c7a725251880af8c6a1481816=
65385b&quot;</div></blockquote></div><br>Please state why the license check=
sum changed.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--94eb2c049652915ad00538aecf70--
