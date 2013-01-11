Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TtoJm-00009P-Bj
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Jan 2013 00:47:22 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jan 2013 15:32:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,455,1355126400"; d="scan'208";a="272905527"
Received: from unknown (HELO [10.255.14.194]) ([10.255.14.194])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2013 15:32:05 -0800
Message-ID: <50F0A0F5.1080301@linux.intel.com>
Date: Fri, 11 Jan 2013 15:32:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: ChenQi <Qi.Chen@windriver.com>
References: <cover.1357465230.git.Qi.Chen@windriver.com>
	<c8df96d897ecdf4fe04088aff1eba2fbfb0c004a.1357465230.git.Qi.Chen@windriver.com>
	<CAP9ODKpQUQmBOnWHRBEcF6k3aK=-bqM0=9m+bi8DxXC7gsHzSw@mail.gmail.com>
	<50EA3BB5.7080103@windriver.com>
	<CAP9ODKqdZVqPj8zMvmDnCbyJZSN_MB2f+qutTKBwkn4FE3aNLw@mail.gmail.com>
	<50EB82DD.7050808@windriver.com>
In-Reply-To: <50EB82DD.7050808@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V6 6/6] core-image-sato: support read-only rootfs
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
X-List-Received-Date: Fri, 11 Jan 2013 23:47:25 -0000
X-List-Received-Date: Fri, 11 Jan 2013 23:47:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2013 06:22 PM, ChenQi wrote:
> On 01/07/2013 06:30 PM, Otavio Salvador wrote:
>> On Mon, Jan 7, 2013 at 1:06 AM, ChenQi <Qi.Chen@windriver.com> wrote:
>>> On 01/07/2013 03:05 AM, Otavio Salvador wrote:
>>>> On Sun, Jan 6, 2013 at 7:44 AM,  <Qi.Chen@windriver.com> wrote:
>>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>>
>>>>> Support read-only rootfs by providing a specific conf file for
>>>>> volatile
>>>>> storage.
>>>>>
>>>>> [YOCTO #3406]
>>>>>
>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> I prefer this solution than the previous one however why you don't use
>>>> a sato-volatile-conf package to provide this?
>>> Because the there exists a one-to-one (or almost one-to-one)
>>> correspondence
>>> between the volatile conf file and the specific image.
>>>
>>> If there is a 'sato-volatile-conf' package, then there should be a
>>> 'minimal-volatile-conf', and maybe a 'custom-volatile-conf' if users are
>>> using a customized image.
>>>
>>> So I think it's simpler to let the image recipe provide the conf file.
>>> The only thing we have to do, when adding read-only rootfs support to
>>> some
>>> image, is to add the conf file to SRC_URI and install it in
>>> choose_volatile_conf.
>> The problem of not using a package for it is regarding upgrades; it is
>> not possible to upgrade the configuration file using the package
>> manager. I know most systems using the read-only-fs will be small and
>> do not use a package manager at all but some use cases will do (mine,
>> in case).
> Sounds reasonable.
> I'll think about it :)
>

+1 for creating a *-volatile-conf package instead of having it buried in 
the image recipe.

Sau!

> Thanks,
> Chen Qi
>
>> So I do believe we ought to have a one-to-one correspondence here.
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
>> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>>
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


