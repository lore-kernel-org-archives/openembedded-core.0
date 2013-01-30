Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U0ckZ-0001x3-OW
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 19:51:31 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jan 2013 10:35:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,569,1355126400"; d="scan'208";a="280464829"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2013 10:35:24 -0800
Message-ID: <510967EB.5060700@linux.intel.com>
Date: Wed, 30 Jan 2013 10:35:23 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
References: <1359500666-2874-1-git-send-email-sgw@linux.intel.com>
	<lytxpzkmh1.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lytxpzkmh1.fsf@ensc-virt.intern.sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_rpm: Escape the backtick to ensure the ls runs on the target
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
X-List-Received-Date: Wed, 30 Jan 2013 18:51:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2013 02:13 AM, Enrico Scholz wrote:
> Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
>
>> This change ensures that the ls /etc/rpm-postinsts runs in the target
>> at first boot time, rather than at the creation time of the script on
>> the host.
>> ...
>> -for i in `ls /etc/rpm-postinsts/`; do
>> +for i in \`ls /etc/rpm-postinsts/\`; do
>>   	i=/etc/rpm-postinsts/$i
>>   	echo "Running postinst $i..."
>
> are you really sure, this is enough? $i gets probably expanded too.  A
> better way than to escape all and everything is to quote the EOF marker.
>
Yes, I verified the out put in the S98run-postinsts script that is on 
disk and it's correct.

There a line above that sets i=\$i so the expansion occurs back to $i!

Sau!

> E.g. compare
>
> i=abc
>
> cat << "EOF"
> echo $i
> EOF
>
> cat << EOF
> echo $i
> EOF
>
>
> Enrico
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


