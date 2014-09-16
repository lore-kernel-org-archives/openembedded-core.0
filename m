Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4F93B7122B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:45:34 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id r5so458859qcx.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 11:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/amsHxLuppdzkLnTh9zSNmwHf8RSZ9Z7Q4hdUcRFBnU=;
	b=nZbIEJUWqUl0x87zVNspz3MDNpKKtQjduuPFdk+l0yWAmxaZbcfWP7XsWsB9ROTPV9
	SVXGe+l94ZzFBC509Xy3GR7bNnMPZF1zaed2jjZTaCPrp3u46OhW5nEGgev0mRvpfKtc
	0AHc71nmEYCxT45qoAc9g9c1kobW6yYm6T/EvdUQs25OJxg8wrH5TQWIh2PZxmrFDbPe
	S0Puy9kxJAqsVYeFJhZShfe/2pvILI+DaBRwYKOfqOXQiQnNIlm9lBEmL2JFV8LRH1zl
	sfhraOEOImbXPoSUWv2puMRyGn5UlKkSeqr8pzeqeB4V677PO0Mu5EeNOZjQjXBz81rp
	yd5Q==
MIME-Version: 1.0
X-Received: by 10.224.172.198 with SMTP id m6mr50278095qaz.19.1410893135855;
	Tue, 16 Sep 2014 11:45:35 -0700 (PDT)
Received: by 10.96.138.101 with HTTP; Tue, 16 Sep 2014 11:45:35 -0700 (PDT)
In-Reply-To: <CAJTo0LZtwOuer0QnH5=gLFzjZknBtauSbjhGt2-F5QT4f=tF7A@mail.gmail.com>
References: <CACS+7ZTGK6duNi6GQ6tqhmrk3_bNnEbSj=LeEzr60vRP3Dw=OQ@mail.gmail.com>
	<CAJTo0LZewZ17aYpXao81LrmuPdgWho8WEYmYhzQ5=pP-AO-QQQ@mail.gmail.com>
	<CACS+7ZQUcknvEU6M1ioMQKRFHa4k7PO_rRGqEH7KWLU4Jn5f_w@mail.gmail.com>
	<CAJTo0LZtwOuer0QnH5=gLFzjZknBtauSbjhGt2-F5QT4f=tF7A@mail.gmail.com>
Date: Tue, 16 Sep 2014 12:45:35 -0600
Message-ID: <CACS+7ZSx-yYuC2HXA=OJ=NM+-NmePBtM4VbYKaFnjodHgJ8sig@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Tue, 16 Sep 2014 18:45:42 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 14:28, Burton, Ross <ross.burton@intel.com> wrote:
> On 15 September 2014 21:20, Dan McGregor <danismostlikely@gmail.com> wrote:
>>> git-am is not happy with this patch, claiming that it's malformed.
>>> Can you try re-sending or pushing to a branch somewhere?
>>
>> Sure: http://bitbucket.org/dankm/openembedded-core.git, branch "sanitizers".
>>
>> It has unrelated changes in it, but this one should be cherry-pickable.
>
> Thanks, I've pulled this into my unfreeze branch for when the 1.8 is
> open.  Post updates if there are new patches and I'll rebase.

No worries. There's a new version up now. I did some experiments with
other machines. Turns out it doesn't
work on aarch64.

