Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5352F6A9C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 16:26:20 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id 13so4394986lba.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 09:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Sv6qgWItioRO5xJNd0nF+lJbAZ9OmKDM0RyhbpTFEG0=;
	b=IjFTUiyv6LIOM7lP26qaQ6F7LAfhH5LF1O0keT22JlL3Jk+tw94c6c+IlSY3shPqaF
	jHhc+WLzPgaO+vRsq5vjfAm5FoLOsFX0JC2NP/AmeAFSmBScQBEm7PrnI9whgVq9zySr
	raa9GL3qQoBz3arhYRMr9OGz9ekahG2/e2Hl33pNuBCI7+vLNQ0rS2qhI11/ah9I20Qm
	rsL6o7+V5FamEDjr18RbcALQBR6LCUCw0LpAigV9STeb0n76k/ke3mYM6PB7FuQMQDJP
	KLZwzOKxvoSmcCSHxfGcQ/0hh/cteByiK1HehwzdffxZBebr6VXp62VJYNUPowV0+rc2
	h7Cg==
MIME-Version: 1.0
X-Received: by 10.152.21.194 with SMTP id x2mr3530102lae.9.1370967980312; Tue,
	11 Jun 2013 09:26:20 -0700 (PDT)
Received: by 10.112.71.14 with HTTP; Tue, 11 Jun 2013 09:26:20 -0700 (PDT)
In-Reply-To: <CAAQYJAsqhGe6BhNPSivJnsDSQxz57qpkXcWXn44KXxSNgw+H6w@mail.gmail.com>
References: <1369524182-994-1-git-send-email-andrea.adami@gmail.com>
	<CAAQYJAudR_UYhKXmb3Qxowm8_b8mnC7nyeB3kA-4MUeQ4QiGdw@mail.gmail.com>
	<CAAQYJAv9GTpL=MgYRsc-idhS+M8LzvwJN9A4x0KMjmJ+rmbE=w@mail.gmail.com>
	<CAAQYJAuWiym=7G_SY4QSO16+VBD4xRWAp5XroEKQd00dngaGCQ@mail.gmail.com>
	<51B7329E.60101@linux.intel.com>
	<CAAQYJAsqhGe6BhNPSivJnsDSQxz57qpkXcWXn44KXxSNgw+H6w@mail.gmail.com>
Date: Tue, 11 Jun 2013 12:26:20 -0400
Message-ID: <CADkTA4M46_uu0Uh249ksBbfK8E_XRywLYuJUt8oNX3ffK1vrrg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
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
X-List-Received-Date: Tue, 11 Jun 2013 16:26:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 11, 2013 at 11:41 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Tue, Jun 11, 2013 at 4:22 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 06/11/2013 07:14 AM, Andrea Adami wrote:
>>>
>>> ping
>>>
>>> Maybe you want cramfs in recipes-devtools and not in recipes-support?
>>> Feedback, please
>>>
>> Apologies, we will not accept this recipe being moved into oe-core, there is
>> not a strong case to move it to oe-core, cramfs is a image
>> type that is not heavily used, and the recipe is available in meta-oe.
>>
> Saul,
>
> See... the 'not heavily used'  is always relative: there are still
> many devices out in the wild with cramfs 'firmwares'.
>
> You're missing my first point: I/we aim to have as less layer
> interdependency as possible (oe-core + BSP) so having to add meta-oe
> is just an unneeded burden for most cases.

I have a similar use case with BSPs and deployment methods. I missed
the start of the thread, but thought the idea of moving this into oe-core
along side the other image types was a good idea. I personally don't see
a big issue or burden with moving it into the base since to me, that's where
image types and formats belong.

Cheers,

Bruce

> Oh, and it would be one recipe less in that meta-oe pot.
>
> Thx for your review
>
> Cheers
> Andrea
>
>> Sau!
>>
>>> Andrea
>>>
>>> On Tue, Jun 4, 2013 at 1:51 PM, Andrea Adami <andrea.adami@gmail.com>
>>> wrote:
>>>>
>>>> Note there would be also the possibility to use the mkfs.cramfs
>>>> provided by util-linux implementing changes in image_types.bbclass and
>>>> util-linux itself.
>>>>
>>>> Seems a bit overkill to me but still an option...
>>>>
>>>> Andrea
>>>>
>>>> On Tue, Jun 4, 2013 at 1:39 PM, Andrea Adami <andrea.adami@gmail.com>
>>>> wrote:
>>>>>
>>>>> ping
>>>>>
>>>>> Recipe is rather stable (tarball of v.1.1 dated 2002) and cramfs can
>>>>> be handy for read-only images on legacy devices.
>>>>>
>>>>> All the needed infrastructure is already present in
>>>>> image_types.bbclass so I'd say this recipe has been mistakenly
>>>>> forgotten when splitting out oe-core
>>>>>
>>>>>
>>>>> Andrea
>>>>>
>>>>> On Sun, May 26, 2013 at 1:23 AM, Andrea Adami <andrea.adami@gmail.com>
>>>>> wrote:
>>>>>>
>>>>>> * though listed in IMAGE_FSTYPES the helper is missing so
>>>>>> * make oe-core autosufficient importing the recipe.
>>>>>> * Fix PN -> BPN to avoid fetch errors with cramfs-native
>>>>>>
>>>>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>>>>> ---
>>>>>>   meta/recipes-support/cramfs/cramfs_1.1.bb | 29
>>>>>> +++++++++++++++++++++++++++++
>>>>>>   1 file changed, 29 insertions(+)
>>>>>>   create mode 100644 meta/recipes-support/cramfs/cramfs_1.1.bb
>>>>>>
>>>>>> diff --git a/meta/recipes-support/cramfs/cramfs_1.1.bb
>>>>>> b/meta/recipes-support/cramfs/cramfs_1.1.bb
>>>>>> new file mode 100644
>>>>>> index 0000000..0bca0e1
>>>>>> --- /dev/null
>>>>>> +++ b/meta/recipes-support/cramfs/cramfs_1.1.bb
>>>>>> @@ -0,0 +1,29 @@
>>>>>> +DESCRIPTION = "Builds cramfs filesystems for embedded systems"
>>>>>> +LICENSE = "GPLv2"
>>>>>> +LIC_FILES_CHKSUM =
>>>>>> "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>>>>>> +DEPENDS = "zlib"
>>>>>> +
>>>>>> +PE = "1"
>>>>>> +
>>>>>> +SRC_URI =
>>>>>> "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${BPN}-${PV}.tar.gz"
>>>>>> +
>>>>>> +SRC_URI[md5sum] = "d3912b9f7bf745fbfea68f6a9b9de30f"
>>>>>> +SRC_URI[sha256sum] =
>>>>>> "133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2eb86baee997d22368"
>>>>>> +
>>>>>> +EXTRA_OEMAKE = "\
>>>>>> +    'CC=${CC}' \
>>>>>> +    'CFLAGS=${CFLAGS}' \
>>>>>> +    'LDFLAGS=${LDFLAGS}' \
>>>>>> +"
>>>>>> +
>>>>>> +do_compile_prepend() {
>>>>>> +    ln -sf GNUmakefile Makefile
>>>>>> +}
>>>>>> +
>>>>>> +do_install() {
>>>>>> +    install -d ${D}${bindir}
>>>>>> +    install mkcramfs ${D}${bindir}
>>>>>> +    install cramfsck ${D}${bindir}
>>>>>> +}
>>>>>> +
>>>>>> +BBCLASSEXTEND = "native"
>>>>>> --
>>>>>> 1.8.1.5
>>>>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

