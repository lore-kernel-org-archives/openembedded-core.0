Return-Path: <nathan@nathanrossi.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 267E0601A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 03:27:37 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f4so900423qte.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 19:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PibvZcvYd3kV0eTmJYf266r+om1OOknrfjD947M3K7c=;
	b=cTzo9wmRSK8lrLKJFs1EZ8ReSNSlCgvTz/21mmYsXWeix31LHMzjz+jSOr09WM9Syf
	EtWfOy0UH/rMfEJ0hVfB7aTgjwP8LU/G8emSv+xxcdprQ7t9yFzcXIxPpaESR+kHzCbA
	uF1fOK62XECnynA5dgIYa8Ns5YgwP8HMQzhfqilr1sdZU9IWrEM0Z5iQQGLLK9ezImSY
	gF+aZz13IXHTIj1cCuqx6Hryn9lDB/K5CwTwncCswueg9k/Y2T9AzbPyCVxnN2GYQevN
	/FCnFpyClt+b/2kicqgr4SrBaryfsACMwgRTRy4vT4cWmbk7y2QS+d5swfrVTCfBP+2W
	cp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PibvZcvYd3kV0eTmJYf266r+om1OOknrfjD947M3K7c=;
	b=kYmpqvOtHeGDNeon5ytIF/85hQxeMhgIJFW468X6xUvVPqiX/hl2Cq9cNW8s+cwWgg
	yXVv4CKnGe54l0WS5Wgh41uWHPcVkB3g2wtWdVfSBwo93MvjzUlh6dogycQnaV5P+ERV
	weRait0EcI/KcqdCoUu2IRyb6GXapKr5up1loG0zCoU5AHB2oKigj44ddSjXmnQY8iTS
	HAo23kt9tRceyouw8LIIyv+u6NmAY1qHQFPzLqL8qQDvDUFvZCgOl/ZKjZe3rp0z6Tpl
	af7fh/xAQ3spR+aoq0hQlGac89muLSnDt0d2Cqcno3wJFpjRoevdWuTbaXHvbZwS0uBn
	bFwg==
X-Gm-Message-State: AIkVDXKs47En02sHXfhE6zzTALgnl9OWNfcjqua3GYLlELm1fRcjvNNrdsonkF0/usKwL07l9RhOGaxRjJujag==
X-Received: by 10.200.33.162 with SMTP id 31mr11651530qty.166.1484191657710;
	Wed, 11 Jan 2017 19:27:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.139.69 with HTTP; Wed, 11 Jan 2017 19:27:37 -0800 (PST)
In-Reply-To: <CA+aJhH3sEgMX2WSGkawn-eY08+-L8NMK8mV1OOfghCgfJ6mqKA@mail.gmail.com>
References: <20161021120728.22639-1-nathan@nathanrossi.com>
	<20161021120728.22639-2-nathan@nathanrossi.com>
	<CA+aJhH3sEgMX2WSGkawn-eY08+-L8NMK8mV1OOfghCgfJ6mqKA@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Thu, 12 Jan 2017 13:27:37 +1000
Message-ID: <CA+aJhH06ByFfBvqOTCfRoZHKpQHz1C9Jv7sCHOa59GDGAMY_Og@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage.bbclass: Allow unset load/entry addresses for ramdisks
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
X-List-Received-Date: Thu, 12 Jan 2017 03:27:38 -0000
Content-Type: text/plain; charset=UTF-8

On 23 November 2016 at 15:29, Nathan Rossi <nathan@nathanrossi.com> wrote:
> Just pinging these patches, to see if there were any issues or
> comments. I realize I sent them just before a release so it was very
> likely they would get lost in the noise.

Pinging these three patches again.

https://patchwork.openembedded.org/patch/133134/
https://patchwork.openembedded.org/patch/133135/ (another patch was
just sent by someone else which does the same change,
https://lists.yoctoproject.org/pipermail/yocto/2017-January/033840.html)

And I've updated the third one, sent a v2 so that it applies cleanly to master.

https://patchwork.openembedded.org/patch/135805/

Thanks,
Nathan

>
> Thanks,
> Nathan
>
> On 21 October 2016 at 22:07, Nathan Rossi <nathan@nathanrossi.com> wrote:
>> Allow the load and entry addresses to remain unset if the UBOOT_RD_*
>> variables are also unset for ramdisk entries in the image tree. This
>> allows for U-Boot to decide dynamically where to load the ramdisk.
>>
>> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
>> ---
>>  meta/classes/kernel-fitimage.bbclass | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
>> index 3bbf91f65a..5c9e76b9ac 100644
>> --- a/meta/classes/kernel-fitimage.bbclass
>> +++ b/meta/classes/kernel-fitimage.bbclass
>> @@ -178,6 +178,15 @@ EOF
>>  fitimage_emit_section_ramdisk() {
>>
>>         ramdisk_csum="sha1"
>> +       ramdisk_loadline=""
>> +       ramdisk_entryline=""
>> +
>> +       if [ -n "${UBOOT_RD_LOADADDRESS}" ]; then
>> +               ramdisk_loadline="load = <${UBOOT_RD_LOADADDRESS}>;"
>> +       fi
>> +       if [ -n "${UBOOT_RD_ENTRYPOINT}" ]; then
>> +               ramdisk_entryline="entry = <${UBOOT_RD_ENTRYPOINT}>;"
>> +       fi
>>
>>         cat << EOF >> ${1}
>>                  ramdisk@${2} {
>> @@ -187,8 +196,8 @@ fitimage_emit_section_ramdisk() {
>>                          arch = "${UBOOT_ARCH}";
>>                          os = "linux";
>>                          compression = "none";
>> -                        load = <${UBOOT_RD_LOADADDRESS}>;
>> -                        entry = <${UBOOT_RD_ENTRYPOINT}>;
>> +                        ${ramdisk_loadline}
>> +                        ${ramdisk_entryline}
>>                          hash@1 {
>>                                  algo = "${ramdisk_csum}";
>>                          };
>> --
>> 2.9.3

