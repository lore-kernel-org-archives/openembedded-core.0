Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB707490C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 13:54:35 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id a14-v6so8647611otf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cXuWOFYzFMYissm2cZJYaoIJLu58TQtH4KYX4/Vf4Ic=;
	b=CVu/5eby/txciEVb2PjZpF44F6AtC4zI/NUk3FSjY0ABPVVZ27YzQAR1fczz3x04LU
	Djejq3UvyEyJy2UQCJZdmrBOKTgd5MkqjaHzzFh8IxXki3IxKohnYWuMhAy59CAa0gc/
	19CKw6FJ85o+PNpEb4Vw7CgnIZ/QBvPUB2Uw7lspRWFUFUGHhw1k5nGcsxBQqJSx0bov
	bF39xdS26ZLmRAuYneXrGIofTNLHVLW3TuASLa/X1tYrjjE8TFbmX3g/Eq/MUlulinkS
	zJGlbTepcPCMV5wHgQdhUEpXiJDxmoQLM+1So1RvUaHBdcBf2Xh2zyVV2zsCHAFQDuQ0
	wpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cXuWOFYzFMYissm2cZJYaoIJLu58TQtH4KYX4/Vf4Ic=;
	b=Enr2i7AMBD3/jevF9VqSFjVs3E64hfnUcDanTW9cK/hdvfAQ+a0XYhcDP2/6FYp+kT
	CJfZBElUkyXr8C5/uj6ShYOSG0o2nKCl7uuJ2Sb+nmKxsClpJdGR4FNwujSHXVkNeMme
	97H98LvHHK6+nbT93abVxCsDqy2OePO8vmpCHLyi8XgzCXlk7N/Ue+YJi+S7MMgMtq4c
	x3jlaSYGr8h7Ayo81oF3qhGoDXGK4ucg8Wu3vKJcQfUo4jOQE5N+fnqFK7hkw9oQc/gO
	u6DGNg8piX3lVO1ffeOl9Elt4CoiJ+HRusT3B98x8nhK+COidpi/MMSZxNtRyO2QLXk8
	0ZVw==
X-Gm-Message-State: AElRT7FHxvr1e+gBnpI/bjGWBR43IUtVS1ezMKYFM1n+bL0nGJFBQblU
	3pu2/kKaKCiLln5utM8fsALg1HLPxT+Hjov6JI0hhw==
X-Google-Smtp-Source: AIpwx49PNzwOpwvSawbjTJivCt+JeDcblcSJBYkGwmfq5udX5CDjTJbZX82QK12iJxsuNL9y3EHf6BixZB/te0ilXM0=
X-Received: by 2002:a9d:281b:: with SMTP id
	m27-v6mr21860326otb.89.1523282076436; 
	Mon, 09 Apr 2018 06:54:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Mon, 9 Apr 2018 06:54:15 -0700 (PDT)
In-Reply-To: <AM5PR0402MB28170F53C366ED380DB78674E2B90@AM5PR0402MB2817.eurprd04.prod.outlook.com>
References: <1522869935-31522-1-git-send-email-tom.hochstein@nxp.com>
	<1522936553.11431.425.camel@linuxfoundation.org>
	<AM5PR0402MB28170F53C366ED380DB78674E2B90@AM5PR0402MB2817.eurprd04.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Apr 2018 14:54:15 +0100
Message-ID: <CAJTo0LbnJaUaG4BVX9u9jEiFm4zCP0mqgUOPpUsP0E2jSj8wAw@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Add recommended modules to nativesdk install
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
X-List-Received-Date: Mon, 09 Apr 2018 13:54:35 -0000
Content-Type: text/plain; charset="UTF-8"

That's definitely a hack.  If SDKs should contain Python then install
python3 (which will install -core and -modules), if not then don't
install it.  The corner-case is a SDK which though dependencies
installs half a Python, in which case I'd say you should just
explicitly add all of Python.

Ross



On 7 April 2018 at 16:37, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> A colleague pointed out that what we installed in the SDK for python 3 was not functional, and that a minimal set of modules was required.  I'm not an expert, but I found a similar line in the python 2 recipe and thought it might be what was needed here.
>
> Tom
>
> -----Original Message-----
> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> Sent: Thursday, April 5, 2018 8:56 AM
> To: Tom Hochstein <tom.hochstein@nxp.com>; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] python3: Add recommended modules to nativesdk install
>
> On Wed, 2018-04-04 at 14:25 -0500, Tom Hochstein wrote:
>> The python3 installation in the SDK did not include the minimum set of
>> modules.
>>
>> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>> ---
>>  meta/recipes-devtools/python/python3_3.5.5.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb
>> b/meta/recipes-devtools/python/python3_3.5.5.bb
>> index d458d32..f893b84 100644
>> --- a/meta/recipes-devtools/python/python3_3.5.5.bb
>> +++ b/meta/recipes-devtools/python/python3_3.5.5.bb
>> @@ -211,6 +211,7 @@ py_package_preprocess () {
>>
>>  # manual dependency additions
>>  RPROVIDES_${PN}-modules = "${PN}"
>> +RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-
>> modules"
>>  RRECOMMENDS_${PN}-crypt = "openssl"
>>  RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
>
> This doesn't look correct, if you want the SDK to contain all python modules, surely you'd just add nativesdk-python3-modules rather than forcing this everywhere?
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

