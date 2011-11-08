Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNoYs-00035y-OW
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 17:30:16 +0100
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 08 Nov 2011 08:23:54 -0800
Received: by pzk32 with SMTP id 32so3347816pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2011 08:23:54 -0800 (PST)
Received: by 10.68.6.163 with SMTP id c3mr1889950pba.54.1320769434178;
	Tue, 08 Nov 2011 08:23:54 -0800 (PST)
Received: from [192.168.1.12] (c-98-246-160-155.hsd1.or.comcast.net.
	[98.246.160.155])
	by mx.google.com with ESMTPS id s4sm5376014pbq.8.2011.11.08.08.23.52
	(version=SSLv3 cipher=OTHER); Tue, 08 Nov 2011 08:23:53 -0800 (PST)
Message-ID: <4EB957A3.50203@intel.com>
Date: Tue, 08 Nov 2011 08:24:03 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1320708905.git.scott.a.garman@intel.com>
	<5a66d5c0a8546166f76fb41cb48c033f8d6ed61f.1320708905.git.scott.a.garman@intel.com>
	<1320761372.10843.36.camel@ted>
In-Reply-To: <1320761372.10843.36.camel@ted>
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
X-List-Received-Date: Tue, 08 Nov 2011 16:30:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2011 06:09 AM, Richard Purdie wrote:
> On Mon, 2011-11-07 at 15:36 -0800, Scott Garman wrote:
>> Fix bug where only packages named PN included base-passwd in
>> RDEPENDS.
>>
>> This fixes [YOCTO #1727]
>>
>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>> ---
>>   meta/classes/useradd.bbclass |    6 +++++-
>>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> Merged to master, thanks.
>
> As an aside, does the USERADDPN variable serve any purpose now or can we
> remove it?

Indeed it does. I'll prepare a patch for that and also to remove the 
temporary workaround USERADDPN entry Koen added to the avahi recipe once 
you've accepted Eric's other patch.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


