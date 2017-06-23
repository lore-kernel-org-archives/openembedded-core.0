Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3F8781C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 13:55:26 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id m77so30886180lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 06:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xcItDYdOG94mu+f5ZF4lqClt8J1BrBMeVWSKaOKfaAQ=;
	b=LR7iGmUGTDTS9cS3BoRTMCtx03VMZC8Flu0dcPl3hOHmtGSRu7nKmuJ3aF0L1evR4r
	sDFcnJeiyla5OuAcxjvWfCTUe+fKiPgJ8ulKIBchVcPOl9cunYle+Xc/K3W/pO4DjQXJ
	QxEDoUlNxmzC1cwcJGnqCmvfH1zMFt8EA2HQuv0Ix/DRdhum0xs9h94vUa0s2Jrl8WMo
	KBogtilNbnbS959LHjrb5M9Wgh/5Mf9staqmaEAT1xm7zPBbXn14yWy0jd2EFTXXS6Hn
	aOp6lBAdRLeGQRnFYL/4VvUrDelVw6VIExo9lyhMVbKANZZWM6n0AlTKdKE5yJqUZGgZ
	pD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xcItDYdOG94mu+f5ZF4lqClt8J1BrBMeVWSKaOKfaAQ=;
	b=pDod1ZlMzy7DKhBPZzDiQhFE+/+laehmgzbvdPBxKsxpceuriQqCes/6tzenBowqSr
	32nubqc7YEpwPKMbG6lQFhBIVzVeGNbE2GQP9XX17qV5vbfEddw7xTbWp/fQfMfvlyEm
	2mRuKYR0d3+DcAEndiLLnO4Ih4sTxpkarcpxBiajIiHzP6zVue1pYqs3gy3CM8irg5QJ
	p22x2zbbtZ9CwgccWVe6Hr63NpGdmNucRC66TYc2NWHAr9hhfhQ8uEDD+vYxkn70bS1r
	QJrJmmGaoNokhDjEVgyQjus6ghGqiFhM49lhNTbCyi5at3F6tYd41WkyKI30Vx3s+lfW
	ai9w==
X-Gm-Message-State: AKS2vOzRV2pzMeez6Flvyogvphd7DLiFETAquuup7Ehwp9Fifv6+iThZ
	Uxy/YJIur0SMDynknAmJSYvrJdgEDQ==
X-Received: by 10.80.139.229 with SMTP id n34mr2067749edn.127.1498226127179;
	Fri, 23 Jun 2017 06:55:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Fri, 23 Jun 2017 06:54:56 -0700 (PDT)
In-Reply-To: <1498225858.3451.20.camel@synopsys.com>
References: <a63a60dd-1000-0bf3-8fc1-5517b88e222d@free-electrons.com>
	<1498225221.24449.128.camel@linuxfoundation.org>
	<CAMKF1soMmyFoLUHyVpMPVYaQ+4avErAr7RqapArUzJrOE8wXcg@mail.gmail.com>
	<1498225858.3451.20.camel@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Jun 2017 06:54:56 -0700
Message-ID: <CAMKF1srrLnoqgQXeCS9ZprA44T1O6rXmnk6gqb9kEnvcrRitdw@mail.gmail.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "thomas.petazzoni@free-electrons.com"
	<thomas.petazzoni@free-electrons.com>,
	"antoine.tenart@free-electrons.com" <antoine.tenart@free-electrons.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: ARC arch support: uClibc status ?
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
X-List-Received-Date: Fri, 23 Jun 2017 13:55:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 23, 2017 at 6:50 AM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
> Hi Khem,
>
> On Fri, 2017-06-23 at 06:46 -0700, Khem Raj wrote:
>> On Fri, Jun 23, 2017 at 6:40 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > Hi,
>> >
>> > On Fri, 2017-06-23 at 15:23 +0200, Mylene Josserand wrote:
>> > >
>> > > We are currently adding to Yocto project the Synopsys ARC CPU
>> > > architecture, which is only available with uClibc library.
>> > >
>> > > We currently have a layer which adds the support of this
>> > > architecture
>> > > and uClibc support as it is, now, removed from OE-core.
>> > >
>> > > Many configurations/fixes are needed in OpenEmbedded-core's recipes
>> > > to
>> > > build successfully with this C library (library's dependencies,
>> > > autotools configuration, etc).
>> > >
>> > > We wanted to send patches to fix them but it seems that all uClibc's
>> > > references are now removed from OE-core, even in recipes:
>> > >
>> > > https://urldefense.proofpoint.com/v2/url?u=https-3A__patchwork.openembedded.org_patch_140943_&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFD
>> > > Dl656eViXO7breS55ytWkhpk5R81I&m=vXM6W0k4FOex1pzJnHfSDtrgw08G-uIiKgZJinDWFtI&s=wd0w1NqlVaNUjpgkDUqxfK2izS-a-XotxpeCqt3Mcro&e=
>> > > https://urldefense.proofpoint.com/v2/url?u=https-3A__patches.openembedded.org_patch_140906_&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl
>> > > 656eViXO7breS55ytWkhpk5R81I&m=vXM6W0k4FOex1pzJnHfSDtrgw08G-uIiKgZJinDWFtI&s=4Y1JNumo1mAFnPDzX2CaFZw9gfkSF2TJa_vIGO8A9yA&e=
>> > >
>> > > What is the status of it? Remove entirely uClibc from OE-core?
>> > > Could you give us advice on how to handle uClibc?  Should we create
>> > > a
>> > > "meta-uclibc" layer which adds support of it + bbappend for all the
>> > > OE-core's recipes that currently fail because of uClibc's
>> > > misconfiguration?
>> > >
>> > > I guess that there is no plan to add uClibc's configuration in OE-
>> > > core's
>> > > recipes (even without uClibc itself), right?
>> >
>> > We dropped uclibc from OE-Core around a year ago in favour of musl
>> > since it seems to work for all the use cases we've been aware of from
>> > our users and nobody was willing to maintain it.
>> >
>> > Since then the uclibc overrides and other pieces in core have bitrotted
>> > to the point it was clear nobody was actively using or maintaining
>> > them. I therefore proposed some patches removing them, those were
>> > agreed by several developers and no objections were seen. We therefore
>> > cleaned up the remaining pieces.
>> >
>> > I believe that we have enhanced the extension mechanisms within the
>> > core such that a meta-uclibc layer would be possible now, even for the
>> > site files and insane.bbclass mappings and so on. It would need to add
>> > some of the extensions removed from the core and then it should be
>> > buildable again.
>> >
>> > If you can't make anything work from the layer let us know and we can
>> > try and figure out a way to solve that. I don't think the uclibc pieces
>> > would be coming back into OE-Core any time soon though as whilst it
>> > does have some niche markets left (e.g. arc), I can't see it being
>> > widely used by the majority of OE users/arches.
>> >
>> > (As an aside I haven't looked at it at all but does musl support arc?)
>> >
>>
>> I dont see arc support in upstream musl, It could good if it was there
>> since that could unleash whole OE on arc architecture. We can do
>> successful world builds on musl much like glibc now a days.
>
> Indeed there's no musl port for ARC [yet].
> But we're almost done with glibc port and it looks like we'll need to switch
> to glibc for OE/Yocto which I believe is doable.
>
> I guess glibc is still the first class-citizen in OE, right?
>

yes that is right.

> -Alexey

