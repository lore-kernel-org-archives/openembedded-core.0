Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 70E8061222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 19:26:23 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id uz19so9163318obc.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 12:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=uA2/E2MEJTaoLNZxKbf0sheHOYxbLVnfLt9UK7gfNh8=;
	b=zdn8NoyksOV5k8LCaK/1IksNESJmPVKVwy9jRZv5ENux80ytYIWGcBx+Ck4YivESQT
	14MIeqaaTd1tMyEdxON2zzcrzmj9utGkO6bvt6krhT0TXD3LVvTwY2L6fabRxNK5O2Pj
	JENwx/JfdnENH6rqvOWxh5scsX56hV5oEctw+lstyt3mRPE/bVElPQfNVfPsI4r8v9B/
	qLYDZxiGXQdrgbIZ/uH3Zy4xqlg5dQYmP84Jf3HbXrQrE3F9pPRhx/VCBfZ74TzG6k9j
	xnCqCibEvr1GntPrk+QK6KyBr4ycZQfjJ9nks34LNc0rNdqSwO2OXnafPJNSEmr5/s0s
	+tMg==
MIME-Version: 1.0
X-Received: by 10.60.133.233 with SMTP id pf9mr546261oeb.46.1376335583597;
	Mon, 12 Aug 2013 12:26:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 12 Aug 2013 12:26:23 -0700 (PDT)
In-Reply-To: <5208EA00.5010505@boundarydevices.com>
References: <1376257018-17066-1-git-send-email-eric.nelson@boundarydevices.com>
	<1376291285.27470.33.camel@ted>
	<5208EA00.5010505@boundarydevices.com>
Date: Mon, 12 Aug 2013 16:26:23 -0300
X-Google-Sender-Auth: g6N687VrXek20F7jgcI_qTv__H0
Message-ID: <CAP9ODKqf=FhdAzq1q_Dj1Hppcub9C4aGyYGGt587or-7fOmcdQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Eric Nelson <eric.nelson@boundarydevices.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, denys@ti.com
Subject: Re: [PATCH] nativesdk-qt4-tools: remove nativesdk-libx11 for qt-embedded
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
X-List-Received-Date: Mon, 12 Aug 2013 19:26:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Eric,

On Mon, Aug 12, 2013 at 10:58 AM, Eric Nelson
<eric.nelson@boundarydevices.com> wrote:
>> I'm afraid we can't do this since you just broke any other kind of
>> override which might get used anywhere by any recipe using this .inc
>> file. I'd also be wary of adding something as simple as "qt" into
>> overrides since it can match things more widely than you might want.
>>
>
> I'm a bit of an OE n00b, and I'm not quite sure how to express this
> conditional.
>
> meta-toolchain-qte shouldn't depend on nativesdk-libx11, and I'm
> not sure how the dependency can be moved to the X11 recipe
> recipes_qt/meta/meta-toolchain-qt.bb.

I think you're looking for to:

http://privatepaste.com/cc22a68c56

The missing part for merging it is to /force/ it to be disabled in qt
configure. This was last Richard complain about this patch when I sent
it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

