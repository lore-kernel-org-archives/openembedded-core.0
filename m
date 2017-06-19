Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3E31D77A63
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 13:29:28 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id r62so33214867qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=32fOms3QvcK7FXbmLiiPwtaAfn4ONE8TIZXNyT1qq/A=;
	b=eE9HbRsy9jKBEXGj0L+h60uquk6Fdcv8NGWDMVb++cmEZxSt7w5du124wD7hxGn2xW
	mqy0lR+oTvdEYLw/YVl/JQ1AvSUoF/KfZBftsDxkgSfyOqvxU/ECK3zVl6iGyO1DZ68E
	5+a7BGvhnGJ5RHD7XI9R9mypILKhAnLYEgb1AznxLxLFPhRxj/4InzazMLPebgs6ofdO
	ujy230i+QItO0juoGJhDa1GEqSL+6QgzGS3kI84/086cQBDR39nYb3zzrnU00krkx+Xo
	+Y1ERSokg/nYz3Qq5j6vRm5JFWBuYWSA5rtzb4XI5Z88b+zn/SnWZ5iNSacnwRO5oF+6
	3TjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=32fOms3QvcK7FXbmLiiPwtaAfn4ONE8TIZXNyT1qq/A=;
	b=W3dgGNjRLHAhB1fraQgTblHxMW7ekuqVEhel3jV8/66SB2p+rwcA3OMrcBC6V7G5OW
	yQCWveXIDcwSJw87OU6rfmR4eoF+ckExsxrrEtnOMYHDzdyQcuwjdQdWTvJV/vkBNZYq
	W4wYGckpVJNaAseCGHWl5AXJ2HQ0Zm3imrV2d0jh15y3NGS/Z4OZkbrsUki8Vqw+UoCL
	2Vrp3lpvhFIYnk0zH1iK1S0WXEPP5f7z7Xpr4O0pdqQpHFwxIYy4gYJHmc2AWi2npeYE
	XwDf9qyTGI5dWEP+XXoIc8htld/uPjcURIw/T1q8Ni1tX+4gj7FjodoijDv++H9IxGsv
	GSjQ==
X-Gm-Message-State: AKS2vOxlhw/yunl+gELVQbOU6mnleJXxw/AefSZOREpd0Up7q8eMw6NF
	dC+XctnVwtvX0Bqtg4hpx7RrKvoXtMbO
X-Received: by 10.55.140.193 with SMTP id o184mr28430614qkd.127.1497878970129; 
	Mon, 19 Jun 2017 06:29:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Mon, 19 Jun 2017 06:29:09 -0700 (PDT)
In-Reply-To: <cbc4d73d-be96-309d-a749-0ad344572a22@balister.org>
References: <1497868738.24449.41.camel@linuxfoundation.org>
	<cbc4d73d-be96-309d-a749-0ad344572a22@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Jun 2017 14:29:09 +0100
Message-ID: <CAJTo0LYp_Vw5qZMqNZPRYQO4uy3oTdcH-ESVeSuHTZgC1HnhEA@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core/Yocto Project's first CVE (CVE-2017-9731)
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
X-List-Received-Date: Mon, 19 Jun 2017 13:29:29 -0000
Content-Type: multipart/alternative; boundary="001a114f0ce8ee735d0552501fa4"

--001a114f0ce8ee735d0552501fa4
Content-Type: text/plain; charset="UTF-8"

On 19 June 2017 at 14:20, Philip Balister <philip@balister.org> wrote:

> So the issue is leaking credentials, not build system paths? I mention
> this because we do leak build system paths into images in other places.
>

Yes, SRC_URI can contain username/passwords, and even if you filter those
out explicitly you can expose internal hostnames and so on.

Ross

--001a114f0ce8ee735d0552501fa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 June 2017 at 14:20, Philip Balister <span dir=3D"ltr">&lt;<a href=3D"=
mailto:philip@balister.org" target=3D"_blank">philip@balister.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":7vm" class=3D"a3=
s aXjCH m15cc083781dc0c05">So the issue is leaking credentials, not build s=
ystem paths? I mention<br>
this because we do leak build system paths into images in other places.</di=
v></blockquote></div><br>Yes, SRC_URI can contain username/passwords, and e=
ven if you filter those out explicitly you can expose internal hostnames an=
d so on.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a114f0ce8ee735d0552501fa4--
