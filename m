Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RXzfE-0007s2-6a
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 19:22:48 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Dec 2011 10:15:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,307,1320652800"; d="scan'208";a="93005378"
Received: from unknown (HELO [10.255.12.199]) ([10.255.12.199])
	by fmsmga001.fm.intel.com with ESMTP; 06 Dec 2011 10:15:59 -0800
Message-ID: <4EDE5BDF.4020409@linux.intel.com>
Date: Tue, 06 Dec 2011 10:15:59 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAMvUbCxsL0hLMcThgR6=1-Vu3tfkOh6Jwr3FP95T_ssPFOMd9g@mail.gmail.com>
	<4EDE4BB2.2020707@windriver.com>
In-Reply-To: <4EDE4BB2.2020707@windriver.com>
Subject: Re: [RFC] Move package-split of kexec-tools (kdump/kexec) into oe-core?
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
X-List-Received-Date: Tue, 06 Dec 2011 18:22:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2011 09:06 AM, Mark Hatle wrote:
> On 12/6/11 10:46 AM, Leon Woestenberg wrote:
>> Hello all,
>>
>>
>> meta-openembedded uses .bbappend to change the package-split-up of
>> "kexec-tools"
>> (as in openembedded-core) into "kexec" and "kdump" packages (this was
>> classic OE
>> behaviour).
>>
>> http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend?id=0c6d03335c117d24096598a3415ba22f74ec4f6e
>>
>>
>> However, in openembedded-core we have a dependency on kexec-tools,
>> thus this
>> error results:
>>
>> | * satisfy_dependencies_for: Cannot satisfy the following
>> dependencies for
>> task-core-tools-testapps:
>> | * kexec-tools *
>> | * opkg_install_cmd: Cannot install package task-core-tools-testapps.
>>
>>
>> So the use of meta-openembedded as a layer breaks openembedded-core.
>>
>> As a solution, can we move this package-split into openembedded-core?
>>
>>
>> Other (neat!) solutions at hand? Maybe a meta-package?
>>
>
> That package split seems reasonable to me, along with corresponding
> changes to openembedded-core to choose the "right" kexec-tools.. (in
> this case since it's test apps, we'd want both...)
>
Seems right here also, just be sure to do appropriate DEPENDS and PR 
bumps for things that currently depend on kexec-tools.

Sau!

> --Mark
>
>> Regards,
>>
>> Leon.
>>
>> thanks 'ant_work' for the pointer to bbappend.
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


