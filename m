Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUrE9-00013C-Sn
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 05:18:09 +0200
Received: by eaal1 with SMTP id l1so372181eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 20:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7uEpBOW/bFGlU0a1Lt9XIMwPOWsNrqzdZXELNRkO+zw=;
	b=VuSq4+0YEnksWbVCmBEu87r9YLY8vex5jcz8ShomU2OGgQlTp6FBS6LN6Qm5CPTWs1
	aavGRdpnALKeealcjsMWrVp0vEF2CZQEzYOdxJEMkDLBMCMMfU7wnbWlYFBwCHmmOza5
	2Lg2TxRduEQwOMphiL05pFruyOD06oKULhg8Glf36mfx+KlJvAjV62LhOof80jjoxGhR
	1ahe3j2Wj1tvKYw9X3r0mAVeR+QzxasLRKT9ykb+7v98QEm+fEszk5Pj0QhMQg0FGt87
	EDfVQ/8mlzUvvCW+AFqeZKheapmIsY5/8+Q8+o9JR4gfPohitLbb1hGTNSPgs8P8zJ3y
	dCUQ==
Received: by 10.213.105.78 with SMTP id s14mr682771ebo.84.1337224087976; Wed,
	16 May 2012 20:08:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 16 May 2012 20:07:37 -0700 (PDT)
In-Reply-To: <4FB45BEF.6070204@windriver.com>
References: <cover.1337162056.git.xiaofeng.yan@windriver.com>
	<a918712a769df875f9e59f7a5aa233b7316705c2.1337162056.git.xiaofeng.yan@windriver.com>
	<4FB38961.2000702@linux.intel.com> <4FB45BEF.6070204@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2012 20:07:37 -0700
Message-ID: <CAMKF1soknCpo6=G=UORak1sN9r5053_U7D=nVkM4xO5nC31wfw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] ncurses: Disable parallel make
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
X-List-Received-Date: Thu, 17 May 2012 03:18:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 16, 2012 at 7:01 PM, Xiaofeng Yan
<xiaofeng.yan@windriver.com> wrote:
> Thanks for your reply. The most cores I have are eight. I also set
> PARALLEL_MAKE=j1000 and 10000. I think I need try to find new way for fixing
> bugs.
>

I think disabling parallel make should be last resort. So yes any
other solution is a good thing to try.


