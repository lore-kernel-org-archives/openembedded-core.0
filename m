Return-Path: <zboszor@pr.hu>
Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
	by mail.openembedded.org (Postfix) with ESMTP id 18E98601D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 10:10:33 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1ebOCP-0008Ls-KZ; Tue, 16 Jan 2018 11:10:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YmDnVzpf353iScUOpeOmOXRgJInUDM4eq7iO01xvlt8=;
	b=bc00BfTwqDzqmVVyoBZ5dWl3i6
	OHaS44C8mFoEyLTYTRw/ENQ5v2VMyCffL2ZnptySGMkQ0eUJM1xhKvhbFn9Hr9IFRtvthtCEpzpGe
	RiLCSPlK1COFXHKDX2yKY9Hqhae0J3IdoGy0I39ahhH+Q851ytQgCHqOfysFiO5jwZDugU7wy0T9z
	F1oFC7IqQjyQmOn6RsYXHncDYCxH7h/MkX1z3VhtSzQC9T4/nI3gvHBfyaZe1wsF6Pen2GwMnFCh5
	BM6TnWdqd59R4T7fyHEbxDnpc5NabHzsP6CH+ZKJ6EorPujtygfJh+FsvMWsBwjIs9dx2PdPy+bHK
	Gp0HYpNg==;
Received: from host-87-242-32-111.prtelecom.hu ([87.242.32.111]
	helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1ebOCK-0000g6-H0; Tue, 16 Jan 2018 11:10:31 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20180112134659.5793-1-zboszor@pr.hu>
	<1515929241.29722.212.camel@linuxfoundation.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <41f084d6-ed15-9e5a-c084-5d2dc9911f7b@pr.hu>
Date: Tue, 16 Jan 2018 11:10:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515929241.29722.212.camel@linuxfoundation.org>
X-Spam-Score: 2.3 (++)
X-Spam-Report-Back: Spamchecker on "prspamd4.pr.hu" has DOESN'T believe this
	is spam.
	pts rule name              description  (score: __SCORE__ points)
	---- ----------------------
	--------------------------------------------------
	-0.2 ALL_TRUSTED Passed through trusted hosts only via SMTP
	3.5 BAYES_99               BODY: Bayes spam probability is 99 to 100%
	[score: 1.0000]
	0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
	[score: 1.0000]
	-1.2 AWL AWL: Adjusted score from AWL reputation of From: address
	Preview: 2018-01-14 12:27 keltez__ssel, Richard Purdie __rta: > On
	Fri, 2018-01-12 at 14:46 +0100,
	B__sz__rm__nyi Zolt__n wrote: >> When downgrading
	a package or using a substitute with lower version,
	>> the way to do it is
	adding or increasing PE and there may be other >> reasons to set PE. >>
	>>
	But it doesn't directly help dependant packages because the shlib >>
	records
	only contain PV. >> >> Let's add the PE value into the shlib records
	for
	packages where >> it's set. >> >> The in-memory variables storing the
	versions
	now use the PE:PV >> notation but the on-disk files must use something
	else
	because >> the : character is already used as field delimiter in the >>
	package.list
	>> files storing the shlib records. Use # instead in the files,
	>> so the
	file format doesn't change. Conversion occurs on reading >> and writing
	the
	package.list files. > > Can you explain a bit more about why/how this
	causes
	a problem? > > PE is needed to maintain consistency of package feeds
	but
	the shlibs > code is primarily used for build time dependency analysis
	to
	figure out > which packages need to depend upon what and ensure runtime
	dependencies
	> are met. I'm not sure that should care about PE. [...]
X-Scan-Signature: 9a146a30ee28b718ea4c667455323329
X-Spam-Tracer: backend.mail.pr.hu 2.3 20180116101031Z
Subject: Re: [PATCH v2] package: Record PE and PR values for shlib dependencies
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
X-List-Received-Date: Tue, 16 Jan 2018 10:10:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2018-01-14 12:27 keltezéssel, Richard Purdie írta:
> On Fri, 2018-01-12 at 14:46 +0100, Böszörményi Zoltán wrote:
>> When downgrading a package or using a substitute with lower version,
>> the way to do it is adding or increasing PE and there may be other
>> reasons to set PE.
>>
>> But it doesn't directly help dependant packages because the shlib
>> records only contain PV.
>>
>> Let's add the PE value into the shlib records for packages where
>> it's set.
>>
>> The in-memory variables storing the versions now use the PE:PV
>> notation but the on-disk files must use something else because
>> the : character is already used as field delimiter in the
>> package.list
>> files storing the shlib records. Use # instead in the files,
>> so the file format doesn't change. Conversion occurs on reading
>> and writing the package.list files.
> 
> Can you explain a bit more about why/how this causes a problem?
> 
> PE is needed to maintain consistency of package feeds but the shlibs
> code is primarily used for build time dependency analysis to figure out
> which packages need to depend upon what and ensure runtime dependencies
> are met. I'm not sure that should care about PE.

See my mail about describing the use case at
http://lists.openembedded.org/pipermail/openembedded-devel/2018-January/116291.html

Practically it can prevent proper dist-ugprade because
library package dependencies can be installed later
than binaries requiring them. If this happens, running
any binary may crash in the pkg_postinst scriptlet.

My use case was the eglibc_linaro-2.19 -> glibc_2.24 transition
but any upgrade where the package already has a PE value set
may be in the same situation. E.g. glib-2.0 1:2.48.2 in Morty vs
1:2.52.3 in Rocko.

A bbappend file can also modify PV. In case PE is missing from
the shlib deps, you can even end up with the same situation
in the same distro with extra layers.

> For PR, again its primarily for package feeds so that updates are
> detected and I'm not sure why the shlibs code should need to care about
> it.

Besides PE, it is also better to always ship libraries and
binaries from the same build, i.e. with the same PV-PR value.

Such an example is e.g. util-linux with util-linux-mount and
libmount1.

The above described situation may occur if a patch is backported
that adds a new library function which is also used at the same
time from binaries in the same patch. All without increasing
the actual package version. This may be a rare case but I am sure
it is not without an example in Yocto. I am not sure if a recipe
review enforces changing PR in this case, though, but it should.

> Perhaps if you explain more about the issues you're having which this
> fixes I'll better understand the problem/need.

I think I just did.

Automatically relying on the full [PE:]PV[-PR] (note the optional
parts which are also done automatically in the patch) adds even
better consistency in the repo and upgrades can be done in the
correct order.

Upgrades should even work if I just cherry-pick some upgrades
but not all, i.e. "opkg upgrade <something-using-glib-2.0>"
should pull the libglib-2.0_0 version it was built with which is
not happening now because the library dependency is only (>= 2.52.3)
in Rocko but 1:2.48.2 from Morty satisfies it.

OPKG 0.3.x has a dist-upgrade mode and Rocko also introduced dnf,
so I assume at some point a proper distro upgrade will get supported.

Best regards,
Zoltán Böszörményi

