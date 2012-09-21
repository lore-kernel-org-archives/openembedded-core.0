Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1TF4QP-0003S9-4b
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 16:41:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Sep 2012 07:27:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,463,1344236400"; d="scan'208";a="209573238"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2012 07:27:59 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 21 Sep 2012 07:27:58 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.152]) by
	ORSMSX153.amr.corp.intel.com ([169.254.13.67]) with mapi id
	14.01.0355.002; Fri, 21 Sep 2012 07:27:58 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: "ml@communistcode.co.uk" <ml@communistcode.co.uk>
Thread-Topic: [OE-core] ld problems with relocated toolchain
Thread-Index: AQHNmAHs8GvFP9tj8UuwnGMMlQI7XZeVSoMAgAAEDID//4vI8A==
Date: Fri, 21 Sep 2012 14:27:58 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C46AF4D78@ORSMSX101.amr.corp.intel.com>
References: <505C7402.4060604@communistcode.co.uk>
	<1348236516.10108.79.camel@ted> <505C7849.70307@communistcode.co.uk>
In-Reply-To: <505C7849.70307@communistcode.co.uk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: ld problems with relocated toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2012 14:41:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Jack,

Please open a bug in bugzilla for the issue, since we're in final stage of =
1.3, all the issues that need to be addressed need have a bug number associ=
ate with it.

Thanks,
Jessica

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Jack Mitchell
Sent: Friday, September 21, 2012 7:23 AM
Cc: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] ld problems with relocated toolchain

On 21/09/12 15:08, Richard Purdie wrote:
> On Fri, 2012-09-21 at 15:04 +0100, Jack Mitchell wrote:
>> I am currently having issues building my application with the latest
>> toolchain.
>>
>> I have used the new capabilities of it being relocatable to place it
>> somewhere sensible and I think this may be what is breaking it. My
>> old toolchain in /opt still works perfectly.
>>
>> The error I receive is:
>>
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/b=
in/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-li=
nux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
>> cannot find crtbegin.o: No such file or directory
>> collect2: error: ld returned 1 exit status
>> make: *** [R0005] Error 1
>>
>> However, crtbeign.o is at the path:
>>
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ pwd
>> /home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux=
-gnueabi
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ find . -name
>>      crtbegin.o
>>      ./usr/lib/arm-poky-linux-gnueabi/4.7.2/crtbegin.o
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/lib
>>      lib/     libexec/
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/libexec/
>>      pt_chown
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$
>>
>>
>> Does anyone have an idea what is the issue here? Why can't it find
>> the object file?
> Did you have the patches that just merged to master applied? There are
> a number of relocation issues those just addressed.
>
> Cheers,
>
> Richard
>

If you're talking about the ones from Laurentiu, then yes - I had been wait=
ing for the merge and was hoping that it would fix my issues, but alas it w=
asn't to be!

Regards,

--

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


