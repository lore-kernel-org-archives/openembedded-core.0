Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD0F73CF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 18:38:47 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so105299602igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=5CALsKWPcPFif4hprogFNuffxc9CCmwt270Heu8Fvpo=;
	b=m5BFEv1YnonL6ONDxS/ObwGSSH7NMpZDzVURuRLoyz6OEn4M+EcRP89hNpnE4TSbBj
	qIUSqlC4FK4hvYW9j/GxQLMT3VuI4PRLBwmyNpPIBecvWbG0NV9UXzLQVr07t/Z7Hdto
	oIOQXpYbXmOtNGxm3UrQNVnRs0l//SRAgNMB5ptphdS49gLl5XSkKJTvGFmc6yMlUt42
	X7+JBNldMncQQO4dIgwYChYvuRKOidMGBlaf5H5g94WpjfQv3tNxQAR7d+c3LNH8rIg0
	NVsJkX2AjLSZng5qL+wTsM0iW9+IYUj8dKDI/Jpt1ESCOo9AhfzmmhOGOCSg9zUCcNCD
	4Yvg==
X-Gm-Message-State: ALoCoQk1xLOA3OKQilrV2RI8/khGXmlZbXMtpzPG8zkDvV7wFLlPz3XpoJu+6MxNsg2jnJCnUlIY
X-Received: by 10.50.110.105 with SMTP id hz9mr8804154igb.77.1442947127778;
	Tue, 22 Sep 2015 11:38:47 -0700 (PDT)
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com.
	[209.85.213.178])
	by smtp.gmail.com with ESMTPSA id d8sm1548430igl.13.2015.09.22.11.38.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 11:38:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcrk20 with SMTP id rk20so86559343igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:38:46 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.102.4 with SMTP id fk4mr19835687igb.46.1442947126089;
	Tue, 22 Sep 2015 11:38:46 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 22 Sep 2015 11:38:46 -0700 (PDT)
In-Reply-To: <56019A6B.3070206@mlbassoc.com>
References: <560173B5.1000408@mlbassoc.com>
	<CAP9ODKpcr+YgGsvnRrsxy9Z2xsN5+KP4KiP-UvYij5eyN+1V1g@mail.gmail.com>
	<56019A6B.3070206@mlbassoc.com>
Date: Tue, 22 Sep 2015 15:38:46 -0300
Message-ID: <CAP9ODKpQDhCL9QbACgMRzV=N_Z7476a1_OxkhV7z0O7PfVd_rQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error building gdk-pixbuf-native
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
X-List-Received-Date: Tue, 22 Sep 2015 18:38:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 22, 2015 at 3:14 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2015-09-22 12:05, Otavio Salvador wrote:
>>
>> On Tue, Sep 22, 2015 at 12:28 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>>>
>>> When building gdk-pixbuf-native, I got this error:
>>> | DEBUG: Staging files from
>>>
>>> /home/local/rpi2_2015-03-05/tmp/work/i686-linux/gdk-pixbuf-native/2.30.8-r0/sysroot-destdir/home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux
>>> to /home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux
>>> | DEBUG: Executing shell function pixbufcache_sstate_postinst
>>> | g_module_open() failed for
>>>
>>> /home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-svg.so:
>>> libharfbuzz.so.0: cannot open shared object file: No such file or
>>> directory
>>>
>>> It seems that [at least] gdk-pixbuf-native needs harfbuzz-native
>>> I looked at the recipe, but it's not 100% obvious to me how to
>>> add this, especially w.r.t. all of the PACKAGECONFIG options.
>>>
>>> Guidance?
>>
>>
>> I had similar failures[1] at O.S. Systems autobuilder and rebuilding
>> made it work.
>>
>> 1.
>> http://ci.ossystems.com.br/view/FSL%20Community%20BSP%20-%20master-next/job/fsl-community-bsp-master-next_wayland-imx28evk/827/console
>>
>> The builds are now succeeding but I did no change to fix it. This
>> seems like a race for me.
>>
>> I tried very hard to reproduce the issue locally at my laptop without
>> success. Do you can reliably reproduce it?
>>
>
> Yes, I had a full tree and this rebuild was kicked off by a meta-data
> update.  Once it happened, I tried this:
>   % bitbake harfbuzz-native gdk-pixbuf-native -c cleansstate
>   % bitbake gdk-pixbuf-native
> failed.  However the manual sequence
>   % bitbake harfbuzz-native
>   % bitbake gdk-pixbuf-native
> succeeded.

I still do not reproduce it :-(

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

