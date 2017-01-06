Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id B7E937199F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 16:45:06 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id j12so460869vkd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 08:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L7N3M+qsZGTwtNV/SfeL4/05AjEPTlA5v1qXBewa/l0=;
	b=ffxRdzj3BDQvMLRStM2oA9WHKLjtWAgEHPEMJzdUOv94WY1iKZCXiTtBigankO5nO8
	kklwNG4cPmbIyV/LzGjEE3Ep0xpoo13LmAPhT35Jx2O1CVj8DeTUY+5MOGGRAtOd3oKG
	yP6Cre40geSrX6Ln12cGlUqJKyo8X5Ka9V1PUh/iPxdBQMOV4Fv5nJVtFGu9sbW9kQ+x
	7lDMFEGNfd5mykdIR+qSlD8ul13JqkcEzE+rk1rRSDb9hU2nbmWqr+lga0fxo/swYv4j
	cWQiLV57f/IYjDVbK596wWz4mYs+2+ocr+GYzHM1+Fid+VVGVfr/JWNcVO5YORpbU3C0
	dXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L7N3M+qsZGTwtNV/SfeL4/05AjEPTlA5v1qXBewa/l0=;
	b=VUkjf//6KfRp5R8LfbFOKMjFrIHm4vsZF3WrVE8Tj9t4vIFP58CQI6vQV8Dkd5ltxt
	KB6/usPG5NIGk0x6MuwKJEmFV/T9bdFJ1Kc+8krXN9BKTSn+9rcFtksMJgu1HgMn91mg
	J/IEstmUvZfV2phkk9MHAxuhXUnSRcT/HU2dwJSrcEBeVIeNQ1lBvHrCfmaYH3JS43Sl
	IfcTqlpWNNtR6tMYfJow+vgVaQlCFV/wHVdfyiTd3HeBbKYlGs4jOPEAuTR64w0x0Med
	8+i/hhiBRi8MRlfznW/diOpQnWoT7JNhREYb0u3NeF28g3dVzyb1IJOISFyBwH9XvFMA
	okEg==
X-Gm-Message-State: AIkVDXKUeJPYanQDJD1MamWGdGYfwobl2I243dE7FkrJSama9O83SE+9zWYY7ZJr95Y1vDEIAY3YBUik1GNR7A==
X-Received: by 10.31.168.7 with SMTP id r7mr26804951vke.148.1483721106336;
	Fri, 06 Jan 2017 08:45:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Fri, 6 Jan 2017 08:44:35 -0800 (PST)
In-Reply-To: <CAJTo0LYyvqUP+gE=mcbkgF9u7ZEqDPEQL15=M6gtr=AtKL33tw@mail.gmail.com>
References: <20170103015528.29635-1-raj.khem@gmail.com>
	<CAJTo0LYyvqUP+gE=mcbkgF9u7ZEqDPEQL15=M6gtr=AtKL33tw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jan 2017 08:44:35 -0800
Message-ID: <CAMKF1sotQbOB9TMCDqa8cNhiD3QsKdgrQmVzHcw=yCbywzeROQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Upgrade to 1.1.16+ on master
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
X-List-Received-Date: Fri, 06 Jan 2017 16:45:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 6, 2017 at 3:45 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 3 January 2017 at 01:55, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> summary of changes
>>
>>
>> http://git.musl-libc.org/cgit/musl/commit/?id=8fe1f2d79b275b7f7fb0d41c99e379357df63cd9
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
> Looks like this is to blame for connman failing last in my test builds:
>
> http://errors.yoctoproject.org/Errors/Details/116506/

I think its the kernel 4.9 headers thats causing it not musl. Do you have that
patch also staged along with this ?

>
> Ross

