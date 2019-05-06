Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 68C107D574
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 11:18:16 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id u21so1582960lja.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2019 04:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TJlELqXLaXtEAlVAj0Dbdw8AbXcYbA408bb4DwKie8g=;
	b=meeHURfChSIK2ncaiytKESAhxe0LG2A5NjU9wtdAj1vi6fbq5z0arNhakXx+6TcA+f
	vtddhiDyP6zkek8eEF9qAj0mN3e+DYrPDVIXm2RYdE5gobEacBmUz+P568IQ03uN0+1L
	6K4Ieg4Mg05J0JOH5aF/nwzqgC4LcUe+7MtqsS/rfkOSMGP3B20lxie7gUt9DCrCi4hM
	0GjcTmWnfPdPoQmpR6dZQlMULgXKZe34wowz50magqdtmdvNp05MIJMVoIfMBGs7YSNx
	Y6/AvPXg3kOtcA1DhHeRZuISL2O4/VfWzfzDYNAnNlsRza1cNSkkDKDhypJGQhcNw0Or
	0n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TJlELqXLaXtEAlVAj0Dbdw8AbXcYbA408bb4DwKie8g=;
	b=ua0J5R+c+cA08eTyh3MKCPVL02qBydWpxJBIUUW/zWhw+gTYCyI5TY+T3POtCjXFb9
	u2TPe3cwi/14CoSTGziQeqrJmgP6r81oq6zrb1hP5gw+iTuyWZabG3Y+OMZKX74KHLyM
	jwshs1u1yyLaTTlzUh6F0wmpmFJJX4BSDBMoL5dB60SxHW0LR9qKy7BMudNmrnY5XzMQ
	2U8I9pQ5TkaCSZ1gNdADsxSERFolpYFEKJsxXKxQ22hdN9/uwZjFxJXhS5PEIS389+yh
	Tx8wKPNfTQ0E9InPHPpbnoowEGfhtwEZ0SfdWDTRnNYZjCZhxk7ZNbLQpY+OzE1dsQB2
	RlRg==
X-Gm-Message-State: APjAAAV64yfFCS1HkJCbpq53JdxGlUJa/orlwxHpo4cHCtG8BiHMhxky
	EN2897yE2P15KM3EOySD8TUInMJp6ek=
X-Google-Smtp-Source: APXvYqx9b8pOwOr82qjxSPAIe5gCCD2p1VvKpxSA9fvPOSRtBwqvYdm8WuCjJ2VjO9fsbkX+NDy7TA==
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr13150057ljg.145.1557141496846;
	Mon, 06 May 2019 04:18:16 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	n20sm2255236lji.53.2019.05.06.04.18.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 04:18:16 -0700 (PDT)
To: Alex Kiernan <alex.kiernan@gmail.com>
References: <20190503164850.130865-1-alex.kiernan@gmail.com>
	<3ddf9772-185b-2f7a-6a27-c8dffaf8bc62@norrbonn.se>
	<CAO5Uq5QL1i3gBmprySJBHBRQRiRVjWbKL11+-vn7qsmLqRD9Mw@mail.gmail.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <db105b21-d7b8-9b51-e026-48199339e500@norrbonn.se>
Date: Mon, 6 May 2019 13:18:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5QL1i3gBmprySJBHBRQRiRVjWbKL11+-vn7qsmLqRD9Mw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Default to non-stateless images
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
X-List-Received-Date: Mon, 06 May 2019 11:18:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alex,

On 06/05/2019 11:36, Alex Kiernan wrote:
> On Mon, May 6, 2019 at 5:54 AM Jonas Bonn <jonas@norrbonn.se> wrote:
>>
>> Hi Alex,
>>
>> The below is fine and looks good.  The one thing that bothers me about
>> this is that "stateless" isn't really a property of the "distro", rather
>> it's a property of the image/machine.
> 
> I agree it should be part of image, I'll respin it.
> 
>>   I suspect, in the same sense that
>> we have readonly-rootfs, that we should probably have image features
>> "stateless-rootfs" (no /etc, no /var) and "volatile-rootfs" (no /var).
>>
> 
> That makes sense to me
> 
>> Furthermore, if you want to boot with 'ro' on the command-line, I really
>> think you need to build your image with the "readonly-rootfs" feature
>> set.  The default should be writable+persistent /etc as that's the
>> configuration used 99% of the time (currently).  "readonly-rootfs" does
>> a bit more than just creating machine-id but it's all relevant to the
>> 'ro' case where /etc isn't writable.
>>
> 
> I think there's (at least) two use cases for ro boot:
> 
> - systems which boot ro and stay that way
> - systems which transition to rw during systemd-remount-fs
> 
> I'm in the second case as I have no initramfs and need the filesystem
> readonly until it's fscked/remounted rw.

I'd argue that you are abusing systemd for this because systemd 
explicity requires /etc to be writable.  The fact that it works on a 
read-only /etc is both incidental and fragile.

That said, I understand why you want to do this.  Have you considered 
putting the fsck in a "systemd generator" that doesn't return until fsck 
finishes?  Generators are kind of like units that run before systemd 
starts... or, at least, they can be (ab)used in this way.  Systemd won't 
start until all the generators are finished (the idea being that the 
generators may be responsible for creating units dynamically).

> 
>> Just for clarification:
>>
>> i)  volatile-rootfs:  means there's no point in prepopulating /var
>> because it's on a tmpfs and needs to be populated at boot time
>>
>> ii)  stateless-rootfs:  means there's no point in prepopulating neither
>> /etc nor /var because they are on a tmpfs and need to be populated at
>> boot time
>>
>> iii)  readonly-rootfs:  means that /etc is really not writable so it's
>> important that: the systemd first-boot stuff needs to be done at build
>> time:  machine-id, unit files set up, all tmpfiles.d snippets that touch
>> /etc and /var need to be done in advance.
>>
> 
> I'm assuming definitions from here?
> 
> http://0pointer.net/blog/projects/stateless.html
> 
> Either way, those work for me...

Correct.  Thanks for digging that up... I should have posted it myself.

/Jonas

> 
> 
> 
> 
> --
> Alex Kiernan
> 

