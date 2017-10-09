Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9C1086FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 16:04:59 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id z11so4268729pfk.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 09:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JwvdYH7qw83xu7UEHA0dYz6AG4cP8JgZ6RJnij6dtDg=;
	b=QB+e7etIYixj0BvZSQy5fRbJdZvAODFmUe+6oiP1cIN3Hp3eG33QOsZib3/WdTh5mY
	6UmLfg4XH/NOIJaI3hqzslP/Fj2/auiDTv4UK2Ihy6MtXqYmkOe5yll7nXXNYxuHj36a
	l/e6OnbmMdy4S2GopR2z46XTmjGI8mU62L7zS/QhgsYddiYJAZt1pMEZ5IMniYxIfNXv
	T0/bXeh7/dGd9Bio2p7qW303UE5I26iKq3wmtqUOJHLi0O26WkSUDslbxtvYDRetZM1k
	3tibjwocAlR8gY6zbIoM68toryphwQcf9w170RyKlhWNMgQ90Mvda3UZ+LCgtTlEnhzq
	deIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JwvdYH7qw83xu7UEHA0dYz6AG4cP8JgZ6RJnij6dtDg=;
	b=i6pTuWabBO66OUJ4EKztD3patKZyvGXjWgbjAA5zrXrR6VSzjuwVu6Tbt4RdKKLI0G
	TayxOQWhj4OCToHjBiEjFNGiJ30e/eCVeK0m91ku4qGekAu92BZxG+6T+b+dbAvljiFG
	Gs2WGCddeSBIHYgRu6TK+52KmzbeWjkWqf6hehNBu88Rzogwhf8uVWBPsqfkwNbV1+Fz
	j/3ot3ox2d/74u6BRFQEssMWF9XZcPF+35VXRrAYk2rUaG5k0kqeNdVtGVyqQIuxG8Z7
	YKlduEsdOTxdCmzEBrDfiRpGEnj7TW6LeJSwGYkGw8sIKXykaKH20boZGKbQTGAoteZc
	TX9g==
X-Gm-Message-State: AMCzsaUsiqABxQfWmMmfM7SOfFZou8ZZ+P51sKmQLIMwjM3etqcoNGVI
	s92kLEo8ZtdG+SHS+AA3Bmf5c4dUoqfF0vVMoe4=
X-Google-Smtp-Source: AOwi7QCBZyFWZTwzr32zCu/Ga6mak19Vigpr2f5jYsE5OpxVDK6oDHXIoRXhizf3rIRAV8TqL1CnpYug7GMV5CjxXSg=
X-Received: by 10.99.107.197 with SMTP id g188mr2181418pgc.341.1507565100932; 
	Mon, 09 Oct 2017 09:05:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 9 Oct 2017 09:04:30 -0700 (PDT)
In-Reply-To: <CAPyrkgxV9aQvx3frYAJFKuK3jBY7Cv+V8=zFjvvLM-jbK5PH8g@mail.gmail.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
	<CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
	<CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
	<CAPyrkgxV9aQvx3frYAJFKuK3jBY7Cv+V8=zFjvvLM-jbK5PH8g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Oct 2017 09:04:30 -0700
Message-ID: <CAMKF1sqQF01x8WOWQRt=jnfBCAsP8_5OSLZnJtPo9QWBu9RGCA@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Illegal instruction when running go binaries in qemux86
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
X-List-Received-Date: Mon, 09 Oct 2017 16:04:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 9, 2017 at 6:15 AM, Paul Barker <pbarker@toganlabs.com> wrote:
> On Thu, Oct 5, 2017 at 3:35 PM, Paul Barker <pbarker@toganlabs.com> wrote:
>> On Thu, Oct 5, 2017 at 3:31 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 5 October 2017 at 15:23, Paul Barker <pbarker@toganlabs.com> wrote:
>>>>
>>>> So my question is: should we just set GO386 = "387" so that it applies
>>>> to all go binaries and accept the slight loss of performance on x86
>>>> systems that do support sse2 instructions? Or should we make this
>>>> MACHINE specific so that sse2 instructions can be used where
>>>> supported?
>>>
>>>
>>> Definitely machine-specific.  Need a way of mapping from OE tunes to Go
>>> options that control the instructions used.
>>>
>>> Ross
>>
>> Looking again, we already have go_map_arm() in goarch.bbclass to set
>> HOST_GOARM and TARGET_GOARM. We probably need to do the same for the
>> GO386 variable.
>>
>
> I'm looking at what I can use to determine if sse2 is supported for a
> given machine/tune.
>
> In TUNE_FEATURES I could check for "core2" or "corei7" based on what's
> in oe-core, but not sure this will cover tunings which might be
> defined in other layers.
>
> Alternatively I could check TUNE_CCARGS for "-msse2" or later but that
> feels dirty.
>
> Any suggestions on this?
>

For cross compile there is no easy way, I would think using a map is
probably the
best thing we can do,

