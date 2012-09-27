Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1THO4X-0004Rm-OT
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 02:04:49 +0200
Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 27 Sep 2012 16:50:51 -0700
Received: by qcad10 with SMTP id d10so1986329qca.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 16:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=vayoFLuorvgUk5X7NkIYtjDeCpyw1ed+bloS4+LR0ZM=;
	b=dIPyV1rbKpS95gKGusbQyE2z1t8+82FLfUVV1Q9SEUO5j7U9KfT0Kw74egkkOF3wGd
	BGKHAn6AbL1zgLqs859j5BbbnZaCVIGIUu5lpyfOol7+riKLMOTrDG88ijE/u9o/ngon
	v64QKxdZ/6tETsESNvUaISPWMCz0rgcQ1lRbhMKFmPbaNPm/ufEIXvrZgK06wKCgXyg6
	fyHTqT9LNUZdGM/9j+ayFQgEzWIHCK3WHwIaDveBUfCp/QrlWQs5hom6/vB6wC0li6EK
	6oTaYIigx/77Kekz17YVNWuigOYsEXQDhwFgjRgkZmY2atsnQJ/1p6QokPuj9mwyY5KM
	RUvw==
MIME-Version: 1.0
Received: by 10.229.77.227 with SMTP id h35mr3594489qck.47.1348789850624; Thu,
	27 Sep 2012 16:50:50 -0700 (PDT)
Received: by 10.229.63.1 with HTTP; Thu, 27 Sep 2012 16:50:50 -0700 (PDT)
In-Reply-To: <50648815.70308@linux.intel.com>
References: <cover.1348695851.git.elizabeth.flanagan@intel.com>
	<50648815.70308@linux.intel.com>
Date: Thu, 27 Sep 2012 16:50:50 -0700
Message-ID: <CAPhnLPBLwMbu7_xU5M_a=8HYxCmB3avo3xLt3LdN0M7CTB55Mw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkBTRd8MkPLJfR8Dwc0jQyPTA8pedFPmyW6cD4eddOo4KshvN0l2hF3riqOyLPLQ9d94KOf
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
X-List-Received-Date: Fri, 28 Sep 2012 00:04:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 27, 2012 at 10:08 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 09/26/2012 02:50 PM, Elizabeth Flanagan wrote:
>>
>> [YOCTO #3118]
>>
>> license.conf hasn't been being parsed. This commit series ensures that
>> license.conf is parsed, that it contains useful variables that should be
>> in a global conf file and that those variables are not kept within
>> license.bbclass.
>>
> So where is the inherit license bbclass?

For the yocto project it's an INHERIT +=  within poky.conf.
meta-angstrom does not inherit it within
conf/distro/include/angstrom.inc.

-b

>
> Sau!
>
>
>> This also fixes an discreprancy between the documentation of LICENSE_PATH
>> (which
>> is what we tell people to use) and what we were using "LICENSE_DIR". This
>> ensures
>> that when the end user needs to add additional licenses, that they use
>> LICENSE_PATH += "path/to/additional/licenses" and that it works.
>>
>
>> The following changes since commit
>> 0b09e50810162a07ef0aecee91ee32b4a36334a3:
>>
>>    busybox: Fix misplaced quote (2012-09-26 18:28:36 +0100)
>>
>> are available in the git repository at:
>>    git://git.yoctoproject.org/poky-contrib eflanagan/LICENSE_PATH
>>
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/LICENSE_PATH
>>
>> Elizabeth Flanagan (3):
>>    license.bbclass: Variable standardization
>>    bitbake.conf: parse license config
>>    license.conf/bbclass: Move globals to license.conf
>>
>>   meta/classes/license.bbclass |   67
>> +-----------------------------------------
>>   meta/conf/bitbake.conf       |    1 +
>>   meta/conf/licenses.conf      |   64
>> ++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 66 insertions(+), 66 deletions(-)
>>
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


