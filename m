Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SaVkh-0000Ia-Qz
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 19:35:07 +0200
Received: by yenl13 with SMTP id l13so1996328yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 10:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ci826V5clpi/lPMQbh+Z/Js/8Owadrq0brU9zoxyovk=;
	b=gpcD+N7RC0B7fcpjvQ05M4K+90VVoUPWV2TlUFX7fbFs2F906z/fd5lqFo1QfkW08M
	JtskgtnYwdb8JJTblrgjS36Wpa86nEKd/SGMp8GUzIVyazwFTVMn0nE/yMPmQDdlND8E
	vCqlfsOB+PbVnlZ/OneH/agJu0u74obpAOGDnquMTj6xJifJe6lFMbhmcKcnrOB91aGR
	QC67W7B7pc6pty3sKQ89JK2PsCCtUxmLj986HgAl4J2NoxRGoDAqqc6/0uFReCFkkoF/
	vtqwPCFiCZT+8Cics7HI9em/MK2cd5q6H+Y/e8v6N6f/s1kvuh1cyF2LiU4KLWFhu5ot
	BkdQ==
MIME-Version: 1.0
Received: by 10.50.149.170 with SMTP id ub10mr2475783igb.38.1338571485542;
	Fri, 01 Jun 2012 10:24:45 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Fri, 1 Jun 2012 10:24:45 -0700 (PDT)
In-Reply-To: <2064973.GX7QB0lz6B@helios>
References: <1338462765-18412-1-git-send-email-schnitzeltony@googlemail.com>
	<1338462765-18412-2-git-send-email-schnitzeltony@googlemail.com>
	<2064973.GX7QB0lz6B@helios>
Date: Fri, 1 Jun 2012 19:24:45 +0200
Message-ID: <CALbNGRR3QYjbSywG93Rv+-ocfSThijVAtMwK0orSDQvZGrjr5w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [V2 2/2] buildhistory.bbclass: add pkg_pre/postinst/rm contents
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2012 17:35:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 1, 2012 at 6:54 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> I'd still like to rework this to use separate files. What if a line in the
> postinst script includes an = (which is not unlikely)?

Yes after first usage (it is not possible on all my machines due to
pythongit version) and taking a look into the parsing scripts I now
understand your concern. It might cause non predictable results. Worst
case if there is a oe varaible name used in scripts. One question:
when outputting into separate files: isn't there a simple way to
attach the raw git diff output for these (maybe as option) in the
results of buildhistory-diff? Then we would have all information
together under one hood.

>
> Note that I'm happy do the reworking myself, I just won't be able to do it
> until the week after next.
>
Thanks. Until then I have my version :)

Andreas


