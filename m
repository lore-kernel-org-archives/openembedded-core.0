Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 443876067D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 23:17:45 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id j85so29114961wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 16:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mLOFHDS3ief5qKd6an8uDLYNBRy2ngeu8UFiF5qBYY4=;
	b=l7Zy16oxG6A/9vda1htkiy2SAV/feZg7tuNW0arOZXMtOC3gq21nXfRGNPmTpg+0/M
	WD2uplrk8suyIn2bbdQHnQzW3WfFx5sUzDRr3nzUhVOB94eupj50WsDUPON/Dwn3B8jN
	azRMSjKbXytUcv2FFJYd0wihMV0EfTITXxD6QiUNT8wg2imlVRZrncXhpYm8/qBicDLK
	P4qlNVWsu9PSd8cP+w92rJonDRXM2WxMCftj6J72C0eidhwgcOCHTDhiMj48mW0yHd7w
	TUSTult57p3bPianF27Cd1TmJcq7dXTBYdzmMu9YmBoZGL7YPEy5oW3lNPAtjJp4LX0n
	xwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mLOFHDS3ief5qKd6an8uDLYNBRy2ngeu8UFiF5qBYY4=;
	b=EZPZVnZIxKJa/Gc+qA+R7pEEfL6rGrI/HNNNlo2AKb+l1JoOcWF3thXqETfCvtgrG2
	f63w2N+z9yEGIE1zO9/Fl+BOdHl0dkVGBiTZqS4YOs08hc/OrFfdSugF9ImBls51NUlT
	KXDVS9Q9pNBvgbjzUVWkiyx9vKwH07DlRklUSFQ2FrM7As2I1rUvBDwe3omaRqr9TfHk
	z9nXQvoAXobJ5/oVkHPhaAlVrCSd84+oWrMc4A9wsCUxdv3m0CnYPGFj5CMBFT//IB7I
	k63o6VICv3BAhmm+Aqn8n4uc0TeRpYUZmEuQ+YmmvDx1JKCyFQRir+UTwHPalPH54qcF
	LZHA==
X-Gm-Message-State: AKS2vOyBznVIaIpYjq6LQXlMQMepF5U7yTUeaXPs0PWqo3dZYcw0A1Hb
	KtB55tynXMiy0DA2ImbPpPDVnCFknQ==
X-Received: by 10.80.151.49 with SMTP id c46mr20506651edb.30.1499210266570;
	Tue, 04 Jul 2017 16:17:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Tue, 4 Jul 2017 16:17:16 -0700 (PDT)
In-Reply-To: <CAP9ODKrfKZqLkcb+c4Yk8CHtPMCrLQqgwiNN7ad4O__ZzuNgAg@mail.gmail.com>
References: <CAJTo0LZ85U2djZGW4rzK7uumBkutYb91yXY40irYyAVvCKOBRQ@mail.gmail.com>
	<20170704153229.6628-1-sledz@dresearch-fe.de>
	<CAP9ODKqtEV8B1MqKMhZbG0mY7DTfK7EVi-M39roTqp5dvPeS1g@mail.gmail.com>
	<CAJTo0LbK1brj7Xd_LeOZNf8ZkCHfRHXVujtKeAXGDxvJnT0cfw@mail.gmail.com>
	<CAP9ODKrfKZqLkcb+c4Yk8CHtPMCrLQqgwiNN7ad4O__ZzuNgAg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Jul 2017 16:17:16 -0700
Message-ID: <CAMKF1srQZZss3qf3SvGC1cy1S2OXpoPhdN7g2w-a-akQXZJMfg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] u-boot-mkimage: fix nativesdk build
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
X-List-Received-Date: Tue, 04 Jul 2017 23:17:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 4, 2017 at 3:16 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, Jul 4, 2017 at 7:11 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 4 July 2017 at 23:08, Otavio Salvador <otavio.salvador@ossystems.com.br>
>> wrote:
>>>
>>> Ross, please apply it as it has been causing problems for many users.
>>> It is applied in master
>>> OE-Core:5d3df78367be0afbfe001b4fa776a98a82e6ce54
>>
>> I would, but I'm not Pyro maintainer ...
>
> Sorry, who is? I must have missed the announcement.

Richard as of now see https://wiki.yoctoproject.org/wiki/Releases

