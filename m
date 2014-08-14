Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3C99762252
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 11:26:15 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so960375wes.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 04:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=6vnJd1d9nuZvZ4mzXlGvzE7EfqoZrGmVtp276n0Q9RI=;
	b=Bgh+1rAE+0Yq1RVHlzmeqHoL/vw0463HZYp7P1w/3njnmQXECbTpqKtSTNpi3uxInA
	VKVbQmuyRXsTMnqhEiLnmTXaggRbAej9DeP3zSHJxYJD5nwK3Eb+tn796aXnqHetIzQl
	yEIv5xhVdeUFLqQr4GrQHXJB4uTB4B4Zd0Ak/SLOHnNe2C5QBKnnWzp1JMJ6/vNwK2+G
	RHdvSvxy2DmVoxFWSMZ/PXbE4NFk8D5Ghh4XojZ+ZhorqrM8qQzNYjE1pKsYNR3yxSEs
	BRpsRfQ5mwBrsaCOmjloQD9M8+NeoPtivX8xJ/d3wkp3tXCMwQ/kjcIe4ekqv6KMWLvm
	pmcg==
X-Gm-Message-State: ALoCoQliPwUJJwP4Drc+hJV+oVSHVShYS5per66ncc5Nd2uKBlkwXdySJu5vn3wUtZ1T8YzpHeoK
X-Received: by 10.180.91.111 with SMTP id cd15mr44394401wib.69.1408015575676; 
	Thu, 14 Aug 2014 04:26:15 -0700 (PDT)
Received: from ?IPv6:2001:610:612::6070:ce8e:41b4:991d?
	([2001:610:612:0:6070:ce8e:41b4:991d])
	by mx.google.com with ESMTPSA id ge8sm78612722wib.4.2014.08.14.04.26.14
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 14 Aug 2014 04:26:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <53EC99F3.1070004@topic.nl>
Date: Thu, 14 Aug 2014 13:26:12 +0200
Message-Id: <8B2546D1-0BE6-4D37-97C7-E2FEE0CAAA28@dominion.thruhere.net>
References: <CADV-EXHPuDtDk8pnFfJ4QQCVQufidX+7YuuK_FdgsEXj_46t6A@mail.gmail.com>
	<CADV-EXHDKqVR8Quu=Vj7-Tk8BrB-OS1Y=Y0iYi+ES2YNUiREMQ@mail.gmail.com>
	<CAP71WjyHMhzdRWmxNwM8Ot=t1O0qFvONyaKqpWSaeEZU_+PKVQ@mail.gmail.com>
	<CADV-EXF_+nNXPUEY0hJ3akxNCb0HeD+tHAYAiVcq9hACCv-ExA@mail.gmail.com>
	<20140813112531.GU14848@jama> <53EC99F3.1070004@topic.nl>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Two distros with same MACHINE
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
X-List-Received-Date: Thu, 14 Aug 2014 11:26:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Op 14 aug. 2014, om 13:13 heeft Mike Looijmans <mike.looijmans@topic.nl> =
het volgende geschreven:

> On 08/13/2014 01:25 PM, Martin Jansa wrote:
>> On Wed, Aug 13, 2014 at 02:09:36PM +0300, Yevhen Kyriukha wrote:
>>> 13 =D0=90=D0=B2=D0=B3 2014 =D0=B3. 13:51 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=
=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C "Nicolas Dechesne" <
>>> nicolas.dechesne@linaro.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB=
:
>>>>=20
>>>> On Wed, Aug 13, 2014 at 12:46 PM, Yevhen Kyriukha =
<kirgene@gmail.com>
>>> wrote:
>>>>> I have 2 distro configs that use different PACKAGECONFIG settings =
for
>>> the
>>>>> same package. I'm building all distros for single MACHINE. Do I =
need to
>>> set
>>>>> different TMPDIR to build these two distros or I can use same dir?
>>>>>=20
>>>>=20
>>>> yes, you should. i generally recommend to use 1 build dir for each
>>>> combination of <machine>, <distro> and <OE version>. keep in mind =
that
>>>> TMPDIR are 'cheap', assuming you are sharing ssate-cache, downloads
>>>> and using rm_work..
>>>=20
>>> Thanks!
>>=20
>> I don't agree with separate dirs for <machine>.
>>=20
>> Sharing the native sysroot and huge part of deploy/ipk/<common-arch> =
is
>> very useful for lowering disk space usage.
>>=20
>=20
> I'd name it as one of the major improvements over classic OE, being =
able to build multiple machines while sharing common things.

Multi machine builds were possible with OE classic as well. It was =
tricky in the beginning (2005-ish) with the giant sysroot, but after =
per-arch sysroots were available it was pretty safe to do multi machine =
builds.

regards,

Koen

>=20
> As for disk space, I found that it helps to occasionally remove the =
tmp dir and start over. That usually yields a few GB back. It would be =
nice if rm_work tried harder to remove stuff.
>=20
> M.
>=20
>=20
>=20
> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
>=20
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) (0) 499 33 69 79
> Telefax:  (+31) (0) 499 33 69 70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>=20
> Please consider the environment before printing this e-mail
>=20
> Bezoek ons op 9 en 10 september tijdens Technology for Health Den =
Bosch (stand 53)
> http://www.technologyforhealth.nl
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


