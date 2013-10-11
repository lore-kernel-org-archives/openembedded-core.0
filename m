Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AAE36CEA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:58:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9BFx0mI013598
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 08:59:00 -0700 (PDT)
Received: from msp-dhcp20.wrs.com (172.25.34.20) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 11 Oct 2013 08:59:00 -0700
Message-ID: <52582044.1010905@windriver.com>
Date: Fri, 11 Oct 2013 10:59:00 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <5258178A.9060606@communistcode.co.uk> <2500881.NDRv60Yfos@helios>
In-Reply-To: <2500881.NDRv60Yfos@helios>
Subject: Re: Nasty tar breakage
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
X-List-Received-Date: Fri, 11 Oct 2013 15:58:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/13 10:55 AM, Paul Eggleton wrote:
> Hi Jack,
>
> On Friday 11 October 2013 16:21:46 Jack Mitchell wrote:
>> I upgraded my host distribution today which pulled in tar 1.27 [1] and
>> caused a nasty breakage. Downgrading to tar 1.26 fixed the problem, I
>> would expect this is something we want to fix before 1.5 goes out the door?
>
> I think this has unfortunately come up too late for 1.5. If we get the fix in
> master it could go into a 1.5.1 point release however.

Workaround would be to use the buildtools-tarball, since it includes tar.

I'd suggest this be documented as a workaround until we can get the patch in for 
1.5.1.

--Mark

>> DEBUG: Executing python function sstate_task_prefunc
>> DEBUG: Python function sstate_task_prefunc finished
>> DEBUG: Executing python function do_populate_sysroot
>> DEBUG: Executing shell function sysroot_stage_all
>> tar: --same-order option cannot be used with -c
>> Try 'tar --help' or 'tar --usage' for more information.
>> tar: This does not look like a tar archive
>> tar: Exiting with failure status due to previous errors
>> WARNING:
>> /home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/x86_64-linux/quilt-na
>> tive/0.60-r0/temp/run.sysroot_stage_all.21827:1 exit 2 from
>>    tar -xf - -C "$dest"
>> DEBUG: Python function do_populate_sysroot finished
>> ERROR: Function failed: sysroot_stage_all (log file is located at
>> /home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/x86_64-linux/quilt-na
>> tive/0.60-r0/temp/log.do_populate_sysroot.21827)
>>
>> [1] https://lists.gnu.org/archive/html/info-gnu/2013-10/msg00004.html
>
> Could you please file a bug for this so we can track the issue?
>
> Cheers,
> Paul
>


