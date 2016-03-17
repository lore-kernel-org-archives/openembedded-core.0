Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 925C462133
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:44:20 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x188so723207wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=N8lfBw/Q6J6M4SR9KJQgKG6ZI+x0VvYYcUuc2+OBRoA=;
	b=ZZVS8wxoNNmXgCvBbZyrtQa0bOOvMIqpAJqyMYWmS8fRcMJ4Z+INtJ6Y5PjjATOpE+
	5r2gH/vvflqtZtd9T9LcnOq2eBtVmN1wxaCD9UB8cFfLkGasP2N0olvFjhU0GQyElkPF
	CmuzCNkzAobB5S34H/MwBnlGs0rSx0Dls4TRWYY2G0HuM7KLnoohWa+C/1t4v1+snL2y
	PeXqNRLfhlmwOipo0/EY+UiJuIg5RyyhrudtffIoG0xfJ+Sjt7LWFatvNx+TEB3nFFOc
	qvRvetdpWVYVDIw2HDo8oLEnmkaiQLfRUQEsMDphX6GnVMPS7rypmiZ3mK7Rw+3pvskW
	rTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=N8lfBw/Q6J6M4SR9KJQgKG6ZI+x0VvYYcUuc2+OBRoA=;
	b=FlIh3LzuvXwhZ1KAzJNf6PXYemPtnu4CktMpXfikbfUsKdk182oXFOO+Bz1wdmGkZ1
	9egCebOq08lcZWwjXLMPw473vwIt8SrjG8IEUt1N3TRSvO790TB4rahoHUbDocIb2JKr
	K5eUgtPDZ694fCM63B1262Hl3OBxE+oDbnUdYUBpQ+faPIFTNF8a0NqJbODvQSLiSo7o
	etqxjq4ns2US4YbSb3neo3AXDMadH8nkrK33qRAk6Al8dK1hutnxlowCofh8IcWSVEbH
	tIKf5VGh5YPaL3Y6nt9YdZD83yc1XjLrYn5HNuXuWk7qbzCtL6m9bD80x1HanMPihff7
	8rjQ==
X-Gm-Message-State: AD7BkJL6/9Xc4TFEetAWi7UiwHJd3i9Kcj1J+ap+ozRmKKOE77Z0aK7Y4pEfiHGVP1WJA478AI/+Q+Q701FtIw==
MIME-Version: 1.0
X-Received: by 10.28.49.3 with SMTP id x3mr11929731wmx.4.1458236660680; Thu,
	17 Mar 2016 10:44:20 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Thu, 17 Mar 2016 10:44:20 -0700 (PDT)
In-Reply-To: <CAJTo0LbQbAi-_eoqYkZgNr9qCFr=Ro5UfP7P6OBLP=m6vCzr3Q@mail.gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
	<1458235169-9267-8-git-send-email-armccurdy@gmail.com>
	<CAJTo0LbQbAi-_eoqYkZgNr9qCFr=Ro5UfP7P6OBLP=m6vCzr3Q@mail.gmail.com>
Date: Thu, 17 Mar 2016 10:44:20 -0700
Message-ID: <CAJ86T=Xs--Sh0eru4XABWG95pN4S_UnvzF24e1cqYFbbKxNrtg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] gobject-introspection.bbclass: make additional DEPENDS conditional
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
X-List-Received-Date: Thu, 17 Mar 2016 17:44:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 17, 2016 at 10:29 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 March 2016 at 17:19, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>>  # Generating introspection data depends on a combination of native and
>> target
>>  # introspection tools, and qemu to run the target tools.
>> -DEPENDS_append = " gobject-introspection gobject-introspection-native
>> qemu-native"
>> +DEPENDS_append = " ${@bb.utils.contains('COMBINED_FEATURES',
>> 'gobject-introspection-data', 'gobject-introspection
>> gobject-introspection-native qemu-native', '', d)}"
>
>
> Have you verified this works with g-i disabled and a clean sysroot?  I'm
> thinking builds will still need at least some of this to provide the m4
> macros.

I'm travelling at the moment, without access to any kind of reasonable
build machine... so I have to confess that I didn't test the patch set
at all. Please treat everything as RFC.

> Ross

