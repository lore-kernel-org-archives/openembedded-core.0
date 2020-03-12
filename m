Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id CFF4260AE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 08:24:01 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id k63so1322796vka.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 01:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2zbvqVUtSpOW7fppHhxfexcxsKhw0E0jxaL9jut536o=;
	b=tugiI7CTqL81XvFcPXRJPhlZBbJsMVvDWLSHCj9wg2oEADlAsGuch6BHlf5NJddEv+
	Y+nssTFQBXaQWgIWTKVZ656bjYcTloTRpV6LQjjyneybXKVeictqtvSNB0Ez2DzSy/1x
	2bF9QVU6HR5UP/vVJ6+Uc/eL7UHWqStSQ8rVyQRpDgdOsdWW7LVUCkTgD//WSY6BQs3d
	tKILVtdR2D9xFQxkn313QBUxUenNTKwXXNpQuH9K9Tybwn9y2qg4iFbJ82U3ubHtAUXp
	6mibL1ecEwFVwP81eVRgGe53H0bjhLtVjMbPcB+MqRpKVZOy+gfjQBlm02iDTZhPqykY
	ZNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2zbvqVUtSpOW7fppHhxfexcxsKhw0E0jxaL9jut536o=;
	b=S4QcGLzHw14p+G2w7nrV8Js99w9y/Wfcw4vhSbADw92tz+Hi4ywpjPIZhRNhB9/qgu
	MXUOm/7D38i33uRizkhZvziCYMNsBVdYK1qqRKY5rgsaSz/nkc1aA6QriB4hx3HotSa5
	xCPVoomVdKNMGZBF9fgGgWdDy98f+EK4mGmemos2xSeNwj1g5WkLbR9ICvnCC+DbZzmL
	28367B6tie8vrT7i3hSlHEc/fe1dd7TC7YN49OYdJ3vEcBS3aRm0xeUAaOv1jcN7yTk5
	8oA4e+a8QgyCf877seu4Mf8UfOTjHjuRgOap9xx6UbamDANQDvPfqRobhSCVPk9egHSY
	3FHA==
X-Gm-Message-State: ANhLgQ3AoqiXpIEq8/tjWgfchR5Xkrln/8VZeWw7U6eIwHg4GJnozWtA
	1zcKK0zEsZHonr1jF1F1cTaatB9HLlLAaAuKWSz+pYd+
X-Google-Smtp-Source: ADFU+vvRYR1UYcEqrj857r/aWGLgPYo83h+b2/A+KIWaeU5HHWhV8gxmXY+pPW7R8b5Q8PKGCDX7hUIWtKLSmu8pU1c=
X-Received: by 2002:a1f:38cb:: with SMTP id f194mr4568472vka.29.1584001442319; 
	Thu, 12 Mar 2020 01:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200311163730.78078-1-sk@typedivision.de>
	<c487b390822a86c1f5dd9339324e86c973142e0e.camel@linuxfoundation.org>
	<d950b7b1-b5f1-8395-69d8-dde1d17725a8@typedivision.de>
	<CANNYZj-BW-y=Ky_WLdGaJR6-5g-Ok00a7dRDTdnxuN3M7Vt5FQ@mail.gmail.com>
	<3b553c8a-4c08-cb95-923c-7f03cb6d01aa@typedivision.de>
In-Reply-To: <3b553c8a-4c08-cb95-923c-7f03cb6d01aa@typedivision.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Mar 2020 09:23:50 +0100
Message-ID: <CANNYZj-XKW0moxJBfgOpTTBtgn8kafnSG+JPph5eGzBz2P-FdQ@mail.gmail.com>
To: Stefan Kral <sk@typedivision.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa: enable testresults.json for testexport
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
X-List-Received-Date: Thu, 12 Mar 2020 08:24:02 -0000
Content-Type: multipart/alternative; boundary="0000000000004b114405a0a413bf"

--0000000000004b114405a0a413bf
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2020 at 22:27, Stefan Kral <sk@typedivision.de> wrote:

> Doing build and test in one pipeline turns out to be more complicated due
> to:
>
> - build machine may be different from test machine (with access to
> hardware)
> - build the image is a one time job, tests may have to be repeated
> reproducibly
> - executing long running tests slows down image creation (for development)
> - tests on dedicated hardware should be runable asynchronously when hw is
> available
>
> Running tests by bitbake -c testimage could be an option but to provide a
> full repo/bitbake/cache setup to run test cases sounds not as easy as
> having just python installed. And for that, testexport does its job quite
> well.
>
> Btw. have you ever thought about to integrate/support some external test
> framework (like robot framework)?
>

Core project does all testing on qemu (using direct testimage); there are
no resources to set up testing on real hardware. So those scenarios aren't
well supported or tested, but patches/proposals welcome :)

Alex

--0000000000004b114405a0a413bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 11 Mar 2020 at 22:27, Stefan Kral=
 &lt;<a href=3D"mailto:sk@typedivision.de">sk@typedivision.de</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
 =20
   =20
 =20
  <div>Doing build and test in one pipeline turns out to be more
      complicated due to:
    <p>- build machine may be different from test machine (with access
      to hardware)<br>
      - build the image is a one time job, tests may have to be repeated
      reproducibly<br>
      - executing long running tests slows down image creation (for
      development)<br>
      - tests on dedicated hardware should be runable asynchronously
      when hw is available</p>
    <p>Running tests by bitbake -c testimage could be an option but to
      provide a full repo/bitbake/cache setup to run test cases sounds
      not as easy as having just python installed. And for that,
      testexport does its job quite well.<br>
    </p>
    <p>Btw. have you ever thought about to integrate/support some
      external test framework (like robot framework)?<br></p></div></blockq=
uote><div><br></div><div>Core project does all testing on qemu (using direc=
t testimage); there are no resources to set up testing on real hardware. So=
 those scenarios aren&#39;t well supported or tested, but patches/proposals=
 welcome :)</div><div><br></div><div>Alex<br></div></div></div>

--0000000000004b114405a0a413bf--
