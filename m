Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1FC763E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 17:00:59 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so73623239pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 10:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=rkrHE/M17nTFyLujaxTITo9L42OgEm1/4LwbJpYz0K8=;
	b=I3Do0KXrzkJtjEtZeh5cBu3dP69ijeayjpH6YgVNhV08NsmDIGjKOTS26oo1OV6CS8
	soQfqpxWKBaxqIJ0FCcE3q9IyqUpCi/1eJS4XOR/vnJLGmHrAlbhPrm8Ar35O/fCSAec
	a55PnrI1NvvibnhzPLlUUZ0kppUb8YgHqGxB/3C686UogOHWqlShlWrDD86eLSx1Q+qG
	tzfcXG+Z0VuIvHb/cp6oZxf+jRnSeV0z6U+vqttCmqLpZGc+FpU8dNTVnwAp8lAFWbtH
	ES7KRHRjXrPQ0Je77YM9g4pI1bNu7efKV0gyinBSiQ4DLJfSbaaXv/IDe79SV/vkkN06
	TYmQ==
X-Gm-Message-State: ALoCoQm+KP+ozNVckNVt48vR3V0jsqYoqnNARFs4LI5BQLpS0he/XCrWA+QgwdyZ6wysRMudTSeb
X-Received: by 10.70.128.34 with SMTP id nl2mr83922787pdb.43.1438102859573;
	Tue, 28 Jul 2015 10:00:59 -0700 (PDT)
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com.
	[209.85.192.181]) by smtp.gmail.com with ESMTPSA id
	i10sm36159965pdr.78.2015.07.28.10.00.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jul 2015 10:00:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdrg1 with SMTP id g1so73743115pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 10:00:56 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.96.194 with SMTP id du2mr84098653pdb.108.1438102856480;
	Tue, 28 Jul 2015 10:00:56 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Tue, 28 Jul 2015 10:00:56 -0700 (PDT)
In-Reply-To: <1438091595.11208.10.camel@linuxfoundation.org>
References: <1438089822.11208.9.camel@linuxfoundation.org>
	<CAP9ODKpsscuNtP+S=zX6uM9sTiFRO8FyN3c9y-Fqr7xUr3B18g@mail.gmail.com>
	<1438091595.11208.10.camel@linuxfoundation.org>
Date: Tue, 28 Jul 2015 14:00:56 -0300
Message-ID: <CAP9ODKo6_GHSpb5NxmD_6giTfng5YpGoYbLUZ8=PURTDb9gK=Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] toolchain-scripts: Extend to cover nativesdk compiler tools (e.g. nativesdk-gcc)
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
X-List-Received-Date: Tue, 28 Jul 2015 17:01:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 28, 2015 at 10:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2015-07-28 at 10:28 -0300, Otavio Salvador wrote:
>> On Tue, Jul 28, 2015 at 10:23 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > This is needed when we add nativesdk-gcc/binutil to an SDK. Being
>> > present doesn't hurt in other cases.
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> Maybe it could use the environment-setup subscript to extend this?
>
> Not sure its worth the complexity of that to be honest...

The point, of doing it this way, is to have the environment script in
its canonical form and without unused code.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

