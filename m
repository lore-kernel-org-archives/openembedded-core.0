Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6C46E918
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 16:57:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s17GveT0014832
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Feb 2014 08:57:40 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 7 Feb 2014 08:57:40 -0800
Message-ID: <52F51080.1000808@windriver.com>
Date: Fri, 7 Feb 2014 11:57:36 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>, Saul Wold <sgw@linux.intel.com>,
	<richard.purdie@linuxfoundation.org>, "nitin.a.kamble"
	<nitin.a.kamble@intel.com>
References: <cover.1391534980.git.bruce.ashfield@windriver.com>
	<274bcde5bf629e3cbac8d32560ce916520a771af.1391534980.git.bruce.ashfield@windriver.com>
	<52F50D0F.7020101@linux.intel.com> <52F50D61.90308@windriver.com>
	<CF1A4DD2.6A6E2%dvhart@linux.intel.com>
	<CF1A4E01.6A6E3%dvhart@linux.intel.com>
	<52F50E7B.50707@windriver.com>
	<CF1A4F8F.6A6F9%dvhart@linux.intel.com>
In-Reply-To: <CF1A4F8F.6A6F9%dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] linux-yocto/3.10: integrate LTSI
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
X-List-Received-Date: Fri, 07 Feb 2014 16:57:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-02-07 11:55 AM, Darren Hart wrote:
> On 2/7/14, 8:48, "Bruce Ashfield" <bruce.ashfield@windriver.com> wrote:
>>>>>>> | ERROR: Function failed: do_compile (log file is located at
>>>>>>>
>>>>>>>
>>>>>>> /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-x86/build/b
>>>>>>> ui
>>>>>>> l
>>>>>>>
>>>>>>> d/tmp/work/qemux86-poky-linux/linux-yocto/3.10.25+gitAUTOINC+4d658aa5
>>>>>>> 80
>>>>>>> _
>>>>>>> 78d2a615b1-r0/temp/log.do_compile.1426)
>
> So since this is qemux86 that is failing, and Bruce has run the qemu
> builds - so are we using the right SRCREVs?
>
> Machine: 78d2a615b1
> Meta: 4d658aa580

That's exactly what just popped into my mind. I didn't send updates
for the meta-yocto BSPs with this first change. But the old SRCREVs
should have continued to work .. very odd, I did see generic x86
in the path, so I thought it was something different.

Bruce

>
>>>>>>
>>>>>> This can be seen on the AB
>>>>>>
>>>>>>
>>>>>> http://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/2
>>>>>> 0/
>>>>>> s
>>>>>> teps/BuildImages/logs/stdio
>
> --
> Darren
>
>


