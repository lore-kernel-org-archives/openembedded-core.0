Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3F59E7DADA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 11:39:38 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 77so2116316otu.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 04:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TZ4q0grExkRO6raAdGllSToJjImPb4e6iCyMDTyoVFs=;
	b=By6biaKWLZJlrsnJ321uUx5sGe7gDNpVTnZz6h7BHlq3M2DhoeK7P8zX6swweGu/OO
	4+YdHggdsp46OOjkdbWFe+cQOJrLo6prikZgMqBKf8L9Exy0qWAco4jOXU3y3Tz1eZxc
	y4UCZCnAfrxHL73oaUmlucZwId1EIWjJiuuZJKGLhQvhK3Dk6UQ+V5wElS6E7MiGFE+Y
	uM0le60eLUmXk02+6VrNJ+O/sNnl7IQXrlim/EKzndeY7H+mp+XjV/qStsFRtVoPzHLn
	QZZAao2TIgMyMia/49AfbEMFQtwmLmTG2fqsQVMn4JT5lWJdKnejJC6lLfV//WCz+cTW
	te4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TZ4q0grExkRO6raAdGllSToJjImPb4e6iCyMDTyoVFs=;
	b=DWYtmEnne9hrsxeWj4J75xqUWS4Q3+z+y9tD8AAGCK1WrgamASKw9QR1tj+NzJHthy
	KmQpWTUfz4Iwq861//2CiIRbOBPQ/PQ1M+st9LJnJa7yY5AOWd1Zc8w0N3HFe/nCk5gX
	EnLBWIz77zkDFF5/7/Qgm63+aZV6j6BNxLPRtY1Ulrfu0ubHbsq+EQB/IC3AOMaxlFAj
	h8d0PdPwmluIX6Be85tcehq64mT679O9xgcjX81MwbuVkxzpkYcwioBAei0wIf2DB82p
	cjVJoHwtfEzNGX0fX/7Qzo0jukA1B3XQkqVRzGdEJ9PmCM1VdlPsrHTeno2OxmCUzVIZ
	892w==
X-Gm-Message-State: APjAAAVLX9IEKjnm74zfvp+QH8K6fuA70x+XcWLcPjqzsKoFwbWS93/Y
	kGOk+hsIOYmUpB6g5sXXxsZ+EyrgJ3Zx5Tkfs8fDZA==
X-Google-Smtp-Source: APXvYqy6Ix0ZWEJi7iSkXoDxqp4KJyBgfTyOFbhw9zxF4V2/w5rJpU0ubx3eIDUB6JkzoUCAKQEyEP5XKLZsZMCT5RI=
X-Received: by 2002:a05:6830:1647:: with SMTP id
	h7mr3056582otr.360.1556537979140; 
	Mon, 29 Apr 2019 04:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190308184939.22937-1-bunk@stusta.de>
	<CANNYZj-c+H9zqsj640ef+evBNQbi+6M1XAqJHaqu-_i5dHaxnA@mail.gmail.com>
	<20190308193841.GA13393@localhost>
	<E3B36DFB-0727-41ED-9494-3997E768A865@gmail.com>
	<20190308203904.GA19247@localhost> <20190425192846.GA8813@localhost>
	<bf9d998e-487b-32a0-7879-9f0694a835ee@windriver.com>
	<20190426051215.GA26023@localhost>
	<c2b30caa-1e86-8363-57fb-d399484d9708@windriver.com>
	<20190426155038.GA17613@localhost>
	<9428cb85-3010-7ce7-a15d-3848fbbe62e7@windriver.com>
In-Reply-To: <9428cb85-3010-7ce7-a15d-3848fbbe62e7@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Apr 2019 13:39:27 +0200
Message-ID: <CANNYZj8JdOQp5q_PjzG4Z3g3WfYMh13D_Dy7Ka_4Es8SDgbqGw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][RFC][PATCH] Remove openssl10
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
X-List-Received-Date: Mon, 29 Apr 2019 11:39:38 -0000
Content-Type: text/plain; charset="UTF-8"

For what it's worth, I don't have a strong opinion on this. Anyone who
still needs 1.0 as the primary openssl version can add the openssl10
recipe as 'openssl' to their private layers, and set PREFERRED_VERSION
accordingly.

Alex


On Fri, 26 Apr 2019 at 19:56, Mark Hatle <mark.hatle@windriver.com> wrote:
>
> On 4/26/19 10:50 AM, Adrian Bunk wrote:
> > On Fri, Apr 26, 2019 at 10:31:03AM -0500, Mark Hatle wrote:
> >> On 4/26/19 12:12 AM, Adrian Bunk wrote:
> >>> On Thu, Apr 25, 2019 at 03:18:47PM -0500, Mark Hatle wrote:
> >>>> On 4/25/19 2:28 PM, Adrian Bunk wrote:
> >>>>> Would you consider this patch appropriate now that warrior has branched?
> >>>>
> >>>> The use of OpenSSL10 as a 'second library' is likely no longer needed.  But
> >>>> OpenSSL 1.0 (as an alternative version) to OpenSSL 1.1 is still needed in some
> >>>> cases.. (FIPS-140-2)
> >>>
> >>> Is anyone actually security-maintaining OpenSSL in OE?
> >>
> >> -In- OE?  I have no idea.
> >>
> >> Outside of OE to meet the OpenSSL-FIPS 'you must not modify the sources and
> >> follow these exact steps', yes people are.
> >> ...
> >
> > Why does this need OpenSSL 1.0 in Yocto?
>
> I think you are misunderstanding what I am saying.
>
> For the recipes that -use- OpenSSL, we still need support for the legacy API
> through at least the end of the year.
>
> In the past we had added pkgconfigs for a few things to switch them between the
> old and new OpenSSL API.
>
> The OpenSSL10 recipe I don't care about, I have no use for it.
>
> > How does this look as OE recipe?
> >
> > I would say that an OpenSSL-FIPS recipe might now perhaps need an
> > openssl_1.1.1%.bbappend re-adding the three openssl-conf lines my
> > patch removes.
>
> You can't.. There is no such thing as OpenSSL-FIPS for 1.1.x.  Doesn't exist,
> never will.
>
> OpenSSL 1.0.2* has an OpenSSL-FIPS module.. They have to be compiled -exactly-
> as stated in the documentation or they are not functionally equivalent..
> (reality doesn't matter here -- it's the rules that matter.)
>
> So after it's built (usually via an SDK), then it's packaged in a recipe that
> uses the precompiled binary.
>
> OpenSSL 3 (there won't be a 2 from my understanding) is supposed to be
> compatible with the 1.1.x API (for the most part), but will include FIPS-140-2
> support.   However, OpenSSL 3 doesn't exist yet.  The last blog from the OpenSSL
> developers indicated end of 2019... but as we all know release dates change.
>
> So for users who have an OpenSSL FIPS requirement, the ONLY answer is that their
> applications (including system) HAVE to use the OpenSSL 1.0.2* + FIPS module.
>
> --Mark
>
> > Do I miss anything more complicated here?
> >
> >> --Mark
> >
> > cu
> > Adrian
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

