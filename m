Return-Path: <anonumiko@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7F96C26B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 15:58:36 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id u6-v6so5481838ljd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 07:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RwDEn/iaouq5ax3Q+xZmlptkTdGNuBdqA3qtf548gwI=;
	b=stqeOmdhT0qJd1Qy1Ao9PLFpaVL+ojj9CvaH+s0F4B0IrUTXigfhdtFJouCDXVdEjW
	pTrnA78phLjBFwdgSYwO2bhcA8o5WKSXYkgOqZOUtlTAYKzt8jheN2yl1nxt3RF66xLW
	nHf4QGRTZb5y3pteYriiF4ifIkR3USFsiunMAj/lwMQCpyU/HU5B2GpdqiQMUXoocI5C
	V6jotM8mqqYUw+YnI70VJhKtHIjL81VJtomhruW7CWPvEN0kXfpP8hYZJsJdKt1Hyxl0
	PxaRG6GVJFRt2omIaKaPEBEqH1bHsOaBFhkiif9x5W/4CYNlE0LBEi1TRWC77diEuLmA
	sE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:references:cc:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RwDEn/iaouq5ax3Q+xZmlptkTdGNuBdqA3qtf548gwI=;
	b=Rq8dl6Tmjjy6Qa49V71UNk8Wn3rEG+ZF+KOCF6U5EHDXqThWub8OLj/iV70bp1SdWl
	zhYSnsWCMpSsMe0WY6mRi1AeZGUqGNOd1LTH9XOZdKlHQidHrqAo/p2AzOrIM8ciS2M1
	1ah+YZ77DJRM/jUxzZKs/F2b/e5a6ghZDMBW0beY0audpwtR5rLcVt2curYgc/SXIgJP
	x/wlgXtD61DhN9bGY8ZbrVA/d5Tgm2zBbIyWRB0m8v/ugiwfSPwBtluB4ifpSq549PLI
	TIqxgdHszT+i1+O3FVeRNXr0eWDTmv50aK7cX/anAjftXI+NURU5+ViBxyZXeSZFGz2g
	7rLQ==
X-Gm-Message-State: AGRZ1gILnDd684CgEDlxL3v2/hTi7pQM+SP/85iV9Kn1gxmW0rzLFDex
	WSV8+x8ivfEd7UKjJpPaj4AjOwsfGVs=
X-Google-Smtp-Source: AJdET5eoVorC7GAJNV46Cbn+9Awa21E6ptU1v/buX9OA4d9kQfQEaw1VFXLTbD8SOjb2ZUzPCMJIYw==
X-Received: by 2002:a2e:b00a:: with SMTP id
	y10-v6mr9555289ljk.109.1541951917187; 
	Sun, 11 Nov 2018 07:58:37 -0800 (PST)
Received: from [82.181.15.94] (82-181-15-94.bb.dnainternet.fi. [82.181.15.94])
	by smtp.gmail.com with ESMTPSA id
	10sm2535621lff.62.2018.11.11.07.58.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Nov 2018 07:58:36 -0800 (PST)
Sender: anonumiko <anonumiko@gmail.com>
From: Niko Mauno <niko.mauno@iki.fi>
To: "Burton, Ross" <ross.burton@intel.com>,
	Pascal Bach <pascal.bach@siemens.com>
References: <20181108105737.21810-1-pascal.bach@siemens.com>
	<CAJTo0LYaW8at7hyOGr2=qwEhSjd22YsZVKghawOjZz78iNuvNw@mail.gmail.com>
	<faabaea1-4869-be52-e1f9-9c4ee5dca4fd@iki.fi>
Message-ID: <b49cbcb1-3dd0-8485-37b3-1997735fafa2@iki.fi>
Date: Sun, 11 Nov 2018 17:58:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <faabaea1-4869-be52-e1f9-9c4ee5dca4fd@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: make alternatives for rev and ionice work with busybox
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
X-List-Received-Date: Sun, 11 Nov 2018 15:58:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/9/18 7:36 PM, Niko Mauno wrote:
> On 11/9/18 2:24 AM, Burton, Ross wrote:
>> On Thu, 8 Nov 2018 at 10:58, Pascal Bach <pascal.bach@siemens.com> wrote:
>>> Busybox can provide ionice and rev. They are both installed to /bin
>>> The corresponding util-linux variant is installed to /usr/bin
>>>
>>> This causes the following error during the do_rootfs task:
>>>
>>>> update-alternatives: renaming ionice link from /bin/ionice to 
>>>> /usr/bin/ionice
>>>> mv: cannot stat '/bin/ionice': No such file or directory
>>>
>>> Moving the util-linux binaries to /bin avoids this error.
>>
>> Isn't it simpler to just set ALTERNATIVE_LINK_NAME[ionice] =
>> "${base_bindir}/ionice" (so the system knows to use the same symlink
>> for this and busybox) instead of actually moving the binary too?
>>
>> Ross
>>
> 
> Case being that busybox has ionice and rev under /bin/ whereas 
> util-linux under /usr/bin/, I wonder would the prudent course of action 
> at this point rather be to revert the 'ionice' and 'rev' specific bits 
> that were introduced (along 'cal') in 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/util-linux/util-linux.inc?id=78db831a7b0c2361a266eb37c7cbf2e368d2280a 
> 
> 
> -Niko

I believe I've pinpointed this issue to https://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/commit/?id=fcb26339000021eb9bb711aa264247aebcfdd4ae which added link relocation support to update-alternatives script (it used to error outright in case the new symlink source differed from old one, which deviated from Debian's update-alternatives behaviour). However in the added implementation, handling of case where target rootfs root directory did not match host rootfs root directory (such as in Yocto do_rootfs context) the 'mv' call tried to relocate the symlink on host rootfs rather than target rootfs resulting in 'cannot stat' error.

I submitted a patch a moment ago to opkg-utils upstream, as well as oe-core patch to opkg-utils recipe (just in case the former takes time to propagate to Yocto):
https://lists.yoctoproject.org/pipermail/yocto/2018-November/043249.html
http://lists.openembedded.org/pipermail/openembedded-core/2018-November/275959.html

-Niko

