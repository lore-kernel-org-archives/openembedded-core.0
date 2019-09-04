Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BBBE57F288
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 08:36:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x848aMjR006805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Sep 2019 01:36:22 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 4 Sep 2019 01:36:21 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1567485996-351404-1-git-send-email-changqing.li@windriver.com>
	<ef8f2598-6a4b-7087-2375-beac482e3924@windriver.com>
	<413ea6ab6c76a8a532b7d28303b54fe61f12cd99.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <761df36a-5ea2-4b07-3e78-a0b5a4276908@windriver.com>
Date: Wed, 4 Sep 2019 16:36:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <413ea6ab6c76a8a532b7d28303b54fe61f12cd99.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.186]
Subject: Re: [PATCH V3] dnf.py: installroot support usrmerge
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
X-List-Received-Date: Wed, 04 Sep 2019 08:36:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 9/4/19 4:15 PM, Richard Purdie wrote:
> On Wed, 2019-09-04 at 16:04 +0800, Changqing Li wrote:
>> Ping
>> Test with/without  usrmege feature passed.
>> With usrmerge:
>> NOTE: test_dnf_installroot (dnf.DnfRepoTest)
>> DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge' to
>> skip the test
>> NOTE:  ... skipped 'Test run when not enable usrmerge'
>> Test run when not enable usrmerge
>> NOTE: test_dnf_installroot_usrmerge (dnf.DnfRepoTest)
>> DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge' to run
>> the test
>> DEBUG: [Running]$ ssh -l root -o UserKnownHostsFile=/dev/null -o
>> StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.16 export
>> PATH=/usr/sbin:/sbin:/usr/bin:/bin; mkdir -p
>> /home/root/chroot/test/etc
>> ....
>>
>> Without usrmerge:
>> NOTE: test_dnf_installroot (dnf.DnfRepoTest)
>> DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge' to
>> skip the test
>> DEBUG: [Running]$ ssh -l root -o UserKnownHostsFile=/dev/null -o
>> StrictHostKeyChecking=no -o LogLevel=ERROR 192.168.7.10 export
>> PATH=/usr/sbin:/sbin:/usr/bin:/bin; mkdir -p
>> /home/root/chroot/test/etc
>> DEBUG: time: 1567404974.8490767, endtime: 1567406474.8424258
>> DEBUG: [Command returned '0' after 0.13 seconds]
>> DEBUG: Command: mkdir -p /home/root/chroot/test/etc
>> Output:
>> ...
>> NOTE:  ... ok
>> NOTE: test_dnf_installroot_usrmerge (dnf.DnfRepoTest)
>> DEBUG: Checking if 'DISTRO_FEATURES' value contains 'usrmerge' to run
>> the test
>> NOTE:  ... skipped 'Test run when enable usrmege'
>> Test run when enable usrmege
> In a previous version of this patch, it introduced a failure in the
> parselogs test as an error was generated into the logs. I haven't
> tested the new version of the patch, was that issue addressed?
>
> Cheers,
>
> Richard

I didn't met failure in test_parselog during test,  the whole testimage 
is passed.

Could you help to send me the link of the failure test if the new 
version still

met test_parselog failure? Thanks.

>
>
>
-- 
BRs

Sandy(Li Changqing)


