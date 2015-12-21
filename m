Return-Path: <belen.barros.pena@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2B86FFE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 11:34:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2015 03:34:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,459,1444719600"; d="scan'208";a="621566378"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 03:34:51 -0800
Received: from irsmsx156.ger.corp.intel.com (10.108.20.68) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Mon, 21 Dec 2015 11:34:50 +0000
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.163]) by
	IRSMSX156.ger.corp.intel.com ([169.254.3.110]) with mapi id
	14.03.0248.002; Mon, 21 Dec 2015 11:34:50 +0000
From: "Barros Pena, Belen" <belen.barros.pena@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"toaster@yoctoproject.org" <toaster@yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [Toaster] FW: [OE-core] [PATCH 6/7] toaster: Update for
	buildstats changes
Thread-Index: AQHROXVy7ZBNK8RZ1kejZvi1bQRPug==
Date: Mon, 21 Dec 2015 11:34:50 +0000
Message-ID: <D29D9433.6DBEA%belen.barros.pena@intel.com>
References: <1450364093.13505.210.camel@linuxfoundation.org>
	<D2997F47.6D98C%belen.barros.pena@intel.com>
	<1450436206.8461.29.camel@linuxfoundation.org>
In-Reply-To: <1450436206.8461.29.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.5.9.151119
x-originating-ip: [10.237.224.30]
MIME-Version: 1.0
Cc: "Bartosh, Eduard" <eduard.bartosh@intel.com>
Subject: Re: [Toaster] FW: [PATCH 6/7] toaster: Update for buildstats changes
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
X-List-Received-Date: Mon, 21 Dec 2015 11:34:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <23753CF74F368041B23718AD6CB7CA33@intel.com>
Content-Transfer-Encoding: quoted-printable



On 18/12/2015 10:56, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

>On Fri, 2015-12-18 at 09:21 +0000, Barros Pena, Belen wrote:
>> I applied the buildstats series on top of toaster-next, ran a build,
>> and
>> checked the build stats info. I can see time per task coming in. I
>> cannot
>> see cpu usage or disk i/o data in the UI because of this
>>=20
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8571
>>=20
>> But there is data for both in the database, and it looks sane. So I
>> guess,
>> from the UI standpoint, the patches are ok: things were as broken as
>> they
>> were before ;)
>
>Thanks Bel=E9n!
>
>I was asked what new data was available from buildstats.

Thanks. I've opened an enhancement for this

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8842

Cheers

Bel=E9n

>Right now you
>show in toaster:
>
>Task execution time
>CPU usage
>Some IO usage number
>
>I'd note that CPU usage is no longer logged, the reason being that the
>numbers were basically misleading and inaccurate. The raw data in
>buildstats looks like:
>
>Started: 1450427397.44
>quilt-0.64-r0: do_compile: Elapsed time: 0.37 seconds
>utime: 7
>stime: 2
>cutime: 16
>cstime: 7
>IO write_bytes: 1269760
>IO read_bytes: 0
>IO cancelled_write_bytes: 0
>IO syscr: 6165
>IO wchar: 1205445
>IO rchar: 4465276
>IO syscw: 1508
>rusage ru_utime: 0.076
>rusage ru_stime: 0.02
>rusage ru_maxrss: 39684
>rusage ru_minflt: 4618
>rusage ru_majflt: 0
>rusage ru_inblock: 0
>rusage ru_oublock: 32
>rusage ru_nvcsw: 53
>rusage ru_nivcsw: 0
>Child rusage ru_utime: 0.168
>Child rusage ru_stime: 0.076
>Child rusage ru_maxrss: 41180
>Child rusage ru_minflt: 81640
>Child rusage ru_majflt: 0
>Child rusage ru_inblock: 0
>Child rusage ru_oublock: 2448
>Child rusage ru_nvcsw: 988
>Child rusage ru_nivcsw: 352
>Status: PASSED=20
>Ended: 1450427397.81
>
>In particular what you can do now is:
>
>a) breakdown filesystem IO usage to reads and writes (read_bytes and
>write_bytes)
>b) show total IO (wchar and rchar)
>
>[difference between filesystem IO and total IO is that there are caches
>in the middle, filesystem IO goes to the physical disk, total IO can be
>from memory - all the reads above were from cache hence 0 read_bytes
>but a large rchar]
>
>c) break down task execution time into "system" (cstime) and "user"
>(cutime) time. Divide those numbers by 100HZ to get seconds. This tells
>us how much time was in the kernel in syscalls and how much doing
>execution in userspace.
>
>d) break down times into parent and child processes (stime and utime
>verses cstime and ustime). The latter includes all children so is a
>total. This is probably less interesting to most users.
>
>e) show the number of voluntary and involuntary context switches
>(ru_nvcsw and ru_nivcsw). Again, the child numbers are totals, you can
>also just get the parent value.
>
>f) there is other data but the above is the pieces I've personally
>found to be interesting/useful.
>
>Some of the numbers are duplicates, e.g. ru_stime is stime/100 (convert
>to seconds) in the parent and child cases. You could do a better CPU
>usage approximation by something like:
>
>(child(ru_stime + ru_utime) / elapsed time) * 100 =3D % CPU Usage
>
>Hope that makes some kind of sense and that we could expose a bit more
>of this to the user at some point!
>
>Cheers,
>
>Richard
>


