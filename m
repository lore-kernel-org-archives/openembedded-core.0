Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Re9K2-0007QV-Fc
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 18:54:22 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 23 Dec 2011 09:47:10 -0800
Received: by iazz13 with SMTP id z13so13450313iaz.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 09:47:10 -0800 (PST)
Received: by 10.42.29.1 with SMTP id p1mr18198163icc.40.1324662430174;
	Fri, 23 Dec 2011 09:47:10 -0800 (PST)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id b20sm43150209ibj.7.2011.12.23.09.47.07
	(version=SSLv3 cipher=OTHER); Fri, 23 Dec 2011 09:47:09 -0800 (PST)
Message-ID: <4EF4BE82.50501@intel.com>
Date: Fri, 23 Dec 2011 09:46:42 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
	<4EF356EF.7080703@intel.com> <4EF41210.5090403@intel.com>
	<3098076.yaHO5nC1Xs@helios>
In-Reply-To: <3098076.yaHO5nC1Xs@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 12/26] ncurses: move libraries to base_libdir
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
X-List-Received-Date: Fri, 23 Dec 2011 17:54:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/2011 12:18 AM, Paul Eggleton wrote:
> On Thursday 22 December 2011 21:30:56 Scott Garman wrote:
>> On 12/22/2011 08:12 AM, Scott Garman wrote:
>>> On 12/22/2011 12:50 AM, Phil Blundell wrote:
>>>> On Wed, 2011-12-21 at 23:55 -0800, Saul Wold wrote:
>>>>> +BUILD_LDFLAGS += "-Wl,-rpath,${base_libdir}"
>>>>
>>>> Why is that required?
>>>
>>> It's actually needed only for the -native case, so that the tic command
>>> (and possibly others) can be run.
>>>
>>> I take it I should have done:
>>>
>>> BUILD_LDFLAGS_virtclass_native +=
>>
>> Having tested this, it actually doesn't work.
>
> Were you doing virtclass_native or virtclass-native? If the former I think the
> latter is what you need.

Whoops, you're right.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


