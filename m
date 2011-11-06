Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNBuV-00050E-8O
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 00:13:55 +0100
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 06 Nov 2011 15:07:40 -0800
Received: by ywm13 with SMTP id 13so8557405ywm.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Nov 2011 15:07:39 -0800 (PST)
Received: by 10.50.217.195 with SMTP id pa3mr37475433igc.12.1320620859682;
	Sun, 06 Nov 2011 15:07:39 -0800 (PST)
Received: from [192.168.1.12] (c-98-246-160-155.hsd1.or.comcast.net.
	[98.246.160.155])
	by mx.google.com with ESMTPS id 4sm31044173pbj.18.2011.11.06.15.07.37
	(version=SSLv3 cipher=OTHER); Sun, 06 Nov 2011 15:07:38 -0800 (PST)
Message-ID: <4EB71341.3020602@intel.com>
Date: Sun, 06 Nov 2011 15:07:45 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1320607825.git.scott.a.garman@intel.com>
	<505c8c4924bc7fcbea892c32b7144ee3b1b4c81b.1320607825.git.scott.a.garman@intel.com>
	<1320611116.3041.2.camel@lenovo.internal.reciva.com>
In-Reply-To: <1320611116.3041.2.camel@lenovo.internal.reciva.com>
Subject: Re: [PATCH 1/1] useradd.bbclass: fix how RDEPENDS is setup
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
X-List-Received-Date: Sun, 06 Nov 2011 23:13:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2011 12:25 PM, Phil Blundell wrote:
> On Sun, 2011-11-06 at 11:31 -0800, Scott Garman wrote:
>> Fix bug where only packages named PN included base-passwd in
>> RDEPENDS. Also remove shadow requirement, since some targets
>> do not use shadow and file ownership can be changed with only
>> passwd/group entries.
>>
>> This fixes [YOCTO #1727]
>
> Don't you need shadow or some equivalent to provide /sbin/useradd so
> that the postinsts work for on-target installs?  Removing shadow from
> RDEPENDS does sound like a good plan for the no-package-management case,
> but I'm not sure it's safe otherwise.

Of course you're right. Thank you for pointing this out. I will spin a 
v2 of the patchset.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


