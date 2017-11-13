Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4904E786A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 19:23:42 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id y206so10767041oiy.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 11:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=yz/YjzWaBoExdX9J6HN1BFx0m/1czovQt4B9KHqq/2Q=;
	b=coYAagvhbafRShzCuNCiZYxg8vGURWT8CKROShUajLFDfbKXhPC2Z2WcFklTpNBOOB
	PLSZLP7gokUViwoM+BTmRL95XXp18+nKQSxtEIDiCm2yiFIrGWZoN42pTdXj6KjQ8OJR
	iKBA1TuU6PhFpzerLnR26mU2rCRQRWQSMFan7BM1gcemgFtNXDeYMrSPv+x4u4GedPqM
	EShsEcBJYw2pFIPJyIerBHDX570FPvhK6nDKOKhejpaooWSC78FjEzotlm31gsHLwckz
	rT1vP367xVRMe9KwLirNFQmIrEwOKs3G7+8xAVJeQCJHd29d615Xl0sI13wvMPqIvKwS
	nwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=yz/YjzWaBoExdX9J6HN1BFx0m/1czovQt4B9KHqq/2Q=;
	b=pF9zcLHfPF+g79TVIX/vJtM7pCS6J61QH6cpmkLbKaVK78CUKyYp5tFCnp12SW1bVi
	5+xHEQG3SDWJ6MaPcQHA0NEnXbkZrrfmkrJegg9z4NEvdMlTZgnswdq2Krd9JbNgNieI
	nuSRUPuY5bAUcl4N+uGWt2scpruSl0QKVB0ZBzBcbt7gFFjWQNxzxAiyprhWw2O3GT+5
	FVGKwplRyw3vgY7LU3pjABPd8WmgPGf5G24uuEKgywYD7WHj7BuJfOL496gfyfNqxZuT
	9ss8Hu9Hjy2Ozxy1kTB5NbVQ5bqIYeR2mZISM6dKTmWCBJNSKRkurIGcQ5RBOJitDYn9
	qllA==
X-Gm-Message-State: AJaThX4pXfTG+uqMTu5as7XlfRiEZ8HtS99/owQb2eYUQKYRTSSF+cHn
	PqEL3zXQCd9ZjPL5urCIlJKqWlim
X-Google-Smtp-Source: AGs4zMYIGI2gGC+BmRPP/u7naYdkebXnGFs37V+s1LWX5RbtPqNRLubm7QWGPFxypXK/cF0In47MJQ==
X-Received: by 10.202.244.212 with SMTP id s203mr3695609oih.145.1510601024034; 
	Mon, 13 Nov 2017 11:23:44 -0800 (PST)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
	[209.85.218.46]) by smtp.gmail.com with ESMTPSA id
	h143sm716281oic.44.2017.11.13.11.23.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 11:23:42 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f46.google.com with SMTP id a81so1914625oii.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 11:23:42 -0800 (PST)
X-Received: by 10.202.244.10 with SMTP id s10mr5832014oih.352.1510601022095;
	Mon, 13 Nov 2017 11:23:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Mon, 13 Nov 2017 11:23:41 -0800 (PST)
In-Reply-To: <610ad2b1-c05b-12ce-08d0-35adfd9ba123@ni.com>
References: <1500479806.27323.202.camel@intel.com>
	<20171107184039.31164-1-haris.okanovic@ni.com>
	<1510179606.1903.92.camel@intel.com>
	<f65277d0-e056-5181-9cc9-1e78e4e97c6b@ni.com>
	<1510351234.1903.159.camel@intel.com>
	<610ad2b1-c05b-12ce-08d0-35adfd9ba123@ni.com>
Date: Mon, 13 Nov 2017 17:23:41 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrOFhxG0=6UkQ2s4xLDfCeoaVuzhwi0MPJut8ENhhMAmw@mail.gmail.com>
Message-ID: <CAP9ODKrOFhxG0=6UkQ2s4xLDfCeoaVuzhwi0MPJut8ENhhMAmw@mail.gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: "Ashfield, Bruce \(Wind River\)" <bruce.ashfield@windriver.com>, "Orling,
	Timothy T" <timothy.t.orling@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"josh.hernstrom@ni.com" <josh.hernstrom@ni.com>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH v9] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Mon, 13 Nov 2017 19:23:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 13, 2017 at 5:16 PM, Haris Okanovic <haris.okanovic@ni.com> wrote:
> On 11/10/2017 04:00 PM, Wold, Saul wrote:
>>
>> On Fri, 2017-11-10 at 15:51 -0600, Haris Okanovic wrote:
>>>
>>> No problem! Thanks for all the good feedback. I think we shook out
>>> most
>>> of the gremlins in the last few months.
>>>
>> Thanks again for your patience !
>>
>>> Let me know if you need help with boot loader integration.
>>>
>> Funny you should mention that, there is another bug recently opened
>> about supporting multiple kernels for at least grub* and systemd-boot.
>>
>> I have some ideas about using the existing bbclasses and extending the
>> LABELS variable automagically.  We also have some plans for make the
>> bootfs be created in a more generic install fashion, rather then the
>> additional do_deploy() function, this is an early WIP.
>>
>> If you have any ideas or work already, we would be happy to use it.
>>
>
> Unfortunately, we don't have any good selection mechanism just yet. Our main
> use case is to aid in debugging driver issues, mostly aimed at kernel
> developers. We provide an image + modules in our feed that's compiled with
> debug options, and require the user to select a preferred boot kernel via
> symlink on the file system.
>
> I envisioned using update-alternatives in the future to facilitate
> selection. The call from postinst would give preference to OE's preferred
> provider while a call from users could override that, if desired.
>
> I'm not familiar with the <bootloader>.bbclass-es and the LABELS variable.
> We use a static boot loader config on our systems. How would this work if a
> kernel is installed from feed -- I.e. after image build? Is there a
> mechanism to rebuild the boot loader config dynamically?

I belive this needs to be done on target, as a post-installation hook.

Debian and other generic distributions handle this using this
strategy. Also it is tied to the bootloader. So we'll need two
versions (grub and u-boot/syslinux).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

