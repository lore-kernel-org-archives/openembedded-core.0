Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id D9DCE6B577
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 04:57:51 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx1so1689560pab.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2013 21:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=iMLWvdQZST1z71ou5/sEVYAC+U3y7EfpZn2vfSRbNc0=;
	b=U+2xVbThI/j0THE8SvlBW8TbyUCB+MOmFbcDUwy0n23ebK+azgCg8Zo6F4DJ1DdT/k
	3oT7Uz+N//exlszBuLthgSqmdULmMC+KeIVrtOb5HFq7uaFbLWCKA5DelyWZwI1sfdoZ
	lwPt3D66QGPXUdhwYaBD+yBW5/flAmfSKYMVcVSy/9jBpEZ7gxoTqrcVYmAxnHXYNKov
	0HxlSWWZAhAYeyMlXldN2HGmV+ybbosMopEvsMXJOGqlKokFpNKmBvlOn8xV+RrJgHVV
	+rG5CYPX5WDI3hJTybjy1/8l/Eyc5ZqVUdGc9gNmkA+ao2mvzzpBEznqfJKoCxtO/kHJ
	1Ejg==
X-Received: by 10.68.2.69 with SMTP id 5mr1612258pbs.124.1375851472493;
	Tue, 06 Aug 2013 21:57:52 -0700 (PDT)
Received: from gourish-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id cn2sm1362847pbb.35.2013.08.06.21.57.50
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 Aug 2013 21:57:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51FB3B2F.1060908@linux.intel.com>
Date: Tue, 6 Aug 2013 21:57:52 -0700
Message-Id: <E42448DC-E268-4FC5-8BB0-B6C31AD44FF1@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F97628.9040801@linux.intel.com>
	<7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
	<13A232F2-9B2C-427E-B5F0-26138984D099@gmail.com>
	<51F9948F.1000908@linux.intel.com>
	<08E217DF-FA59-4DAB-BB7F-0369A4BB3165@gmail.com>
	<51F99839.4020003@linux.intel.com>
	<FEC3604F-BE31-4146-AA6B-A16CB22C8D3F@gmail.com>
	<51FB3B2F.1060908@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Wed, 07 Aug 2013 04:57:52 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

I have updated the tree and rebased it on top of latest OE-Core
now python3-jinja should reliably build. Let me know if there are more =
issues.


On Aug 1, 2013, at 9:53 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 08/01/2013 01:19 PM, Khem Raj wrote:
>>=20
>> On Jul 31, 2013, at 4:05 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>=20
>>> On 07/31/2013 03:51 PM, Khem Raj wrote:
>>>>=20
>>>> On Jul 31, 2013, at 3:49 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>=20
>>>>>=20
>>>>> Still seems to failing in Jinja, I wonder if the dependencies are =
correctly sinec it's nooking for native bits and the python3-native had =
not been installed yet.
>>>>>=20
>>>>>=20
>>>>=20
>>>> in my build from scratch several times, I never had this issue. Did =
you do an incremental build to get to this issue ?
>>>>=20
>>>=20
>>> Yes, most of my builds are incremental until I throw them against =
the Autobuilder!
>>=20
>> Saul,
>>=20
>> I was able to reproduce the incremental build issue. I have now fixed =
it and pushed a rebased branch to pull tree
>> in contrib. Please try it out
>>=20
>=20
> Almost there!  It looks like you have a ${PN} in the tarball name =
instead of ${BPN} and it's causing a multilib failure for zeromq.
>=20
>> ERROR: Fetcher failure: Fetch command failed with exit code 8, =
output:
>> http://download.zeromq.org/lib32-zeromq-3.2.2.tar.gz:
>> 2013-08-02 00:24:06 ERROR 404: Not Found.
>>=20
>> ERROR: Function failed: Fetcher failure for URL: =
'http://download.zeromq.org/lib32-zeromq-3.2.2.tar.gz'. Unable to fetch =
URL from any source.
>> ERROR: Logfile of failure stored in: =
/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/=
build/tmp/work/x86-pokymllib32-linux/lib32-zeromq/3.2.2-r1/temp/log.do_fet=
ch.9470
>=20
> Notice the lib32-zeromq-3.2.2.tar.gz instead of zeromq-3.2.2.tar.gz
>=20
> Thanks
> 	Sau!
>=20
>=20
>> Thanks
>> -Khem
>>=20
>>=20
>>=20


