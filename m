Return-Path: <m.hoffmann@cartelsol.com>
Received: from ms-10.1blu.de (ms-10.1blu.de [178.254.4.101])
	by mail.openembedded.org (Postfix) with ESMTP id 5C90678687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 13:26:56 +0000 (UTC)
Received: from [80.153.115.6] (helo=[10.17.123.139])
	by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2) (envelope-from <m.hoffmann@cartelsol.com>)
	id 1eS0sD-0006Ki-14; Thu, 21 Dec 2017 14:26:57 +0100
To: Robert Yang <liezhi.yang@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <b4cc53ff-9653-a90e-92de-1e59f9dbbce8@cartelsol.com>
	<6a6ceee7-bf43-70ab-72bb-c10f299ca149@windriver.com>
From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Message-ID: <b3556d63-e844-a2cb-2e42-a9732ad68477@cartelsol.com>
Date: Thu, 21 Dec 2017 14:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <6a6ceee7-bf43-70ab-72bb-c10f299ca149@windriver.com>
X-Con-Id: 239684
X-Con-U: 0-mhoffmann
X-Originating-IP: 80.153.115.6
Subject: Re: systemd PACKAGECONFIG = "lz4" leads to broken init
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
X-List-Received-Date: Thu, 21 Dec 2017 13:26:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hey Robert,

thanks for the patch. I'd like to understand how this fixes the problem
or probably more genrally how the PACKAGECONFIG thing works internally.

Can someone give me a pointer on where to look? It seems a bit like
magic just adding "lz4" twice at the end :-).

Kind regards,
Marcus

On 21.12.2017 05:40, Robert Yang wrote:
> Hi Marcus,
> 
> I think that the following patch can fix the problem:
> 
> The following changes since commit
> 978472c58629d1448399207873bbead96b27102e:
> 
>   image.bbclass: Add additional bb.debug to help track 12304 (2017-12-18
> 18:02:12 +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib rbt/systemd_lz4
>  
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/systemd_lz4
> 
> 
> Robert Yang (1):
>   systemd: fix PACKAGECONFIG for lz4
> 
> // Robert
> 
> On 12/21/2017 05:34 AM, Marcus Hoffmann wrote:
>> Dear all,
>>
>> when building poky with
>>
>> PACKAGECONFIG_append_pn-systemd = "lz4"
>>
>> in local.conf and
>> DISTRO_FEATURES_append = " systemd"
>> VIRTUAL-RUNTIME_init_manager = "systemd"
>> in bblayers.conf, init (=systemd) can't start because of a missing lz4
>> library:
>>
>> /sbin/init: error while loading shared libraries: liblz4.so.1: cannot
>> open shared object file: No such file or directory
>>
>> Best wishes,
>> Marcus Hoffmann
>>

