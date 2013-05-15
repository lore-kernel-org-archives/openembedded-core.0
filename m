Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UckYI-000132-Rv
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 00:52:10 +0200
Received: by mail-wi0-f177.google.com with SMTP id hr14so2138832wib.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 15:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=PWjmpts38Qol0ybA6KJ3HKeBP/SSm7kcBUwA9B5r8Ao=;
	b=qhD14MGTZStP3Mqu+nKRb4fxzIin7bvy1rYFqCZ8/N4KzvNi6qKNaYMCb6gsz4ZRAc
	u/Tgw58lsoElZQJiIO91J46csk+9jxkEtjfI+zUVwmSjzFgiodYFQMj1OYv0zfGTD4Pv
	c1lAghCRQ3NNW88T50eZEEA49/sW14RX4PdCQpnATODbTOfhvQPLghi3TgdAQ1J4sU4u
	bemjB47N/hVN2M0/20jg2P6/HFv9ofsTgULYTL3veXRhy4o5G60zEpQ7bWSHMeSKpmY2
	JV5koyhuaRRES6yGCcONPHwrYSCgiWeALeUR6IPgYVM7S5jtY7Urv4V2DskeaZCut3T1
	iLWQ==
MIME-Version: 1.0
X-Received: by 10.180.37.229 with SMTP id b5mr18741305wik.29.1368657233502;
	Wed, 15 May 2013 15:33:53 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Wed, 15 May 2013 15:33:53 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305151757110.12800@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
	<alpine.DEB.2.02.1305132059460.25048@oneiric>
	<CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
	<CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
	<CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
	<D9D792CF-EAA0-4B7B-8C5D-9429196AEC70@gmail.com>
	<alpine.DEB.2.02.1305140423590.26605@oneiric>
	<CADkTA4O1VFk1juzepWzjV1FjF9F2J_A83ga92USdgxwegd3Qwg@mail.gmail.com>
	<alpine.DEB.2.02.1305140824360.23009@oneiric>
	<CADkTA4M+Ya24qHwFbB-ETyGwTM-8p_OvuzkUF4yDaQ+=iDZQuA@mail.gmail.com>
	<CAHUNapTw8-B5AEk2YN3t+vRkjwVOS65Ehs6HV5RkbipYUWpS3A@mail.gmail.com>
	<CADkTA4P+CaEJFfkWSzGrcYMgs7Kxa9iNkgNbQou0xhf53oP6Uw@mail.gmail.com>
	<CAHUNapSuTwy0sSDCXAmk6PEqVkqJzGsrLyPJL9VQCaN5gMbOOA@mail.gmail.com>
	<CADkTA4MpRM5Vw8iDL6gw9jMZ93Bu3Y6mGwy5JVx69pkkP2F06w@mail.gmail.com>
	<alpine.DEB.2.02.1305151757110.12800@oneiric>
Date: Wed, 15 May 2013 18:33:53 -0400
Message-ID: <CAHUNapTU2he7VM+CrEYv5cwoWdB82nVgLowy8d+_zMCzChNZLw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Wed, 15 May 2013 22:52:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 15, 2013 at 5:58 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Wed, 15 May 2013, Bruce Ashfield wrote:
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> index b79fa4e..d458212 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> @@ -5,6 +5,7 @@ KBRANCH = "${KBRANCH_DEFAULT}"
>>
>>  SRCREV_machine_qemuarm ?= "8fb1a478c9a05362e2e4e62fc30f5ef5d6c21f49"
>>  SRCREV_machine_qemumips  ?= "b8870f2b11f4c948ae90a19886335fa8b7fca487"
>> +SRCREV_machine_qemumips64  ?= "49041e56a3c4ff552bf9f8195809b8040e2e2723"
>>  SRCREV_machine_qemuppc ?= "e4c12f12e61a29b6605c4fcbcfd6dbe18bd7b4e4"
>>  SRCREV_machine_qemux86 ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
>>  SRCREV_machine_qemux86-64 ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
>
>   so just to be painfully clear, if i have current oe-core and
> openembedded-core-contrib repoes, i need make only the above change in
> the latter to get a working qemumips64 build that will boot to the
> command line and let me log in?

I just built and ran it using plain meta-poky/meta and
meta-poky/meta-yocto (applying the above change to meta-poky/meta/...,
and using a very recent pull to master) and am quite happy to report
that it works for me (as I understand it Saul pushed the various parts
required for the toolchain earlier today). The linux kernel banner,
sources, and "uname -a" are all linux-yocto_3.8.11 and I can log in
using the qemu SDL interface.

Now I just have to remove the kernel version preference line in my
config and verify that works okay too.

Does this mean we now have something that can work on the EdgeRouter Lite?


