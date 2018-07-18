Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 02C7C6003C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 19:50:20 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id b22-v6so4319413lfa.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 12:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VwSU8S2+nyrSd9BaUOOwXYKIMW//S2E8EsA60PlgXEw=;
	b=VGWHISaUUy9deH+Cx/3Feq5e4l+ywJvXJBuMUkCw0Cs9ibPFBEyWoBz/VVDv/9Kyt2
	fD5vgOEEjT98cXOJQII1La46VAjWT1nqXZ4lsGY/g6gsetbZJPVaAnFnOh79ZCg+lDhs
	ExNdWWfh5Wlju/zFQENIoFpo3herKr39eOftV6T+pdpnv8sXiAAh+PdOPYlR1//I2OtK
	9xHPi8/muKnFALOPfZQsl1/I6bu9hxJAGrSNJgtB16dleP2V6c0BF6zmF9ny0Uo8Qj1q
	QIEf2RXgfF/wwJAt7e+NjrCp8zs3YJi6bqGLErzGr7sFe3pAI607LKBYq3fuTfCArPm+
	jofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VwSU8S2+nyrSd9BaUOOwXYKIMW//S2E8EsA60PlgXEw=;
	b=hnSWtduteXnG24yXx43wkpUE2bTAeBnMMCeSeBCoT4NN+amhd5mqak7Vh6sse9UNXz
	cC84JHb8m4sz7Nh0j0UjWpWuNUZc7FpsLIsXL6EuQwZ/Zfr4LN2qdNlwf9FqqMN5fQL2
	9zGyF7Vcilx3USV5NmatccriCXxysRHMLMV5+Bf0J/MrCox8ZSkPBBXN5hv859HKKuUD
	gAWz4e8rIGGe2b0voDfUDRDVeT21N2lby249ARIaks3q7cPPyUXtGKwe6cIOi5rO0xyN
	YZ4hwfIHdNBYxxQolsQekIhY2RCIPkKP15yS911/LW6PeoWsuTvx5CGPdrJ+CB237vVr
	yx2g==
X-Gm-Message-State: AOUpUlFqqswaQrhZlD4POnbGyoWUeUpINzFlfd/j4NWtzkaFBCN5F8Hk
	DtYF2AqJhW4n/zSvWf08TMR3z2O1qv73TcJrZeI=
X-Google-Smtp-Source: AAOMgpegEx1hIRmcOZDUD0/yYNDvhEX6N7a3WXOdhCEDY+shXTvSW30W/bg4sMQ4OUb+FVxzb1Whl7JLnh/z8Dl70eU=
X-Received: by 2002:a19:de4e:: with SMTP id
	v75-v6mr4605877lfg.14.1531943421370; 
	Wed, 18 Jul 2018 12:50:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9696:0:0:0:0:0 with HTTP; Wed, 18 Jul 2018 12:49:50
	-0700 (PDT)
In-Reply-To: <b562af34-25d1-67e5-0eb5-8de62a8b3e2e@windriver.com>
References: <20180716225009.3403-1-alistair.francis@wdc.com>
	<b562af34-25d1-67e5-0eb5-8de62a8b3e2e@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 18 Jul 2018 12:49:50 -0700
Message-ID: <CAKmqyKNTOhiWn7nZwHEgMiH01c-0wqJ6RN6TpEG6wCuCxS0KRQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Enable coredump if it is in PACKAGECONFIG
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
X-List-Received-Date: Wed, 18 Jul 2018 19:50:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 6:57 PM, ChenQi <Qi.Chen@windriver.com> wrote:
> Hi Alistair,
>
> I don't think this file needs to be modified. And you are uncommenting the
> default values. The behavior is expected to remain the same.
>
> Also, I just did a quick test with coredump enabled and things were working
> correctly.

You are right, it works for me now as well.

Is it still worth adding this with support for setting custom values?

Alistair

>
> Best Regards,
> Chen Qi
>
>
> On 07/17/2018 06:50 AM, Alistair Francis wrote:
>>
>> Previously if coredump was enabled in PACKAGECONFIG the user would still
>> need to modify the conf file to enable it. Now the config will be
>> enabled if coredump is enalbed in the PACKAGECONFIG.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   .../systemd/systemd/coredump.conf             | 21 +++++++++++++++++++
>>   meta/recipes-core/systemd/systemd_237.bb      |  5 +++++
>>   2 files changed, 26 insertions(+)
>>   create mode 100644 meta/recipes-core/systemd/systemd/coredump.conf
>>
>> diff --git a/meta/recipes-core/systemd/systemd/coredump.conf
>> b/meta/recipes-core/systemd/systemd/coredump.conf
>> new file mode 100644
>> index 0000000000..4cbc19cdc5
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/coredump.conf
>> @@ -0,0 +1,21 @@
>> +#  This file is part of systemd.
>> +#
>> +#  systemd is free software; you can redistribute it and/or modify it
>> +#  under the terms of the GNU Lesser General Public License as published
>> by
>> +#  the Free Software Foundation; either version 2.1 of the License, or
>> +#  (at your option) any later version.
>> +#
>> +# Entries in this file show the compile time defaults.
>> +# You can change settings by editing this file.
>> +# Defaults can be restored by simply deleting this file.
>> +#
>> +# See coredump.conf(5) for details.
>> +
>> +[Coredump]
>> +Storage=external
>> +Compress=yes
>> +ProcessSizeMax=2G
>> +ExternalSizeMax=2G
>> +#JournalSizeMax=767M
>> +#MaxUse=
>> +#KeepFree=
>> diff --git a/meta/recipes-core/systemd/systemd_237.bb
>> b/meta/recipes-core/systemd/systemd_237.bb
>> index 3efca33e73..db2848fd65 100644
>> --- a/meta/recipes-core/systemd/systemd_237.bb
>> +++ b/meta/recipes-core/systemd/systemd_237.bb
>> @@ -276,6 +276,11 @@ do_install() {
>>                         chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>>                 fi
>>         fi
>> +
>> +  # If coredump was enalbed, enable it in the config
>> +  if ${@bb.utils.contains('PACKAGECONFIG', 'coredump', 'true', 'false',
>> d)}; then
>> +    install -Dm 0755 ${FILE_DIRNAME}/${BPN}/coredump.conf
>> ${D}${sysconfdir}/systemd/
>> +  fi
>>   }
>>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

