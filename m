Return-Path: <california.l.sullivan@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 44A2660049
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:01:19 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Sep 2017 11:01:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,379,1500966000"; d="scan'208";a="127656206"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 11 Sep 2017 11:01:20 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20170908221221.24444-1-california.l.sullivan@intel.com>
	<CAP9ODKp5JuuuExXx+34zQqcyfaH3xXRDKSkQuTWg9gZhD1ESpg@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <d9dc21e8-8782-8980-2afa-8a8a433f6759@intel.com>
Date: Mon, 11 Sep 2017 11:01:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp5JuuuExXx+34zQqcyfaH3xXRDKSkQuTWg9gZhD1ESpg@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] initramfs-framework: split setup-live and install-efi into separate recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Sep 2017 18:01:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

It looks like v1 was merged, so I'll have to rebase and send another patch.

---
Cal

On 09/09/2017 02:33 PM, Otavio Salvador wrote:
> On Fri, Sep 8, 2017 at 7:12 PM, California Sullivan
> <california.l.sullivan@intel.com> wrote:
>> Having these the initramfs-framework recipe forced initramfs-framework
>> users to build several tools they didn't need, and made it more
>> difficult to declare the recipe as allarch.
>>
>> Fixes [YOCTO #12024].
>>
>> v2 changes:
>>    * fix SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in layer.conf
>>    * bump PR of initramfs-framework
>>    * add allarch to setup-live and install-efi modules, as they're just
>>      shell scripts
>>
>> v3 changes:
>>    * set PR of new recipes to 4, as the name of the packages they build
>>      is the same as when they were part of the main recipe.
> I'd drop this from the commit log.
>
>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ... other than that,
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
>


