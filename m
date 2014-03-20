Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2B60E60E79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 11:57:48 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id a41so637852yho.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 04:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=huLD8OEbqQfHM6aJ8JBDmkl7vuXLdrSF8J/60h+uBPk=;
	b=KFUGpHAsvf1cwXYl+8IzpD0cUToHWNX1N8JwbicGlQrEMfMTpVaTomLG0Xo+bTkid9
	uvKZB4mtFyfug3FnO0tsYVe84T1+XiDnRJgnGl/odv7woscqzgTkqweM2yckPwvpUV9y
	gmXUxxAXujiJ1VFSqkKMpuuWzWkSBl7Uf7Wu9a4oXFcGkDZevyE0cP5/aNgpb30sN+Qp
	xxSrO00DOaC9lDINgXeqKVpghteHyTGsS4gI1iKz9UkDhMATUvVL99sS//ACQRMErjMf
	4ewWpHToJ+JYhTU3Q2GD28KDzULIZRYcmpK5Aq39tcMTHIbFVMgT0kZE5ej2xskwxfwm
	BGHQ==
MIME-Version: 1.0
X-Received: by 10.236.180.232 with SMTP id j68mr9640887yhm.122.1395316669274; 
	Thu, 20 Mar 2014 04:57:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 20 Mar 2014 04:57:49 -0700 (PDT)
In-Reply-To: <CAMKF1spcWtVah6-F6AQaSs72Cmyrke-5+JrdmR5s7AA6QCuDJA@mail.gmail.com>
References: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
	<23BFBADE-120F-4DBC-AABF-A9F802B8222C@dominion.thruhere.net>
	<1395147366.3808.70.camel@ted>
	<CAP9ODKqhnScZ+__098Q7OS53WrkkASfrfSxdkGt3OeozZ=2yJA@mail.gmail.com>
	<532A36F3.2090800@mlbassoc.com>
	<CAMKF1spcWtVah6-F6AQaSs72Cmyrke-5+JrdmR5s7AA6QCuDJA@mail.gmail.com>
Date: Thu, 20 Mar 2014 08:57:49 -0300
X-Google-Sender-Auth: SSNVW6Ie8q0e2w6S4HDJchP1ikg
Message-ID: <CAP9ODKpw88t=-njVoA2ZNHFTdshBHU4Mu32K_cru5GjFn3X3VQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] linaro-pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Thu, 20 Mar 2014 11:57:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 19, 2014 at 9:45 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Mar 19, 2014 at 5:31 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>>
>> What are you afraid of?  Putting this in OE-core _may_ make sense
>> if it serves a larger community, but having it there will not be
>> destabilizing, so why not?
>
> We should always strive towards making OE-Core leaner, therefore we
> should evaluate the real common usecase. which means there must be a
> good justification to add it there

The OE-Core addition is something which ought to be done when
something becomes a 'standard' in our use or used by most. Until this
really happens this is still a goal. So better to move it to OE-Core
when we see the profit of doing it is good enough.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

