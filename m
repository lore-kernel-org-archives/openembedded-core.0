Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RVo5s-0005GQ-KO
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 18:37:17 +0100
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 30 Nov 2011 09:30:33 -0800
Received: by ywn1 with SMTP id 1so2302289ywn.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 09:30:32 -0800 (PST)
Received: by 10.50.10.163 with SMTP id j3mr3741923igb.15.1322674231977;
	Wed, 30 Nov 2011 09:30:31 -0800 (PST)
Received: from [10.1.10.192] (c-67-170-181-205.hsd1.or.comcast.net.
	[67.170.181.205])
	by mx.google.com with ESMTPS id jm11sm10375246ibb.1.2011.11.30.09.30.30
	(version=SSLv3 cipher=OTHER); Wed, 30 Nov 2011 09:30:31 -0800 (PST)
Message-ID: <4ED66835.3050400@intel.com>
Date: Wed, 30 Nov 2011 09:30:29 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4ED0CC76.4040606@emagii.com> <1322579029.7964.0.camel@ted>
	<4ED54C2B.2060505@emagii.com>
In-Reply-To: <4ED54C2B.2060505@emagii.com>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Wed, 30 Nov 2011 17:37:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2011 01:18 PM, Ulf Samuelsson wrote:
>
>>> Seen a couple of errors as well.
>>>
>>> 1. ERROR: Function 'useradd_sysroot' failed
>>> Tried to access "/etc/group" but this was locked.
>>> Problem disappeared the next time I rebuilt.
>> Can you file a bug about this problem please. I think we need to go
>> through the code paths in shadow and ensure its locking is sane. I took
>> a quick look at the code and was left wondering what lckpwdf() does for
>> example. Scott, could you take a look at this?
>
> Bugzilla is out of service, so bugs cannot be filed.

I have filed a bug for this, and have been trying to reproduce it 
without success:

http://bugzilla.pokylinux.org/show_bug.cgi?id=1794

> Haven't seen the issue since then so it is hard to give any details.
> I used very high BB_NUMBER_THREADS = 24.

I do have access to a system with a lot of cores, and have been doing 
builds on it.

I'd just like to confirm that when you saw this, it was a build from 
scratch (e.g, not using sstate cache from a previous build). And also, 
you *weren't* building this from a remote filesystem (NFS), correct?

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


