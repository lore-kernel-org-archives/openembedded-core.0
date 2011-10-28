Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RJw3H-00007P-18
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Oct 2011 01:41:31 +0200
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga14.intel.com with ESMTP/TLS/RC4-MD5; 28 Oct 2011 16:35:25 -0700
Received: by pzk4 with SMTP id 4so23191648pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 16:35:24 -0700 (PDT)
Received: by 10.68.33.227 with SMTP id u3mr15819pbi.72.1319844923480;
	Fri, 28 Oct 2011 16:35:23 -0700 (PDT)
Received: from [192.168.1.12] (c-98-246-160-155.hsd1.or.comcast.net.
	[98.246.160.155])
	by mx.google.com with ESMTPS id z3sm27541652pbu.7.2011.10.28.16.35.22
	(version=SSLv3 cipher=OTHER); Fri, 28 Oct 2011 16:35:22 -0700 (PDT)
Message-ID: <4EAB3C41.8000306@intel.com>
Date: Fri, 28 Oct 2011 16:35:29 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1319580412.git.scott.a.garman@intel.com>
	<4EAA4025.2010709@intel.com>
In-Reply-To: <4EAA4025.2010709@intel.com>
Subject: Re: [PATCH 0/1] documentation audit script
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
X-List-Received-Date: Fri, 28 Oct 2011 23:41:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/2011 10:39 PM, Saul Wold wrote:
> On 10/26/2011 12:12 AM, Scott Garman wrote:
>> Hello,
>>
>> I've been using this script to perform audits of which packages
>> are producing documentation, and feel it's long overdue for this
>> to be added to the git tree. So here it is.
>>
>> The following changes since commit
>> f586aaa8d00361a9597a546d665077c75cf4d520:
>>
>> libxml-parser-perl, libxml-simple-perl, expat, sgmlspl-native, git:
>> bump PR to rebuild after perl upgrade (2011-10-25 08:36:01 +0100)
>>
>> are available in the git repository at:
>> git://git.yoctoproject.org/poky-contrib sgarman/docaudit-script
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/docaudit-script
>>
>>
>> Scott Garman (1):
>> documentation-audit.sh: script for auditing documentation build
>> status
>>
>> scripts/contrib/documentation-audit.sh | 92
>> ++++++++++++++++++++++++++++++++
>> 1 files changed, 92 insertions(+), 0 deletions(-)
>> create mode 100755 scripts/contrib/documentation-audit.sh
>>
>
> Can you please run this and generate a report.

I did this and sent the report to the yocto ML on 10/26.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


