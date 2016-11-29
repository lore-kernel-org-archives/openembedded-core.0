Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 06E8A719F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:27:49 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id n21so181869917qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3LE6rcuScvWP4+vxSE2vEsJdvK9uq8G6AnUbHBwmVf8=;
	b=wJ25kPrKqIJafkjrhBM4masi4hUsfdMB5+h5WFDhnBbfx3+gxEaU8BQc5Om+cETQrD
	U1Jst54xPtM/VCIiMK6v9d4yrigRhwkFcF/Ji4sY4FgxWHjqwpBv3O5rd80/hhCLE7zr
	OenOcrfsggZhWGlMSIL6Vsdssx0lLNc1FS8eEsKfUFQHjt9Z/DHHwOXKSZFbJFFq53OT
	JKFndc/qp2Sy4lh7vGVgjwrw1UXVvhhCtzNPqfe2/0YpSFCD4tbvybp6ojEtWRoHjaXI
	9+ZKVZXVWjlyewk2rmTsP7wRtBlOKPvQ0TColHDshT6TALM3y9xGuPD55nwR6Ztod7N3
	CDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3LE6rcuScvWP4+vxSE2vEsJdvK9uq8G6AnUbHBwmVf8=;
	b=lK6Wc8XMmpazv7upjr733nf54JF81WtrR97K6+MLld190ZCgQRGci8zAMtE2z6XgQ7
	AUqN2XYBSfS/kPUgNxbqe+FSvgvQQwtPlMrCzQW0edbiCYpF/BKiYN/G0XimNVRmctpL
	Wov5aQEKEIK1mjQDRllSbCxQisNV8NVe6RcHT3Cb0ZLYRqNmn7jUluJzUkDRNUYUwpd3
	cTetJMNPUZrAPUCYlfds1gJdXIA5r/luud407K5mFfXB2Bq29eBB6NF2w4s5SqmjxEHm
	UZSb6x9XxLNmYuqcQmnMaSO7ShayyQoYoH8rwHAak4sIgoB5oxjX1+koXxkzh14qdJsl
	gq3w==
X-Gm-Message-State: AKaTC02eus8AFkfZ5g0M3WX4Wk57POTzLDFww9/1azBE7hP+GI3q/YqEbcm0hykVMmoLLxn9bn4aP74SoKG9V2VQ
X-Received: by 10.55.106.134 with SMTP id f128mr27422152qkc.121.1480440471192; 
	Tue, 29 Nov 2016 09:27:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 29 Nov 2016 09:27:30 -0800 (PST)
In-Reply-To: <1708364.g3ONUbFma5@peggleto-mobl.ger.corp.intel.com>
References: <alpine.LFD.2.20.1611280544090.16875@localhost.localdomain>
	<alpine.LFD.2.20.1611290542100.24580@ca624034.mitel.com>
	<CAJTo0LZrWkbyaDWb-8mfNZm2d3mqsqab4uwtNN6Q=dPEKXhiHg@mail.gmail.com>
	<1708364.g3ONUbFma5@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Nov 2016 17:27:30 +0000
Message-ID: <CAJTo0LaRu_wSbjz1ACXs8KFzLav=x5aeaJDdbZEPEaWg2bx-Kw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: ASSUME_PROVIDED versus SANITY_REQUIRED_UTILITIES versus "The Build Host Packages"
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
X-List-Received-Date: Tue, 29 Nov 2016 17:27:50 -0000
Content-Type: multipart/alternative; boundary=001a114fddf665c8e4054273e845

--001a114fddf665c8e4054273e845
Content-Type: text/plain; charset=UTF-8

On 29 November 2016 at 17:24, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> How would you get access to that recipe-space information within
> sanity.bbclass though?
>

Yeah good point, that might be "a bit" tricky.

Ross

--001a114fddf665c8e4054273e845
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 November 2016 at 17:24, Paul Eggleton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":ah" class=3D"a3s aXjCH m158b11d98590759a">How would you get access =
to that recipe-space information within<br>
sanity.bbclass though?<br></div></blockquote><div><br></div><div>Yeah good =
point, that might be &quot;a bit&quot; tricky.</div><div><br></div><div>Ros=
s=C2=A0</div></div></div></div>

--001a114fddf665c8e4054273e845--
