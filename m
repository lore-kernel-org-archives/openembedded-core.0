Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SmsNo-0004r0-TE
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 22:10:37 +0200
Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 05 Jul 2012 12:59:31 -0700
Received: by ghbz12 with SMTP id z12so7411882ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 12:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=LE+D6gqRcxMG3QFlQ/KaoZ+0dHB4uZUBHfeEL+qI9SY=;
	b=J7lt1Xtb21+QtMt2lpJW4a2YHoeS8Zhn/qSqjh+z4lhDPGRRUzmKjZGdMub610pA2q
	xKhKDdoD9oGSBwlEBPx5V0X/9U3xfY2rgcYnRzXKxY3Oqg+jftOV/vuw7WyCxBbrFGuI
	mE84qWH+1NSO6j/nnKB+sOP23M3xhi2YVOaMXBiDilzmuKMDE3MRgKs+3x0D9evcXktb
	jiaiofw6CzmA3bKXERZzbAgUpTXs0mAwIjd7Ac0QzcDdhjaEvlcqXlrFHOKgvE0Ym9E9
	fohZjqAe3vKuT6NGgll65tOJ42ImL1AVVTIz8bsuunExrpHf74mkb661HA41DC+MgsJq
	C6dw==
Received: by 10.66.75.225 with SMTP id f1mr38107069paw.35.1341518369964;
	Thu, 05 Jul 2012 12:59:29 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id
	op10sm20307501pbc.75.2012.07.05.12.59.27
	(version=SSLv3 cipher=OTHER); Thu, 05 Jul 2012 12:59:28 -0700 (PDT)
Message-ID: <4FF5F219.8000103@intel.com>
Date: Thu, 05 Jul 2012 12:59:21 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340682796-11569-1-git-send-email-b19537@freescale.com>
	<4FEC908A.3000205@linux.intel.com>
	<CAEsOVNerdO8m=0LHYUy8sn+6W=aOiEQS18vOQy8DYqWQeDxA+Q@mail.gmail.com>
In-Reply-To: <CAEsOVNerdO8m=0LHYUy8sn+6W=aOiEQS18vOQy8DYqWQeDxA+Q@mail.gmail.com>
X-Gm-Message-State: ALoCoQn5pGoen/GgRHoZiP+LnKbcpL9SQPSGRTxsPAIBesGZbpcHYAa9p0NDtnBdggTsXELDzIvE
Subject: Re: linux-dtb: add multi-dtb build support
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
X-List-Received-Date: Thu, 05 Jul 2012 20:10:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2012 11:29 AM, McClintock Matthew-B29882 wrote:
> Can we add this to denzil branch? (post 1.2.1 is fine) - I realize
> this is somewhat a new feature though but it would be helpful to have
> it in denzil.

Ok, I've now created a contrib branch to start tracking changes for 
1.2.2, and have included this commit:

http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next-1.2.2

The usual caveats apply - I can rebase this branch at any time, etc.

Scott

>
> -M
>
> On Thu, Jun 28, 2012 at 12:12 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 06/25/2012 08:53 PM, b19537@freescale.com wrote:
>>>
>>> From: Zhenhua Luo<b19537@freescale.com>
>>>
>>>       including following enhancement:
>>>       * support multi-dtb build
>>>       * skip dtb build and install when KERNEL_DEVICETREE is empty
>>>       * print a warning message when specified dts file is not available
>>>
>>> Signed-off-by: Zhenhua Luo<b19537@freescale.com>
>>> ---
>>>    meta/recipes-kernel/linux/linux-dtb.inc |   36
>>> +++++++++++++++++++++++++------
>>>    1 files changed, 29 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
>>> b/meta/recipes-kernel/linux/linux-dtb.inc
>>> index 9188cee..8aa1458 100644
>>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>>> @@ -15,13 +15,35 @@ python __anonymous () {
>>>
>>>    do_install_append() {
>>>        if test -n "${KERNEL_DEVICETREE}"; then
>>> -       dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree
>>> ${KERNEL_DEVICETREE}
>>> -       install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERSION}
>>> -       install -d ${DEPLOYDIR}
>>> -       install -m 0644 devicetree
>>> ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.dtb
>>> -       cd ${DEPLOYDIR}
>>> -       rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
>>> -       ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb
>>> ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
>>> +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
>>> +            if [ ! -f ${DTS_FILE} ]; then
>>> +                echo "Warning: ${DTS_FILE} is not available!"
>>> +                continue
>>> +            fi
>>> +            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print
>>> $1}'`
>>> +            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed
>>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>> +            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
>>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>> +            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o
>>> ${DTS_BASE_NAME} ${DTS_FILE}
>>> +            install -m 0644 ${DTS_BASE_NAME}
>>> ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
>>> +        done
>>>        fi
>>>    }
>>>
>>> +do_deploy_append() {
>>> +    if test -n "${KERNEL_DEVICETREE}"; then
>>> +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
>>> +            if [ ! -f ${DTS_FILE} ]; then
>>> +                echo "Warning: ${DTS_FILE} is not available!"
>>> +                continue
>>> +            fi
>>> +            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print
>>> $1}'`
>>> +            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed
>>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>> +            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
>>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>> +            install -d ${DEPLOYDIR}
>>> +            install -m 0644 ${B}/${DTS_BASE_NAME}
>>> ${DEPLOYDIR}/${DTB_NAME}.dtb
>>> +            cd ${DEPLOYDIR}
>>> +            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
>>> +            cd -
>>> +        done
>>> +    fi
>>> +}
>>
>>
>> Merged into OE-Core
>>
>> Thanks
>>          Sau!
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center




