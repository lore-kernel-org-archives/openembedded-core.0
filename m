Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UJ9hK-00020M-Rg
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 22:40:47 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Mar 2013 14:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,893,1355126400"; d="scan'208";a="307126863"
Received: from unknown (HELO [10.255.13.200]) ([10.255.13.200])
	by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2013 14:23:30 -0700
Message-ID: <514CCBD1.7060306@linux.intel.com>
Date: Fri, 22 Mar 2013 14:23:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1363107795-2140-1-git-send-email-cristian.iorga@intel.com>
	<1363107795-2140-4-git-send-email-cristian.iorga@intel.com>
	<20130312214846.GM9724@jama.dyndns-home.com>
	<CAJTo0LYBe10HhsMtynzpuS5arEDtXBFxcLKqryPFWEV=7Q7SbQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYBe10HhsMtynzpuS5arEDtXBFxcLKqryPFWEV=7Q7SbQ@mail.gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 3/4] bluez5: conflicts with bluez4
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
X-List-Received-Date: Fri, 22 Mar 2013 21:40:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2013 09:42 PM, Burton, Ross wrote:
> But bluez4 doesn't provide bluez5 and vice versa - the runtime API are
> different.
>
Is there going to be a v3 version that has RREPLACES since they can not 
co-exisit, but they also don't PROVIDE.  As Ross pointed out in a 
previous email, the package manager needs to be able to remove the older 
bluez package when migrating from 4 -> 5.

Thanks

    Sau!



> Ross
> --
> Ross Burton
> Sent with Sparrow <http://www.sparrowmailapp.com/?sig>
>
> On Tuesday, 12 March 2013 at 14:48, Martin Jansa wrote:
>
>> On Tue, Mar 12, 2013 at 07:03:14PM +0200, Cristian Iorga wrote:
>>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com
>>> <mailto:cristian.iorga@intel.com>>
>>> ---
>>> meta/recipes-connectivity/bluez5/bluez5_5.3.bb <http://bluez5_5.3.bb>
>>> | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
>>> <http://bluez5_5.3.bb>
>>> b/meta/recipes-connectivity/bluez5/bluez5_5.3.bb <http://bluez5_5.3.bb>
>>> index 311562f..5963483 100644
>>> --- a/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
>>> <http://bluez5_5.3.bb>
>>> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
>>> <http://bluez5_5.3.bb>
>>> @@ -6,6 +6,8 @@ SRC_URI += "file://bluetooth.conf \
>>> SRC_URI[md5sum] = "44de20f6422bf90a01b8df48e7dfe4ed"
>>> SRC_URI[sha256sum] =
>>> "828e2cd1109835c2fc1d731fb7fd7b46951044e451cc8556a37e1312d8c8c9a6"
>>> +RCONFLICTS_${PN} = "bluez4"
>>
>> That's not enough for upgrade path, add RREPLACES/RPROVIDES too.
>>> +
>>> do_install_append() {
>>> install -d ${D}${sysconfdir}/bluetooth/
>>> install -m 0644 ${S}/profiles/audio/audio.conf
>>> ${D}/${sysconfdir}/bluetooth/
>>> --
>>> 1.7.10.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> <mailto:Openembedded-core@lists.openembedded.org>
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> --
>> Martin 'JaMa' Jansa jabber: Martin.Jansa@gmail.com
>> <mailto:Martin.Jansa@gmail.com>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> <mailto:Openembedded-core@lists.openembedded.org>
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


