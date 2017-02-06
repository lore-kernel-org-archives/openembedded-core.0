Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 686D8600E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 17:06:04 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id s140so61449145qke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 09:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MxNVcm4z3I/sP/MKAedAs32F2HtTpQQJscsOXCd6YkY=;
	b=EXQ8LNQ97r82CwqMaK1X+fM+uQfaW9pR6HEYQ81I9VADRdt8rYyAkXVKb7N14d5XBD
	GZ7wqnT8RKYui8rbOega/RXVaLDoegc08QZ+zF4NYCl/upnY9tcLT3UdkjFGVEA2stGk
	E9OEFIHJVQL5IrtCBw6UPhcL8Fc/ZpswHv7aAkVdPmgUwOQrojZDGPtSidpnExTRLKj5
	zXXe1Aro3M5AfVqbc+DQ1WWVJFEATusyAcZ4r96j9qogxuvCDzGX+YkpOfHiX+lM7Cvl
	GJd5+Bbhob0ni56dVf/mlM+c00b1gwDwV5vTOmTU0iQPVW+MLV7ex0whnONjB8VYDDVr
	tFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MxNVcm4z3I/sP/MKAedAs32F2HtTpQQJscsOXCd6YkY=;
	b=rAohOb9+koC2+aYPCK7/+m4nKCNaV1tkt7F3Bq6yTYnfHLpJILHXLEkWjwX/1xQ5I2
	fLfvpQ4B0ephnJXvDtW9r4remlHtwNYEMo21hreJn+otaZftnSBVHMRv5SiC6a+aah/5
	2y2eTRZmfMkOzJSqOas3c8CjD39XENp3vT8+iEb4oRg8uitfqB9Ghhpyr7Invyf9DB70
	HW7mRMkPVG0qL3qP/M6roVE9wSG6qGGQU6YxgVGvpWw4yXIYZJSqcCZlGIHIeYA6wFid
	VEHG6hzMe1l0t31BoCStLvdo0s7PblPpRfdSRJhLiIouA1XHcmcpI8VbVXRPxzOnn8i8
	D5rA==
X-Gm-Message-State: AMke39nuMxCf+R090I5ZuxYi9PI4czMaieeCdm6RWV7fRoLzfFb5xrX6GQsMpwuA16KqLufbSNmF0miIsAIV4v4h
X-Received: by 10.55.183.133 with SMTP id h127mr11189568qkf.121.1486400764228; 
	Mon, 06 Feb 2017 09:06:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 6 Feb 2017 09:05:43 -0800 (PST)
In-Reply-To: <1486400123.22715.15.camel@pbcl.net>
References: <1486120259.13882.26.camel@pbcl.net>
	<1486120807.14144.68.camel@linuxfoundation.org>
	<1486124973.13882.29.camel@pbcl.net>
	<1486388525.22715.2.camel@pbcl.net>
	<1486391230.14144.82.camel@linuxfoundation.org>
	<1486392281.22715.7.camel@pbcl.net>
	<1486400123.22715.15.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Feb 2017 17:05:43 +0000
Message-ID: <CAJTo0LZA2vY932F9FVnRJfZDfNBvmXAm+SqtMNCc5sO4SYO+Pg@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RSS difficulties
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
X-List-Received-Date: Mon, 06 Feb 2017 17:06:04 -0000
Content-Type: multipart/alternative; boundary=94eb2c0600568bc9050547dfa556

--94eb2c0600568bc9050547dfa556
Content-Type: text/plain; charset=UTF-8

On 6 February 2017 at 16:55, Phil Blundell <pb@pbcl.net> wrote:

> And, since recipe-sysroot-native is inside ${WORKDIR}, this blows away
> everything that rss carefully placed there. Doh.
>

Ha, nice.  I'm sure that was well intended but blasting all of ${WORKDIR}
seems overkeen.  I bet that was fun to chase!

Ross

--94eb2c0600568bc9050547dfa556
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 February 2017 at 16:55, Phil Blundell <span dir=3D"ltr">&lt;<a href=3D=
"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div>And, since recipe-sysroot-native is in=
side ${WORKDIR}, this blows away everything that rss carefully placed there=
.  Doh.</div><span class=3D"HOEnZb"><font color=3D"#888888"><div></div></fo=
nt></span></blockquote></div><br>Ha, nice.=C2=A0 I&#39;m sure that was well=
 intended but blasting all of ${WORKDIR} seems overkeen.=C2=A0 I bet that w=
as fun to chase!</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--94eb2c0600568bc9050547dfa556--
