Return-Path: <andyblac@icloud.com>
Received: from st11p00mm-asmtp003.mac.com (unknown [17.172.81.2])
	by mail.openembedded.org (Postfix) with ESMTP id F413C65FDC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 02:31:31 +0000 (UTC)
MIME-version: 1.0
Received: from macmuppets.DiskStation.me
	(host86-167-70-74.range86-167.btcentralplus.com [86.167.70.74])
	by st11p00mm-asmtp003.mac.com
	(Oracle Communications Messaging Server 7u4-27.08(7.0.4.27.7) 64bit
	(built Aug
	22 2013)) with ESMTPSA id <0N5F00I2RWCI6380@st11p00mm-asmtp003.mac.com>
	for openembedded-core@lists.openembedded.org;
	Mon, 12 May 2014 02:31:32 +0000 (GMT)
Received: from [192.168.1.31]
	(host86-167-70-74.range86-167.btcentralplus.com [86.167.70.74])
	(Authenticated sender: andyblac)	by macmuppets.DiskStation.me (Postfix)
	with ESMTPSA id 95394B30231	for
	<openembedded-core@lists.openembedded.org>; 
	Mon, 12 May 2014 03:31:25 +0100 (IST)
From: Andrew Blackburn <andyblac@icloud.com>
In-reply-to: <CAMKF1so70jmiMNdfT_sBvnfHRd5zQNS-6LL3JufMs5H__+765A@mail.gmail.com>
Date: Mon, 12 May 2014 03:31:23 +0100
Message-id: <1E758580-2234-4832-B3F7-2848343DFA89@icloud.com>
References: <874B01E8-8A61-442E-981C-3FCE0763854E@icloud.com>
	<CAMKF1so70jmiMNdfT_sBvnfHRd5zQNS-6LL3JufMs5H__+765A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1874)
X-Spam-Status: No
X-MANTSH: 1TEIXWV4bG1oaGkdHB0lGUkdDRl5PWBoaGxEKTEMXGx0EGx0YBBIZBBsTEBseGh8
	aEQpYTRdLEQptfhcaEQpMWRcbGhsbEQpZSRcRClleF2hjeREKQ04XSxseGmJCH2lpH29TGXhzB
	x5pGhgZG3wcEQpYXBcZBBoEGxsHTU4fGBgYGUsFGx0EGx0YBBIZBBsTEBseGh8bEQpeWRdhWk5
	JTxEKTEYXbGtrEQpDWhcSHAQbHB0EHRoEHR4RCkJeFxsRCkJGF2BicmtBYG1bcntfEQpCRRdtQ
	WBPQ01wYRp+YREKQk4Xa0UaUlAeQ1xZXGgRCkJMF2UcekZwQENgeRMSEQpCbBdrUxx/GB1Hblh
	sUBEKQkAXYU9hR29tQEhrH0wRCkJYF2hDeGceQXpgXBtSEQpwZxdmXUtIbkdDHUF/bREKcGgXa
	0FSf3hsXl1kHQERCnBoF2kcZAVsfkMFQm9LEQpwaBdvU2VjZ01kTgVFWhEKcGgXZW1vHmxjQGh
	IQ3sRCnBoF2JjS3tJHEB4Hl0ZEQpwZxdhQV1nTm4aRx8baREKcH8XZUxeeEN4fUBHYAERCnBfF
	2ZsX1sbfG5tYVxpEQpwbBdgWEheaHNMen9vGBE=
X-CLX-Spam: false
X-CLX-Score: 1011
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.11.96,1.0.14,0.0.0000
	definitions=2014-05-11_03:2014-05-09, 2014-05-11,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=48 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=7.0.1-1402240000
	definitions=main-1405120035
X-MailScanner-ID: 95394B30231.A5D43
X-MailScanner: Found to be clean
X-MailScanner-From: andyblac@icloud.com
Subject: Re: talloc build error
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
X-List-Received-Date: Mon, 12 May 2014 02:31:33 -0000
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: quoted-printable

cheers guy=92s

thats worked using autotools-brokensep instead of autotools, =
=91wvstreams_4.6.1.bb=92 also needed this too.

best regards=20

andy.

On 11 May 2014, at 23:46, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, May 11, 2014 at 9:29 AM, Andrew Blackburn =
<andyblac@icloud.com> wrote:
>> hi all,
>>=20
>> i recently merged =91meta-openembedded=92 master into my branch, but =
i am now getting a build error with tallow, below is the erro i am =
getting, can anyone help on how to fix.
>=20
> It could be that S !=3D B change might be impacting this recipe. Can =
you
> change the recipe to inherit autotools-brokensep instead of autotools
> class.
>=20
>>=20
>>=20
>> NOTE: Preparing runqueue
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> ERROR: Function failed: do_configure (log file is located at =
/home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/tal=
loc-2.0.1-r2/temp/log.do_configure.9168)
>> ERROR: Logfile of failure stored in: =
/home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/tal=
loc-2.0.1-r2/temp/log.do_configure.9168
>> Log data follows:
>> | DEBUG: Executing python function sysroot_cleansstate
>> | DEBUG: Python function sysroot_cleansstate finished
>> | DEBUG: SITE files ['endian-little', 'bit-32', 'mips-common', =
'common-linux', 'common-glibc', 'mipsel-linux', 'common']
>> | DEBUG: Executing shell function autotools_preconfigure
>> | DEBUG: Shell function autotools_preconfigure finished
>> | DEBUG: Executing python function autotools_copy_aclocals
>> | DEBUG: Python function autotools_copy_aclocals finished
>> | DEBUG: Executing shell function do_configure
>> | gnu-configize: 'configure.ac' or 'configure.in' is required
>> | WARNING: =
/home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/tal=
loc-2.0.1-r2/temp/run.do_configure.9168:1 exit 1 from
>> |   gnu-configize
>> | ERROR: Function failed: do_configure (log file is located at =
/home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/tal=
loc-2.0.1-r2/temp/log.do_configure.9168)
>> ERROR: Task 4967 =
(/home/vix/oe-alliance/meta-openembedded/meta-oe/recipes-support/talloc/ta=
lloc_2.0.1.bb, do_configure) failed with exit code =911'
>>=20
>>=20
>>=20
>> hope someone can help
>>=20
>>=20
>> cheers
>> Andy.
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


