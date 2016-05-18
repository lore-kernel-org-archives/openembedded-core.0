Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 65CA160616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 07:18:08 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id k142so63241685oib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 00:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EABGYacLHNb770qmNukLM4rW7CGy7XkatROgEs4J6gM=;
	b=QVK5BfuciqrhZ+TgOCXWeVLGzvIkM/Ib+y3VRCeTi4ZAdPFNu1PJH76Mtmcl8ZkIIo
	8ID9WUNKKrTJZ47sPHkOllvH1Aeeht/7z8Zc12xodwt4jXXkJfTmIdT5ipPKTI53dN+I
	5dZ41ThHr6eKqqjMy1zWDKEXbhLElhiZdDzh5OTpAVn1a4eYqpZtkPr1Xo8ktfOq58i8
	eIwkig6DnX26GFWE8XltOegBzY4SuONZgTpQlq7bRiVDh2geagovjZVlBdON29YpC71R
	sN4WwtaTLYHZXE8A/zJ2vbX7NvhRHZNqkNwOvYbR5iFdvpijRrzKIal+C34WtBaE3uN3
	w5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EABGYacLHNb770qmNukLM4rW7CGy7XkatROgEs4J6gM=;
	b=emN61KZrWzleJkYEVUN1RLN/CXRuavqoIjF/bfH6BJl0odO+o7P2C3kzjpt4Xvebd8
	q986VbwHc3tgDaJEs2icihkFPfI8UPFAjWD0F90WlXEMnEhIKWkTGkLvZsDAaqxkNOWu
	9bqMqxUse1mjXWTQ1yi48ElySj3oFLjxEKjNnxBpNsEmir+9SUPZr2kCFoxSezph+n8T
	JCkNIFAHP+zUn1yn8x23ZVUD4j2/9nWTrefYWQMNSBw0sUT4lHiL4KkVEYRDUO7AqPlU
	STIL8Y/o/ETYDorGSHkQTMR1siUauEqBWSx9neRszzCGLT0SZZFKWIFHH/69gLaD7ZKJ
	8BQA==
X-Gm-Message-State: AOPr4FW8NjlUjNrm4XVl39sHBQBJBv2OfVWpSs+mCF6JQOxjAaSh7Fo1dB9F3zhRvvHUmgVRs0/o5s0FTiVvG/jB
X-Received: by 10.202.175.71 with SMTP id y68mr3046097oie.154.1463555888448;
	Wed, 18 May 2016 00:18:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Wed, 18 May 2016 00:17:38 -0700 (PDT)
In-Reply-To: <1463516665.4578.24.camel@linuxfoundation.org>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
	<CAHiDW_FQJuwT=JPtvCMPM3bcQozTqyEDFq8LjziNe=NHT+HPMw@mail.gmail.com>
	<CAP9ODKoNnq0ufH=XF8oPqTQKW_o0NehzUXCvanzLkJMEHXAdFQ@mail.gmail.com>
	<314BCBC6-07F6-4B6E-89E6-FA6D86C682B0@gmail.com>
	<CAHiDW_GzrvqCkkcUMtNQTtgoit9JdJ5Y-pBP2vHsiC67+7JB-Q@mail.gmail.com>
	<CAJTo0LbN+7V1iZ5u77EZbJxtF4ou2p40+ka-aJaQx=Fk4znSzg@mail.gmail.com>
	<CAP9ODKqSG31qa3Au7g04DMjQmn+B4Xzz2Rtm2Ym0xYs55Mc-PA@mail.gmail.com>
	<1463516665.4578.24.camel@linuxfoundation.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 18 May 2016 10:17:38 +0300
Message-ID: <CAHiDW_GgVr60VQzg5Pd0L8v5C44dEQOxLUG932i=T4AqtfUSSw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Wed, 18 May 2016 07:18:08 -0000
Content-Type: text/plain; charset=UTF-8

On 17 May 2016 at 23:24, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2016-05-17 at 11:00 -0300, Otavio Salvador wrote:
>> On Tue, May 17, 2016 at 5:38 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> >
>> > On 17 May 2016 at 08:31, Jussi Kukkonen <jussi.kukkonen@intel.com>
>> > wrote:
>> > >
>> > > There's not much to work on as far as I can tell: 1.11 should be
>> > > a
>> > > simple upgrade with trivial patch changes.
>> > > As I said, I'm totally fine with waiting a couple of weeks until
>> > > 1.11.
>> > > On the other hand I haven't seen any reasons to start packaging a
>> > > pre-release -- why this one if we normally don't do it?
>> >
>> >
>> > Agreed, if we want an upgrade now then 1.10 is good, otherwise wait
>> > for
>> > 1.11.  There's no urgent need for a prerelease is there?
>>
>> So please do 1.10 now, as the XWayland rework was done basing on that
>> ... we can handle 1.11 upgrade once it happens.
>
> I fixed up the selftest failure the original patch as proposed caused
> and have merged that. Anything further can be based on that...

Thanks RP.

Explanation for anyone coming to this thread wondering why the weston
recipe does what it does:
* wayland-protocols is allarch because it's just xml files
* weston needs to add WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE}
  to EXTRA_OECONF to find the xml files as PKGCONFIG_SYSROOT_DIR would
point to the wrong
  place when weston is multilib -- allarch files are in machine
sysroot, not multilib sysroot
* this leads test_sstate_sametune_samesigs test to fail, which RP
silenced by adding
  EXTRA_OECONF[vardepsexclude] = "MACHINE"

Simples!

Any other wayland compositor recipe will have to do similar things.

 - Jussi

