Return-Path: <nathan@nathanrossi.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id CE5AD78096
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 12:56:30 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id u73so261676qkl.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1gHSLEDk2TbbG1JP5IxuD6yvI2gdXcpUkZZkzipSDYo=;
	b=iDGuY1641TmfcRK+wVSqxl6ICD5ymk3Ky5RRjZkMtvYZYIoH0MNcHZGCaWDKEOlyE0
	JA8ktqYMPxcF4PvqSvX3ZGXABMgOVhtT0iKaiQrmXTU/u1yRzMSvZU+xbucBvDgtkizh
	SH7UOKXwQyzcLSHtck5ex61bx8mVIfnI+jHxXoqDCkiQXh7cg1iEDAPQsMW8xDCcpvCL
	opGhNDJPJhaJh0Z3lDMaiF3yV/dpGVOZf+8KhN8V7Yb4U/TzLXQzVxX3S+vOmwRLOBKA
	KAAg7I+KvHaFBqNnx4iZEOgbnQ5xB2vElN0RO+mXzSS4kI563G6I71oYkFXv9LlhFccg
	xIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1gHSLEDk2TbbG1JP5IxuD6yvI2gdXcpUkZZkzipSDYo=;
	b=WBngVT94QIw760o2f79kfcaGwZWlcwl2ImpwiKVzjr9p+/LoN7rMlHgrx0Zsa2TMg4
	6FE0cF8F3/ddVemtUrMFciSGIyIoIMYdnxyuFxi9G4SihPBoXoJtUVWhf40V+8Wm/uPf
	7LuzZG/FY3aex4QONWOnPe6OwR0xD9+ZJG2rfhIRm1GqM60QYjTbSGGDlqWp2cTzUU1Z
	Lts2JSZPoi1D2sUTf7N46RdKpjfseBTb592A3gSMkmnpoR1TC7eNyfS8MW2G0HXM6s8E
	AQJqIbUazGDSsCBl+kuX1vFIhHE64njLaYZL54K1xy5haa4JYLdgMk5mhtwsVpfinGMi
	LePw==
X-Gm-Message-State: AHPjjUhsao+d54v1lVnWdbrZj+SK3l9kmlelLZtyx1EBS8mSIVyFAFms
	tcwtyyC1aNlwUtLmj9awGlGhdx8N1+YZjoV+vPnPVA==
X-Google-Smtp-Source: AOwi7QAKM08UBMH/r9ucUhSxO3/+66RUy5AANd8HKBNcMb5LUxd+WUPgUUEtCtUqPtwayMdMTmQbVyzHNzOwk9PPP5Q=
X-Received: by 10.55.58.196 with SMTP id h187mr2392658qka.33.1505393791678;
	Thu, 14 Sep 2017 05:56:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.140.207 with HTTP; Thu, 14 Sep 2017 05:56:31 -0700 (PDT)
In-Reply-To: <CAMKF1sry4fSRQa-wqcdcds0U8tN3jQhRdLZbtU1OzBG-4rSVTA@mail.gmail.com>
References: <20170910131446.4555-0-nathan@nathanrossi.com>
	<CAJTo0LaqHGMPDF=JHGw5NcBzvTkFbP2bQfmgcG8o-Zx0hTeD3g@mail.gmail.com>
	<CAMKF1sp1R_wnW6Zkh96WWJKgC9zzgtbO-__JvqgEYWp_B6whzw@mail.gmail.com>
	<CAHUNapT0zPy9SUv+g7OBKp86BF_s8_=_RPrmNhMJQa7S8LbM8w@mail.gmail.com>
	<CAMKF1sry4fSRQa-wqcdcds0U8tN3jQhRdLZbtU1OzBG-4rSVTA@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Thu, 14 Sep 2017 22:56:31 +1000
Message-ID: <CA+aJhH1pOZyXvkSCfp=g6C15oe+NQD0+fMKwcTiK=bOTnsZAEQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Recipes for Open Source Verilog and Lattice iCE40 FPGAs tools
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
X-List-Received-Date: Thu, 14 Sep 2017 12:56:31 -0000
Content-Type: text/plain; charset="UTF-8"

On 13 September 2017 at 11:24, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Sep 12, 2017 at 4:42 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>> On Tue, Sep 12, 2017 at 4:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Mon, Sep 11, 2017 at 1:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>>> On 10 September 2017 at 14:14, Nathan Rossi <nathan@nathanrossi.com> wrote:
>>>>>
>>>>> Please note whilst this series is sent for oe-core it may be better
>>>>> located in another layer? (e.g. meta-oe). However since the recipes and
>>>>> the tools they build are not specific to a single BSP it did not make
>>>>> sense to keep in a BSP specific layer.
>>>>
>>>>
>>>> Sounds like a dedicated FPGA layer would be ideal.
>>>>
>>>
>>> I think a layer for 2 recipes might be too much. Put it under recipes-devtools
>>> in meta-oe for now.
>>
>> 5?
>>
>> Am I reading this patch correctly? There are 5 recipes?
>
> 2 or 5 doesnt matter I just meant "too few to be a layer of its own"
> engineers minds :)

That was my initial thoughts, and I was following your suggestion Khem :).

Though it seems like now is probably a reasonable time as any to
create a layer to give a home for recipes in the HDL/FPGA space. After
all there are other projects that I would like to look at and probably
create recipes for in time, so what is now 5 recipes is likely to
increase.

But I don't like the idea of a FPGA or vendor (e.g. lattice/etc)
specific layer since that makes it appear like a BSP layer, and there
is the problem of the tools 'conflicting' with proprietary tools those
vendors provide. I was thinking of following the approach of a
language-like layer similar to how meta-python/meta-rust/etc. are
setup, something like meta-hdl? Which would cover the recipes in the
language space (simulation/high-level hdl) as well as the recipes that
translate/compile HDLs for physical targets (FPGA, CPLD, etc).

Regards,
Nathan

