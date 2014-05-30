Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id CBCA16FE06
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 15:20:25 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id c1so943632igq.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1O1wI4vmqWaiZuYgGgv0b/omwDn8wIizJF3mSvs88xs=;
	b=xfL9BR08YQBnlWEXl9Qn5tzcz20JsLN8WmjnC57xpeHBLzzFrjJyPnMbz7BK/E4R2C
	NOliSQ/hWwXo2xaBoUbFywRUOioV+Jv+pEn0rQH6Z+o1/dJ3bLhQZgI72MFVKTIZqivx
	cxou/UAyiJ3AgeZL95mT5inLJnHgDZHjox3he0ubI8/mamYl5tHIMCLs3KRyVi7FygEh
	dFw7JdLvyApjVWBPSZaD0kpCXDm5WclfLXfhvVUJOgaS6qbsLkIYP8vY39GzLM/Kic0s
	I3VKBIEmIyBB6Tv6X6sEkz9HWlftU7Yvde2AymStcVkvPf1mIKG3HuHSIJr8xOoidmbD
	FF4Q==
X-Received: by 10.50.143.9 with SMTP id sa9mr379203igb.2.1401463226437; Fri,
	30 May 2014 08:20:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Fri, 30 May 2014 08:19:56 -0700 (PDT)
In-Reply-To: <CAJTo0La5LW4EeUX9-Eaa3jGeY_-U7PsA3T6ThqTAvihks6PUmQ@mail.gmail.com>
References: <1401390620-21874-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0La5LW4EeUX9-Eaa3jGeY_-U7PsA3T6ThqTAvihks6PUmQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 May 2014 08:19:56 -0700
Message-ID: <CAMKF1srp47_PP8942naSOwgda9K=YrN_JQu8mup_ZB4MO+t43A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade 212 -> 213
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
X-List-Received-Date: Fri, 30 May 2014 15:20:33 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 30, 2014 at 7:28 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> +       sed -i '/ln --relative --help/d' ${S}/configure.ac
>>         sed -i -e 's:\$(LN_S) --relative -f:lnr:g' ${S}/Makefile.am
>>         sed -i -e 's:\$(LN_S) --relative:lnr:g' ${S}/Makefile.am
>
> Introducing lnr was my fault but this is getting a bit convoluted, can
> the ln-munging be replaced with a patch so it is less magical?

We will have to do a patch that will not be accepted in systemd since
now they explicitly enquire
if ln supports it or not otherwise they bailout. So what are our
options, one carry a patch around that wont go anywhere or use lnr
that can be removed once we have all supported distros have ln
--relative available. I dont see any advantage of 1 over 2.

