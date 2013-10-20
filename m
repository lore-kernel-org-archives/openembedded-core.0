Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4955C6D1BD;
	Sun, 20 Oct 2013 22:22:28 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id ar20so9928902iec.26
	for <multiple recipients>; Sun, 20 Oct 2013 15:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=F44BHw2vWHTaZ8/vYTPUTGJaveD5qx6aTcwJtp3sAuE=;
	b=UPLTe59MaLMsXMpcgsmlBePbxt9hNMHtXQdk03G1uRxoNdZ2aJ5ueAb5dbYX2ygjDO
	MS+cLmSHW4nUoDXZ7iLZjVyDwSSqHJaufJSu6Pt0dWfaVs+3T9Ri1qItd7EZbeyZmiUY
	dw00QH8s9PE9mI+nUQpHRkSOw9J1Kp7epxBydIQ1Cef29gjqS6+W7RqReotliUPQc/r6
	IxT1QKEWqrYQ3hYQ5oO0LLAHppXLa9mCxNr7OHBpABrYO9+/hF9QmV8Fx/+LUe4TgajX
	gSAzCM3fg7chVFf83RUp6O7g0psgf3yugwTODdfukeZWz7TKMXVYH83SyiUvCMWzq7sZ
	dNMA==
X-Received: by 10.50.22.67 with SMTP id b3mr7161654igf.39.1382307749910; Sun,
	20 Oct 2013 15:22:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.5.225 with HTTP; Sun, 20 Oct 2013 15:21:59 -0700 (PDT)
In-Reply-To: <20131020130402.GA29181@jama>
References: <CAMKF1sonakYiB++QeeeXKVztx+7CKW3zn=ndn=kP+kSVmqu3Qw@mail.gmail.com>
	<20130919120202.GK7313@jama>
	<19D9595C-FE9E-4E24-B249-D32F62F25EA2@gmail.com>
	<20130920114815.GI18414@jama> <20131020130402.GA29181@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Oct 2013 15:21:59 -0700
Message-ID: <CAMKF1sph7dRoMguO1FUPyWT1OBsoeWi2tSYR2ZYgsMohPwirfg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: patchwork updated
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
X-List-Received-Date: Sun, 20 Oct 2013 22:22:28 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 20, 2013 at 6:04 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Sep 20, 2013 at 01:48:15PM +0200, Martin Jansa wrote:
>> On Thu, Sep 19, 2013 at 09:11:50PM -0700, Khem Raj wrote:
>> >
>> > On Sep 19, 2013, at 5:02 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >
>> > > On Sun, Sep 15, 2013 at 12:32:44AM -0700, Khem Raj wrote:
>> > >> Hi All,
>> > >>
>> > >> The patchwork has been updated to latest. Please keep an eye if you
>> > >> see something non working let me know immediately.
>> > >
>> > > Hi,
>> > >
>> > > something is wrong,
>> > >
>> > > http://patchwork.openembedded.org/user/bundles/
>> > >
>> > > returns 502 Bad Gateway for me and I cannot access individual bundles,
>> > > which is very bad, because all oe-devel patches are separated into
>> > > bundles based on layer.
>> >
>> > OK. I have created a local fix for it and also started a discussion on patchwork ml
>> > bundles should be visible now. Let me know if there are further issues.
>>
>> Thanks for quick fix, it works for me now, but maybe not for others
>>
>> Bundles main page
>> http://patchwork.openembedded.org/user/bundles/
>> as well as user bundle (this is "in-test" bundle)
>> http://patchwork.openembedded.org/user/bundle/79/?archive=both
>> work now, but public link for the same bundle
>> http://patches.openembedded.org/bundle/jama/in-test/
>> shows 502 Bad Gateway
>>
>> Can you check that your local fix can be applied in last link as well?
>
> Khem, can you please look at it? I'm trying to get layer maintainers to
> check and cleanup their bundles, but that doesn't work for them now.
>

hmm OK when I have reliable internet I will try to look into it

> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

