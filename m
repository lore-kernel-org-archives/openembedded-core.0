Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRsu1-0001OD-Gi
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 00:29:05 +0200
Received: by eekc1 with SMTP id c1so1726513eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 15:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9w5bugkiPO581PW4jdgnx0hIMYQF/gl3c3AMV42R6MY=;
	b=nQTDd/l0N2RyCAB+QUQ2Up6mpHCHEC/RMZ+IoTNVl4RsX0v3Xy1GWOZZV5LWSkSIGO
	4WYcW0OizjlxcmnziZn+na4+HctLgLyjYwxFWSt24WevS2MbD5bH7252UKCj33lXhu3k
	EIMdCn1m8EskxFLDb2UjqEHpcC3DoKKP+fdJTjYH7tp/ks8j37hjbk1UysmQqWO9c7/P
	h2LkmwqGPXeg+/RARAQCKH9MaFEwclcXHTokyjETIBZtDpDVp0+lbUyBl+mX5B5iUKRz
	SVjivveOLB8D1t+bGvhtYE0eiORxiG8c8hLZbWuYoA27EQyQtIkofG0QKsVDXC5bdvOU
	L7Sg==
Received: by 10.14.187.1 with SMTP id x1mr3756312eem.101.1336515553628; Tue,
	08 May 2012 15:19:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Tue, 8 May 2012 15:18:43 -0700 (PDT)
In-Reply-To: <CAMKF1srhrwcEks0rGssCXQdyEFa9wYX6zVp14qAKns7wLHeJVA@mail.gmail.com>
References: <cover.1336015963.git.raj.khem@gmail.com>
	<4FA998F8.8060306@linux.intel.com>
	<CAMKF1srhrwcEks0rGssCXQdyEFa9wYX6zVp14qAKns7wLHeJVA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 May 2012 15:18:43 -0700
Message-ID: <CAMKF1sr_KgMb+5fsrWhjvGh-BmKHyjMF4+25yBR0szeijLF9aQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Enable xserver-xorg for all qemumachines
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
X-List-Received-Date: Tue, 08 May 2012 22:29:05 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 8, 2012 at 3:09 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 8, 2012 at 3:06 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>> Khem,
>>
>> Not sure what I am doing differently, but I am not getting the xserver to
>> start on at least ppc and mips (two that I tried just now).
>>
>> Are you build a Yocto sato image or oe-core sato image?
>>
>> I get the following on a ppc:
>>
>> Fatal server error:
>> no screens found
>> xinit: giving up
>> xinit: unable to connect to X server: No such file or directory
>> xinit: server error
>>
>
> hmmm I have booted core-image-sato but I have bare OE-Core
> Do you have
>
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/qemu-xserver-xorg&id=8a60dabb7902b7be42d06cb735e96248e2e67dba
>
> is some layer on top changing it in some way ?

hmmm another think I have is this patch
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=955dee621361e01627ebfde152f25873070cf301

which deletes kdrive recipes. I did not propose it for inclusion yet
but I wonder if there is any mix and match happening when these
recipes are not deleted.
You can cherry-pick it and see if that helps.


