Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 91C7A71CE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 16:08:56 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a188so4803208pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=B75U/jSmZjt+3NaVeyZdHQDdfpJn4Fs+lsiATQueKuo=;
	b=i3kzAaMvM4hfeVMhm/XEuQF6+obaMDIyhogcLosxNJevlHfi7IUN5E+yW2a1iMb2+B
	pAS/WvQmYbogYCLsSDXMLigjTGO2Pxtl0ge6+ljylUs6Nwnu7FcbHYV7CvWJyrxFa4Bk
	E4wGl7EO32WjAvojFwJcx4yvOzNx+e10v52zmN61qG1wjB++EEIyIXqCYBIVNj0C7EyJ
	VJEilBGr7Snnyh1MBkrrsrSvJZGya+AnXx/s7n1HeYMmaPPNCrLcECx1Q3VKq3+nNzeR
	WpASwJO32zYogpAnkvsWSrT3HuTnxOVtfPiQ7bUjwNAq2qsNG/eB3llIRNP+LUnKfZN9
	+yAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=B75U/jSmZjt+3NaVeyZdHQDdfpJn4Fs+lsiATQueKuo=;
	b=JzkaXZ8L49UvybOADl3zC7C5HUBwmDsSfKXq/EdjqoCY+Dog4a/rXeZX7mvN43EPvr
	kYHIkeO0AM6PxQLKVq8KJCfpaq9FwupwfgMB20vOlCNVqW3LhAT8AP5iRhPn0m41ggGh
	nHBp540afqiwy4IrPmMFZZPGeyYOe5zMdhRMBAUq3Biqt1DPdGSDLVlFZ/32WqCNmITg
	vk1DyIyCEBVPh75UOTisEohNt32e6TIMs5xMOHNeK1I76Rb/apQ3LKBohP8DNqsofYJB
	k2saK/ATaETJdGHkesncFUwTgqyyV0gE2rCATIbTIoNW6Ly3/ZcBdcY+Ac/4FUACgyei
	kSEw==
X-Gm-Message-State: AN3rC/7qlOOBOWu4xkPA6+xJQK+8G3RxEDJUIvfdVx+Z5Zjz2MOil4Yj
	xfFJAChVsHI7BM2107Q=
X-Received: by 10.84.179.99 with SMTP id a90mr33807674plc.26.1493050137281;
	Mon, 24 Apr 2017 09:08:57 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:e3df:bf0a:9f90:498e?
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id
	73sm31797173pfj.31.2017.04.24.09.08.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 09:08:56 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1490031500-38242-1-git-send-email-denis@denix.org>
	<20170421231816.GC20419@denix.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0fa0e630-137b-73ba-f212-0049b92e5199@gmail.com>
Date: Mon, 24 Apr 2017 09:08:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170421231816.GC20419@denix.org>
Subject: Re: [morty][PATCH] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Mon, 24 Apr 2017 16:08:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 04/21/2017 04:18 PM, Denys Dmytriyenko wrote:
> Ping. It's been over a month now...
its in my stagging since 4/1.  The AB has been failing with my current 
changes.

- armin
>
>
> On Mon, Mar 20, 2017 at 01:38:20PM -0400, Denys Dmytriyenko wrote:
>> From: Ed Bartosh <ed.bartosh@linux.intel.com>
>>
>> .siginfo files are not being accessed from local or NFS-mounted
>> sstate mirrors when sstate package is installed, so their atime
>> is not updated. If sstate mirror is cleaned based on access time,
>> they get deleted, even though they are still being used.
>>
>> Updated atime of .siginfo symlinks with 'touch -a'. This command
>> dereferences symlinks pointing to the local mirror and updates
>> atime of the .siginfo file on the mirror.
>>
>> [YOCTO #10857]
>>
>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>>   meta/classes/sstate.bbclass | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>> index 8643f3d..4fdfcc8 100644
>> --- a/meta/classes/sstate.bbclass
>> +++ b/meta/classes/sstate.bbclass
>> @@ -724,6 +724,8 @@ python sstate_sign_package () {
>>   #
>>   sstate_unpack_package () {
>>   	tar -xvzf ${SSTATE_PKG}
>> +	# update .siginfo atime on local/NFS mirror
>> +	[ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
>>   	# Use "! -w ||" to return true for read only files
>>   	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
>>   	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig
>> -- 
>> 2.7.4
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


