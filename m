Return-Path: <ygl@iot.bzh>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 220A87016E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 10:11:48 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id k86so78346199lfi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 02:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QTaFIOBd1KYjotnwqF6TJC7MlPwCB9+Bwlb+LVOBC4k=;
	b=mIVLaOCrIC0W42HGhL4QCfe9aPfmw7mOk4g529gKJx9l1MegF7qfviS1HrkGi4ELRF
	Vr0wTZWw2xXRaEM3XDq4o4nnsYiUiy3Nddd3gCIsoc8mszNSwtu+CF6rm9NewhvitEHD
	rwBCOVqQ2Gn/hYFoBc8H/zsFmbp6CuWrpvu0caGClV79N+QKEC12IMmHsuhE4s/9qO74
	1AeCSBHa9xo8TBDBoW1dcxZVghxGOnWA+1UdG67dWUaIAcMM4TzAjZwT1B9d0+24uvtW
	dhNExbQTHlNsAtgPwOuh2RWISdEV7OSL6feJArD5tcNZdGRGHvTUZQ82jQPK1lnB9QKK
	AtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QTaFIOBd1KYjotnwqF6TJC7MlPwCB9+Bwlb+LVOBC4k=;
	b=q2j2NBk9RUE25amJsZPZ4KQ4sWv68GomQsPeCksMOJcdtwHGi6kawh4IZp1IIR1uRC
	faZjI33ebwcpOhmWqvfsPEQvb/HPXPPAZMcejbPtfiD5pNud2524h47YqjbsMeDsK0U3
	bjSsj8k5xeKHZB9ihq8/k4dncwpoIx0ib5OYFQPV13272fuzhn+z5ihwQuknLVV5pQKN
	CUmYpUJuzCI/HPVhsCQTrmZJ3QXk8RZFeRftRLgHLWW6Jd6gDMs4qA5bcJZuvrkfmHsp
	X2UdO13bS8nyHFMd78j1kJ8oWalAZUHm8yFUmbsYvGn+ke95pUQDAl0PkM5AD4nVK/Q7
	pBEA==
X-Gm-Message-State: AIkVDXLZBPzn0lBGMIzPQR4IVXjUCkQh8gHI+AH78nBS7BxMZK5tewXInzb962trbzYvpYqc2t4onKVUuWrTqQ==
X-Received: by 10.46.9.216 with SMTP id 207mr12855297ljj.4.1484561507971; Mon,
	16 Jan 2017 02:11:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.89.208 with HTTP; Mon, 16 Jan 2017 02:11:47 -0800 (PST)
X-Originating-IP: [82.253.123.24]
In-Reply-To: <CAJTo0LZgBD=9cLcbaxOQ66kC2hxHFtCVC+U-0NdSS0fRS0NOPQ@mail.gmail.com>
References: <1484317398-25452-1-git-send-email-yannick.gicquel@iot.bzh>
	<CAJTo0LZgBD=9cLcbaxOQ66kC2hxHFtCVC+U-0NdSS0fRS0NOPQ@mail.gmail.com>
From: Yannick GICQUEL <yannick.gicquel@iot.bzh>
Date: Mon, 16 Jan 2017 11:11:47 +0100
Message-ID: <CAMZwcMDZjjJ2Fcwd-DC3gCz-k8qE5UETY=+MaV35FFCPoA9_UQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ccache: enable max size setup for ccache dir
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
X-List-Received-Date: Mon, 16 Jan 2017 10:11:49 -0000
Content-Type: text/plain; charset=UTF-8

2017-01-13 15:43 GMT+01:00 Burton, Ross <ross.burton@intel.com>:
>
> On 13 January 2017 at 14:23, Yannick Gicquel <yannick.gicquel@iot.bzh>
> wrote:
>>
>> +def init_ccache():
>> +    # dummy python version
>> +    return
>> +
>> +init_ccache() {
>> +    if [ -n "${CCACHE}" ]; then
>> +        ${CCACHE} -M ${CCACHE_MAX_SIZE}
>> +    fi
>> +}
>> +
>> +do_compile_prepend() {
>> +    init_ccache
>> +}
>
>
> That is horrible. :)

Thanks for your direct review :)

>
> Is it not possible to just pass -M[size] to ccache every time it's invoked?
> If it needs to be invoked on its own, then a do_compile[postfunc] or
> something to trim the size after a build would be neater.

I tried to pass -M option in CCACHE variable directly, but it breaks
host_gcc_version().

About cache size trimming, ccache does not support such feature. It
supports "forced cleanup", but as stated in the man page it's not
needed until user manually modify cache content. Keeping size limit ot
1GB is still possible, but as it is stored by default in TMPDIR why
doing so ? My assumption is that people who activates ccache will have
in mind it will consumes disk space (FYI, webkitgtk recipe requires
3.9GB)

Agree that using a "do_compile[prefuncs]" will be more compact than
the current proposal, i will prepare a V2 serie with this syntax.

Yannick

>
> Ross

