Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 779906A8CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 15:23:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5OFUIZT030366; Mon, 24 Jun 2013 16:30:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YMqghFw0e1hQ; Mon, 24 Jun 2013 16:30:27 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5OFUKhA030354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 24 Jun 2013 16:30:21 +0100
Message-ID: <1372087414.9930.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 24 Jun 2013 16:23:34 +0100
In-Reply-To: <51C86361.6020703@linux.intel.com>
References: <cover.1371807568.git.jackie.huang@windriver.com>
	<d520d4fc66725801e83d4719e6c71f9015d8c9b0.1371807568.git.jackie.huang@windriver.com>
	<CANyK_8desSo69SzZqb4PNL1WHDV1EgrCGegGTYse8zwTN_iymw@mail.gmail.com>
	<51C7F903.9030809@windriver.com> <51C86361.6020703@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Limit the kbdrate application to x86, mips and sparc.
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
X-List-Received-Date: Mon, 24 Jun 2013 15:24:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-06-24 at 08:18 -0700, Saul Wold wrote:
> On 06/24/2013 12:45 AM, jhuang0 wrote:
> >
> >
> > On 6/24/2013 3:23 PM, Paul Barker wrote:
> >> On 24 Jun 2013 07:28, <jackie.huang@windriver.com
> >> <mailto:jackie.huang@windriver.com>> wrote:
> >>  >
> >>  > From: Jackie Huang <jackie.huang@windriver.com
> >> <mailto:jackie.huang@windriver.com>>
> >>  >
> >>  > The code relies on hardware specific memory locations to access
> >>  > and modify the keyboard repeat rate.  It also requires read/write
> >>  > access to /dev/port which doesn't exist on every architecture's
> >>  > root fs.  The defect was raised for Qemu PowerPC but it also fails on
> >>  > ARM.  The keyboard emulation in qemuppc is for an ADB (Apple
> >> Desktop Bus)
> >>  > device and not compatible with an Intel driver.  There's also no
> >>  > indication in the documentation that the code should work on
> >>  > anything other than Intel architecture but it also works on MIPS.
> >>  >
> >>
> >>  > ++#if !(  defined(__i386__)   \
> >>  > ++     || defined(__x86_64__) \
> >>  > ++     || defined(__mips__)   \
> >>  > ++     || defined(__sparc___))
> >>  > ++
> >>  > ++      fprintf(stderr,
> >>  > ++              "ERROR:  %s should only be used on MIPS, x86 and
> >> Sparc archicture boards\n", basename(argv[0]));
> >>  > ++        exit(1);
> >>  > ++#endif
> >>
> >> Would it be better to detect the target platform in the build system and
> >> skip building the kbdrate program for architectures it won't work on
> >> rather than building and installing a known broken program?
> >
> > Yeah, it should be better, I will check if we can do that.
> >
> Use COMPATIBLE_MACHINE

We're after to take out a single binary, not the whole recipe?

Cheers,

Richard


