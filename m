Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rhr9i-0004Th-5L
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 00:19:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jan 2012 15:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92290574"
Received: from unknown (HELO [10.7.199.69]) ([10.7.199.69])
	by orsmga001.jf.intel.com with ESMTP; 02 Jan 2012 15:11:41 -0800
Message-ID: <4F0239AC.2050100@linux.intel.com>
Date: Mon, 02 Jan 2012 15:11:40 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1325541032-29837-1-git-send-email-josh@linux.intel.com>
	<4F022DB5.3040501@linux.intel.com>
In-Reply-To: <4F022DB5.3040501@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: rename syslog.conf to syslog-startup.conf
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
X-List-Received-Date: Mon, 02 Jan 2012 23:19:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/12 14:20, Saul Wold wrote:
> On 01/02/2012 01:50 PM, Joshua Lock wrote:
>> Busybox 1.19 introduced basic support for an rsyslog inspired syslog.conf
>> whereas we've been shipping syslog.conf as a file to be sourced by the
>> syslog init script in order to configure which options busybox's
>> syslog is
>> started with.
>>
>> Busybox 1.19 in syslog mode chokes on our syslog.conf and doesn't start.
>>
>> This patch renames the syslog.conf we ship to syslog-startup.conf in
>> order
>> to prevent busybox trying to parse the file as an rsyslog style
>> syslog.conf
>>
> Do we need to also add an updated skeleton syslog.conf that the busybox
> syslog can parse?

We certainly could do that, but there's no need to. The syslog.conf is 
optional and the options we set at init continue to work as they have.

In fact, as far as I could tell from a quick search this morning, 
there's no way to tell syslogd log to a buffer, as we currently do by 
default, with syslog.conf.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


