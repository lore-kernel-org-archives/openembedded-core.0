Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A8F0071B4B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 22:59:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB6MxVqT023696
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Dec 2016 14:59:33 -0800 (PST)
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Dec 2016 14:59:31 -0800
To: =?UTF-8?Q?Maciej_Borz=c4=99cki?= <maciej.borzecki@rndity.com>, "Robert P.
	J. Day" <rpjday@crashcourse.ca>
References: <alpine.LFD.2.20.1612060948001.9434@ca624034.mitel.com>
	<CAD4b0_+EACruAvA839=YTu8=FHAjGcuMzFbaLugJZQD6NOjf2Q@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <879b42db-266b-f662-bb06-b8043dca08a5@windriver.com>
Date: Tue, 6 Dec 2016 17:59:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAD4b0_+EACruAvA839=YTu8=FHAjGcuMzFbaLugJZQD6NOjf2Q@mail.gmail.com>
X-Originating-IP: [172.25.44.2]
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is the closest alternative to red hat's ABRT in OE?
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
X-List-Received-Date: Tue, 06 Dec 2016 22:59:45 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-12-06 11:02 AM, Maciej BorzDcki wrote:
> On Tue, Dec 6, 2016 at 3:49 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>>
>>   as in:
>>
>> https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/ch-abrt.html
>>
>> specifically, to manage core files? i would have thought judicious use
>> of "ulimit" would be the solution. others?
>>
>
> If you're using systemd there is systemd-coredump(8).
>

You could try minicoredumper:

https://linutronix.de/minicoredumper/

<quote>
    The minicoredumper project provides a program that handles the
    creation of core dump files on Linux. It can produce much smaller
    core dump files by making use of sparse files, compression, and
    allowing the user to configure what parts of the process memory
    image should be dumped.
</quote>

There's even a slightly out of date meta-oe recipe:

http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb?h=master


Oh and Ubuntu uses apport:
   https://wiki.ubuntu.com/Apport

	--
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

