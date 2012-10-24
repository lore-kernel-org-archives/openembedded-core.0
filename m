Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>)
	id 1TQw15-0001Gl-29; Wed, 24 Oct 2012 10:08:43 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Oct 2012 00:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,639,1344236400"; d="scan'208";a="239383270"
Received: from adinu-vostro-460 (HELO [10.237.105.39]) ([10.237.105.39])
	by fmsmga002.fm.intel.com with ESMTP; 24 Oct 2012 00:45:02 -0700
Message-ID: <50879CC0.2030104@intel.com>
Date: Wed, 24 Oct 2012 10:46:08 +0300
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1349345672-803-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<CA+chaQePjXEa0o6ziqV7rUVgqWOEoyJPMb1iApbv-9MEJzts0Q@mail.gmail.com>
	<20121018205948.GE3087@jama.jama.net>
	<20121023185454.GS3269@jama.jama.net>
In-Reply-To: <20121023185454.GS3269@jama.jama.net>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gypsy: removed gypsy from meta/recipes-connectivity
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
X-List-Received-Date: Wed, 24 Oct 2012 08:08:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

This change was caused by the bug :

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2797

I removed the tarball and kept only the git package because that is what 
says in the bug.

Secondly, i modified the SRCREV because i took the latest version in the 
git repo.

If there is anything more to add please send me an email.

Thanks,

Andrei Dinu

On 10/23/2012 09:54 PM, Martin Jansa wrote:
> On Thu, Oct 18, 2012 at 10:59:48PM +0200, Martin Jansa wrote:
>> On Thu, Oct 18, 2012 at 08:59:19PM +0200, Martin Jansa wrote:
>>> I know you've sent
>>> http://patchwork.openembedded.org/patch/37763/
>>> to add it to meta-oe, but this patch removed also newer gypsy_0.9.bb
>>> and only older gypsy_git.bb was added back.
>>>
>>> Please fix that.
>> There is also this diff which isn't mentioned in your commit.
>>
>> -SRCREV = "3652e1f37e82b8e63983e30fda3482cd099a8cf5"
>> +SRCREV = "be8c9c382d2d1d37b51d29b0843045121ec90213"
>>   PV = "0.8+git${SRCPV}"
>>   PR = "r2"
>>
>> @@ -15,4 +15,5 @@
>>                       file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
>>
>>   SRC_URI = "git://anongit.freedesktop.org/gypsy;protocol=git \
>> -           file://fixups.patch"
>> +           file://fixups.patch \
>> +           file://0001-gypsy-m4-directory-missing-from-structure.patch"
> ping
>
> meta-oe is still broken because of this
>
> Cheers,



