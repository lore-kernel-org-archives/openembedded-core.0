Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAlAo-0003Vx-1p
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 17:47:38 +0100
Received: by lbbgi4 with SMTP id gi4so1783808lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FBHNmVdadgqnPHeef3NI98t0xT4QhmHd3qeQGOUqLAU=;
	b=AUDuT1pw7GLlfPEzVSLFvNEy2t+9uE5ArVThrZDwxWzusOo3JBL753x0I/lwhyFI0C
	Bo/ojPoHJnZJd7m1kSjobNmyNhQI80WsCxyQyWZsM6lYitiz/aFPYSJL4ZBa/xfUfb0s
	Z4LeVV8ycPNn5dY3aAvMKRs954oUsgXhDtcq6MBUO8Y3wCzRrs2nSM+WxjGnXw+Fbtjp
	ZiSCC9ToMZ03sXZOVd3LIUDk1eHgx6NL3VPYy/9p6E9++5VY76MY57YnCnfL2oFvbHP0
	uQFklfS3NOPmfOtsBAwon3UiTp8iwIddC0j9JrZEz577B/flunkc9cWoOnPsQc7LWumZ
	SN0A==
Received: by 10.112.37.73 with SMTP id w9mr3121371lbj.22.1332434322870; Thu,
	22 Mar 2012 09:38:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Thu, 22 Mar 2012 09:38:12 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0137BE5C@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sq7hcTKrzFBYgmUOTcdQw6sC1FG4jUhsfKauqeXLQMgsg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
	<20120322131310.1c6455d1@eb-e6520>
	<CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
	<20120322134340.1af3dfda@eb-e6520>
	<CAMKF1srORF53h-V+fKTjJn2jWg=f6nOaMf_eUmYPLnW-ovc7NQ@mail.gmail.com>
	<20120322141455.644058f0@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137BE5C@ORSMSX106.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2012 09:38:12 -0700
Message-ID: <CAMKF1srd0KanO6NfQtm0U39GZS_ANsu9KdRR0hirpKQrhMCxzg@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Thu, 22 Mar 2012 16:47:39 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 22, 2012 at 9:20 AM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>
> Renaming the sdk python2.7/lib-dynload/readline.so to python2.7/lib-dynload/readline_d.so gets the sdk gdb working for me too.
> So is this a workaround or solution to the problem? If it is a workaround what should be right solution?

I think we should be generating these _d.so files during python-native
build. So please look into why its not happening. I wont have much chance
during the day to look at that


