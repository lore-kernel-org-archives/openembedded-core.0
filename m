Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8E774A13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 19:09:20 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 128-v6so4232445vkf.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 12:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zpmHqosSIeGWiXENRQUfGNQ60rO3POh9G0ULaNoghtw=;
	b=I/Tag/RvIWRomy2uxDjIbAB8OdllI8TMgMpJEU0h6hXP3DnaIB1KzKBA2PY/2O4itU
	1amujpCPK9ZCvdHPC6ZFaBAyKRjKt7y1FgsQSRHxvvCHM4CTPcF0tVhpOnUefN1wYxj9
	RAyXO5qojgYU2+6FJgffXIswU48qOW/4LcsvCO3lRzQgBGi94U6rLc0Y3u4soNZl2bpd
	qHmIHcSurTNPEO3p1TSolCcJMgR97AL8stA+gxVM8upBdBvHeeGE2BOMIEY6IRhdNiyj
	BmIEIPYe5LoD8bM8yqzK3fMJBulOU/fTU+scbTYfKQKU4Wh67gwVPBW7JskgqyXTrldl
	6T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zpmHqosSIeGWiXENRQUfGNQ60rO3POh9G0ULaNoghtw=;
	b=FdUREX+dRw+bygJ9FLvofjLnju2fFkanF+RmDkEl+XEh813Kyb9dMPCc/HPZ+Fy9ms
	Bfjnz+en+Wtl0vHSLIVY0h6mXxbG6eSt6vGW7EhJrFZtaPq6bJddMIQB2ds7NQc6dryZ
	f3WmB/cSDj1HF17C5m9ccI7n5NntlEz23zLw63uMN7oKfeNRJV0eKiMGAd0iOJ6lOhzC
	QElgeRmQ379dK2aDElp48xrwZDXPU/BkYqhAjL0ErKvZr3PU7Q+faGci+PzaBf9A5et4
	tShdKwib41CdEgrLNrx2JOpiiV2zhEoiSLNimKRQdAE5I4bzmXJSHuyUecajNnIO8Xlq
	VgUw==
X-Gm-Message-State: ALKqPwd8nSBsIbxhzk69n2mwKPn4zRw06XsofhKQXOscMi2Iqmm2K0EK
	FA3QFnqXy5aRVVYS6JvqvxVCpHxff7TijGsalhM=
X-Google-Smtp-Source: ADUXVKIG2zxJW+MlscGpNh7lxu/CPb2HMt+mLyljXJmfpFiwWWeZ/foWKVpn0aBgikgPlUgxPr404PbmYxYVumjWb/Y=
X-Received: by 2002:a1f:3451:: with SMTP id
	b78-v6mr10622285vka.2.1527620961155; 
	Tue, 29 May 2018 12:09:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 29 May 2018 12:09:20 -0700 (PDT)
In-Reply-To: <1527620176.16911.114.camel@linuxfoundation.org>
References: <1527215248-7224-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1srvQZ7z3xYaNJU9M_QQNq+pBFftSrJNBWwhcXQp0XDQPw@mail.gmail.com>
	<CAJ86T=XdWPKG+EURX35cgpxbOL6FetzKdoND+=aXte1MPcxdtw@mail.gmail.com>
	<1527620176.16911.114.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 29 May 2018 12:09:20 -0700
Message-ID: <CAJ86T=WnroCLGfjxYckS=HHXQ+dyG8Wg_YnYRwu2T+bNx=kPHA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dropbear: drop obsolete patch 0004-fix-2kb-keys.patch
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
X-List-Received-Date: Tue, 29 May 2018 19:09:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 11:56 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2018-05-29 at 11:26 -0700, Andre McCurdy wrote:
>> On Tue, May 29, 2018 at 10:29 AM, Khem Raj <raj.khem@gmail.com>
>> wrote:
>> >
>> > On Thu, May 24, 2018 at 7:27 PM, Andre McCurdy <armccurdy@gmail.com
>> > > wrote:
>> > >
>> > > This patch has been obsolete since 2005:
>> > >
>> > >   https://github.com/mkj/dropbear/commit/736f370dce614b717193f45d
>> > > 084e9e009de723ce
>> > Seems fine to drop but I would like to understand why we carried it
>> > thus far.
>> > What is the history of it in OE ?
>> It's older than the git history in oe-core (ie it was added in August
>> 2005 as part of the first commit to oe-core).
>>
>> The patch looks like it was initially created in March 2005 against
>> dropbear 0.45.
>>
>> In 2011 someone (incorrectly) added a tag "Upstream-Status:
>> Inappropriate [configuration]".
>>
>> That's about as much history as we have.
>
> Looks like it was added for 0.44:
>
> http://git.openembedded.org/openembedded/commit/packages/dropbear?id=ed6e40d6aff6cffabeff6f7fd6a9fee062566b2c
>
> and there was some associated discussion:
>
> http://familiar.handhelds.narkive.com/b1VGg2bI/problem-w-dropbear-ssh

That discussion ends with Matt Johnston (the dropbear author) saying
he will make a change in the next release to set the key size at
run-time rather than relying on a hardcoded maximum... which is
exactly what he did.

> so remote systems with 2048 length keys were somehow causing it
> problems?
>
> Cheers,
>
> Richard

