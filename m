Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9A160169
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 10:21:17 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id i17so5696879qcy.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 03:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=2W2iKXRq2zuvPo+YhdTB8dfm8GExZd9jLoCtN5E49Zc=;
	b=drghiYvpiRCNWB2fCGmTPSPbxZYvrwjS624LqNzJ3Cxi/M3mmc2QyCfZAFbzdGGNaz
	5vq/PIk/VaUGm7W2jz4uk7kJKYw9vnzhY120XdxodJwSzpCIf15Smwu1AniBK0QeMZ+9
	3/Yn6LhJfYv7689aLXNl9ZtYkelnnJ4l81K6V/CWroopjMnKPbFAKIgQZfkhgZmb21Vr
	0Up0qozIwISnKmwaGeOc+isA1qu7zQBfX500FW1Fq55tLeSJtuMqFi475H6vhoCCSH7+
	gF5CWKAYB4rRtTmwd0+g6PobmOZpqF0U02nnuc+gJxFfwj6a/lHSSwi1P1EbzExDFjwa
	2rJw==
X-Received: by 10.140.32.227 with SMTP id h90mr32610427qgh.13.1414750878396;
	Fri, 31 Oct 2014 03:21:18 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Fri, 31 Oct 2014 03:20:38 -0700 (PDT)
In-Reply-To: <CALXw4G5O2NRCzQ4MiF8fG4G1C_bZNYbuH8NcdYbJUhRctjCgfA@mail.gmail.com>
References: <CALXw4G7x6Xbf3Wr=mKUCk6G5e4k=8sz_pph9VUMegLn1txA9WQ@mail.gmail.com>
	<CANyK_8cv3go0ghbLD73WwEdEyPiB5bLzaN_w8Wa4KxDQo92quQ@mail.gmail.com>
	<CALXw4G5O2NRCzQ4MiF8fG4G1C_bZNYbuH8NcdYbJUhRctjCgfA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 31 Oct 2014 10:20:38 +0000
X-Google-Sender-Auth: USJIxW5V39EMisoaaipkwN-NWq8
Message-ID: <CANyK_8e79R1X=wex2Z9BhRSFDL458eNXVtRz5PQj0yQiWGc2cA@mail.gmail.com>
To: Michael Gloff <mgloff@emacinc.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: Opkg 0.2.3
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
X-List-Received-Date: Fri, 31 Oct 2014 10:21:20 -0000
Content-Type: text/plain; charset=UTF-8

On 31 October 2014 07:14, Michael Gloff <mgloff@emacinc.com> wrote:
> On Thu, Oct 30, 2014 at 2:48 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
>>
>> On 30 October 2014 19:15, Michael Gloff <mgloff@emacinc.com> wrote:
>> > I would also at this time like to propose changing the default list
>> > directory from /var/lib to something else (/usr/lib ?). On a read only
>> > rootfs, everything in /var/lib/ gets mounted on the tmpfs, therefore
>> > packages installed get lost.
>>
>> Changes in v0.3.0 will make this much easier to configure. You'll be
>> able to set cache_dir, lists_dir, info_dir, lock_file and status_file
>> in opkg.conf. I'd rather we left the defaults as-is and use those
>> settings once v0.3.0 is released. v0.3.0 will also create any
>> directories needed if they don't exist. So it may make sense to set
>> cache_dir to something under /tmp, lock_file to something under /var
>> or /run and everything else under /usr if that's what's desired.
>>
>
> Cool, I'm looking forward to v0.3.0 and beyond
> Why not use the new syntax? The recipe should reflect the version of the
> package.

A change to the lists_dir syntax isn't included in the patches I've
got prepared. Perhaps you could send a patch to change this after I've
updated the opkg recipe to v0.2.3?

> Changing the lists_dir with 0.2.1 did not work for me. I can test the old
> syntax on 0.2.3 and see, if there is interest.
>
> Is there a reason why opkg-collateral.bb exists? And couldn't be merged with
> opkg?
>

opkg-collateral pre-dates my involvement with opkg and OE. We could
propose merging opkg-collateral.bb and opkg-config-base_1.0.bb into
the main opkg recipe, it could simplify things a little.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

