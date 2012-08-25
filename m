Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T5N2h-0007L5-C9
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 22:33:15 +0200
Received: by eekb57 with SMTP id b57so853975eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 13:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=q23759o8bDosjd6pmMIPIAqtKEXZNCgC2qf4xDfVa+w=;
	b=ElwKQWdmwHOA/AAy9RKScCjNkGPVbaXn3inrlOVinR8bPK8LJU1prarIZDq+7WfB05
	T7IEgcPgym4Wf8ZxUu0DVn8zgtPqm8G0enk61iCIAMaGwihT1Dbnh0oThvINe1g9d39v
	YxFUX16Yx9+BT/NREeZ1GK8/c8S29SP+Gv9r+QJxPQzhltk7DkUcNMVxMHYYMUUv4FGM
	4BwfQSIlJfB7Y3lvLhG/4oGW3+0AHM08No0b6YSF97OkzsgQbfHabkshZVwGiFobWWDg
	dtAXMrsDtEARcpnQv1GPLXzl8xMvIUv1RTvwrhcEkEd9TCKMEqUYN1HGSNmUcajQ6stc
	edqQ==
Received: by 10.14.202.66 with SMTP id c42mr12036778eeo.35.1345926065916; Sat,
	25 Aug 2012 13:21:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Sat, 25 Aug 2012 13:20:34 -0700 (PDT)
In-Reply-To: <1345895601.14369.103.camel@ted>
References: <cover.1345867875.git.tom.zanussi@intel.com>
	<65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
	<3BDCB1BC-7393-4B42-BE04-3BE9A8C90123@dominion.thruhere.net>
	<CAMKF1srk3toCstU+aL66uohw4CPmCZm6szB4f2qswkUsJjTr9g@mail.gmail.com>
	<1345895601.14369.103.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Aug 2012 13:20:34 -0700
Message-ID: <CAMKF1sp-tHRgygfmf=fOGdSXqJfN1N=znqkqRkGKm-qAHNxmow@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ia32-base.inc: new include file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Aug 2012 20:33:15 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 25, 2012 at 4:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2012-08-25 at 01:13 -0700, Khem Raj wrote:
>>
>>
>> On Saturday, August 25, 2012, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>> >
>> > Op 25 aug. 2012, om 06:34 heeft tom.zanussi@intel.com het volgende
>> geschreven:
>> >
>> >> From: Tom Zanussi <tom.zanussi@intel.com>
>> >>
>> >> This is the ia32-base.inc moved over from meta-intel.  See
>> meta-intel
>> >> for the complete history of contributions to this file.
>> >>
>> >> Here's the initial commit text that explains the purpose of this
>> file:
>> >>
>> >>  The meta-intel BSPs currently have a number of machine settings
>> common
>> >>  to all - factor these out into a common include file.
>> >>
>> >>  Also add several new intel-specific XSERVER variables for building
>> >>  XSERVER variables in BSPs.
>> >>
>> >> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
>> >> ---
>> >> meta/conf/machine/include/ia32-base.inc | 58
>> +++++++++++++++++++++++++++++++++
>> >>
>> >> +# glibc-related variables
>> >> +#
>> >> +GLIBC_ADDONS ?= "nptl"
>> >
>> > That's a distro setting
>>
>> And its redundant
>
> I thought you tried removing this and we ran into issues?

I did not but I guess someone else did and it
was seemingly because of these settings in meta-intel but I will try
to remove it once again and having this in OE core might be beneficial

besides, I think the name of file is misleading as Phil also pointed out


>
> Regardless, I think this is reason to have this in one place where we
> can clean it up. I tried to untangle the GLIBC_EXTRA_CONF bit that was
> here until recently and that was more painful than necessary needing
> patches to meta-intel and meta-yocto. If we get one good include file,
> we then have one place to clean this kind of thing up and it stops BSP
> layers having to do their own things badly.
>
> So in summary I think this is a reason to support this change :)
>
> Cheers,
>
> Richard
>
>
>
>


