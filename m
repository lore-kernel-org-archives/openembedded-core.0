Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RwzXW-0001zx-QP
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 18:18:11 +0100
Received: by lbol12 with SMTP id l12so2653314lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 09:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=8GO57gOvA/84VrkUjZdc2YsuXuNTHY6nxAYs2eLVQ9Y=;
	b=SDMRJYVMALBzS+ADhWIsfzpelnTcemT+/SiHk4v4yHXwJljhl9X7eQkwbBjTei2Bsh
	0C1/8/pMZ3vN2mczcDXBZF36zHvvfj3KM7K5U6YmXcp/WRfPiT6I4cfi85TcF2DB2Fse
	xuAoFYkg93WfKGyCjajIRAENMeCehiQ3iNBSo=
Received: by 10.152.128.230 with SMTP id nr6mr9703150lab.27.1329153001032;
	Mon, 13 Feb 2012 09:10:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 13 Feb 2012 09:09:30 -0800 (PST)
In-Reply-To: <1329147596.14363.90.camel@phil-desktop>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
	<20120213074852.GA3832@jama.jama.net>
	<CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
	<1329147596.14363.90.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Feb 2012 09:09:30 -0800
Message-ID: <CAMKF1sq3CedFnobWnYdDZziUp8JmsxwC7eQd_NxeG=38NMuu+g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Mon, 13 Feb 2012 17:18:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2012 at 7:39 AM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2012-02-13 at 05:23 -0800, Steve Sakoman wrote:
>> We need to find a way to prevent or warn of disruptive changes like
>> this zlib patch.
>
> Aren't these sorts of things meant to get tested on the Yocto
> autobuilder before being merged? =C2=A0I thought that was how it was supp=
osed
> to work.
>

The patch takes care of packages in oe-core but essentially
relied upon layers to consider the update and I also posted a script
that would help in identifying
recipes which need updates.


