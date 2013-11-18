Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 763FC6D8C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:11:32 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id hu8so3867161vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 07:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=SoTd826H6JPX3XB15IZ5DdkWksZ4h0Hnj3m59GilTEU=;
	b=Oo6ER70ijfoPIzGv+8obXPR9g0DDnXPwJZbjnzzzRGihqbfs26QR11EpBihYA/oStU
	T6z8Pum+7tsyMXOfAqIc4RPk/wuQIr5ZGdZ+VuJfNheD2OyUKA0MmJKfKusXnG/xjhtA
	aPENcBhv72x7I+xmIpGohNpu0jwLqa+5U5OKUgKtrMHcKvp1NOgRAKnbVd0kZDFl+zIf
	3+T8ExbA9DUAPs0HQewaUgeUA4bphefdMEwaDlshisM6s7S3dOADfb6cGaVb4gA2uQOu
	bPV+hYOMcGDNsy6ovAzivy1Qe50ZrwbQNLHp+k0Somx0C7+Ktg/Yj+6K7kwcnkjeKJwB
	KU5w==
X-Received: by 10.58.168.205 with SMTP id zy13mr16181462veb.19.1384787493539; 
	Mon, 18 Nov 2013 07:11:33 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.49.71 with HTTP; Mon, 18 Nov 2013 07:10:53 -0800 (PST)
In-Reply-To: <1384776180.6460.218.camel@ted>
References: <1384776180.6460.218.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 18 Nov 2013 15:10:53 +0000
X-Google-Sender-Auth: pyIzzxXT7y4XBD_c-5_eMqGWgRg
Message-ID: <CANyK_8eV7QDcCMboBYMzQ0EMsvkdLaOmhc3E1e6Oonk-j1XWLQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg in svn?
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
X-List-Received-Date: Mon, 18 Nov 2013 15:11:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 November 2013 12:03, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Hi Paul,
>
> Looking at opkg, I did have one other question. Currently in most builds
> we build opkg (either as the package manager or at least for
> update-alternatives). opkg is in svn but its one of the few remaining
> components we use from svn. It means we have to build subversion-native
> which has a fairly long dependency chain. It would be nice if we didn't
> need to so is there any chance we can move opkg to git?
>
> An alternative would be to have good tarball releases we could use
> instead?
>

The answer is yes to both of these. In my queue of patches to oe-core
which I'm currently testing is an update to the opkg-0.2.0, downloaded
as a tarball instead of from svn.

I'm also trying to organise git hosting for opkg within Yocto Project,
I think I'm waiting to hear back from Michael Halstead on a couple of
questions.

It's just a bit slow going as I'm very busy with other work at the
minute. I can send the patches I have as RFCs if someone else has time
to test them - I know opkg-0.2.0 builds correctly, I just haven't had
time to generate a package feed and try to do a live update of
something on a real board running opkg-0.2.0. It's on my todo list but
it may be a few days or weeks before I find time to test this out.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

