Return-Path: <yang.wang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D6CB78F60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 14:25:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7SEPOmu010007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 07:25:24 -0700
Received: from [128.224.56.219] (128.224.56.219) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 28 Aug 2018 07:25:23 -0700
Reply-To: <yang.wang@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180518085550.92085-1-mingli.yu@windriver.com>
	<5B1E1444.9000407@windriver.com>
	<30f93af9-5a38-059e-184f-bbbe52a01105@windriver.com>
	<f248ce00-4c47-7a70-9902-585960c5ccd4@windriver.com>
	<39d4429f-e3c6-33fc-3073-8cea08d81794@windriver.com>
From: Yang Wang <yang.wang@windriver.com>
Organization: Wind River
Message-ID: <8c09821e-7076-ad73-2849-c6a7b7287a3e@windriver.com>
Date: Tue, 28 Aug 2018 10:25:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <39d4429f-e3c6-33fc-3073-8cea08d81794@windriver.com>
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
X-List-Received-Date: Tue, 28 Aug 2018 14:25:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 08/27/2018 08:57 PM, Randy MacLeod wrote:
> On 08/27/2018 06:17 PM, Yang Wang wrote:
>> Not sure if it's worth to run the Ptest on QEMU though, I also run 
>> Ptest on SIMICS simulators, thousands of tests didn't get run, looks 
>> like the result was not good as well.
>>
>> Now my nightly Ptest runs on x86 device and gets consistent result 
>> every day:
>>
>>      2018-08-27T06:26 -- 2018-08-27T09:52
>>      Passed:  40518
>>      Failed:  289
>>      Skipped: 1876
>
> Consistent results are good and > 90% pass rate is very good.
> What are the stats using qemux86-64 and/or simics?
>
> I don't expect that qemu results would be as close to real hardware
> as Simics but it is quite good and freely available.
>
Actually, Ptest has 37 test suites as far as I know, different test 
suites spent different time on QEMU and hardware, here is a list of 
Ptest suites and their case number and spent time for running:

#    Suite Name    Suite Location                        Case # Time to 
Run    Case #    Time to Run
                                                     qemu-x86-64         
intel-xeon-core2
1    acl            /lib64/acl/ptest/run-ptest            2 1m        
     380        1m
2    attr        /lib64/attr/ptest/run-ptest            143 1m        
     143        1m
3    bash        /lib64/bash/ptest/run-ptest            79 8m            
79        4m
4    bluez5        /lib64/bluez5/ptest/run-ptest        7 6m            
7        6m
5    bzip2        /lib64/bzip2/ptest/run-ptest        6        1m     
     6        1m
6    dbus-test    /lib64/dbus-test/ptest/run-ptest    15 3m            
15        1m
7    diffutils    /lib64/diffutils/ptest/run-ptest    20 1m            
20        2m
8    e2fsprogs    /lib64/e2fsprogs/ptest/run-ptest    147 9m            
335        10m
9    ethtool        /lib64/ethtool/ptest/run-ptest        2 1m        
     2        1m
10    flex        /lib64/flex/ptest/run-ptest            114 3m        
     114        1m
11    gawk        /lib64/gawk/ptest/run-ptest            300 3m        
     298        2m
12    gdbm        /lib64/gdbm/ptest/run-ptest            30 2m        
     25        2m
13    glib-2.0    /lib64/glib-2.0/ptest/run-ptest        62 14m        
     220        6m
14    gzip        /lib64/gzip/ptest/run-ptest            51 4m        
     18        1m
15    kbd            /lib64/kbd/ptest/run-ptest            15 1m        
     7        1m
16    libevent    /lib64/libevent/ptest/run-ptest        22 6m        
     1        3m
17    libpcre        /lib64/libpcre/ptest/run-ptest        34 3m        
     3        1m
18    libxml2        /lib64/libxml2/ptest/run-ptest        1 1m        
     0        1m
19    lzo            /lib64/lzo/ptest/run-ptest            75 8m        
     5        3m
20    mdadm        /lib64/mdadm/ptest/run-ptest                6m     
             6m
21    nettle        /lib64/nettle/ptest/run-ptest        90 3m        
     90        3m
22    numactl        /lib64/numactl/ptest/run-ptest             8        3m
23    openssh        /lib64/openssh/ptest/run-ptest        13 27m        
     47        52m
24    openssl        /lib64/openssl/ptest/run-ptest        87 47m        
     56        15m
25    parted        /lib64/parted/ptest/run-ptest        64 5m        
     38        10m
26    perl        /lib64/perl/ptest/run-ptest            101 20m        
     2440    47m
27    perl5        /lib64/perl5/ptest/run-ptest        110 17m        
     2406    29m
28    python        /lib64/python/ptest/run-ptest        10961    1h 
5m        32323    20m
29    rsyslog        /lib64/rsyslog/ptest/run-ptest        2200 3h 
37m        25        8m
30    sed            /lib64/sed/ptest/run-ptest            147     1m    
         86        3m
31    slang        /lib64/slang/ptest/run-ptest         96        1m
32    strace        /lib64/strace/ptest/run-ptest        1557    1h 
13m        431        6m
33    systemd        /lib64/systemd/ptest/run-ptest        305     9m    
         155        3m
34    tcl            /lib64/tcl/ptest/run-ptest            869     
53m            206        6m
35    tcpdump        /lib64/tcpdump/ptest/run-ptest        451     7m    
         413        3m
36    util-linux    /lib64/util-linux/ptest/run-ptest    516 25m        
     514        13m
37    zlib        /lib64/zlib/ptest/run-ptest            2 1m            
2        1m
     Overall                                            18080    10h 
30m        40415    4h 15m

As you can see, running subset of them on QEMU could be a solution if 
people do not want to spend too much time on it or simulator is the 
preferred test device.

Thanks,
-Yang
>>
>> Thanks,
>> Yang Wang
>
>


