Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id CB4596D5A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 11:18:07 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id g12so7007579oah.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 03:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=BCIunAd8NbVhSMUqC4gtUMHt2I1p7Vopub6dSkL+x7g=;
	b=YOpq1IexEtd9gNFXTHR9aqppxjwreJXIDFxFH90lyUl3JzXtCycJd48/yLJRN58mQq
	aS3fuo3HVsaEBwkpE0kAdK+1jPkd7t7GP/i62EC6gNec1HbvEIwahoLo2CAIR2dRFycY
	g/oSyhkZVkNPDBO4enNMTOMluQA8OQy2Z6okO7TMz7E1IaVPaVRTnoE7NSizEOUE39LW
	sWcT4dijNE4EcaK/SMFNSpxIhEvzwW1aCzPC8DVjQoUM5LY/AE3i+hMbpSXoZraZap2r
	W8GCGeZQetNYVOVqkhU1+UEFeefKNOVgYzejkwYAAMY3QUZ0GrPATim3tPCQ6jK2Tb6D
	oyQw==
MIME-Version: 1.0
X-Received: by 10.182.40.201 with SMTP id z9mr1152458obk.45.1384773489132;
	Mon, 18 Nov 2013 03:18:09 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 18 Nov 2013 03:18:09 -0800 (PST)
In-Reply-To: <CAJTo0LZWNbMFA1ogn2W7dvxtXh31LovO9QbYKcQsGpTR7C6KCg@mail.gmail.com>
References: <1384773018.6460.202.camel@ted>
	<CAJTo0LZWNbMFA1ogn2W7dvxtXh31LovO9QbYKcQsGpTR7C6KCg@mail.gmail.com>
Date: Mon, 18 Nov 2013 09:18:09 -0200
X-Google-Sender-Auth: rEioduFx9cNruBSTEVupQOFKNsk
Message-ID: <CAP9ODKq9cOsVWxJ5GtTfO4g6ccOvrvAjzr_YT6S+CY6aUjVqcQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: DORA RFC: FILESOVERIDES in dora
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
X-List-Received-Date: Mon, 18 Nov 2013 11:18:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 18, 2013 at 9:15 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 November 2013 11:10, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> a) Revert the change in the branch. Anyone who adapted to the correct
>> behaviour on the branch would need to revert those changes
>
> As there hasn't been a .1 of Dora yet this only impacts people who
> have been tracking git, so I think it's probably best to apologise for
> this merge and revert it, on the grounds that it's a serious behaviour
> change.

I agree with Ross here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

