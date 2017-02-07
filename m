Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id DA01E6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 17:45:16 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id n125so2869928vke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 09:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QsmgDYIkk+XqCelElKpL1gppe5nQ3mUN9SHO5e488hs=;
	b=MKk9vis0HFSKzmMvykhSZDUeyXTGYzvPgDsre3tuEpOnlQ+oDh5q14wZkvogrORXqY
	P+pZuAUvD2nhjIpKeZ44Rfjibzx4/mWI+Rnxg0c76qNNBhr2KreEaZWECL4NRhXqP0x9
	suWLfl5OFIz6cik8tr9xxqnVCX+EmOfuTjbb2rBewOYImdK9GTiN5iorP+sITI+OzmPV
	7u8HfpQgFerW1w3B/eoqEnwts1OLSAiNkNmbcQAremYWXKxVJLJLjEuPkIOVMzWk5slw
	tKzXdNy7pvGQTQjCZjW24AYQ9Pv84sDFxmECUVt7+rqdDlpsFsgBMXVCL1YsXbW6Oxu8
	GmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QsmgDYIkk+XqCelElKpL1gppe5nQ3mUN9SHO5e488hs=;
	b=LuTCQlTZQap2XwwLWbKbWgk2lF3gDGtD485b1RQY0vRidxB5Y2Sb/zIr8IZiZIlovT
	v6sO7MYusY+oT92+NAOxO5aCao4lCiS8WXsqHXca44pGDS1yyB958HzQVSmofLUtwuq4
	fpvr4jqkFrCUy7bVLmQxj/ATe4yt00AzBtpoBvgRkPlJ9hwXnlLuwQ3ijSyqNrqNCsMh
	kJelya1EiNB+l94XsCXWfv9oHPQS2kb5QZjsJ8WVYnVK/bXad+mMZn1CfpPW2V7IaT4i
	xneBanMxeievxBi3tFkELJhIkKrh3zGOoeH+3zPYa6QfFMnIL5UoGeLgAUNIDv4rg2OJ
	J+jw==
X-Gm-Message-State: AMke39mH38AbjmFh25XQ4bwWpaXfQ2IwQcf5fMR1h/sLUQV/SnIzbT65BX11JBr4IQRBORuN5UKuV/zXOxrSIw==
X-Received: by 10.31.108.149 with SMTP id j21mr6428648vki.93.1486489516912;
	Tue, 07 Feb 2017 09:45:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Tue, 7 Feb 2017 09:44:46 -0800 (PST)
In-Reply-To: <CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2017 09:44:46 -0800
Message-ID: <CAMKF1sqJSgjLMOPo7pkpfNDUOWLu4R0F9BNzbPFzWYgha5gwHw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Tue, 07 Feb 2017 17:45:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 7, 2017 at 9:35 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 7 February 2017 at 04:24, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This is converging the recipes for go from
>> meta-virtualization and oe-meta-go
>
>
> I'm still of the opinion that this should be in meta-go, not oe-core...
>

I think we have to make multiple layers agree on using one layer
I find atleast 3 which carry go recipes along with, if its in OE-Core
either these layers become redundant or layers which are housing go
recipes for
different purpose like meta-virtualization can then drop the compiler recipes
it will be easier from consolidation point of view.

if we dont want to take it into OE-Core, we should create a new layer
meta-golang on yp git and then help request community to converge to
it, it still can be ignored by layers.

> (but totally agree that converging is essential)
>
> Ross

