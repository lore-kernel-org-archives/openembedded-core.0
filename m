Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RlG5W-0004Fp-7J
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 09:32:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0C8PEBN018337
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jan 2012 00:25:14 -0800 (PST)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 Jan 2012 00:25:14 -0800
Message-ID: <4F0E98E5.3020302@windriver.com>
Date: Thu, 12 Jan 2012 16:25:09 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1326266933.git.wenzong.fan@windriver.com>	<4F0E8C3D.7040507@linux.intel.com>
	<4F0E940D.9050904@windriver.com>
In-Reply-To: <4F0E940D.9050904@windriver.com>
Cc: "Yan, Xiaofeng" <Xiaofeng.Yan@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/1] archive.bbclass: archive work directory
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
X-List-Received-Date: Thu, 12 Jan 2012 08:32:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 04:04 PM, wenzong fan wrote:
> On 01/12/2012 03:31 PM, Saul Wold wrote:
>> On 01/10/2012 11:34 PM, wenzong.fan@windriver.com wrote:
>>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>>
>>> v2 updates:
>>>
>>> 1) Remove the special-casing for gcc, checking for any packages under
>>> 'tmp/work-shared';
>>>
>>> 2) Remove some bash-specific code, replase the '[[regular-expression]]'
>>> with isovalent 'grep' statement.
>>>
>>>
>> So how is this work different than that of Xiaofeng's doing the 
>> tar_archive?  Can these two be merged somehow?  We also have 
>> something called copyleft complaince, is this similar or somehow 
>> different?
>
> They are a little similar but mostly are different, #1655 (Xiaofeng's) 
> will need to export the source packages (such as *.tar, *.rpm ...) for 
> using, Mark also commented the details at:
>
> http://bugzilla.pokylinux.org/show_bug.cgi?id=1655
>
> But the #1590 (mine) only archive the patched sources/build_scripts up 
> for later checking.

And I think both the 'archive.bbclass' and 'copyleft_complaince.bbclass' 
were designed for some license related issues, but the 'archive.bbclass' 
will create snapshot for all sources and 'copyleft_complaince.bbclass' 
will do dynamic checking for the licenses.

Thanks
Wenzong
>
> Thanks
> Wenzong
>
>>
>> We also have src_distribute.bbclass and sourcepkg.bbclass, seems like 
>> we have a more ways to package up source code than we know what to do 
>> with.
>>
>> Mark, we might want to sync up on this and figure out what we really 
>> have and what's really needed here.
>>
>> Thanks
>>     Sau!
>>
>>
>>
>>
>>> The following changes since commit 
>>> 4a8a3c503fd896593b787c26edbe46a7324e494e:
>>>    Richard Purdie (1):
>>>          Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works"
>>>
>>> are available in the git repository at:
>>>
>>>    git://git.pokylinux.org/poky-contrib wenzong/1590
>>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/1590
>>>
>>> Wenzong Fan (1):
>>>    archive.bbclass: archive work directory
>>>
>>>   meta/classes/archive.bbclass |   49 
>>> ++++++++++++++++++++++++++++++++++++++++++
>>>   1 files changed, 49 insertions(+), 0 deletions(-)
>>>   create mode 100644 meta/classes/archive.bbclass
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



