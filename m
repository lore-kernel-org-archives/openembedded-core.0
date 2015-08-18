Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E4F8973E20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 11:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7IBSC8H003564; Tue, 18 Aug 2015 12:28:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ml414saBZNjA; Tue, 18 Aug 2015 12:28:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7IBRujH003556
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 18 Aug 2015 12:28:07 +0100
Message-ID: <1439897276.12105.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Aug 2015 12:27:56 +0100
In-Reply-To: <20150818111630.GB30532@jama>
References: <55C637DB.9010106@balister.org>
	<55C8956D.9080508@linux.intel.com> <55C8F83F.4010003@balister.org>
	<55C9F7F2.2060502@linux.intel.com>
	<CAMKF1soCEwGMkVfHsMzp3Wt49LKQusLC8jTrYygCSsBgjHZQQw@mail.gmail.com>
	<CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
	<CAP9ODKpXke_FaA_bSUtPSjqMKWtUsyU44qsm73KfZNrajfZrnQ@mail.gmail.com>
	<55CC588E.6030200@balister.org> <20150818090328.GG2458@jama>
	<1439892671.12105.35.camel@linuxfoundation.org>
	<20150818111630.GB30532@jama>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Tue, 18 Aug 2015 11:28:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-18 at 13:16 +0200, Martin Jansa wrote:
> Is it still true that autobuilder cannot test different sets of layers
> for different builds?
>
> It would be nice to see meta-gplv2 as separate layer, but tested and
> maintained as it is now inside oe-core (possibly with more help from
> outside especially if we can move some other recipes there as well).
> That way autobuilder can test meta-gplv2 layer only in non-GPLv3 builds
> and people who don't mind having GPLv3 components don't need to see
> "bit-rotten old versions" in proper oe-core.
> 
> I was suggesting the same for sato in OEDAM (core-image built without
> meta-sato in one autobuilder job, then sato-image with meta-sato
> included in separate job), but IIRC there were some autobuilder
> limitations which prevented to use metadata layers like this (which
> seems very sad).

I think things are improving in this area, it can handle simple layer
changes. That said, I'm nervous about touching the autobuilder config
too much as even simpler changes to the autobuilder configuration tend
to have issues which cause massive headaches trying to keep patches
moving. I don't think the shear amount of pain we're suffering at the
moment is particularly visible to people :/. 

Separating out sato from the core, particularly within the tests is
likely to be quite some work. Its certainly doable, the question is
whether its a priority with the resources available and to put it
simply, there isn't the bandwidth/resources.

It would also likely mean we end up building twice the quantity of
builds with and without sato which we simply don't have the autobuilder
resources for (or we accept testing cycles double).

Cheers,

Richard




