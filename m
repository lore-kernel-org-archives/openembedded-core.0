Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rl3kr-0005rg-Pq
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 20:22:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jan 2012 11:15:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106090335"
Received: from unknown (HELO [10.255.14.12]) ([10.255.14.12])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2012 11:15:00 -0800
Message-ID: <4F0DDFB3.7040906@linux.intel.com>
Date: Wed, 11 Jan 2012 11:14:59 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1326269523.12463.3.camel@localhost.localdomain>
In-Reply-To: <1326269523.12463.3.camel@localhost.localdomain>
Subject: Re: does busybox 1.19 still support the arg `-m'?
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
X-List-Received-Date: Wed, 11 Jan 2012 19:22:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 11/01/12 00:12, Ni Qingliang wrote:
> in file meta/recipes-core/busybox/files/syslog
> I found code section:
> 	if [ -n "$MARKINT" ]; then
> 		SYSLOG_ARGS="$SYSLOG_ARGS -m $MARKINT"
> 	fi
> but I can't find `-m' in the help of syslogd.

Looks like busybox disabled that code in 2007!? I've prepared a patch to 
remove this from the init script and syslog-startup.conf.

Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


