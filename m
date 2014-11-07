Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 97E7F65C87
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 20:52:20 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id i57so1630468yha.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 12:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=RRy1uJBadCLNmLTjzDQGt88Lj1N4jMaVWK8cRF/zXJg=;
	b=G/t6xwUs9MLAfljB4wnsjLBcyQbHVPf1q2/masXwSB/gXVjL6yW8XqKBfPlzLwmK+T
	ATKEiWre0JdDXTrSbb3/6iCDcqhh1e+dT2DYBpWIU1UH/fxJTbnPR4yKq4fS9hIdh4lU
	TaJjSLOpcPjKhapZ3ibcPG3309gGmaWk+meK5giBuWdmP70rNgCa0Kt9EfIgf5uI5TPM
	+IQt+K+g0t4bZ4j89hPTY7Pz2obPO4ZK36FOh/RINT3imit7Py91A5N4LpVnFlAJPYDZ
	MzwvlCHXkGBwAmVf5/TIlv2qX4DgR7xE5zFho++EcHr5bjVQ0Gcn0kWg6d/LQSqm4TEw
	HwhA==
MIME-Version: 1.0
X-Received: by 10.170.130.202 with SMTP id w193mr15748582ykb.22.1415393541221; 
	Fri, 07 Nov 2014 12:52:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Fri, 7 Nov 2014 12:52:21 -0800 (PST)
In-Reply-To: <CAJTo0LYLh9A8zYJDMtyCBw2r1pX8KxNjv=mq5MBX=B8BZvRObw@mail.gmail.com>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0Law3iWz=+A1vA7QsikNozeVP7U49=+T9fkT7YgLzJ_hcA@mail.gmail.com>
	<20141107194159.GD9512@denix.org>
	<CAJTo0LYLh9A8zYJDMtyCBw2r1pX8KxNjv=mq5MBX=B8BZvRObw@mail.gmail.com>
Date: Fri, 7 Nov 2014 18:52:21 -0200
X-Google-Sender-Auth: AmnWaB_w5Sfey3F-iqmX44DVzPE
Message-ID: <CAP9ODKrQ3nLF0ztdnFhK7inu45R_c7_94HtKLt5e7dnRueH3-Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Fri, 07 Nov 2014 20:52:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 7, 2014 at 6:43 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 7 November 2014 19:41, Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> > | scripts/basic/fixdep: 1: scripts/basic/fixdep: Syntax error: word
>> > unexpected (expecting ")")
>> >
>> > I suspect the real problem is:
>> >
>> > $ file fixdep
>> > fixdep: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically
>> > linked (uses shared libs), for GNU/Linux 2.6.32,
>> > BuildID[sha1]=0xb4ea84a189f10b4f3e08fb10f8e490135e2b920c, not stripped
>> >
>> > It appears to have been built using the target compiler, not the host.
>>
>> Ross,
>>
>> I'm a bit lost here - as you said above, this is a target build and yet
>> you
>> say it shouldn't use the target compiler. Can you please explain what you
>> mean?
>
>
> Yes, it's building a binary (fixdep) and then executing it.  That binary
> needs to be built with the host compiler (BUILD_CC).
>
> Easily replicated for me with "MACHINE=qemuarm bitbake u-boot-mkimage".

We should move to 2014.10 version. If people wish I can prepare and
send those patches as I have those working on meta-fsl-arm for a
while.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

