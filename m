Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9F6856A880
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 14:22:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jun 2013 07:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="351490729"
Received: from unknown (HELO [10.255.12.247]) ([10.255.12.247])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jun 2013 07:22:22 -0700
Message-ID: <51B7329E.60101@linux.intel.com>
Date: Tue, 11 Jun 2013 07:22:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Andrea Adami <andrea.adami@gmail.com>
References: <1369524182-994-1-git-send-email-andrea.adami@gmail.com>
	<CAAQYJAudR_UYhKXmb3Qxowm8_b8mnC7nyeB3kA-4MUeQ4QiGdw@mail.gmail.com>
	<CAAQYJAv9GTpL=MgYRsc-idhS+M8LzvwJN9A4x0KMjmJ+rmbE=w@mail.gmail.com>
	<CAAQYJAuWiym=7G_SY4QSO16+VBD4xRWAp5XroEKQd00dngaGCQ@mail.gmail.com>
In-Reply-To: <CAAQYJAuWiym=7G_SY4QSO16+VBD4xRWAp5XroEKQd00dngaGCQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cramfs: import recipe from meta-oe
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
X-List-Received-Date: Tue, 11 Jun 2013 14:22:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2013 07:14 AM, Andrea Adami wrote:
> ping
>
> Maybe you want cramfs in recipes-devtools and not in recipes-support?
> Feedback, please
>
Apologies, we will not accept this recipe being moved into oe-core, 
there is not a strong case to move it to oe-core, cramfs is a image
type that is not heavily used, and the recipe is available in meta-oe.

Sau!

> Andrea
>
> On Tue, Jun 4, 2013 at 1:51 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
>> Note there would be also the possibility to use the mkfs.cramfs
>> provided by util-linux implementing changes in image_types.bbclass and
>> util-linux itself.
>>
>> Seems a bit overkill to me but still an option...
>>
>> Andrea
>>
>> On Tue, Jun 4, 2013 at 1:39 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
>>> ping
>>>
>>> Recipe is rather stable (tarball of v.1.1 dated 2002) and cramfs can
>>> be handy for read-only images on legacy devices.
>>>
>>> All the needed infrastructure is already present in
>>> image_types.bbclass so I'd say this recipe has been mistakenly
>>> forgotten when splitting out oe-core
>>>
>>>
>>> Andrea
>>>
>>> On Sun, May 26, 2013 at 1:23 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
>>>> * though listed in IMAGE_FSTYPES the helper is missing so
>>>> * make oe-core autosufficient importing the recipe.
>>>> * Fix PN -> BPN to avoid fetch errors with cramfs-native
>>>>
>>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>>> ---
>>>>   meta/recipes-support/cramfs/cramfs_1.1.bb | 29 +++++++++++++++++++++++++++++
>>>>   1 file changed, 29 insertions(+)
>>>>   create mode 100644 meta/recipes-support/cramfs/cramfs_1.1.bb
>>>>
>>>> diff --git a/meta/recipes-support/cramfs/cramfs_1.1.bb b/meta/recipes-support/cramfs/cramfs_1.1.bb
>>>> new file mode 100644
>>>> index 0000000..0bca0e1
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/cramfs/cramfs_1.1.bb
>>>> @@ -0,0 +1,29 @@
>>>> +DESCRIPTION = "Builds cramfs filesystems for embedded systems"
>>>> +LICENSE = "GPLv2"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>>>> +DEPENDS = "zlib"
>>>> +
>>>> +PE = "1"
>>>> +
>>>> +SRC_URI = "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${BPN}-${PV}.tar.gz"
>>>> +
>>>> +SRC_URI[md5sum] = "d3912b9f7bf745fbfea68f6a9b9de30f"
>>>> +SRC_URI[sha256sum] = "133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2eb86baee997d22368"
>>>> +
>>>> +EXTRA_OEMAKE = "\
>>>> +    'CC=${CC}' \
>>>> +    'CFLAGS=${CFLAGS}' \
>>>> +    'LDFLAGS=${LDFLAGS}' \
>>>> +"
>>>> +
>>>> +do_compile_prepend() {
>>>> +    ln -sf GNUmakefile Makefile
>>>> +}
>>>> +
>>>> +do_install() {
>>>> +    install -d ${D}${bindir}
>>>> +    install mkcramfs ${D}${bindir}
>>>> +    install cramfsck ${D}${bindir}
>>>> +}
>>>> +
>>>> +BBCLASSEXTEND = "native"
>>>> --
>>>> 1.8.1.5
>>>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

