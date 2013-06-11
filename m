Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9836A9A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:41:50 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id v1so2805808lbd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:cc
	:content-type; bh=VYzg1LDTHYZMcO0+8nLuOM0BaMnhuNHNZ89Tyk8iE5c=;
	b=YoHbbWMAdA5dtjJOBi1fmSW/hldwdHHyr5r6EBtGtSJuzv02XLcx000PSj1ck1StJd
	5T+28Ys5rD0F9T9MKIklwdy9WTFSB8PW4+thaTtWiSdyKmc0N6AMJbwyLKZgabWprYMk
	ab+hiaRDzAUGQKJBHZtWGxSNbRp295Oyggk3yZ0BboEiZY0OY4EN+QM/Z8VRtaGUEOyr
	KyrbaMvIAHk5zZ92/H9GPuuyq8bOM2ehwzOAIO4Jezv0NonfBgiiIj+yoJ04yjSArFQI
	87gmRLXXFgULNwxNYbmPGgzICLQSdatR92Pzb2MUpV0O+nIoRl9HzSJw3zYSX5qBZAdC
	cMvg==
MIME-Version: 1.0
X-Received: by 10.152.22.130 with SMTP id d2mr7206731laf.33.1370965311620;
	Tue, 11 Jun 2013 08:41:51 -0700 (PDT)
Received: by 10.112.204.163 with HTTP; Tue, 11 Jun 2013 08:41:51 -0700 (PDT)
In-Reply-To: <51B7329E.60101@linux.intel.com>
References: <1369524182-994-1-git-send-email-andrea.adami@gmail.com>
	<CAAQYJAudR_UYhKXmb3Qxowm8_b8mnC7nyeB3kA-4MUeQ4QiGdw@mail.gmail.com>
	<CAAQYJAv9GTpL=MgYRsc-idhS+M8LzvwJN9A4x0KMjmJ+rmbE=w@mail.gmail.com>
	<CAAQYJAuWiym=7G_SY4QSO16+VBD4xRWAp5XroEKQd00dngaGCQ@mail.gmail.com>
	<51B7329E.60101@linux.intel.com>
Date: Tue, 11 Jun 2013 17:41:51 +0200
Message-ID: <CAAQYJAsqhGe6BhNPSivJnsDSQxz57qpkXcWXn44KXxSNgw+H6w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
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
X-List-Received-Date: Tue, 11 Jun 2013 15:41:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 11, 2013 at 4:22 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 06/11/2013 07:14 AM, Andrea Adami wrote:
>>
>> ping
>>
>> Maybe you want cramfs in recipes-devtools and not in recipes-support?
>> Feedback, please
>>
> Apologies, we will not accept this recipe being moved into oe-core, there is
> not a strong case to move it to oe-core, cramfs is a image
> type that is not heavily used, and the recipe is available in meta-oe.
>
Saul,

See... the 'not heavily used'  is always relative: there are still
many devices out in the wild with cramfs 'firmwares'.

You're missing my first point: I/we aim to have as less layer
interdependency as possible (oe-core + BSP) so having to add meta-oe
is just an unneeded burden for most cases.
Oh, and it would be one recipe less in that meta-oe pot.

Thx for your review

Cheers
Andrea

> Sau!
>
>> Andrea
>>
>> On Tue, Jun 4, 2013 at 1:51 PM, Andrea Adami <andrea.adami@gmail.com>
>> wrote:
>>>
>>> Note there would be also the possibility to use the mkfs.cramfs
>>> provided by util-linux implementing changes in image_types.bbclass and
>>> util-linux itself.
>>>
>>> Seems a bit overkill to me but still an option...
>>>
>>> Andrea
>>>
>>> On Tue, Jun 4, 2013 at 1:39 PM, Andrea Adami <andrea.adami@gmail.com>
>>> wrote:
>>>>
>>>> ping
>>>>
>>>> Recipe is rather stable (tarball of v.1.1 dated 2002) and cramfs can
>>>> be handy for read-only images on legacy devices.
>>>>
>>>> All the needed infrastructure is already present in
>>>> image_types.bbclass so I'd say this recipe has been mistakenly
>>>> forgotten when splitting out oe-core
>>>>
>>>>
>>>> Andrea
>>>>
>>>> On Sun, May 26, 2013 at 1:23 AM, Andrea Adami <andrea.adami@gmail.com>
>>>> wrote:
>>>>>
>>>>> * though listed in IMAGE_FSTYPES the helper is missing so
>>>>> * make oe-core autosufficient importing the recipe.
>>>>> * Fix PN -> BPN to avoid fetch errors with cramfs-native
>>>>>
>>>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>>>> ---
>>>>>   meta/recipes-support/cramfs/cramfs_1.1.bb | 29
>>>>> +++++++++++++++++++++++++++++
>>>>>   1 file changed, 29 insertions(+)
>>>>>   create mode 100644 meta/recipes-support/cramfs/cramfs_1.1.bb
>>>>>
>>>>> diff --git a/meta/recipes-support/cramfs/cramfs_1.1.bb
>>>>> b/meta/recipes-support/cramfs/cramfs_1.1.bb
>>>>> new file mode 100644
>>>>> index 0000000..0bca0e1
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-support/cramfs/cramfs_1.1.bb
>>>>> @@ -0,0 +1,29 @@
>>>>> +DESCRIPTION = "Builds cramfs filesystems for embedded systems"
>>>>> +LICENSE = "GPLv2"
>>>>> +LIC_FILES_CHKSUM =
>>>>> "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>>>>> +DEPENDS = "zlib"
>>>>> +
>>>>> +PE = "1"
>>>>> +
>>>>> +SRC_URI =
>>>>> "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${BPN}-${PV}.tar.gz"
>>>>> +
>>>>> +SRC_URI[md5sum] = "d3912b9f7bf745fbfea68f6a9b9de30f"
>>>>> +SRC_URI[sha256sum] =
>>>>> "133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2eb86baee997d22368"
>>>>> +
>>>>> +EXTRA_OEMAKE = "\
>>>>> +    'CC=${CC}' \
>>>>> +    'CFLAGS=${CFLAGS}' \
>>>>> +    'LDFLAGS=${LDFLAGS}' \
>>>>> +"
>>>>> +
>>>>> +do_compile_prepend() {
>>>>> +    ln -sf GNUmakefile Makefile
>>>>> +}
>>>>> +
>>>>> +do_install() {
>>>>> +    install -d ${D}${bindir}
>>>>> +    install mkcramfs ${D}${bindir}
>>>>> +    install cramfsck ${D}${bindir}
>>>>> +}
>>>>> +
>>>>> +BBCLASSEXTEND = "native"
>>>>> --
>>>>> 1.8.1.5
>>>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

