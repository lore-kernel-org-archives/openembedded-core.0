Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SAHvY-0005eQ-Di
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 10:33:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2L9P2uP002217
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Mar 2012 02:25:02 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 21 Mar 2012 02:25:02 -0700
Message-ID: <4F699E6C.6070306@windriver.com>
Date: Wed, 21 Mar 2012 17:25:00 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4F6948EC.5050309@windriver.com> <333082295.tACmPZfEAB@helios>
In-Reply-To: <333082295.tACmPZfEAB@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: runqemu doesn't work with graphics through ssh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2012 09:33:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/21/2012 04:52 PM, Paul Eggleton wrote:
> On Wednesday 21 March 2012 11:20:12 Robert Yang wrote:
>> The runqemu doesn't work with graphics through ssh, here are the
>> reproduce steps:
>>
>> 1) ssh -X (or -Y) to a host
>> 2) runqemu qemux86
>>
>> The qemu window would leap and leap, and can't be closed by click
>> the "close" button or "crtl-c".
>>
>> the "runqemu nographic qemux86"
>>
>> This happens on: Fedora 13 64bit and Ubuntu 11.10 64bit, the ssh connection
>> is from Ubuntu 11.10 32bit.
>
> I regularly do this from my Fedora 14 64-bit my machine to my Ubuntu 11.10 32-
> bit machine and do not have any such problem. Has this just started happening
> for you or had you not tried this configuration until now?
>

It doesnt' work for me since a long time ago, maybe 3 months ago, I doubted
this was because of my host(Ubuntu 11.10 64bit), but it still didn't work
when I changed to FC 13 64bit.

I tried another host Ubuntu 10.10 32bit just now, this one worked well.

Regards,
Robert

> Cheers,
> Paul
>


