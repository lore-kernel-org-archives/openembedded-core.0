Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECB4731A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 09:09:49 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id to18so92851889igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 01:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=pz1Hdmn/9SpLfP1K6Yw/YJspLNFYP4v3rv0xCqFZ+s8=;
	b=mP4mY+b2BfGJq1tPkCcKrcgEFTkQG0Xy/0/1O0cpKGD8E6emN3S6Tgt1ZtxR/O1HZy
	4taaQYv4wwB+UojWI5N/CuwHwtmoObFmWxgNKgx4G0SsNKCPIUvkiTchvoudCdgaIW8J
	Dwj63FHjBtdyJOPRwEvWL1ALBcm1ol3ROZIxjc/g2E496mMEzHHnP0rLJb2dbI0GU5Qu
	qJnEQim1iri766yGuWsWn6buKubpElwrM2GUfdpYrQkNnRLaKpHORv2h2tAkGGHMvxeN
	5V4Kf3ENfcBQ4ZnMfmFT+R7vqI2tCv/L7Gk5Sx5Fme7YTYd01UiJdN/8xv7RHLU70QpC
	i9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pz1Hdmn/9SpLfP1K6Yw/YJspLNFYP4v3rv0xCqFZ+s8=;
	b=B4exsxJ/4KTQNrokPdEn8mDOn+f+XjYFoW2yhog+e1+3GynYyQZtmU+qdHWumoeeO4
	BWOd51jBv4GrJDb7+7nxgIzkduK70YW81exP8Jrn3jeoX2wPc5MZR/QX+ry3rG4O8E0H
	cHfv7c6X3g0wlxx5jRE2a6onU7RO8gc60oIBMu22f9/ABvuTwci/0zS36AH7RYqcWtEV
	2Xh6g9nUjy+XTOwvQaRTwjIXlvf8D8i+SLqNzQnbcBuyB8yXMOcvA68q0WncgWWtsZxx
	tVRkbN+Ghn4LOOiM/6ORriE/+Om8o0akqcDgUlBq9SLDLhQ5jGrj7l10wJSmu2Y+aEGb
	MHSQ==
X-Gm-Message-State: ALoCoQmL86IJ/X23WnjOG4qRgdyo2gyrxCATmzVwnINhMDWcjkUtgwxbU/ojvA6EAmpFTq9LpP8MQ7FivRypLPoab/uGHP1zMSiQFodBl0rqtLu0HeSTYVA=
X-Received: by 10.50.126.8 with SMTP id mu8mr33320407igb.52.1450948190601;
	Thu, 24 Dec 2015 01:09:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 24 Dec 2015 01:09:31 -0800 (PST)
In-Reply-To: <1450910987.2002.86.camel@pbcl.net>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
	<1450910987.2002.86.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Dec 2015 09:09:31 +0000
Message-ID: <CAJTo0Lbrb-yu=71a+7YnF0pSkiNxB26U7xh7dbS7Jr8DPEJmag@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Delete all .la files?
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
X-List-Received-Date: Thu, 24 Dec 2015 09:09:50 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf7d21470527a1337b

--047d7b1635bf7d21470527a1337b
Content-Type: text/plain; charset=UTF-8

On 23 December 2015 at 22:49, Phil Blundell <pb@pbcl.net> wrote:

> Sounds good to me.  I have been using the patch from:
>
>
> http://lists.openembedded.org/pipermail/openembedded-core/2012-October/069912.html
>
> for what is apparently the past three years and it continues to work
> well.
>

That's good to know, thanks Phil.  Does  your work not build
openjade-native?  As I said that needed .la files to be present in my
testing so I'm wondering what the difference is.

Ross

--047d7b1635bf7d21470527a1337b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 December 2015 at 22:49, Phil Blundell <span dir=3D"ltr">&lt;<a href=
=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div id=3D":fw" class=3D"a3s" style=3D"o=
verflow:hidden">Sounds good to me.=C2=A0 I have been using the patch from:<=
br>
<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2012-O=
ctober/069912.html" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org/pipermail/openembedded-core/2012-October/069912.html</a><br>
<br>
for what is apparently the past three years and it continues to work<br>
well.</div></blockquote></div><br>That&#39;s good to know, thanks Phil.=C2=
=A0 Does =C2=A0your work not build openjade-native?=C2=A0 As I said that ne=
eded .la files to be present in my testing so I&#39;m wondering what the di=
fference is.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--047d7b1635bf7d21470527a1337b--
