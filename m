Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 68E93607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 13:14:44 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id ik10so76467209igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 05:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=47cCJVp/6JbBMjjmhBvKtHBioSnYfeNtC8IL0gEqLXc=;
	b=oWMkKnGRMQa1mw57axp7WMzShvN73adRoHQ+lKwMQ7CXj52DKparrDj/MJcmcS/Eun
	9BFqTzfmft2cJgQPZAs7jh5MyndwzdiieWReD60GhrWiaREPNdqwO4sS1td5WR8G637C
	8y8cyj8FawuGye77wUkz4ptY9ot16X9fFboH8HZikpiYY1EjJlZD4RGHIizuhrcYHTSQ
	mowL8PkutZZZ4NgcjyKDt0b5LaFt6cpUczve81gcpw5/aSxhExLuRBFjm9o6eOvejzxi
	4FE78ByJL3MdxjKuk8Me3CsJDNrCFiYpQIfk9QykN42qcjMMNisIStKHF41qXArY2Pcs
	BR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=47cCJVp/6JbBMjjmhBvKtHBioSnYfeNtC8IL0gEqLXc=;
	b=BGDE/SQGZs43NxSMbtyoPb45V938X6fEj5FXespbOGDFsQeeT5U139ySsu1fsvs2gZ
	/rQVQREz9Mwr5jJmfULdZ8wAQGtTO+OzLNZKLnP/SjQR9nhByz+EgY/hPq31xN/T19Xb
	kyDNCQeZf9rCUgkWPakVgVESTtjV0JmRFc9jBhm/E6GZT+z5SQtOH8mW9CRP/LzqXY0R
	zlG24PbMj59XIz92NT6yiTvGNBEAvdueCGfygK++q08dOpGGcYsdvoSYLQikdh/sInfP
	ZM7fhWPoJwGWilIPmCoKSGIMV07m5Bge3o0k1SHOCELEkUCVq2NGTnM5BTcw+Y9PuK4R
	Gp0Q==
X-Gm-Message-State: AG10YOQvX6heb9iD5fCKf/ctvQ5mmvlr4Lr3t3pE7v0CFbb1/Xv471UemsUZN0r+A+UsXodljvbMB5vMCCNHck5V
X-Received: by 10.50.55.4 with SMTP id n4mr14632010igp.64.1453209283553; Tue,
	19 Jan 2016 05:14:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 19 Jan 2016 05:14:21 -0800 (PST)
In-Reply-To: <1453206311-26625-1-git-send-email-adrian.ratiu@ni.com>
References: <1453206311-26625-1-git-send-email-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Jan 2016 13:14:21 +0000
Message-ID: <CAJTo0LYyJGHLyrHd7eZ9KR9WfDknoWpgKQ5uHiFm8dhOwSJdQw@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-runtime.inc: provide libquadmath
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
X-List-Received-Date: Tue, 19 Jan 2016 13:14:47 -0000
Content-Type: multipart/alternative; boundary=e89a8f3b9b4931a5300529afa718

--e89a8f3b9b4931a5300529afa718
Content-Type: text/plain; charset=UTF-8

On 19 January 2016 at 12:25, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> +RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic libquadmath"
>

If libquadmath is only needed when fortran is enabled, shouldn't this
respect the FORTRAN variable as well?  Or are there users beyond the
fortran support?

Ross

--e89a8f3b9b4931a5300529afa718
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 January 2016 at 12:25, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ns" class=
=3D"a3s" style=3D"overflow:hidden">+RUNTIMETARGET =3D &quot;libssp libstdc+=
+-v3 libgomp libatomic libquadmath&quot;<br></div></blockquote></div><br>If=
 libquadmath is only needed when fortran is enabled, shouldn&#39;t this res=
pect the FORTRAN variable as well?=C2=A0 Or are there users beyond the fort=
ran support?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--e89a8f3b9b4931a5300529afa718--
