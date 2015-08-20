Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 155A8737F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 21:31:26 +0000 (UTC)
Received: by paom9 with SMTP id m9so2808078pao.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 14:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=eaZrHWpgbO7htg3hTqf+sPrXOvD2VN9zXUXvovEdqv4=;
	b=n0Wtbq7itUlNKsaMyGfwwDAqNhKtUxH6O7JFpZbv8qDBpog2620amLyTynnanvOmfH
	AgiXoLgsW4fWEUzsWh6qnQxu8N0f9+WVUTNJ3C/g55gc6auEBWQxk60brU2VN/ySfHSa
	U1KczQqsELq0muFk6LWNVqYy6+gCg9hX825mJ18A+FDK8nKvD7tE1DGegjra0DQaFkse
	qujxeYvHw1Bqyc8CdKE8tOffMJFMJZSR4Lac1Yrvr3+1nLh1jBc1QS0X/cs+uWyB2mJU
	ErH7oikUlRBu28Rr/CeFntj4r0MzstPYUmSTt2c2h1acHlZmAdEDLPxBPdcl+HY3yxsd
	GKSQ==
X-Received: by 10.66.141.74 with SMTP id rm10mr10340411pab.56.1440106286601;
	Thu, 20 Aug 2015 14:31:26 -0700 (PDT)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	fl6sm5408103pab.12.2015.08.20.14.31.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Aug 2015 14:31:25 -0700 (PDT)
Message-ID: <55D6472C.9040901@gmail.com>
Date: Thu, 20 Aug 2015 14:31:24 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1440098114.git.akuster808@gmail.com>
	<20150820193110.GA15465@jama>
In-Reply-To: <20150820193110.GA15465@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] Dizzy-next for 1.7.3
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
X-List-Received-Date: Thu, 20 Aug 2015 21:31:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/20/2015 12:31 PM, Martin Jansa wrote:
> On Thu, Aug 20, 2015 at 12:20:31PM -0700, Armin Kuster wrote:
>> Please consider these changes for inclusion to the 1.7.3 update.
>>
>> The following changes since commit e8da5133c2efd3bc4c5f41bb27207c053bc2360d:
>>
>>    runqueue: Add message to explain the problem if diffsigs multiple tasks don't exist (2015-08-20 12:11:24 -0700)
>
> Can you add:
> http://patchwork.openembedded.org/patch/97485/

This and its depend patch merged to akuster/dizzy-next

- armin
> ?
>
> It's already in master and fido.
>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>>    http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next
>>
>> Richard Purdie (2):
>>    fetch2: Extend mirroruri handlling
>>    sstate: Use SSTATE_DIR for FILESPATH
>>
>> Saul Wold (2):
>>    grub-efi: Use the backport patch from grub
>>    grub-efi: Add trailing \ missed in last patch
>>
>> Sona Sarmadi (3):
>>    bind9.9.5: CVE-2015-5477
>>    qemu: CVE-2014-7840
>>    qemu-vnc: CVE-2014-7815
>>
>>   bitbake/lib/bb/fetch2/__init__.py                  |  1 +
>>   meta/classes/sstate.bbclass                        |  4 +-
>>   meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
>>   .../bind/bind/bind9_9_5-CVE-2015-5477.patch        | 45 +++++++++++++++++
>>   meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
>>   .../recipes-devtools/qemu/qemu/CVE-2014-7840.patch | 57 ++++++++++++++++++++++
>>   .../qemu/qemu/vnc-CVE-2014-7815.patch              | 53 ++++++++++++++++++++
>>   meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  2 +
>>   8 files changed, 163 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
>>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch
>>   create mode 100644 meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.patch
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

