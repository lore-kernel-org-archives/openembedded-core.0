Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id D9C2C6071F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 14:30:57 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id b186so229954vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2016 07:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=S3mv2LWvVV09XZ94zH51/GEKFtlqQ9yjxQAXqIo763s=;
	b=OpnasYhPjUmQmQK+eF9YzKVBwQWjCC6oG50lF4HGWdI+iKITRVW3KsdpxJsL72V2f/
	y3ar0UtbTJp2+Ze/tui6mdOIlVztXEzpX+c2qpXzAanm9gWtEkp9jKg52o7AszAJ6kUe
	vDjSV337JgIixtDxvmTwxpQ0KuO/mukOyk3I5P8F9EiLKyEg1g3zFfv3v+7xnfgnx9W9
	Bnodz7NLCZzZCUisfqrmH0/qbtaQxDRXqfv+2GdJxBT/Mnnx5zNcaWT+M+2x194qYlja
	4XYYW+taE+ZcSPVDheA2f8Akad3ngWOZB95RcTgZSKrOQFKdpwQwtMEAY/9kU5lHsuWB
	YrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=S3mv2LWvVV09XZ94zH51/GEKFtlqQ9yjxQAXqIo763s=;
	b=a2/bJDcOvOekXGS5tVBZ270+8+YKHzEin391E4vC34J4OYvPL+Bw6zMGiYG8s/ti+F
	VXyxr7adNYx7dX8zPz1MfwjQs7Xkkspx+M4XgIK+hgGlf5xSx2694r7TPiN7TcsSHFkB
	t2gabV44SvpZ21ZZe2wDPdvYw9wuyFOCB2sd7FupySB8gbjLS2LD0XZWln76UKdhby+b
	aChR5mlv1O4PkC/IvxFHFKLntVpbash22PUgvPBgRbdkh3qmzygXKsR/BHgJINsEC75L
	W8DLQa5MT2/JX3oR4T2v0aU6FsMtxHmUAWZ9VUuniU7J2OOCwLFG1I8UeTF/ksEx5KdK
	+ZPg==
X-Gm-Message-State: AA6/9Rl6F2fIXbaQ5T5z2sTbb+iLZxqcTfCQCQS9fn2nWBwfReGkjSvofhcTsNUiUrTDLh9UuCnlM5/MSvuKDA==
X-Received: by 10.31.74.4 with SMTP id x4mr9176724vka.58.1475418658668; Sun,
	02 Oct 2016 07:30:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.140.8 with HTTP; Sun, 2 Oct 2016 07:30:58 -0700 (PDT)
In-Reply-To: <a1d1262b-1ecf-933a-f3b6-01234c95c31e@smile.fr>
References: <CABcZAN=WpicbLyg-sc=GDiMS81iwsGe1m+NE-fUfw2tniWpWXA@mail.gmail.com>
	<1475247756-32008-1-git-send-email-ed.bartosh@linux.intel.com>
	<a1d1262b-1ecf-933a-f3b6-01234c95c31e@smile.fr>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sun, 2 Oct 2016 16:30:58 +0200
Message-ID: <CAFkk2KR5AB_gjq5XKFBJjOaaRHJ3DzJdCqS5H1Kq=m35xZ3jTQ@mail.gmail.com>
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] scripts: add new script 'native'
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
X-List-Received-Date: Sun, 02 Oct 2016 14:30:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 2, 2016 at 4:15 PM, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.=
fr> wrote:
> "native" might be a bit too generic...
>
> could I suggest oe_native-run or bitbake-native ?
>
> something that says it's yocto-galaxy specific and can be autocompleted w=
ith
> a reasonable prefix...
>
>
> J=C3=A9r=C3=A9my Rosen

I think overly namespacing things that aren't likely to clash in
practice gets annoying. I would've gone for "run-native" (more
descriptive and English-like, less generic), but how about something
simple and easy to type like "oe-native" or "oe-run-native" if a
prefix is added? That's consistent with the naming scheme used for
many other scripts in scripts/ too.

Cheers,
Ulf

>
>
>
> On 30/09/2016 17:02, Ed Bartosh wrote:
>>
>> Added 'native' convenience shell script to run native tools.
>> Example of usage:
>>    > bitbake bmap-tools-native
>>    > native bmaptool --version
>>
>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>> ---
>>   scripts/native | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>   create mode 100755 scripts/native
>>
>> diff --git a/scripts/native b/scripts/native
>> new file mode 100755
>> index 0000000..496e34f
>> --- /dev/null
>> +++ b/scripts/native
>> @@ -0,0 +1,48 @@
>> +#!/bin/sh
>> +#
>> +# Copyright (c) 2016,  Intel Corporation.
>> +# All Rights Reserved
>> +#
>> +# This program is free software;  you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> +# the GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program;  if not, see <http://www.gnu.org/licenses/>
>> +#
>> +
>> +#
>> +# This script is for running tools from native oe sysroot
>> +#
>> +
>> +if [ $# -lt 1 -o "$1" =3D '--help' -o "$1" =3D '-h' ] ; then
>> +    echo "Usage: $0 <native tool> [parameters]"
>> +    exit 1
>> +fi
>> +
>> +SYSROOT_SETUP_SCRIPT=3D`which oe-find-native-sysroot 2> /dev/null`
>> +if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
>> +        echo "Error: Unable to find oe-find-native-sysroot script"
>> +        exit 1
>> +fi
>> +. $SYSROOT_SETUP_SCRIPT
>> +
>> +OLDPATH=3D$PATH
>> +
>> +# look for a tool only in native sysroot
>>
>> +PATH=3D$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECOR=
E_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin
>> +tool=3D`/usr/bin/which $1 2>/dev/null`
>> +
>> +if [ -n "$tool" ] ; then
>> +    # add old path to allow usage of host tools
>> +    PATH=3D$PATH:$OLD_PATH $@
>> +else
>> +    echo "Error: Unable to find '$1' in native sysroot"
>> +    exit 1
>> +fi
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

