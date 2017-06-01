Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7D7AC7760A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:28:18 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id p66so15011991qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 02:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jyIJ3ko+xA5OD9XE4leTj/uaylb8QF9pT3+L/XAzW+8=;
	b=cOsV+gIH4LdARasBKIA/CXTum0KQNaDun9RLYTTIW3Xv1zaPz/dv43LPRFNBbKMKfa
	jTNN1UFu4ELJJPw9WvdQJTaBjTG4OD4dP2epZi76e9a5aVsiUN09200luZWwqD1wmMrg
	ZhPtbeBhEksE88mPkSvg+VQVpomZ12AFdW+vqPwGezrB4Jydz8iFRyI6GJrdPmonrlxf
	bbJ8EQB2nyJz0cy5mqEWS9VUvAk3JyRaw2TWbxOqONEUAaFfzCIr/yJYe70Buk87zNrQ
	2juOJIiZl+U5vG4eL2bwddqZgx0YGTCq2DG5VlAZXMlSDYv2GWYCr6b38QPu6sMUCFkx
	qSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jyIJ3ko+xA5OD9XE4leTj/uaylb8QF9pT3+L/XAzW+8=;
	b=uUvIgZagzkyBxebpfF/2QpM6ggeghAWQ1QYxysXBtf9YLQ1MbBYhDmvPqTjciPWVpq
	gOGaQ3TfvRrgWERFH5VkC/bm88OgeSU5uQIzPQOUZ9DJ4nZ4j5BHmIy9MfleKoGGm474
	z1LnrDkICBlz2p3jV8CrTknOwA5KcZxfbzx000bKGAEb2edOKHXOY4rX+cYGwuA24V8b
	okwV1mBd0I6wxK3ZZypXHEiNZvzkIFnDq4M5pO2ItqlBFoVcb0vs+z0YObWKus9h4Sz3
	zyVQ4f90GXc13O1t+QLr3FY/sTDHsMH1KiqaReMEwz/cLiw5/TALpnA5QB0E81x1wjU7
	JGsg==
X-Gm-Message-State: AODbwcBw45Y0Rfg1MXAS5DMrtGP1Zt9EC7SWhY0bksmoksU04QZ5ZH2M
	9xwiKxt7AYOWG/gNig5jSC2zcOBTs3rg
X-Received: by 10.55.146.199 with SMTP id u190mr443775qkd.109.1496309299601;
	Thu, 01 Jun 2017 02:28:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 1 Jun 2017 02:27:59 -0700 (PDT)
In-Reply-To: <20170530153249.7161-1-nicolas.dechesne@linaro.org>
References: <20170530153249.7161-1-nicolas.dechesne@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Jun 2017 10:27:59 +0100
Message-ID: <CAJTo0La8sEivJMFo7BzLbgLUOt0gD-8UPS06LZ0fNLoc8BoJrg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade to 17.1.1
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
X-List-Received-Date: Thu, 01 Jun 2017 09:28:18 -0000
Content-Type: multipart/alternative; boundary="94eb2c08bd70470fc70550e2a885"

--94eb2c08bd70470fc70550e2a885
Content-Type: text/plain; charset="UTF-8"

On 30 May 2017 at 16:32, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> * Costmetic changes in license.html file required new MD5 hash
> * Add PACKAGECONFIG option for libunwind support (new feature, disable by
> default)
> * Rebased 0001-Use-wayland-scanner-in-the-path.patch
> * Added zlib in DEPENDS, otherwise mesa no longer builds.
>

Breaks under musl:

http://errors.yoctoproject.org/Errors/Details/143476/

Ross

--94eb2c08bd70470fc70550e2a885
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 May 2017 at 16:32, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=3D"=
mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@lina=
ro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;bord=
er-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:1hh" cla=
ss=3D"gmail-a3s gmail-aXjCH gmail-m15c59fdfbeb70b30">* Costmetic changes in=
 license.html file required new MD5 hash<br>
* Add PACKAGECONFIG option for libunwind support (new feature, disable by d=
efault)<br>
* Rebased 0001-Use-wayland-scanner-in-<wbr>the-path.patch<br>
* Added zlib in DEPENDS, otherwise <span class=3D"gmail-il">mesa</span> no =
longer builds.<br></div></blockquote></div><br>Breaks under musl:</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"http=
://errors.yoctoproject.org/Errors/Details/143476/">http://errors.yoctoproje=
ct.org/Errors/Details/143476/</a><br></div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c08bd70470fc70550e2a885--
