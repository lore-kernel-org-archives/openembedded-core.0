Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB6A6E750
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 13:55:30 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so3667345ykb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 06:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=z9JIGb9dQbjSSRpucjWcxuh34dnvEUfZfGxq2OZH7kE=;
	b=vRMmPK/2P7gnRpbSEX7xpBtD1y2ghOu8OctLfJNgCNAr7lbZsyUQO2OuDzunpV4F+W
	gN+29Cd3Ce3xoqJwiGbdFrQjN8DTNYNcQli66MEtejShabbLC+Dphct6TOh13AFF4Icp
	FPPcqmxWg4gng6yXuV+43w8YCyjXekqRa7U4AqEACjUlxFCJ+ru4J2Xa5TYqGCrMldcf
	HtFQjJoRhQHvI+HadVjS8+fqHAdPJB59nNRXHZZgXBv07xes6RpIjj6J7bDIn4gdqRe2
	R4XjaEpmFqAOr8ON3x5TG1yH8GBWSEhr3bMfXJogpscJTpTaqOWvbxlXYuoK5pbXMSaM
	AT8g==
MIME-Version: 1.0
X-Received: by 10.236.110.77 with SMTP id t53mr11520366yhg.78.1396014930982;
	Fri, 28 Mar 2014 06:55:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 28 Mar 2014 06:55:30 -0700 (PDT)
In-Reply-To: <53357AFD.9080902@intel.com>
References: <1395868053-27393-1-git-send-email-otavio@ossystems.com.br>
	<533419E9.3080509@intel.com>
	<CAP9ODKrUyfcP1vzEgYupPM-rg2jeE1VgPsP++Nh=fDeBuTjc7A@mail.gmail.com>
	<533569B6.9090103@intel.com>
	<CAP9ODKqwkv4yvcKPqMeHSuwKQ3UUzZCWLK6==o46G6wsqDkc_A@mail.gmail.com>
	<53357916.3090108@intel.com>
	<CAP9ODKo6LmdrbUoXKjpwbVb4jcL5M4a4_tUAv1GdbwDSR-Cs6Q@mail.gmail.com>
	<53357AFD.9080902@intel.com>
Date: Fri, 28 Mar 2014 10:55:30 -0300
X-Google-Sender-Auth: KaOm3vqjUaOwlsTJFngTE3UeTEc
Message-ID: <CAP9ODKoJKqKQhaTf93UPmDvqojY1UbiGuzPZuGjKj9QurgYzuw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Valentin Popa <valentin.popa@intel.com>
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston : refactor to identify EGL, cairoglesv2 support
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
X-List-Received-Date: Fri, 28 Mar 2014 13:55:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 28, 2014 at 10:37 AM, Valentin Popa <valentin.popa@intel.com> wrote:
> On 03/28/2014 03:35 PM, Otavio Salvador wrote:
>>
>> On Fri, Mar 28, 2014 at 10:28 AM, Valentin Popa <valentin.popa@intel.com>
>> wrote:
>>>
>>> On 03/28/2014 02:53 PM, Otavio Salvador wrote:
>>>>
>>>> On Fri, Mar 28, 2014 at 9:23 AM, Valentin Popa <valentin.popa@intel.com>
>>>> wrote:
>>>>>
>>>>> On 03/27/2014 08:09 PM, Otavio Salvador wrote:
>>>>>>
>>>>>> On Thu, Mar 27, 2014 at 9:30 AM, Valentin Popa
>>>>>> <valentin.popa@intel.com>
>>>>>> wrote:
>>>>>>>
>>>>>>> On 03/26/2014 11:07 PM, Otavio Salvador wrote:
>>>>>>>>
>>>>>>>> From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>>>>>>>>
>>>>>>>> Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
>>>>>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>>>>>>> ---
>>>>>>>>      meta/recipes-graphics/wayland/weston_1.4.0.bb | 7 +++++--
>>>>>>>>      1 file changed, 5 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>>>>>>> b/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>>>>>>> index e0c354d..a41b5cd 100644
>>>>>>>> --- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>>>>>>> +++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
>>>>>>>> @@ -23,7 +23,6 @@ EXTRA_OECONF = "--enable-setuid-install \
>>>>>>>>                      --enable-simple-clients \
>>>>>>>>                      --enable-clients \
>>>>>>>>                      --enable-demo-clients-install \
>>>>>>>> -                --disable-simple-egl-clients \
>>>>>>>>                      --disable-libunwind \
>>>>>>>>                      --disable-rpi-compositor \
>>>>>>>>                      --disable-rdp-compositor"
>>>>>>>> @@ -39,7 +38,7 @@ PACKAGECONFIG ??=
>>>>>>>> "${@base_contains('DISTRO_FEATURES',
>>>>>>>> 'wayland', 'kms fbdev way
>>>>>>>>      # Weston on KMS
>>>>>>>>      PACKAGECONFIG[kms] =
>>>>>>>> "--enable-drm-compositor,--disable-drm-compositor,drm udev
>>>>>>>> virtual/mesa
>>>>>>>> mtdev"
>>>>>>>>      # Weston on Wayland (nested Weston)
>>>>>>>> -PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-egl
>>>>>>>> --disable-wayland-compositor,virtual/mesa"
>>>>>>>
>>>>>>>
>>>>>>> We need --disable-egl if wayland is not in DISTRO_FEATURES. See bug:
>>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5867
>>>>>>
>>>>>> As egl is not part of PACKAGECONFIG it will do the right thing, no?
>>>>>>
>>>>> Yes, it will. My concerns are about --enable-drm-compositor (kms)
>>>>> without
>>>>> egl; I know that the user can pass at runtime the --use-pixman flag,
>>>>> but
>>>>> I
>>>>> think it's more important to keep egl enabled by default in weston
>>>>> (this
>>>>> is
>>>>> probably the main "usecase" of wayland/weston). So if you enable egl,
>>>>> the
>>>>> bug will reproduce.
>>>>
>>>> The PACKAGECONFIG is for flexibility and so we are using it here as it
>>>> is designed. I understand we still don't have a way to map config
>>>> dependencies but this is no excuse to say the patch is wrong or
>>>> inappropriate.
>>>>
>>>> We are using this in the upcoming i.MX6 Wayland support we sent to
>>>> meta-fsl-arm and the only blocker is this patch be accepted.
>>>>
>>> The patch is not wrong, but disables egl. Looks good to me and if merged
>>> I'll submit a patch to add egl in PACKAGECONFIG.
>>
>> If you want, I can add the egl there, and send v2. That's easy.
>
> That would be great. And don't forget to --disable-egl in case wayland is
> not in PACKAGECONFIG.

This is the point I don't agree. I think user needs to drop egl when
dropping wayland.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

