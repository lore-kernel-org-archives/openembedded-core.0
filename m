Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id B804F61013
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 04:03:35 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id ma3so154690pbc.35
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 21:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=KErAjBIYyHK72HwWeXru1oO9nppGp8AOWRYt2m9mIP4=;
	b=p6wt07//GSBwVdz+9kSZ9KYnVkbOU/Y3xzlWItGUHxHe8vnf+pgg0H4uIw2t0IDNpY
	OcWbAvh7D8yjOv6Efc2djHm3d2eEvRsab1Rdv78cIl/iiCRuEaD4tywbwy2IGM639etb
	sZLXyMkE0dwt1h95fwl2Gr3fjBLFYeeGsrYU4MrTYvZPqeBDejZm6XEqPAlfoZwz0ilX
	qWOcMyraqvhc16fvXyI9HqUl5AdUM6cyqBFDb+jlExO/0W+w5eWxf0DKAzQv89D267+V
	MThWo8TNRO1VrDiJfNefV9gSZvakfu0Ud6w2sMG1haGqaXG2/N1PmiHq4v8zXhMkMDWG
	YzDw==
X-Received: by 10.66.149.73 with SMTP id ty9mr18362695pab.36.1377230616652;
	Thu, 22 Aug 2013 21:03:36 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id xs1sm20445609pac.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 21:03:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZ-NCuuE0hQYpgzx0GXhikAUVzRrVaDFayg-OLnt1o7TA@mail.gmail.com>
Date: Thu, 22 Aug 2013 21:03:32 -0700
Message-Id: <6CECB12B-85FC-4789-874E-D55764E60ACA@gmail.com>
References: <739A9EF8-4ABD-419C-978B-29006E185238@gmail.com>
	<CAJTo0LZ-NCuuE0hQYpgzx0GXhikAUVzRrVaDFayg-OLnt1o7TA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: World build on OE-Core
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
X-List-Received-Date: Fri, 23 Aug 2013 04:03:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 22, 2013, at 2:36 PM, "Burton, Ross" <ross.burton@intel.com> =
wrote:

> On 22 August 2013 22:24, Khem Raj <raj.khem@gmail.com> wrote:
>> x86_64
>> =3D=3D=3D=3D=3D=3D
>>=20
>> Summary: 17 tasks failed:
>>  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-lib=
/libxft_2.3.1.bb, do_compile
>>  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/cairo/ca=
iro_1.12.14.bb, do_compile
>>  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/gstrea=
mer/gst-plugins-base_0.10.36.bb, do_compile
> ...
>=20
> The majority of your failures on x86-64 get autobuilt every night, so
> I'd be curious to see the your logs if you still have them.
>=20

well, one point to note is I am using OE-Core standalone, the logs are =
here

http://sakrah.homelinux.org/files/world/

see for eglibc.* files.



> Ross


