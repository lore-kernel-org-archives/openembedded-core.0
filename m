Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 887457002B;
	Wed, 13 Jan 2016 00:20:07 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id q21so401844555iod.0;
	Tue, 12 Jan 2016 16:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UO8JkO0Ty1/4bpauelwc6UT/rpVisLniegf7zqzpML4=;
	b=TJECJBb+AaGUichBM7hKX/UcwY08SdK1p+3jK9WqdnHb+eYk1ZY3jiEgMgompLrWdi
	wNrCjaSDWURB0azg9vtDwf931C70RCF83lYw7YbOnAlxKVK/iGjRgPfidEX+WCLZ8rrk
	5V7HznXK6GqWrDK7iJczljKD4sD2+v3aJPKh9q1kGpS6HDcmZ1/fNgsOpmtxV2PmHc73
	VpiK0Il/36YoODA92WPvsMNyXY/u0JGvTQAAyBlpGcGiukOYiWO5YycknYZyQKvk6slO
	BKuzjzzuABIkRf7jUE7LNZv1+Us9VAqLYzFnfnMuPBFop+QHg4jKIBMVpFYIZ1dJ7vaf
	T96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UO8JkO0Ty1/4bpauelwc6UT/rpVisLniegf7zqzpML4=;
	b=AZkUBJ8HJVmcrbhefAV9z1IXos3sdcljMYoNmzTxExrnjWduwsLMbdzoELPowRdjvP
	aJcSf5Flwd3AvgrTnDDOXCUQaMqhPNsNG5rUCPYvgkgKZcfsMfrYCGxeGQAMgXed7XBw
	pT7OpUGG6QKguQ45ChbG4iN9/gtbiZ/ZsXaY32uoIEyAnrmeVWTMe/NZYaAsOMFVATTn
	UfY4xuOInBQZTQXzbQ/DOdo4M2+eydsiWqQ6kCWWK6Tw2lE5MED4RRdodeGJkrHhmtKw
	+fSTNC58koepvpilR8WTBfdt1cChIfZY3VhTWiT+XR+ltwZI6kE1HveCSYAAjf17EgQ6
	78lA==
X-Gm-Message-State: ALoCoQnvlHS5wStKp2LjsCkc2vgLcUcEiPk32Sgy0f9xCdys1BsDJU407Z9Ty1hx4QT91nPtLNf0nENjVbOFC4TWxwzvj6IEVg==
X-Received: by 10.107.165.14 with SMTP id o14mr32644707ioe.49.1452644407873;
	Tue, 12 Jan 2016 16:20:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Tue, 12 Jan 2016 16:19:38 -0800 (PST)
In-Reply-To: <1462345.ZzKELdxCEg@peggleto-mobl.ger.corp.intel.com>
References: <39606447-07D3-4F1F-93A1-CB9C77114535@gmail.com>
	<1462345.ZzKELdxCEg@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jan 2016 16:19:38 -0800
Message-ID: <CAMKF1spYKDvYh2uvVBVqesyFM0_jAdYYTBnzEnOfQ-YQXw-xsA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Cached size of off_t
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
X-List-Received-Date: Wed, 13 Jan 2016 00:20:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 12, 2016 at 4:09 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tue, 12 Jan 2016 15:23:33 Khem Raj wrote:
>> Hi
>>
>> We cache size of off_t in site files and the value is 4 in most cases
>>
>>
>> meta/site/arm-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
>> meta/site/ix86-common:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
>> meta/site/nios2-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
>> meta/site/powerpc32-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
>> meta/site/x32-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=8}
>> meta/site/x86_64-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=8}
>>
>>
>> However this value is wrong when largefile support is enabled (which is
>> default) on most OE based distros. It also lands us in nasty bugs which are
>> complicated to uncover eg. the curl issue
>>
>> http://git.openembedded.org/openembedded-core/commit/?id=3c58712465494e441c4
>> 036a7cf21d2e6d343efab
>>
>> and just in OE-Core more e.g. grub2,libsndfile1,pax are showing same
>> symptoms.
>>
>> I think this value should be left for configure to compute and
>> autotools.bbclass should pass --{enable|disable}-largefile based upon
>> DISTRO_FEATURES enabling largefile support
>>
>> Do we see any downsides or point I might have missed
>
> IIRC I think the issue was older configure scripts without the capability to
> compute this properly (where we're not auto-reconf'ing them).

Thanks Paul.
I think in that case it is better to move that into the concerned
recipe and let defaults be reversed


>
> Ross, any thoughts?
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

