Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S505L-0007DZ-Bs
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 20:30:11 +0100
Received: from mail-qy0-f180.google.com ([209.85.216.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 06 Mar 2012 11:20:29 -0800
Received: by mail-qy0-f180.google.com with SMTP id d15so2775720qcs.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 11:20:29 -0800 (PST)
Received-SPF: pass (google.com: domain of scott.a.garman@intel.com designates
	10.224.173.72 as permitted sender) client-ip=10.224.173.72; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	scott.a.garman@intel.com designates 10.224.173.72 as permitted
	sender) smtp.mail=scott.a.garman@intel.com
Received: from mr.google.com ([10.224.173.72])
	by 10.224.173.72 with SMTP id o8mr9237751qaz.76.1331061629269 (num_hops
	= 1); Tue, 06 Mar 2012 11:20:29 -0800 (PST)
Received: by 10.224.173.72 with SMTP id o8mr7977866qaz.76.1331061625957;
	Tue, 06 Mar 2012 11:20:25 -0800 (PST)
Received: from [172.10.11.19] ([209.216.168.112])
	by mx.google.com with ESMTPS id gw4sm30646550qab.13.2012.03.06.11.20.23
	(version=SSLv3 cipher=OTHER); Tue, 06 Mar 2012 11:20:24 -0800 (PST)
Message-ID: <4F566375.30705@intel.com>
Date: Tue, 06 Mar 2012 11:20:21 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAFZPMoaRKkELBmd1u5SnWF5UDQiHawi9aRJFw72UqGrKLJQNHw@mail.gmail.com>
	<CAFZPMob-UQNR9Q-_EsumFpWj=49t9TNjFYF8WTNLgfDWQ+qiAQ@mail.gmail.com>
In-Reply-To: <CAFZPMob-UQNR9Q-_EsumFpWj=49t9TNjFYF8WTNLgfDWQ+qiAQ@mail.gmail.com>
X-Gm-Message-State: ALoCoQmYO+Ic5px+mzhqL+6ln8ctEuOxUyxy4CcmCtmqmCDAj4DIUOfDBNXVNdkPRjwAPfPWKz6V
Subject: Re: broken ncurses support for python
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
X-List-Received-Date: Tue, 06 Mar 2012 19:30:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2012 05:06 AM, Sergey Lapin wrote:
> On Tue, Mar 6, 2012 at 3:08 PM, Sergey Lapin<slapinid@gmail.com>  wrote:
>> commit dd05e06b89906002f68d616a6326c962e725bc54
>> Author: Christopher Larson<chris_larson@mentor.com>
>> Date:   Tue Jan 10 13:51:18 2012 -0600
>>
>>     ncurses-native: install to libdir, not base_libdir
>
> I was wrong with this one, actual culprit is this one:
>
> commit 796c3d038fb7892a5e5206fb10217623de18853f
> Author: Scott Garman<scott.a.garman@intel.com>
> Date:   Wed Jan 4 22:30:29 2012 -0800
>
>
>>
>> breaks python ncurses support.
>>
>> Any ideas on proper fixing? For myself I revert this locally and
>> everything works perfectly.
>> (I think .so files and .a archives should be in usr/lib while .so
>> can go to /lib which is not the case with current ncurses.)
>> so mv in do_install should be sufficient, not --libdir=${base_libdir}.

Could you be more specific about how python ncurses support is broken? I 
assume you're getting errors of unresolved symbols. If that's the case, 
you may need to rebuild the application so it links to ncurses from 
base_libdir.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


