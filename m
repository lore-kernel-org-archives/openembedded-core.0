Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 055A8731CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:47:48 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id x131so3253543ite.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8M/pBSHR+A3EqH9odNme6Gyp2frivNahipuXEvEz7bU=;
	b=Wh77il/ui6cAQqcxZfL8DyFkOeEUgWxkZEC6x3CPmUkFFrHZNlZycTG8/r3EXFfy0l
	iYJwqyJ82f5+siVqsvAvDfxKP1iDRwxGES6iJwoF6GpAiGGww12vaAavnhWhR0hZ32SF
	qRGSdnDU9ks56tpud20y702Y1cIWtYOU9Z/wJIrzVIwh3jaNKVH8s3m+I5Iq1qUX+AQE
	JSoO4r4X6CoJ2Gp/+8LlIiBDj1vF6tXZ+NEgc3SJ76usHOYttFp18sbwy2DDcPf9QGKG
	WIQGSYNY4yOMnifQULrxqQnF5RV/bsJPALmXSivQAZ9R8cVgivX37F2Ex8xmkDl5+xLZ
	vEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8M/pBSHR+A3EqH9odNme6Gyp2frivNahipuXEvEz7bU=;
	b=czyc6Qg9+5bAhQY04SPi6RlsPwpFfxGxNw+px6R1rRlo6uqSDwBPg8GPYB6h6FcqWT
	H6Rp7J72KUc1mD9i9zqU5xxjxruinKV8iOCMJNkkwnTR2V90m4B59bjnz+WvwGlBFZe1
	djYVCVn5IcoEAxgCkPQSYGuBcL6F3vA/kLbhOkGj65+wsv4wXZWbl5vjrWz5ZFO/65D8
	IWgDFETOoyf8G43gxYeJA1wOaBI2mQsnQFTT+FvDWslmO+0PWbkk01ySDvhlF3fkt1Vw
	mcLEBd3mmiWtCgJ6Z9OE5874tfrfoewncek5yHWZuvKBj26LYMeIAZGc21+RfN3/+8wp
	vKUw==
X-Gm-Message-State: AEkoouv/PUWsY4PxaTxQ7C2x9A7n2bOg+T2YbvxPtht9wilBbuAaBMmKOZJnWCUEB5P0AgRahB1zyBi0LbqoEO1L
X-Received: by 10.36.121.206 with SMTP id z197mr693820itc.22.1471538869310;
	Thu, 18 Aug 2016 09:47:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 18 Aug 2016 09:47:29 -0700 (PDT)
In-Reply-To: <1471538461-27065-1-git-send-email-raj.khem@gmail.com>
References: <1471538461-27065-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Aug 2016 17:47:29 +0100
Message-ID: <CAJTo0LYU11Jvqyv+D=qgreP8mGYchLQF1JJbosNmtBo6ONtSeQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Specify extra paths
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
X-List-Received-Date: Thu, 18 Aug 2016 16:47:49 -0000
Content-Type: multipart/alternative; boundary=001a114aa820944837053a5b57c2

--001a114aa820944837053a5b57c2
Content-Type: text/plain; charset=UTF-8

On 18 August 2016 at 17:41, Khem Raj <raj.khem@gmail.com> wrote:

> Some layers have gstreamer plugin recipes which include
> the .inc files from OE-Core but they do not get to find
> the patch that is being forced by the .inc file and
> ends up with errors like
>

Bad commit message as you don't specify the module.

But should this SRC_URI_append be in the common plugins.inc anyway?  Are
there out-of-tree modules that don't use gst-common and so the patch won't
apply?

Ross

--001a114aa820944837053a5b57c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 August 2016 at 17:41, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":1w0" class=3D"a3s aXjCH=
 m1569e8858d13a109">Some layers have gstreamer plugin recipes which include=
<br>
the .inc files from OE-Core but they do not get to find<br>
the patch that is being forced by the .inc file and<br>
ends up with errors like<br></div></blockquote></div><br>Bad commit message=
 as you don&#39;t specify the module.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">But should this SRC_URI_append be in the co=
mmon plugins.inc anyway?=C2=A0 Are there out-of-tree modules that don&#39;t=
 use gst-common and so the patch won&#39;t apply?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114aa820944837053a5b57c2--
