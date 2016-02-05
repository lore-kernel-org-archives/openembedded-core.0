Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 55F5C7732A;
	Fri,  5 Feb 2016 12:04:30 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id d63so126174175ioj.2;
	Fri, 05 Feb 2016 04:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=nN2c2ndKLwwRKPxfkJxY4mLxZWUlOZXXwuNgizJWWuI=;
	b=rpB9ae0VUR86P/v0BwfDSRNVKq0+mFGk8JLndm2L97xK4pDa2YQAa4i1BXUGbQqvWs
	K/Ew4nDH4LdXxE4hMnv2k6Z69wn1g9ybOoBVSePuqM5sldSwCx3eNJa+7qoYQkHPSl74
	suJMO2qYqXI/uolGwXglFcf/UxG3Tqbt4M3I5y84S9pUog3FnrzTpadcNpCv7rPH7PqD
	oKV9jwUNa8KZv3ftN8XiqLZHH2y7K0NHuMw4fPXOexdmThMg4P3nC/iRBmf0T6ZKJJNU
	mS/+KrkuXUd8dgsZhWDzG/AbDZlXs7uFY1ew1/geokwL7I8Kz4Tj9mQb9MfQeFCHR9N+
	UCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=nN2c2ndKLwwRKPxfkJxY4mLxZWUlOZXXwuNgizJWWuI=;
	b=bWYryWiwiDHwkboEcQ3RVQLFFDDU6PD/kEgFAAHOijU5NYzXtir9QMYNQZQU1KX3AB
	Mkh9eCg7KRN2kThF1ebR7o+LRNSfHJwpK7XnKdZguFtID1z/U5QwMTL+r5f6REJYzbf+
	FdeYM1PV4jYaFXIaH2/44GMCyuVH5p7Yaai9wXuAKIcIwpuC02/NoIiWTWTBmUS+slD9
	s9/hfuUDbms3eCd3PioVK6qzemLw195+s6j3ro/j/SylHeGEisaC9+Pc5A50rlx5rtEA
	z3cNDAFenBhuGFC3ZDgYB8dJPqVnfcidQhFHk4clNJdLHewHm4zghuflr8OVOOLwb3uQ
	kBzQ==
X-Gm-Message-State: AG10YOTOBZH6qmxXhFThH2LrBg7VPSOejIVZ2nU/KRwA33bAQc/pyoLAAj4cf2aNeCC1PYPozYn1x3jF+xP9Dw==
MIME-Version: 1.0
X-Received: by 10.107.164.15 with SMTP id n15mr13278936ioe.148.1454673871075; 
	Fri, 05 Feb 2016 04:04:31 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Fri, 5 Feb 2016 04:04:31 -0800 (PST)
In-Reply-To: <CALbNGRRWrvs7JL6V8ePoofYvWU0Lxs-vBq1=qU2OE7syOOgDXw@mail.gmail.com>
References: <CALbNGRRmD=4QUi=+_fx48M4GDB9VwTX5m5wH12j4ed1OK6SW6Q@mail.gmail.com>
	<1454511012.27087.183.camel@linuxfoundation.org>
	<CALbNGRRWrvs7JL6V8ePoofYvWU0Lxs-vBq1=qU2OE7syOOgDXw@mail.gmail.com>
Date: Fri, 5 Feb 2016 13:04:31 +0100
Message-ID: <CALbNGRTxaRv_U1NaA303DGV5h0m-+RqQExeb5VNrhBWTazoYWg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, rehsack@gmail.com
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Language settings GTK (glibc?) problem
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
X-List-Received-Date: Fri, 05 Feb 2016 12:04:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 5, 2016 at 1:02 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Feb 3, 2016 at 3:50 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Wed, 2016-02-03 at 12:49 +0100, Andreas M=C3=BCller wrote:
>>> Hi,
>>>
>>> while testing libreoffice language packets I found that language
>>> settings for GTK based apps are broken. Interestingly QT based
>>> applications (tested with qtcreator and lxqt) and libreoffice are
>>> working fine.
>>>
>>> I did some research and hope for some expert with helping hints.
>>> Details are:
>>>
>>> * I am testing with jethro environment
>>
>> I did wonder about http://git.yoctoproject.org/cgit.cgi/poky/commit/?id
>> =3D3b5288f0a28205289063424afc474675cbaa05b8
>>
>> or possibly:
>>
>> https://github.com/rehsack/poky/commit/46ac36953e2e76ba716c7ba42ddfe41c9=
a19a11d
> After seeing that Jens just sent this ^^ for Jethro, I think I have
> read this email the wrong way around: This commit does not break
> things it fixes them.
>
> Background: I saw the mentioned error
>
> _nl_intern_locale_data: Assertion `cnt < (sizeof
> (_nl_value_type_LC_COLLATE) / sizeof (_nl_value_type_LC_COLLATE[0]))'
> failed.
>
> when running my images but wiped them away by [1] without fixing the root=
 cause.
>
> My excuse: This error was thrown in lxdm greeter. I thought it was a
> problem with lxdm which I 'fixed' by adding the patch.
>
> Will give the backport a test and hope I'll get i18n back for GTK (and
> most likely others).
>
> Andreas
Oops I forgot:

[1] https://github.com/schnitzeltony/oe-core/commit/5c6616eafc1911c9dd79c56=
fa544d38c60a331fb

