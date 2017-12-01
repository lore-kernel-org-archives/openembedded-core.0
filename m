Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 33F6F6093C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 19:45:48 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id a41so9364199wra.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 11:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KpAWE36ewOyQLmIREzYYIbGf1wX/ZI0uCFawdga40KE=;
	b=aW8xng/7YvdqKNAoIv9ZMhNBhg+ott7kDC3eaNoYzQaMMrRB+/fLYitUQZY9WPrVkb
	9eVQf7dhGvtK/aRYPvApjqtqMv3/cNwmuGlLymP2pdM0gQBn7fHuT16/4cmoG7IiYgbL
	1Ie1zmfnxSIwcThWSqm2n6kw4uyfl6Wa29oJYr83PGkVtJEa5e4P9zPyVnaDwZuakC4v
	bLvRs03Icao5GaRc+CLMYsxjk5PC+jSc0z8VF/Ui6eO6b+rSFqkGaLG36qyJm8Sd2uQR
	PwHUYdkFIKyBb4M8lyztY3aXPMUr32CTQ5RkihfNn07QfHKZ0Vv4/O10R3u3IM0ZCU3N
	ZvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KpAWE36ewOyQLmIREzYYIbGf1wX/ZI0uCFawdga40KE=;
	b=KsDn+ZvmUKNEBN4kScTOZlkofqJ/e1HIqWq20OHYEHAGPVgf8w0GiqUBUPTUNoS1f8
	XJ/WJvQAm87KFsCCH7Q2hQa4t90pbZneIGdZJgkcCWxk7JncWK3EA85LRtCYW/uEqW3B
	IEnghxzmIc2ZxXtQ8HBMlsN9xdRC5PUdShX5DeFtxeOSpweAdTqc8eimNTRWhQVWXXyT
	hMKt1c9jGNqHJckKRE/UqdrZo26tEyb4Ny7404nl15XJwVYRNC2GcIm1TuBwtddDslwl
	2toWoX8YrRnskDBSLDNkcvrfF0xm6Daest9RDrh+X3hnHGMlg+fe/eoBLPNraybSNG9V
	7gIw==
X-Gm-Message-State: AJaThX5aUhpDK7NFT7XuBw9ifofMifYHSPBvsbkdGrKji4Ptq5B3Hwyp
	kFgI0IpWBlbNwPqQ9/Iyj9uVt1KeK+QKTqCNf2w=
X-Google-Smtp-Source: AGs4zMbRwNVYRJRoTve3zM3xPh5irve6wi1H9sJRbL6haqQ2tODaY90cY9IeOMkPIgjjL2kem2k4WrgxbDHBB+X1osk=
X-Received: by 10.223.131.133 with SMTP id 5mr2673784wre.266.1512157549787;
	Fri, 01 Dec 2017 11:45:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Fri, 1 Dec 2017 11:45:48 -0800 (PST)
In-Reply-To: <CAJ86T=WSqJysxG6mBxbKnKpsp9TaFN=gfWGv0k7joF5LVU--XQ@mail.gmail.com>
References: <1509141048-32541-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=WSqJysxG6mBxbKnKpsp9TaFN=gfWGv0k7joF5LVU--XQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 1 Dec 2017 11:45:48 -0800
Message-ID: <CAJ86T=V85wNuQdpS1PjoTQORM8xzMPWo-0pNpBaiXkGpxr=wKg@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: set more conservative default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Fri, 01 Dec 2017 19:45:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 7, 2017 at 2:35 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Fri, Oct 27, 2017 at 2:50 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Setting IMAGE_FSTYPES_DEBUGFS to the same value as IMAGE_FSTYPES can
>> lead to creating a large number of DEBUGFS filesystem images, many of
>> which may not make much sense (or may not even be buildable).
>
> Ping.

Ping again. Any issues with this change?

>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/conf/bitbake.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 9696273..15feb57 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -757,7 +757,7 @@ require conf/sanity.conf
>>  DL_DIR ?= "${TOPDIR}/downloads"
>>  SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
>>  IMAGE_FSTYPES ?= "tar.gz"
>> -IMAGE_FSTYPES_DEBUGFS ?= "${IMAGE_FSTYPES}"
>> +IMAGE_FSTYPES_DEBUGFS ?= "tar.gz"
>>
>>  INITRAMFS_FSTYPES ?= "cpio.gz"
>>  # The maximum size in Kbytes for the generated initramfs image size.
>> --
>> 1.9.1
>>

