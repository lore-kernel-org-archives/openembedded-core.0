Return-Path: <michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 98CB277F6D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 13:48:02 +0000 (UTC)
X-AuditID: 0a00029b-695ff70000003fa4-43-5935610f6ec8
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	74.EC.16292.F0165395; Mon,  5 Jun 2017 08:48:03 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Mon, 5 Jun 2017 08:47:59 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Joshua Lock
	<joshua.g.lock@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Leonardo Sandoval
	<leonardo.sandoval.gonzalez@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/2] Multi-threaded RPM support
Thread-Index: AQHS3T0Et+tuaahuPUC0IBkRMEsPoKIWg+EAgAASvwCAAAO8AP//rYpg
Date: Mon, 5 Jun 2017 13:47:59 +0000
Message-ID: <655290B7709079438B7932553958E60DA1310D09@ESS-EX01.essvote.corp.local>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<1496585728.6630.165.camel@linuxfoundation.org>
	<4f9f2466-1409-e5d8-917c-58b4864f8863@linux.intel.com>
	<1496668890.3690.7.camel@linux.intel.com>
	<c247784f-f822-9193-c3cd-650ec9581af4@linux.intel.com>
In-Reply-To: <c247784f-f822-9193-c3cd-650ec9581af4@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWyRiBPQ1c40TTSoPk1t8X/x9vYLGYd2slm
	0fzxEIvFnZ/v2C1+PJvI6sDqMe9koMf+uWvYPc5tXMEYwBzFZZOSmpNZllqkb5fAldE0T7Bg
	iWBF/8zrbA2MC/i6GDk5JARMJFraXzB3MXJxCAkcZZS4+fw1O4Qzk1HiTHcfI0gVm4CRxLnr
	mxhBEiICe5gkbp36xAySEBawlbi75jwTiC0iYCdx8UAvG4TtJvH92EEWEJtFQEWi5/wasDiv
	QJDExdPr2CA2TGGSaJjwlR0kwSngLLHt/2SwBkYBMYnvp9aADWUWEJe49WQ+E8StAhJL9pxn
	hrBFJV4+/scKYctJvGtqY4Wo15FYsPsTG4StLbFs4WtmiMWCEidnPmGZwCgyC8nYWUhaZiFp
	mYWkZQEjyypGvlwjvdTi4rL8klS95PzcTYzAWOFiYJq9g7GnKfYQowAHoxIP740Y00gh1sSy
	4srcQ4zSHCxK4rw3n6lGCgmkJ5akZqemFqQWxReV5qQWH2Jk4uAEEVxSDYzJrlL7rzMXmB55
	2Tg1U5vd6+KxH2mH9R9fnBXFv3xC4n+1PW8vLMo6esnmYvglM4VLFo6TVWdya7b1lLwQltRl
	DD7kmj1ZpnzP1G+zLqw8v2DCPYU/eUeYHbuefDhmHjLfjE9XuplHwEFixu878dcEEyoj11w/
	+m5zZ6zZi+6sb2m9Ro2s8X+UWIozEg21mIuKEwG4Htc/ewIAAA==
Subject: Re: [PATCH 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Mon, 05 Jun 2017 13:48:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I just wanted to note that in my quest to get newer chrome to build I have =
used centos7 with the official devtoolset-6 scl.
It was able to build my pyro based distro fine in gcc6.  So Centos7 has an =
officially supported path that may be viable if it comes down to being the =
last gcc 4.x distro.


-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Alexander Kanavin
Sent: Monday, June 05, 2017 8:35 AM
To: Joshua Lock; Richard Purdie; openembedded-core@lists.openembedded.org; =
Leonardo Sandoval
Subject: Re: [OE-core] [PATCH 0/2] Multi-threaded RPM support

On 06/05/2017 04:21 PM, Joshua Lock wrote:

> On the Yocto Autobuilder clusters we have:
> * centos7 / gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-11)
> * debian8 / gcc (Debian 4.9.2-10) 4.9.2
> * debian-testing / gcc (Debian 6.3.0-14) 6.3.0 20170415
> * fedora24 / gcc (GCC) 6.3.1 20161221 (Red Hat 6.3.1-1)
> * fedora25 / gcc (GCC) 6.3.1 20161221 (Red Hat 6.3.1-1)
> * opensuse132 / gcc (SUSE Linux) 4.8.3 20140627 [gcc-4_8-branch
> revision 212064]
> * opensuse422 / gcc (SUSE Linux) 4.8.5
> * ubuntu1604 / gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609
> * ubuntu1610 / gcc (Ubuntu 6.2.0-5ubuntu12) 6.2.0 20161005
>
> We are aiming to replace openSUSE 13.2 (as it was discontinued in
> January of this year) but CentOS 7 has a good long lifetime ahead of
> it, therefore supporting it and RHEL 7 will require gcc 4.8.5 support.

Thanks; in that case using atomic types and other C11 features is not=20
possible at all for quite some time, and openmp support, while=20
available, is restricted to version 3.1 of the spec (which should be=20
just about enough - earlier versions do not have task support).

I actually have gcc 4.8 here (on debian testing, which will become=20
debian 9 in a couple of weeks), even though the default version is 6.3,=20
so I can test 4.8 compatibility locally.


Alex
--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

