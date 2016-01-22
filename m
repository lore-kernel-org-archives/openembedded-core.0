Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB5471E63
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:13:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 123so416158wmz.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LrouzgLmd0KMqCvMpZ4GWM3Qrphjt7UKfQzmtUfix3w=;
	b=eqJYdl3z4bR/FHiNf8p2mZasQv8xy+jGOTEbVSe8P/22y9+tH+SIDGMWUGKQ4PUPe+
	kzLFQ21fooLBhKY1oCUHnYAHpn1bAB4AZgV64EgyhovMxPka0O2zcSMowOqCQyoeK2HV
	rJThrlkt49yCCgXcA7D/1Jntyrj0zlRQLusuHOu1aggnqxM9z8FdwD22scQXNIfDZyQE
	0uJWcHiiVLp785/45qoAaplxzovpIGt6eJvLrSEUmBqDTQljVmEP7ED+d9Gy3VRZozdO
	9hsqNoUtKC1nvfiQa+NnkzBuY9Vt2h4h7Wz/7iH2vWGm8ymTgS0EGrfmMlDaJb28pR5J
	uWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=LrouzgLmd0KMqCvMpZ4GWM3Qrphjt7UKfQzmtUfix3w=;
	b=i/XxOaBgs/fTX7EGDfjoO3SVbqnAlOuNB4lmhjUlLJia42DjvDna6TimDuKHPJjO+w
	62+kdaZvIGa0ufivmI2Zfelt+p3Q7xdCr1eed/qR2GBxNyPcjStgY+XHy4hOS2RGnysh
	66xmuyyL9ggatXdwbNB1DXXGskRU1hbRODiBprHrp+Uyd0We3etcaLlBysU2r1EXcLKq
	3jXLYexcDDDq69ATnQ+vX2hcyn4ulFvs8acJVdKv4n4Pj0fr2GTfN1tOjv4qpb4Iy1RI
	h4E8oXZMWjYJGBP9w74VhW/KH8yfMOi0XSEAW8NQVA+xH3WIvmyzorIrRUckcBBfBqRj
	AlLQ==
X-Gm-Message-State: AG10YORIpDt9/QnQANfosBTFx0MwSkJzIqD5TqVBiZD+1yq+Kx57UABjIK3Pz1L4Y/XsPcU5IHBdS5CfeMnGnw==
MIME-Version: 1.0
X-Received: by 10.28.182.133 with SMTP id g127mr5772786wmf.61.1453504405878;
	Fri, 22 Jan 2016 15:13:25 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Fri, 22 Jan 2016 15:13:25 -0800 (PST)
In-Reply-To: <CAJTo0LY17Bv-1XiAhd3O1xti0Xtt0gUsrEer21an+vfRd39zDA@mail.gmail.com>
References: <cover.1453427939.git.liezhi.yang@windriver.com>
	<7c60a8094ba098006166f4b2eb8f23b6891c7e7e.1453427939.git.liezhi.yang@windriver.com>
	<CAJTo0LY17Bv-1XiAhd3O1xti0Xtt0gUsrEer21an+vfRd39zDA@mail.gmail.com>
Date: Fri, 22 Jan 2016 15:13:25 -0800
Message-ID: <CAJ86T=XTf1V=NeySa=vFgj5F0dMELm2GsNOmP7Rtd48KOeT3vw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] meta: cleanup PACKAGECONFIG ??= ""
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
X-List-Received-Date: Fri, 22 Jan 2016 23:13:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 22, 2016 at 2:57 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 22 January 2016 at 01:59, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> The base.bbclass can handle PACKAGECONFIG well when it is not set, so
>> PACKAGECONFIG ??= "" isn't useful here, but there are a lot of them,
>> which may mislead the newbie that it is a must.
>
>
> I actually like the clarity of PACKAGECONFIG??="".  Does anyone else have an
> opinion either way?

I'd prefer to keep it too.

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

