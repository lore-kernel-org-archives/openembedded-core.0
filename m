Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TGXtm-0008Kz-7a
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 18:22:14 +0200
Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 25 Sep 2012 09:09:09 -0700
Received: by pbbro12 with SMTP id ro12so367243pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 09:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=wh3urhBP+HxHX22sDWx81keLcmYL7fRlgVtLWIIegF8=;
	b=llh9blJE2hkMzI6AUl9ghcoWtqj/TrnIu4gQrKrxCs8+kopuQxRaMFMZg0zbE1TNsG
	JUiOOI+CQ8TBmw4L7e+qT/Wa4l7efxfsdqHeMZ4qDrIZtZJv9WCpnuMz7WK4z29BXzjD
	oDmE9OCJS6FlNCNZE/dXrZqfo8dGMrtVsmSyyny66bUoTL0SGSHVB2MP8d3rzSogucJQ
	0mLr60f05MEVPDjnAc3yU8hNYTHr8TujC2EjCB3mZf1VMk7jHB6hTmtDjlECS9VNp7Uf
	IuraJdVWSEqVli8N3kkBEMWKovBHpsqiU+2nioPFj0fQs3Y1lbl2dlTSlWUM4FoCkEaj
	nfPw==
Received: by 10.68.138.166 with SMTP id qr6mr47151909pbb.69.1348589363281;
	Tue, 25 Sep 2012 09:09:23 -0700 (PDT)
Received: from [10.1.10.30] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id rz10sm532710pbc.32.2012.09.25.09.09.21
	(version=SSLv3 cipher=OTHER); Tue, 25 Sep 2012 09:09:22 -0700 (PDT)
Message-ID: <5061D72E.4070704@intel.com>
Date: Tue, 25 Sep 2012 09:09:18 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1348532322.git.scott.a.garman@intel.com>
	<1348560712.8662.28.camel@ted>
In-Reply-To: <1348560712.8662.28.camel@ted>
X-Gm-Message-State: ALoCoQlHPVq2FK0rXBUpnybaCZ6I1g12ZStbJzyW7+qpIQ/WubNrj/x5nJv/pz1Ko9dObdFrXpdP
Subject: Re: [PATCH 00/58] denzil pull request 2
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
X-List-Received-Date: Tue, 25 Sep 2012 16:22:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2012 01:11 AM, Richard Purdie wrote:
> On Mon, 2012-09-24 at 17:24 -0700, Scott Garman wrote:
>> Hello,
>>
>> If this works I'll hopefully be submitting the cover letter only,
>> this patchset is pretty big.
>>
>> I've got a lot of patches for denzil now that I'd like to get merged
>> before they get too out of hand, so here is my pull request for it,
>> along with autobuilder output and explanation.
>>
>> Note, the autobuilder run was done with my poky-based branch.
>>
>> nightly-x86:
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/729
>>
>> All builds green except for atom-pc, which fails during build_hddimg of
>> do_bootimg due to the kernel image file not being found in the target
>> sysroot.
>
> Which broke due to:
>
> http://cgit.openembedded.org/openembedded-core-contrib/commit/?h=sgarman/denzil-next-pull2&id=0e3e88f9f87d1083ddd7dcaa526b3cd7a1cd53ff
>
> so I think you need:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d9302305faf4ec733dc9a98f91f5014eb814d62d
>
> to fix the atom-pc errors.
>
> I am nervous about the number of version upgrades in here. Perhaps
> someone can summarise what the problem is and why we need them?

Hi Richard,

I think these emails were posted while you were away:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/029888.html

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/029889.html

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


