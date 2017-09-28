Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7532A6067D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 14:29:38 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id d8so2229759pgt.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=myHo11dPyzmcAoXqUxprLDYEiWRI69XCI3iGr5p7qDc=;
	b=NO6CAqttASZXcWDfEi8nFOXut+fGktD7App+hqbiGdbK5Fl8O/ZrnykgCv+suJO7Ah
	OjkbnuoAMNNbFAChuDRltnRJssyHfNOruI+363g7Svvx4UPvNAkTGT2HHWrtPq78U/sC
	zf+iD4QsWtyBF+iKYc1Nybmz2ZKFUPUH2yu/0QjlPMjpj23ZMfb3bBVgrvp0/dql9Z0k
	yD/gHa4Wt+3PNbJvGWcmUBuF8z+PNVHFOo6dKXMv0nkdgYR9RaDu4pgAzQ5oJSGQ5AnT
	VbFyD+ozMvAAdVhg5E9/oTZl96w9x0KGpo/J+6WIGg6SXxKxx6BedYqnO0TiuyCQEDit
	rWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=myHo11dPyzmcAoXqUxprLDYEiWRI69XCI3iGr5p7qDc=;
	b=Bn6hrK7mrwkAZj6j9U0FQCAjii/gmp1vcloJuJkw8OLu3r5qHSeTcuqyEKTwbe+CRl
	JvVY0A5MFBp8F+5fLfH9quOzzHHx4CGTUstWM/W65MZZQ/bbury9I+iPBy1fNgnpVNku
	9etV4Xr0wEfA4Tba/U6rrFwv94gmmuca5G3ArtyMQBKUJ9fBv7d+LOhBXZku1TyNLuOg
	uBRA+hmfijElQUJ4Vi809jtlb8KMXYxUIzEcu10JKWOZWATKSRd7XBSWyB5KWaeQTCEz
	Pt8PdoDwvUTWcm4eavDyWAAucat/nK3LFErD1Ar9gfXhkyAbVEP8jjB8bY4HVcgjLYfT
	UJGQ==
X-Gm-Message-State: AHPjjUj9AYMcvKFm1i88z7JfDaaF9nZM1U+uAMmZRrh6ZEJPmmkrw420
	rG7XSbRGh4V5o+5Xifa56z0=
X-Google-Smtp-Source: AOwi7QCdCkk6gXUhtzH8Mvl6/eHFUjpXfI1oBnOIL8ln9N9P4r9vjQvcubiC8ZjhZkl6QwG/uGkvcQ==
X-Received: by 10.99.119.140 with SMTP id s134mr4446436pgc.415.1506608979486; 
	Thu, 28 Sep 2017 07:29:39 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:f084:ad3:5bb0:9acb?
	([2601:202:4001:9ea0:f084:ad3:5bb0:9acb])
	by smtp.gmail.com with ESMTPSA id l74sm3800940pfi.9.2017.09.28.07.29.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Sep 2017 07:29:38 -0700 (PDT)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20170913193820.11923-1-nicolas.dechesne@linaro.org>
	<CAP71WjzHT4Y5S6CRD9LNvkDfpCzPDuFwFtaD0Bqr3HQVKA8MOg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <cb482b0f-b66a-b1d1-6089-3ef80f141895@gmail.com>
Date: Thu, 28 Sep 2017 07:29:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjzHT4Y5S6CRD9LNvkDfpCzPDuFwFtaD0Bqr3HQVKA8MOg@mail.gmail.com>
Subject: Re: [morty][PATCH] kernel.bbclass: fix KERNEL_IMAGETYPE(S) for Image.gz
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
X-List-Received-Date: Thu, 28 Sep 2017 14:29:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Nicolas,


On 09/27/2017 12:20 PM, Nicolas Dechesne wrote:
> On Wed, Sep 13, 2017 at 12:38 PM, Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
>> KERNEL_IMAGETYPES lists all the kernel images that we want to build. in
>> cb17b6c2a7 (kernel.bbclass: support kernel image type of vmlinux.gz), some logic
>> was added to support vmlinux.gz which is not a target built by kernel
>> makefiles (only vmlinux). It is clear that the goal of this logic is only to
>> support vmlinux.gz and not others compressed format (such as Image.gz) which are
>> valid target for kernel makefiles.
>>
>> For Image.gz we should rely on the kernel makefiles and not do the compression
>> in kernel class.
>>
>> This patch updates the logic used to filter out non supported kernel target from
>> KERNEL_IMAGETYPES, and make vmlinux.gz a 'special case', instead of *.gz. If
>> more special cases are needed in the future, we could add them in a similar way.
>>
>> This patch should be a no-op for anyone using vmlinux or vmlinux.gz, and on top
>> of that it is fixing the build for Image.gz which was not working until now.
>>
>> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit cfc0c897656fe67e81a6a5dcd936dff785529f41)
>> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>> ---
> I noticed that morty was updated very recently, and this patch wasn't
> merged. Is there any issue with this patch? We would really need this
> fix in morty.
Its in my akuster/morty-next. I am working in some kernel boot issues.
Once that gets working I will submit a pull request which will include
this change.

- armin
>
>
>>  meta/classes/kernel.bbclass | 18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index eefe574a60..f8318b83a1 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -28,7 +28,6 @@ KERNEL_VERSION_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION',
>>  KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>>
>>  python __anonymous () {
>> -    import re
>>
>>      # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
>>      type = d.getVar('KERNEL_IMAGETYPE', True) or ""
>> @@ -40,7 +39,10 @@ python __anonymous () {
>>          types = (alttype + ' ' + types).strip()
>>      d.setVar('KERNEL_IMAGETYPES', types)
>>
>> -    typeformake = re.sub(r'\.gz', '', types)
>> +    # some commonly used kernel images aren't generated by the kernel build system, such as vmlinux.gz
>> +    # typeformake lists only valid kernel make targets, and post processing can be done after the kernel
>> +    # is built (such as using gzip to compress vmlinux)
>> +    typeformake = types.replace('vmlinux.gz', 'vmlinux')
>>      d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
>>
>>      for type in types.split():
>> @@ -262,14 +264,12 @@ kernel_do_compile() {
>>         fi
>>         for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
>>                 oe_runmake ${typeformake} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
>> -               for type in ${KERNEL_IMAGETYPES} ; do
>> -                       if test "${typeformake}.gz" = "${type}"; then
>> -                               mkdir -p "${KERNEL_OUTPUT_DIR}"
>> -                               gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
>> -                               break;
>> -                       fi
>> -               done
>>         done
>> +       # vmlinux.gz is not built by kernel
>> +       if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
>> +               mkdir -p "${KERNEL_OUTPUT_DIR}"
>> +               gzip -9c < ${B}/vmlinux > "${KERNEL_OUTPUT_DIR}/vmlinux.gz"
>> +       fi
>>  }
>>
>>  do_compile_kernelmodules() {
>> --
>> 2.11.0
>>


