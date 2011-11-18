Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RRWIe-000504-S6
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 22:48:45 +0100
Received: from mail-gy0-f180.google.com ([209.85.160.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 18 Nov 2011 13:42:16 -0800
Received: by ghrr13 with SMTP id r13so2404637ghr.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 13:42:16 -0800 (PST)
Received: by 10.50.100.194 with SMTP id fa2mr4741424igb.49.1321652535755;
	Fri, 18 Nov 2011 13:42:15 -0800 (PST)
Received: from [192.168.1.12] (c-98-246-160-155.hsd1.or.comcast.net.
	[98.246.160.155])
	by mx.google.com with ESMTPS id el2sm7523520ibb.10.2011.11.18.13.42.14
	(version=SSLv3 cipher=OTHER); Fri, 18 Nov 2011 13:42:14 -0800 (PST)
Message-ID: <4EC6D137.7020002@intel.com>
Date: Fri, 18 Nov 2011 13:42:15 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4EC6B45A.9060107@intel.com>
	<CAMKF1spQ5roygTCMRtZ5nhfhV+S9520tJYdV5Lyt-MB-Je1XZA@mail.gmail.com>
	<4EC6B917.90007@linux.intel.com> <4EC6BEF9.9060205@intel.com>
	<20111118211740.GF3549@jama.jama.net>
In-Reply-To: <20111118211740.GF3549@jama.jama.net>
Subject: Re: qemu needs > 2 GB of RAM to build?
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
X-List-Received-Date: Fri, 18 Nov 2011 21:48:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2011 01:17 PM, Martin Jansa wrote:
> Why not enable more swap? It's slow but works for short peaks in mem
> usage. I have to extend our swap from 2G to 4G on VM with 2G RAM for
> some builds.. also needed during linking unstripped libs :/.

Thank you, Marin - this is an excellent idea. :)

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


