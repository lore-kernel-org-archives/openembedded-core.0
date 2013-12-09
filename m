Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 486A26E20E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 13:52:54 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id el20so1569174lab.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 05:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9AcQrxYw6/SVDjFtjkp0lEy9pG7UqwLk/WAsa++gclQ=;
	b=z7VzI14X3e35zHPKybC7koMh5BthoA5mErcbHtr+WfZy/GHfeSiIB9l0VNJZ6HXU4g
	avh5/AaWmDB3JtXEHElk+TBsv13a72QJSo/jR+DG4Qbey/cl4+LNWOzwTtFfH30xPwJs
	jY2Ik8hQ3V/ECsS68eZpI1v5bSCayNEJsp/35zBm6PRFKj2MTgbXk+itwsjhF/k+mzUL
	6YW3YGU8SYv9aeiPSofoe+b9niaCvgisNiQKZ4AlcPh8zWbY4Q00iPEqqqMGHfiMTdoe
	unOww0qRGiG9A7KJwYw1VXOH3hctu+VFh276ujlBUfLYSn465HCW+rH3jSIa6lolp/a6
	DHBw==
MIME-Version: 1.0
X-Received: by 10.152.36.101 with SMTP id p5mr1965068laj.67.1386597172923;
	Mon, 09 Dec 2013 05:52:52 -0800 (PST)
Received: by 10.114.97.104 with HTTP; Mon, 9 Dec 2013 05:52:52 -0800 (PST)
In-Reply-To: <CAP9ODKpv76jtiMqmg3eCJ1TYzvrhBESQMfQF5rVeT2XgJHR0tw@mail.gmail.com>
References: <cover.1386558973.git.Qi.Chen@windriver.com>
	<c20f79f4a812a4e007413751e3cabf63a4f5e6ec.1386558973.git.Qi.Chen@windriver.com>
	<CAP9ODKpv76jtiMqmg3eCJ1TYzvrhBESQMfQF5rVeT2XgJHR0tw@mail.gmail.com>
Date: Mon, 9 Dec 2013 14:52:52 +0100
Message-ID: <CAAQYJAs9j=VJ+L=sLsLG1H1hs3brarksgqtijE8v2Wr35HCSQQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: default USE_DEVFS to '1'
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
X-List-Received-Date: Mon, 09 Dec 2013 13:52:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 9, 2013 at 12:52 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> I agree with the commit but ...
>
> On Mon, Dec 9, 2013 at 1:17 AM,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Default USE_DEVFS to "1" so that the `makedevs' command is not run
>> at rootfs time by default. There are mainly two reasons to do so.
>> 1. This will fix a build failure with initramfs-kexecboot-klibc-image.
>
> Can you elaborate this error? is it something we can/should fix?
>
>> 2. Most of our images use a filesystem over /dev. Most of the time, it's
>>    just devtmpfs. So we actually are using a filesystem over /dev.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  meta/classes/image.bbclass |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index cc65e35..b8bd462 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -77,7 +77,7 @@ PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
>>  # Images are generally built explicitly, do not need to be part of world.
>>  EXCLUDE_FROM_WORLD = "1"
>>
>> -USE_DEVFS ?= "0"
>> +USE_DEVFS ?= "1"
>>
>>  PID = "${@os.getpid()}"
>>
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


The underlying issue here is the extra pass of makedevs  " makedevs:
No entry for root in search list "

At first I could not understand why that was *not* happening on my
builds then I realized we set
IMAGE_DEVICE_TABLES = "" in our machine.conf because we use devtmpfs
for all images.

qemux86 does instead inherit the default setting of image.bbclass so
it uses "files/device_table-minimal.txt"


Cheers

Andrea

