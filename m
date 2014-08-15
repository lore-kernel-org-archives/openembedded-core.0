Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2837065CC1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 12:18:33 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id i57so2116701yha.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 05:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=rn4Pjs9QoIt0KIzHxmcnhNt9/Z7+B+BO4sf5YDyuVKA=;
	b=ZdZji+knDiMhlzxdLKjBV5vQAKV4ya3Uxn7Kyp4O/IRXlm/rqSvBXaXjJKjQRl00SO
	rg3JgNuMnkyejY29bW/mkfU0ERrk+sbVQL0b4MwNkvzWe817alAAJSAM7vaUPaJoRYG3
	8c+x1+4BrZQdnQ8UTyZILiLk8Ot+n2MHpjkqBQz9axc2IytWpmn1Lyn+Rm3bQC/ifv5U
	wn1gXQrsrfAYf7h9MOENS/GoKNrAGzBZlKe7jWxPy8s5x+9SGTr/EBUhxEmzVmJHGXHA
	IWVDgzxoELisphojMdprFVzoLQD1Wx+Ae+a3Iq6a05VreeiIP9l1MDZbHJWvWPOKYMnG
	Ok4Q==
MIME-Version: 1.0
X-Received: by 10.236.91.74 with SMTP id g50mr26306911yhf.59.1408105114827;
	Fri, 15 Aug 2014 05:18:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Fri, 15 Aug 2014 05:18:34 -0700 (PDT)
In-Reply-To: <1408095935.21596.20.camel@ted>
References: <1407788504-27417-1-git-send-email-otavio@ossystems.com.br>
	<1407788504-27417-3-git-send-email-otavio@ossystems.com.br>
	<1408095935.21596.20.camel@ted>
Date: Fri, 15 Aug 2014 09:18:34 -0300
X-Google-Sender-Auth: rHddXoc8oZJj3aDPP5-K-if1hdU
Message-ID: <CAP9ODKoCwNa_q-qf+h7CFTYx7wLk6UDHZ3uKxtpswkEHc5n2vA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libpam: Allow use during build and in SDK
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
X-List-Received-Date: Fri, 15 Aug 2014 12:18:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 15, 2014 at 6:45 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2014-08-11 at 17:21 -0300, Otavio Salvador wrote:
>> The recipe had libpam hardcoded in some places which were causing
>> failures as the metadata renaming hooks does not change those,
>> generating a broken dependencies list.
>>
>> This patch fixes those and add the native and nativesdk support.
>
> Well, it doesn't as far as I can tell.
>
> Firstly, the autobuilder blew up since nativesdk-coreutils isn't
> available, which in turn shows nativesdk-libcap isn't either. I pushed
> patches into master-next for those, next I see:
>
> WARNING: QA Issue: nativesdk-pam-plugin-xauth rdepends on nativesdk-nativesdk-libpam-suffix, but it isn't a build dependency? [build-deps]
>
> So I'd love to know what testing this had?

I will test this better here and send a new patchset.

This was my fault as this were not tested in master. Will proper fix
it and send.

Sorry for that.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

