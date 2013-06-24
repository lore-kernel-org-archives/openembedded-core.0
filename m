Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC116A8CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 15:18:59 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Jun 2013 08:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,929,1363158000"; d="scan'208";a="321745421"
Received: from unknown (HELO [10.255.13.89]) ([10.255.13.89])
	by azsmga001.ch.intel.com with ESMTP; 24 Jun 2013 08:18:58 -0700
Message-ID: <51C86361.6020703@linux.intel.com>
Date: Mon, 24 Jun 2013 08:18:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: jhuang0 <jackie.huang@windriver.com>
References: <cover.1371807568.git.jackie.huang@windriver.com>
	<d520d4fc66725801e83d4719e6c71f9015d8c9b0.1371807568.git.jackie.huang@windriver.com>
	<CANyK_8desSo69SzZqb4PNL1WHDV1EgrCGegGTYse8zwTN_iymw@mail.gmail.com>
	<51C7F903.9030809@windriver.com>
In-Reply-To: <51C7F903.9030809@windriver.com>
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
X-List-Received-Date: Mon, 24 Jun 2013 15:18:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/24/2013 12:45 AM, jhuang0 wrote:
>
>
> On 6/24/2013 3:23 PM, Paul Barker wrote:
>> On 24 Jun 2013 07:28, <jackie.huang@windriver.com
>> <mailto:jackie.huang@windriver.com>> wrote:
>>  >
>>  > From: Jackie Huang <jackie.huang@windriver.com
>> <mailto:jackie.huang@windriver.com>>
>>  >
>>  > The code relies on hardware specific memory locations to access
>>  > and modify the keyboard repeat rate.  It also requires read/write
>>  > access to /dev/port which doesn't exist on every architecture's
>>  > root fs.  The defect was raised for Qemu PowerPC but it also fails on
>>  > ARM.  The keyboard emulation in qemuppc is for an ADB (Apple
>> Desktop Bus)
>>  > device and not compatible with an Intel driver.  There's also no
>>  > indication in the documentation that the code should work on
>>  > anything other than Intel architecture but it also works on MIPS.
>>  >
>>
>>  > ++#if !(  defined(__i386__)   \
>>  > ++     || defined(__x86_64__) \
>>  > ++     || defined(__mips__)   \
>>  > ++     || defined(__sparc___))
>>  > ++
>>  > ++      fprintf(stderr,
>>  > ++              "ERROR:  %s should only be used on MIPS, x86 and
>> Sparc archicture boards\n", basename(argv[0]));
>>  > ++        exit(1);
>>  > ++#endif
>>
>> Would it be better to detect the target platform in the build system and
>> skip building the kbdrate program for architectures it won't work on
>> rather than building and installing a known broken program?
>
> Yeah, it should be better, I will check if we can do that.
>
Use COMPATIBLE_MACHINE

Sau!

>>
>>  > ++      set_progname(argv[0]);
>>  > +       set_progname(argv[0]);
>>
>> Accidental repeat?
>
> Indeed, thanks for pointing this out.
>
> Thanks,
> Jackie
>
>>
>> --
>>
>> Paul Barker
>>
>> Email: paul@paulbarker.me.uk <mailto:paul@paulbarker.me.uk>
>> http://www.paulbarker.me.uk
>>
>

