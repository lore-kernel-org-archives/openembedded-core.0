Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TB4Jp-0005xW-QT
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 15:46:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Sep 2012 06:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="220253833"
Received: from costin-desktop (HELO [10.237.105.156]) ([10.237.105.156])
	by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2012 06:33:52 -0700
Message-ID: <504DDF6A.1020409@intel.com>
Date: Mon, 10 Sep 2012 15:39:06 +0300
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1346924974-13859-1-git-send-email-constantinx.musca@intel.com>
	<1347283193.2673.240.camel@phil-desktop>
In-Reply-To: <1347283193.2673.240.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] automake 1.12.3: fix warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2012 13:46:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2012 04:19 PM, Phil Blundell wrote:
> On Thu, 2012-09-06 at 12:49 +0300, Constantin Musca wrote:
>> +++ b/meta/recipes-devtools/automake/automake/no-configure.in-warn.patch
>> @@ -0,0 +1,19 @@
>> +Don't show a warning if configure.in exists
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> +
>> +--- a/lib/Automake/Configure_ac.pm
>> ++++ b/lib/Automake/Configure_ac.pm
>> +@@ -77,8 +77,8 @@ sub find_configure_ac (;@)
>> +
>> +   if (-f $configure_in)
>> +     {
>> +-      msg ('obsolete', "autoconf input should be named 'configure.ac'," .
>> +-                       " not 'configure.in'");
>> ++#      msg ('obsolete', "autoconf input should be named 'configure.ac'," .
>> ++#                       " not 'configure.in'");
> Why is this change "embedded specific"?
>
> p.
>
>
Good question :). The Upstream-Status has to be Inappropriate [ 
configuration ]. Anyway, this patch will not be merged because we 
decided that we have to patch the packages instead to eliminate the warning.

Cheers,
Constantin Musca


