Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id D6A2F73117
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 13:09:28 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id u134so3500616ywu.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 06:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=ESOhBdKZvoAUYWLYmHiuSADrZTVIFkuRcbQ0PGi6CPo=;
	b=1oi8RNQbTF9d93ASOAYNWhK1s5edtT3xvGkE4sSIdhMstP9u0oOJkqCV8sDmZ7H/Ac
	ZIECgqYb4LfXc+Mj7L/elE7zzXIBxM5LpIlxFya43fxHgQ8nMCpnT8d6kdoUCvZroIC/
	gXZhY9g6H4ydShvEmkFXC//+nMtJae3qzxUu61LVc+XbDNKx/Hd3dExbAPZ9fEbHnf4c
	D6ZPZRmSGhkWWRqXjPjNGe0OMr3Ua9XDDZ9MObAlk6nPHheg0eAzN2OGP+sJlzQbWlhu
	Vd6JPwvXQqsspJItEQXkPi1h7CSL+D0xNxz+7zaOaWCgLyxda570aCLyxVT/UYNawJTo
	o13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=ESOhBdKZvoAUYWLYmHiuSADrZTVIFkuRcbQ0PGi6CPo=;
	b=WbQNNp+r4GPqZoRB/IvVpe5yqj5eFuIZ1dx9I8OWGehaTlQQXADQxETbwyMapl21WE
	duAl3Mzn7gk4h1oQ0WXw7iugB6sQ5E8RMhmKZN/PqUGDGeBR4UKezAxkV7cPRlJWckAJ
	0tgmMuPoP7yXIDtWfJeemiR+ByShak25sWiTIQ/DU4QDawE0m5Rj3kSP1hiYAZnsMsKR
	M00/uqU8ma8wgiO5hVooKVBdYBhzrS8Ssgml1YeLjaiyaoyRysPm/WRfFSX2qplIGuxy
	RU+MwRxH2s8ZUcELEm0Al6rBXM/1Eg/e1Kfgu7GGgxwPmiBVMqD4V1siDjLtBOWYIRP9
	hQRA==
X-Gm-Message-State: AHPjjUjHFvUdHX21vd5hS/6xRBpNECb0IVO/Oc5KdGB2i27PoNayqI0X
	31lmBOsZ9JTYArlqDunJ5YgFhOh1
X-Received: by 10.37.96.87 with SMTP id u84mr11306458ybb.377.1506949768627;
	Mon, 02 Oct 2017 06:09:28 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41]) by smtp.gmail.com with ESMTPSA id
	x66sm1201100ywb.108.2017.10.02.06.09.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 06:09:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id 125so8908505oie.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 06:09:26 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDP54df7rbKk+B+8E3cm1zJkbWbv9iEu2xcAXSrE226ADBsxrUY7sNZkmaG7O2HnVQLiWgVlcldTm5Q2n+FY3k=
X-Received: by 10.157.20.233 with SMTP id r38mr8706924otr.357.1506949766040;
	Mon, 02 Oct 2017 06:09:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Mon, 2 Oct 2017 06:09:25 -0700 (PDT)
In-Reply-To: <2adc6b6c-9538-bede-9235-b3642b0d5ccc@linux.intel.com>
References: <20170930180655.25134-1-otavio@ossystems.com.br>
	<d270479c-2e98-0211-1cc0-b7775a318d1b@linux.intel.com>
	<CAP9ODKopd3YGyd7wfz-Xyc+QDEJSJX3yeCwY7ced+aFAY4+Lgg@mail.gmail.com>
	<2adc6b6c-9538-bede-9235-b3642b0d5ccc@linux.intel.com>
Date: Mon, 2 Oct 2017 10:09:25 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrjgs211OR+P3CBMbL9HhD1RK-bks7jky12NuqD49qmSA@mail.gmail.com>
Message-ID: <CAP9ODKrjgs211OR+P3CBMbL9HhD1RK-bks7jky12NuqD49qmSA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	"Burton, Ross" <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] lib/oe/package_manager.py (rpm): Signature check is enabled by default
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
X-List-Received-Date: Mon, 02 Oct 2017 13:09:29 -0000
Content-Type: text/plain; charset="UTF-8"

Alexander,

On Mon, Oct 2, 2017 at 8:01 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 10/02/2017 01:00 AM, Otavio Salvador wrote:
>
>>> NAK both patches, I'm afraid. gpgcheck and repo_gpgcheck are two
>>> different
>>> options, which control different things, and you thoroughly confused them
>>> here.
>>
>>
>> I did test both patches and this is not what I figured. Did you test it?
>
>
>>> Again, 'gpcheck' option has nothing to do with verifying signed package
>>> feeds. NAK.
>>
>>
>> Oh really? so tell me why it fixed my error?
>>
>> Without this patch I need to use:
>>
>> dnf install --nogpgcheck <pkg>
>>
>> and it is sub-optimal as I did not enabled signed support.
>
> Oe-core has support for two different things:
>
> 1. Signing and verifying individual package files. This feature is
> controlled by RPM_SIGN_PACKAGES option in build configuration and dnf's
> gpgcheck config file option at runtime.
>
> 2. Signing and verifying repository metadata. This feature is controlled by
> PACKAGE_FEED_SIGN option and repo_gpgcheck config file option respectively.
>
> The above two things are completely orthogonal, and can be enabled and
> disabled independently of each other. Now please look at your patches
> keeping this in mind.
>
> I assure you, both of the patches are incorrect. Exactly why is left as an
> exercise for the reader.

I assure you I did test both patches. I leave as an exercise to you to
show me what it breaks.

Also, keeping "exercises" for contributors is not something which
helps to gather more contributions. It solved the dnf install
requirement for my test and seems to be the right thing to do. I may
be missing something but please point it or give me a case test.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

