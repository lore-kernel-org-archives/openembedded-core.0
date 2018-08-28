Return-Path: <yang.wang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4FBF78DD1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 17:22:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7SHMXCw025194
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:22:33 -0700
Received: from [128.224.56.219] (128.224.56.219) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 28 Aug 2018 10:22:32 -0700
Reply-To: <yang.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
References: <20180518085550.92085-1-mingli.yu@windriver.com>
	<5B1E1444.9000407@windriver.com>
	<30f93af9-5a38-059e-184f-bbbe52a01105@windriver.com>
	<f248ce00-4c47-7a70-9902-585960c5ccd4@windriver.com>
	<39d4429f-e3c6-33fc-3073-8cea08d81794@windriver.com>
	<8c09821e-7076-ad73-2849-c6a7b7287a3e@windriver.com>
From: Yang Wang <yang.wang@windriver.com>
Organization: Wind River
Message-ID: <63cfc1ec-10c0-a3bf-92be-4549d08c1d60@windriver.com>
Date: Tue, 28 Aug 2018 13:22:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8c09821e-7076-ad73-2849-c6a7b7287a3e@windriver.com>
Subject: Re: [PATCH] boost: add ptest support
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
X-List-Received-Date: Tue, 28 Aug 2018 17:22:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 08/28/2018 10:25 AM, Yang Wang wrote:
> On 08/27/2018 08:57 PM, Randy MacLeod wrote:
>> On 08/27/2018 06:17 PM, Yang Wang wrote:
>>> Not sure if it's worth to run the Ptest on QEMU though, I also run 
>>> Ptest on SIMICS simulators, thousands of tests didn't get run, looks 
>>> like the result was not good as well.
>>>
>>> Now my nightly Ptest runs on x86 device and gets consistent result 
>>> every day:
>>>
>>>      2018-08-27T06:26 -- 2018-08-27T09:52
>>>      Passed:  40518
>>>      Failed:  289
>>>      Skipped: 1876
>>
>> Consistent results are good and > 90% pass rate is very good.
>> What are the stats using qemux86-64 and/or simics?
>>
>> I don't expect that qemu results would be as close to real hardware
>> as Simics but it is quite good and freely available.
>>
> Actually, Ptest has 37 test suites as far as I know, different test 
> suites spent different time on QEMU and hardware, here is a list of 
> Ptest suites and their case number and spent time for running:
>
>
Just want to make it look better:
==============
#    Suite Name    Case #    Time to Run    Case #    Time to Run
                 qemu-x86-64            intel-xeon-core2
1    acl            2        1m            380        1m
2    attr        143        1m            143        1m
3    bash        79        8m            79        4m
4    bluez5        7        6m            7        6m
5    bzip2        6        1m            6        1m
6    dbus-test    15        3m            15        1m
7    diffutils    20        1m            20        2m
8    e2fsprogs    147        9m            335        10m
9    ethtool        2        1m            2        1m
10    flex        114        3m            114        1m
11    gawk        300        3m            298        2m
12    gdbm        30        2m            25        2m
13    glib-2.0    62        14m            220        6m
14    gzip        51        4m            18        1m
15    kbd            15        1m            7        1m
16    libevent    22        6m            1        3m
17    libpcre        34        3m            3        1m
18    libxml2        1        1m            0        1m
19    lzo            75        8m            5        3m
20    mdadm                6m                    6m
21    nettle        90        3m            90        3m
22    numactl                            8        3m
23    openssh        13        27m            47        52m
24    openssl        87        47m            56        15m
25    parted        64        5m            38        10m
26    perl        101        20m            2440    47m
27    perl5        110        17m            2406    29m
28    python        10961    1h 5m        32323    20m
29    rsyslog        2200    3h 37m        25        8m
30    sed            147        1m            86        3m
31    slang                            96        1m
32    strace        1557    1h 13m        431        6m
33    systemd        305        9m            155        3m
34    tcl            869        53m            206        6m
35    tcpdump        451        7m            413        3m
36    util-linux    516        25m            514        13m
37    zlib        2        1m            2        1m
     Overall        18080    10h 30m        40415    4h 15m

>
> As you can see, running subset of them on QEMU could be a solution if 
> people do not want to spend too much time on it or simulator is the 
> preferred test device.
>
> Thanks,
> -Yang
>>>
>>> Thanks,
>>> Yang Wang
>>
>>
>


