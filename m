Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7rWT-0000NR-4N
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 17:58:01 +0100
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 14 Mar 2012 09:49:14 -0700
Received: by yenl4 with SMTP id l4so2804139yen.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 09:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=ma4blHQO6vVICrusztMcRZHQWsjlXEuvcOX68eweo/I=;
	b=gCscBXtL5kmnwIlomgRff7B4xplQetI94Di6zkDeoLlBY3Pli4cd1VyjKMSw0lqtzv
	oTwiswjcUOje83df837fhZfKqu93tc+X1mob5DrYOa3GDBEiZkZUBpdlu7kDd20qfVCS
	T8tsrQz0Z6z0E9nRQSURqdNOliFArAsCpy2qgRmpFJ9V/dB5aOURMy7CMtG4wyMGe5hI
	TegtcNwZiJeg9OIR8s7lzRNwdyGQ/i2eFdgMEyWlYKuftdYz2tJI95cMySlVfzmbr+0F
	MD/U4etyEqKt6j+RPu2QyfeHMKLXJTYXVPqVb307CiUgEsR4/92l+p1zzipcA+4eK3lw
	ZMVg==
Received: by 10.60.1.7 with SMTP id 7mr3978490oei.71.1331743753528;
	Wed, 14 Mar 2012 09:49:13 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id g4sm4858834oeg.5.2012.03.14.09.49.11
	(version=SSLv3 cipher=OTHER); Wed, 14 Mar 2012 09:49:12 -0700 (PDT)
Message-ID: <4F60CC11.1040700@intel.com>
Date: Wed, 14 Mar 2012 09:49:21 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1331684953.git.scott.a.garman@intel.com>
	<20120314075108.GC3919@jama.jama.net>
In-Reply-To: <20120314075108.GC3919@jama.jama.net>
X-Gm-Message-State: ALoCoQnqjWHkD16xJPBK0aWzld9J9Z/Y3v/YSvCcq8C8zfqFuP3w8YmYL0AEz15sZFeYKUh8/DVJ
Subject: Re: [PATCH 0/1] ncurses packaging fix
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
X-List-Received-Date: Wed, 14 Mar 2012 16:58:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2012 12:51 AM, Martin Jansa wrote:
> On Tue, Mar 13, 2012 at 05:31:24PM -0700, Scott Garman wrote:
>> Hello,
>>
>> This fixes the ncurses library packaging. Thanks to Andreas Oberritter
>> for pointing it out.
>
> Why not use another do_split_packages for base_libdir?
>
> Can it be used only once per recipe? are there any libs left in libdir?

Hi Martin,

This is something worth looking into, but due to the amount of testing I 
feel it would need, I'm going to have to defer it. Our next release is 
coming up fast, and I've been asked to focus on recipe upgrades for the 
rest of this week. I have filed bug #2106 to keep track of it.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2106

Certainly anyone who has time to do proper testing on this can grab 
ownership of the bug in the meantime.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


