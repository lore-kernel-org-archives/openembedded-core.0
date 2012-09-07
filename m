Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TA5vD-0005as-17
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 23:17:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2012 14:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,387,1344236400"; d="scan'208";a="142737414"
Received: from unknown (HELO [10.255.13.76]) ([10.255.13.76])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2012 14:04:35 -0700
Message-ID: <504A6163.8020704@linux.intel.com>
Date: Fri, 07 Sep 2012 14:04:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1347041849-1559-1-git-send-email-sgw@linux.intel.com>
	<CAMKF1sq3OboaitVyZYqNSaedp2UFZ0m6QJ8Bznw0uFgQR8kG-A@mail.gmail.com>
In-Reply-To: <CAMKF1sq3OboaitVyZYqNSaedp2UFZ0m6QJ8Bznw0uFgQR8kG-A@mail.gmail.com>
Cc: Marc Ferland <marc.ferland@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: allow root login when debug-tweaks is enabled
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
X-List-Received-Date: Fri, 07 Sep 2012 21:17:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2012 01:52 PM, Khem Raj wrote:
> On Fri, Sep 7, 2012 at 11:17 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> +       for i in ${IMAGE_FEATURES};
>> +       do
>> +               if [ ${i} = "debug-tweaks" ]; then
>> +                       sed -i -e "s/^#PermitRootLogin/PermitRootLogin/" ${D}${sysconfdir}/ssh/sshd_config
>> +                       sed -i -e "s/^#PermitEmptyPasswords no/PermitEmptyPasswords yes/" ${D}${sysconfdir}/ssh/sshd_config
>> +               fi
>> +       done
>
> instead of looping could you apply same logic as in dropbear to do this thing ?
>
>
dropbear seems to do it as a patch, not in the do_install_append, also 
looking at dropbear it may be possible to simplify that it seems like 
it's a 2 step process that could be done in one step.  I think 
DISTRO_TYPE is only used in dropbear.

I guess its possible to export a variable that can be read by the 
install_append(), I will give it a test.

Sau!



