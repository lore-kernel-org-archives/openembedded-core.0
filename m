Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 683F575E80
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 07:56:48 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id e185so19444202vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 00:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=zG0l+F3YI/XlZjUjnta0B4jLfbJgnXoFu9LRlx5RFCI=;
	b=ivhEFR50Hv9sSz7kkD52DGhVcGN8lsO+yv9NBdfREsqUNzHhyLLJhG7s6fUa550uZR
	rpLNxDcqWw6YkdkgUvGZBDUDNeejtOOn3TgSjEqXgREV8dndAUmnz8kBh0z/Xsrup8YI
	PHM163PSu86LG+lFHlsPw9dyN+NsjF8IjrYqn0fNfE+d5Z1RqRJNkv3a3+jOhq63QcW7
	3MZjMDonYUSZld8J4ultiPrRPZJiisqvHLxa4c7Uk1GjLmdvm99ToCG08AW/geKL4HPB
	Un3zTsDYhhbzBjW8vBVFtrG8/LmrEIevSxAMoZ7Uej8AY2/EUWIVCTlf8McIhTOQiHBp
	DlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=zG0l+F3YI/XlZjUjnta0B4jLfbJgnXoFu9LRlx5RFCI=;
	b=FA7DrENZULJ4DKY+74ijLlFw2DSLYmYY/08cFDSv+Ap8gNwGHZyMP+hEUpJK8KB2Cz
	Ns/IAq7TBY/SJIAVRWlgWnsaKqqtXZyRaq1MkEjWBazO3x7gTOCGFF3Rz9/XEcNqR8mS
	Iw5RyDmDqy22rLlNBXK3RMuQZCD7I5kc6Bo2i7OOitrfHyuEUykjKIpt1t7hfgqdVTdt
	0NNST6OvNm3WYuHOqNAjANQ1xJrkdVgCTwC6E2sxWE+3zmFj23KXm994JpwTGzdaOzRf
	X2Qe6sXEAzITSHgBVv9WmCyOuBRR9GjqS27Zp7D9sekEpkEqU+h8IoKDUcYij0ycU1co
	MmoA==
X-Gm-Message-State: AD7BkJIW0tMP8VoNYm2hiQTGsb5AYvT/Hqpj7XCIgTSFBPB75BH1UzFaDP1QrbzdETtIN+g0T+1M97+YzDXVDw==
MIME-Version: 1.0
X-Received: by 10.31.1.67 with SMTP id 64mr5900926vkb.130.1459756608426; Mon,
	04 Apr 2016 00:56:48 -0700 (PDT)
Received: by 10.159.35.65 with HTTP; Mon, 4 Apr 2016 00:56:48 -0700 (PDT)
In-Reply-To: <CAMKF1spSnyYGJWZOG6vs8kW7y3JjZBo7J843jWhOZzq-RYCeww@mail.gmail.com>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
	<CAEHkU3VUnh78uOWRT2gYhAR5QOxYGDnc6J8RAsqkEkyj31HWfA@mail.gmail.com>
	<1459724450.7348.146.camel@linuxfoundation.org>
	<CAMKF1spSnyYGJWZOG6vs8kW7y3JjZBo7J843jWhOZzq-RYCeww@mail.gmail.com>
Date: Mon, 4 Apr 2016 09:56:48 +0200
Message-ID: <CALbNGRS7NEOTpCdV+Y-ZFzwTk-k9w2DPV_t9_VMP_4J6zM5CaQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Mon, 04 Apr 2016 07:56:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 4, 2016 at 4:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Apr 3, 2016 at 4:00 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>> I added some text to bugzilla. The gist is: In poky the sources are
>>> not deployed.
>>
>> I don't understand that. If you mean playing sources in the -dbg
>> packages, poky does that too. Is there some specific configuration
>> Angstrom makes which triggers this?
>>
>> There was a bug in master recently which broke source file deployment
>> into -dbg packages but that was a bug everywhere which was then fixed
>> when we realised.
>
> Max, somewhere in thread you indicated angstrom 2015.12 release which
> would be actually using jethro
> and if it has been recently fixed in master than it would explain why
> it worked on poky/master and not on angstrom
> may be this fix should be cherry-picked to jethro.
I checked Angstrom master but did not find matching commit. Which
commit are you referring to?

Andreas

