Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 68A276011B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 10:49:01 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id q130so187596233qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 02:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vStS246zsCEA/lRUwyt+AJRegCRWvjq5dEu49n/Tm7U=;
	b=03RWA4Rd2hEdbE+ODxoPFksrTBZa8s2JcJubHWE7WkO6DlZnZAyUMgk4o7FR/QFRjT
	ZM0LmbFpozgy8PKDA33QCfoiS9qiAinVV1QqxHM2MVKXyu+c+wp0/duvVw38rJboumZz
	ePPrv6WpPwD2ARNQSbPsr63sRt34iK0gSB36cIahh76DV51JdYQkkPCYYdBFtDYeOXd8
	duSop1W9A2DMLkFLvBrIkv6L6uP0ijapf5VofIdMBNtEnc0J+5LoIYJ0jQX030TvC4BH
	GQAbejTU5zaY+NUA7AMM5DmiiwcrfKYkCjkGiCqKeZQdA44Ir2t5zF6CaWsesHj+GuCh
	g1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vStS246zsCEA/lRUwyt+AJRegCRWvjq5dEu49n/Tm7U=;
	b=aXD7qdD4ILN/jYjS5Q7ErQVXkHY1Xl+H1ARw6xUcqYgsI538huUi51fzhyWTUs5e8+
	sJEn3CydZuHj+zQ9ruGEZHbRIIg1CXNkOqY4aDUXiyU9rtY/gm4WlxqK9827und0aiwQ
	wzJYGHOyWxFahFsh6BXumhL1L06jVqjiXNN5J56N6OZDHEmwXfc+1Q4+yUXXWPi14SQ4
	51XomTy9OLjtyeJ3QIXs+XO9GV7/mag5RMmZLvmHqS2LXZJOMWid5HwiGxp97Ny5m4CT
	JFh9+BvtSnIpvb7ezWHv91zRe6VB064zFDr+7n40VlrRT9vLZ9MMqAOn0yYjGSE4VU1S
	hKfQ==
X-Gm-Message-State: AKaTC01sZ21Og7W02qOhZynrNC65Jr9MWByo/ce176fL+Co+fbxrPU7jVpapnCxMJbGxadl98d8c9gW3MP06ANnR
X-Received: by 10.55.39.88 with SMTP id n85mr52583252qkn.244.1481021343457;
	Tue, 06 Dec 2016 02:49:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 02:48:43 -0800 (PST)
In-Reply-To: <CAHZ0fbGcJPSjagwjxu08SxbaCAr50ucZ7WL3s-cMG2v4JaoNdg@mail.gmail.com>
References: <CAHZ0fbGcJPSjagwjxu08SxbaCAr50ucZ7WL3s-cMG2v4JaoNdg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 10:48:43 +0000
Message-ID: <CAJTo0LbB5_PkVd-XBH7ESUtiGvTi7ziqLjRr9FXjLp7zAVpvqw@mail.gmail.com>
To: "Ylinen, Mikko" <mikko.ylinen@intel.com>
Cc: "meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-intel] [PATCH 2/2] gstreamer1.0-vaapi: Import from meta-intel
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
X-List-Received-Date: Tue, 06 Dec 2016 10:49:02 -0000
Content-Type: multipart/alternative; boundary=94eb2c094b161540680542fb2716

--94eb2c094b161540680542fb2716
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 09:57, Ylinen, Mikko <mikko.ylinen@intel.com> wrote:

> This suggests the versions should be kept in sync with the gstreamer
> versions:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/commit/?id=
> 3f51f61efe93c104ba7996f54f381c6c1a5e6546
>

Khem sent a GStreamer upgrade a few days ago, so they'll all be merging at
once.  gst-vaapi 1.8 doesn't build with gst 1.10 anyway.

Ross

--94eb2c094b161540680542fb2716
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 09:57, Ylinen, Mikko <span dir=3D"ltr">&lt;<a href=3D=
"mailto:mikko.ylinen@intel.com" target=3D"_blank">mikko.ylinen@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>This suggests th=
e versions should be kept in sync with the gstreamer versions:</div><div><a=
 href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/commit/?id=3D=
3f51f61efe93c104ba7996f54f381c6c1a5e6546" target=3D"_blank">http://git.yoct=
oproject.org/<wbr>cgit/cgit.cgi/meta-intel/<wbr>commit/?id=3D<wbr>3f51f61ef=
e93c104ba7996f54f381c<wbr>6c1a5e6546</a>=C2=A0</div><span class=3D"HOEnZb">=
<font color=3D"#888888"><div></div></font></span></blockquote></div><br>Khe=
m sent a GStreamer upgrade a few days ago, so they&#39;ll all be merging at=
 once. =C2=A0gst-vaapi 1.8 doesn&#39;t build with gst 1.10 anyway.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--94eb2c094b161540680542fb2716--
