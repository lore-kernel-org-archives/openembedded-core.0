Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SmtD8-000695-Mi
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 23:03:38 +0200
Received: from mail121-va3-R.bigfish.com (10.7.14.240) by
	VA3EHSOBE012.bigfish.com (10.7.40.62) with Microsoft SMTP Server id
	14.1.225.23; Thu, 5 Jul 2012 20:50:27 +0000
Received: from mail121-va3 (localhost [127.0.0.1])	by
	mail121-va3-R.bigfish.com (Postfix) with ESMTP id 9865F1C02CB;
	Thu,  5 Jul 2012 20:50:27 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zzbb2dI98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail121-va3 (localhost.localdomain [127.0.0.1]) by mail121-va3
	(MessageSwitch) id 1341521425339680_30012;
	Thu,  5 Jul 2012 20:50:25 +0000 (UTC)
Received: from VA3EHSMHS001.bigfish.com (unknown [10.7.14.242])	by
	mail121-va3.bigfish.com (Postfix) with ESMTP id 4FBBE38006F;
	Thu,  5 Jul 2012 20:50:25 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS001.bigfish.com
	(10.7.99.11) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 5 Jul 2012 20:50:21 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.163]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Thu, 5 Jul 2012 15:52:16 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Scott Garman
	<scott.a.garman@intel.com>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [oe-core] linux-dtb: add multi-dtb build support
Thread-Index: AQHNWtwtIn2bs/LK9UedJs65xGih+A==
Date: Thu, 5 Jul 2012 20:52:15 +0000
Message-ID: <CAEsOVNf0s+QBs_NYiquUTU8zew052PKx6uEwUEwPBBHzbnVLUA@mail.gmail.com>
References: <1340682796-11569-1-git-send-email-b19537@freescale.com>
	<4FEC908A.3000205@linux.intel.com>
	<CAEsOVNerdO8m=0LHYUy8sn+6W=aOiEQS18vOQy8DYqWQeDxA+Q@mail.gmail.com>
	<4FF5F219.8000103@intel.com>
In-Reply-To: <4FF5F219.8000103@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: linux-dtb: add multi-dtb build support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 05 Jul 2012 21:03:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <10E51ED4EB9E144C9B90E8B575171CA5@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 5, 2012 at 2:59 PM, Scott Garman <scott.a.garman@intel.com> wro=
te:
> On 07/05/2012 11:29 AM, McClintock Matthew-B29882 wrote:
>>
>> Can we add this to denzil branch? (post 1.2.1 is fine) - I realize
>> this is somewhat a new feature though but it would be helpful to have
>> it in denzil.
>
>
> Ok, I've now created a contrib branch to start tracking changes for 1.2.2=
,
> and have included this commit:
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dsgarman/de=
nzil-next-1.2.2
>
> The usual caveats apply - I can rebase this branch at any time, etc.

Are you missing a patch on this series? ChecksumError class does not exist.=
..

commit 2f009e5b?

-M

>
> Scott
>
>
>>
>> -M
>>
>> On Thu, Jun 28, 2012 at 12:12 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>> On 06/25/2012 08:53 PM, b19537@freescale.com wrote:
>>>>
>>>>
>>>> From: Zhenhua Luo<b19537@freescale.com>
>>>>
>>>>       including following enhancement:
>>>>       * support multi-dtb build
>>>>       * skip dtb build and install when KERNEL_DEVICETREE is empty
>>>>       * print a warning message when specified dts file is not availab=
le
>>>>
>>>> Signed-off-by: Zhenhua Luo<b19537@freescale.com>
>>>> ---
>>>>    meta/recipes-kernel/linux/linux-dtb.inc |   36
>>>> +++++++++++++++++++++++++------
>>>>    1 files changed, 29 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
>>>> b/meta/recipes-kernel/linux/linux-dtb.inc
>>>> index 9188cee..8aa1458 100644
>>>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>>>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>>>> @@ -15,13 +15,35 @@ python __anonymous () {
>>>>
>>>>    do_install_append() {
>>>>        if test -n "${KERNEL_DEVICETREE}"; then
>>>> -       dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree
>>>> ${KERNEL_DEVICETREE}
>>>> -       install -m 0644 devicetree
>>>> ${D}/boot/devicetree-${KERNEL_VERSION}
>>>> -       install -d ${DEPLOYDIR}
>>>> -       install -m 0644 devicetree
>>>> ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.dtb
>>>> -       cd ${DEPLOYDIR}
>>>> -       rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
>>>> -       ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb
>>>> ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
>>>> +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
>>>> +            if [ ! -f ${DTS_FILE} ]; then
>>>> +                echo "Warning: ${DTS_FILE} is not available!"
>>>> +                continue
>>>> +            fi
>>>> +            DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "." '{prin=
t
>>>> $1}'`
>>>> +            DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed
>>>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>>> +            DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | s=
ed
>>>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>>> +            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o
>>>> ${DTS_BASE_NAME} ${DTS_FILE}
>>>> +            install -m 0644 ${DTS_BASE_NAME}
>>>> ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
>>>> +        done
>>>>        fi
>>>>    }
>>>>
>>>> +do_deploy_append() {
>>>> +    if test -n "${KERNEL_DEVICETREE}"; then
>>>> +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
>>>> +            if [ ! -f ${DTS_FILE} ]; then
>>>> +                echo "Warning: ${DTS_FILE} is not available!"
>>>> +                continue
>>>> +            fi
>>>> +            DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "." '{prin=
t
>>>> $1}'`
>>>> +            DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed
>>>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>>> +            DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | s=
ed
>>>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>>> +            install -d ${DEPLOYDIR}
>>>> +            install -m 0644 ${B}/${DTS_BASE_NAME}
>>>> ${DEPLOYDIR}/${DTB_NAME}.dtb
>>>> +            cd ${DEPLOYDIR}
>>>> +            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
>>>> +            cd -
>>>> +        done
>>>> +    fi
>>>> +}
>>>
>>>
>>>
>>> Merged into OE-Core
>>>
>>> Thanks
>>>          Sau!
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> Scott Garman
> Embedded Linux Engineer - Yocto Project
> Intel Open Source Technology Center
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



