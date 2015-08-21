Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 38E99766DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 01:17:44 +0000 (UTC)
Received: by iods203 with SMTP id s203so66286334iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 18:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VNRgUuJI4jQ2/cS0Gjz/5BcdyHI28neElw5oQwJGFlc=;
	b=rvMYljYKuKZkP19VTlvUNSCJvqocRytGYf8teSRN1XDRYiOwmrJKmmJoS4kaxDe/CL
	YPfrDIaiuI2YNFSrt6JRoZ1523DFjjCe5Y1p2SUQ09bZpPgUBG2fQGaOg1Nico4wBcPV
	tpDNP9xtayoRFN/RdxivXM52mO1zIl+w4+Nac9X6iF7uozqMdiOESPotpa8C9orZkaYn
	/1dJ0j+xKyYODV3tj9N+rgwkXjsXC+SGwhq025CeSsMRErF15tmaFylgFxeVmmhJmVP+
	QGcfu82X9nVdfe9Uprsa7IEI0g92obIYh40la2v+KRdVJoDjITwQGUrQP97+ArVojf5y
	+1qA==
X-Received: by 10.107.14.203 with SMTP id 194mr6130164ioo.195.1440119865119;
	Thu, 20 Aug 2015 18:17:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 20 Aug 2015 18:17:15 -0700 (PDT)
In-Reply-To: <55D5D076.5000106@balister.org>
References: <1439787800-21088-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LZRWXQOc+SCbL1PeJ9QXn_9WHKDC3y6t+QpJ8-_689Y6w@mail.gmail.com>
	<5402FBA9-07E4-47CF-983E-E8778B5AE2F6@gmail.com>
	<CAJTo0La4nHiHRLzraJdmO1AMSZ9RJGi=WSZAemrcGPFZTsoXrg@mail.gmail.com>
	<CAMKF1soxndfF7OLyAx-c49WBDdLhbbecQhxSj7ixeo2hFsRcTA@mail.gmail.com>
	<55D5D076.5000106@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Aug 2015 18:17:15 -0700
Message-ID: <CAMKF1sqfGP1VGefHU_HRBSZnF=UikHZcs=b9sO92PO5v5TBaBQ@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4 V2] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Fri, 21 Aug 2015 01:17:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 20, 2015 at 6:04 AM, Philip Balister <philip@balister.org> wrote:
> On 08/19/2015 10:21 PM, Khem Raj wrote:
>> On Wed, Aug 19, 2015 at 12:55 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> On 17 August 2015 at 16:41, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> There are many reasons, for me its overlay support for systemd-nspawn,
>>>> networkd has got many new features that is now usable w.r.t. IP forwarding,
>>>> vxlan etc.
>>>> and it has many bug fixed in those 2000 odd commits since 219, no
>>>> different then any other package upgrades we do in general it keep the
>>>> upgrade workload lower as we roll the releases.
>>>> Any specific concerns ?
>>>
>>>
>>> Can we get an updated patch with a clearer commit log?
>
> I've also heard that as systemd evolves, more binaries are getting added
> to the base package that should be packaged separately for people
> interested in small images. I do not have personal experience here, but
> wanted to pass along the feedback.
>
> We should look at buildhistory packaging differences when we do upgrades.

Here is the diff between files in 219 and 224, if you want to know
more I can paste more info just let me know.

https://gist.github.com/kraj/2a066973a5e5cf83ed24

sizes have gone up on daemons, no new daemons besides some new service files
and scripts are added

