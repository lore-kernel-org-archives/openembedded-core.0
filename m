Return-Path: <slavasalnikovv@gmail.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id 190DD74D0D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 13:16:19 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id i17-v6so8574116ywg.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jTDKf5bI0JQ8ZXHgcTWrAyXVYEICT0ViW6Ewwq9+6Ek=;
	b=LGC83/uLkxe6w9mtabPn9FsBdf2eV/yjec7uKHjNpHjYfLhqyfGBemSxDSjBf5ByQf
	PZ0TzBOZgI4IujIPQ7Zm7crpEULsyeqgtdlsAGt4ZOpto/Kl21MRNDL4Ln95JjfFv8pK
	8sKXo8AV/zZuuYJVyLCyiLzSxgP2ayVPHmCmU5Mw25QHufyhAoCKN1i8P+bC7KQG+GMk
	K/w3ZTNvn3YERg8AKrPnP2ZGOeWzCIALrPf9SSQu1dk9ANhQdBDF8QhbXk60BsIKwBHa
	vTN0KlUcyU+HzNYsZ39IUvfZ/xqFBmxrwb+XyaQnLa0CWpPU0a9FxdEqUly2Y83zP9NI
	YMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jTDKf5bI0JQ8ZXHgcTWrAyXVYEICT0ViW6Ewwq9+6Ek=;
	b=i3eqKmkcohDbM5DPMTLpqb9XvWe1r9dzwVt5tN+qcEJOTl0UHxWGIdl1NzEjpN2k3s
	HnxgeKI4pXuFkLp6wdeBU6oLUxCttCWwUPt6wKaQ45g3eU4Ipaltz1ZYKLwiI84IItsp
	RWF6bxfaSUkKECYAownf2/UVp9a5rTL2oMppUfm4rWT3NQF1os8SI/ETQ9iJpZbPICHl
	io5SsZRzQIMUVMVGv3+g//MGsBdxZnYINTTRiG4L+Llpp0VoN1cXwk9CQlzIQCoA/pxN
	p7zytaNJD+AOCa9rXi1yeBPlGXbqvrMWgW4R4uwC2pgn4qVq9U7GIVmvq8e7SvzcWhAH
	sujg==
X-Gm-Message-State: ALQs6tCb1y352JiVLyO08z9wnXV2dFmw/dIHk0E406Bqh/CxqN/vRmX3
	0SRe5frzqhvr3594+JDVySK4irDLmQkZRiSeShI=
X-Google-Smtp-Source: AB8JxZqaLJRCLH6nNlCofC1uEgUlCZJVl8+VFZN9xVXzwYrnGdw1uSls75J7Wsh4MhTetjBEAMW2vZribsy60NKeBaA=
X-Received: by 2002:a81:ac41:: with SMTP id
	z1-v6mr20114780ywj.13.1525698980829; 
	Mon, 07 May 2018 06:16:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.51.88 with HTTP; Mon, 7 May 2018 06:16:20 -0700 (PDT)
In-Reply-To: <dc9619db-2ee9-131a-fe29-614308f0495e@linux.intel.com>
References: <CACAZDOmB7+7WfZfzt_qxinq48ANmsbm_q0nrmneAuN7gM2pJvQ@mail.gmail.com>
	<dc9619db-2ee9-131a-fe29-614308f0495e@linux.intel.com>
From: Viacheslav Salnikov <slavasalnikovv@gmail.com>
Date: Mon, 7 May 2018 16:16:20 +0300
Message-ID: <CACAZDOk8m5pXrny5etfe-cYNHkRj33w1LX1SfnBKDcW0iq6nuQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: cURL recipe: SSL backend
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
X-List-Received-Date: Mon, 07 May 2018 13:16:20 -0000
Content-Type: multipart/alternative; boundary="000000000000c9612a056b9d79da"

--000000000000c9612a056b9d79da
Content-Type: text/plain; charset="UTF-8"

Alright, good point.

But what if I need to use openssl instead of gnutls on Target? Can it be
changed without side effects?

Regards,

2018-05-07 15:59 GMT+03:00 Alexander Kanavin <
alexander.kanavin@linux.intel.com>:

> On 05/07/2018 03:51 PM, Viacheslav Salnikov wrote:
>
>> cULR is built with GNUTLS for Target but OpenSSL is used for native and
>> SDK.
>>
>> So my question is: why GNUTLS is used only for target? Is it necessary
>> for some good reason? Documentation for cURL has no explicit answer for
>> that.
>>
>> Could somebody help me to find the answer?
>>
>
> I think enabling gnutls on the native side would add a ton of dependencies
> to build, and so openssl (which is more self-contained) is selected there.
>
> Alex
>
>

--000000000000c9612a056b9d79da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Alright, good point.<br><br></div>But what if I =
need to use openssl instead of gnutls on Target? Can it be changed without =
side effects?<br><br></div>Regards,<br></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">2018-05-07 15:59 GMT+03:00 Alexander Kanavin <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" ta=
rget=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span>:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><span class=3D"">On 05/07/2018 03:51 PM, Viachesla=
v Salnikov wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
cULR is built with GNUTLS for Target but OpenSSL is used for native and SDK=
.<br>
<br>
So my question is: why GNUTLS is used only for target? Is it necessary for =
some good reason? Documentation for cURL has no explicit answer for that.<b=
r>
<br>
Could somebody help me to find the answer?<br>
</blockquote>
<br></span>
I think enabling gnutls on the native side would add a ton of dependencies =
to build, and so openssl (which is more self-contained) is selected there.<=
br>
<br>
Alex<br>
<br>
</blockquote></div><br></div>

--000000000000c9612a056b9d79da--
