Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THO8u-0004Yz-S4
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 02:09:21 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Sep 2012 16:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,498,1344236400"; d="scan'208";a="214793258"
Received: from unknown (HELO [10.255.13.154]) ([10.255.13.154])
	by orsmga002.jf.intel.com with ESMTP; 27 Sep 2012 16:56:26 -0700
Message-ID: <5064E7A9.1090209@linux.intel.com>
Date: Thu, 27 Sep 2012 16:56:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
References: <cover.1348695851.git.elizabeth.flanagan@intel.com>
	<50648815.70308@linux.intel.com>
	<CAPhnLPBLwMbu7_xU5M_a=8HYxCmB3avo3xLt3LdN0M7CTB55Mw@mail.gmail.com>
In-Reply-To: <CAPhnLPBLwMbu7_xU5M_a=8HYxCmB3avo3xLt3LdN0M7CTB55Mw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] license.bbclass fixes
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
X-List-Received-Date: Fri, 28 Sep 2012 00:09:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2012 04:50 PM, Flanagan, Elizabeth wrote:
> On Thu, Sep 27, 2012 at 10:08 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 09/26/2012 02:50 PM, Elizabeth Flanagan wrote:
>>>
>>> [YOCTO #3118]
>>>
>>> license.conf hasn't been being parsed. This commit series ensures that
>>> license.conf is parsed, that it contains useful variables that should be
>>> in a global conf file and that those variables are not kept within
>>> license.bbclass.
>>>
>> So where is the inherit license bbclass?
>
> For the yocto project it's an INHERIT +=  within poky.conf.
> meta-angstrom does not inherit it within
> conf/distro/include/angstrom.inc.
>
> -b
>
Acked-by: Saul Wold <sgw@linux.intel.com?>
>>
>> Sau!
>>
>>
>>> This also fixes an discreprancy between the documentation of LICENSE_PATH
>>> (which
>>> is what we tell people to use) and what we were using "LICENSE_DIR". This
>>> ensures
>>> that when the end user needs to add additional licenses, that they use
>>> LICENSE_PATH += "path/to/additional/licenses" and that it works.
>>>
>>
>>> The following changes since commit
>>> 0b09e50810162a07ef0aecee91ee32b4a36334a3:
>>>
>>>     busybox: Fix misplaced quote (2012-09-26 18:28:36 +0100)
>>>
>>> are available in the git repository at:
>>>     git://git.yoctoproject.org/poky-contrib eflanagan/LICENSE_PATH
>>>
>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/LICENSE_PATH
>>>
>>> Elizabeth Flanagan (3):
>>>     license.bbclass: Variable standardization
>>>     bitbake.conf: parse license config
>>>     license.conf/bbclass: Move globals to license.conf
>>>
>>>    meta/classes/license.bbclass |   67
>>> +-----------------------------------------
>>>    meta/conf/bitbake.conf       |    1 +
>>>    meta/conf/licenses.conf      |   64
>>> ++++++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 66 insertions(+), 66 deletions(-)
>>>
>>
>
>
>


