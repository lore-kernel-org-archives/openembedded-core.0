Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43BAA60FC6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 21:29:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4TLTjF5016628
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 14:29:45 -0700 (PDT)
Received: from msp-dhcp16.wrs.com (172.25.34.16) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 29 May 2013 14:29:45 -0700
Message-ID: <51A67348.9020709@windriver.com>
Date: Wed, 29 May 2013 16:29:44 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1369835496-20815-1-git-send-email-mark.hatle@windriver.com>
	<20130529143740.GL3192@jama> <1369838840.14887.220.camel@ted>
	<CAP9ODKp1Tu3HXXz-4qOBQa1oY_r338keLFvvP6rZRf+aTyHtxQ@mail.gmail.com>
	<1369862668.14887.236.camel@ted>
In-Reply-To: <1369862668.14887.236.camel@ted>
Subject: Re: [RFC PATCH] base.bbclass: Deprecate the PRINC logic
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
X-List-Received-Date: Wed, 29 May 2013 21:29:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/13 4:24 PM, Richard Purdie wrote:
> On Wed, 2013-05-29 at 14:00 -0300, Otavio Salvador wrote:
>> On Wed, May 29, 2013 at 11:47 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>          On Wed, 2013-05-29 at 16:37 +0200, Martin Jansa wrote:
>>          > On Wed, May 29, 2013 at 08:51:36AM -0500, Mark Hatle wrote:
>>          > > Background:
>>          > >
>>          > > At the recent TSC meeting we were discussing ways of
>>          removing the PRINC
>>          > > in favor of the PR server, which should now be standard.
>>           The first step
>>          > > in this process is coming up with a simple patch that
>>          declared PRINC as
>>          > > deprecated.  If this type of patch is successful, the
>>          block of code could
>>          > > be replaced with a bb.error eventually.
>>          > >
>>          > > It is not expected that this patch will go in by itself,
>>          but instead
>>          > > should be coordinated with changes to the recipes in
>>          common layers such
>>          > > as openembedded-core, meta-openembedded/meta-* and other
>>          community layers.
>>          >
>>          > This doesn't say what's the process of getting all PR
>>          increments
>>          > applied.
>>          >
>>          > Should we send list of recipes and required PR increments
>>          per layer (and
>>          > someone will sum these increments and create actual PR bump
>>          from it). Or
>>          > will we take turns and send actual PR bump patches per layer
>>          and someone
>>          > will define order of layers to go in (so that we prevent
>>          many conflicts
>>          > while merging)?
>>
>>
>>          This is something we need to figure out. The realistic process
>>          is
>>          probably do this layer by layer. If we can batch some up
>>          together that
>>          would obviously be better...
>
>> If this is the case, to ensure we have the PR in sync we should have
>> it PRINC as a bb.error; this will cause some pain but will avoid
>> PRServer picking the layer PRINC and losing it in next build. Or does
>> PRServer handle this gracefully?
>
> I proposed this but other TSC members didn't like the approach and would
> prefer a grace/warning period, maybe spanning until after the next
> release.
>
> I can see the arguments both ways...

I prefer the warning for one release approach.  What I'm afraid will happen is 
oe-core is released in the Fall, and a group of users migrates to it from the 
last release and suddenly all of their layers break.  These are the people who 
do not keep up with day to day development.

With the warning, they won't be immediately blocked -- but will be sufficiently 
annoyed (and warned) that they need to fix something or it will break.

--Mark

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


