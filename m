Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <77083fc448827536e0fb8c76fe507b71d4b4a532.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 17 Feb 2022 22:46:16 +0000
In-Reply-To: <81021d0953ac5825f1436af7295089f6409a0b10.camel@intel.com>
References: <20220208225310.1685131-1-raj.khem@gmail.com>
	 <333ededd-79c4-8a21-b6a5-8012b5f793e3@windriver.com>
	 <CAMKF1sp5rtBg0tf4mN-9VBUxVYXbqrA1i8nQe-L_8MHNRapj1g@mail.gmail.com>
	 <MW3PR11MB4633B716168A3E59ECA2F06994359@MW3PR11MB4633.namprd11.prod.outlook.com>
	 <CAMKF1srKp84XMQLTs6jbfhxMhgBK2suLxjHQNbdPBH+gT9qW1g@mail.gmail.com>
	 <MW3PR11MB46331A0B570CEB101DACBE1E94359@MW3PR11MB4633.namprd11.prod.outlook.com>
	 <CA+chaQevizhQX+ogTf+5rOhbjJjch8yS79S+DOpk8o-KFm90HA@mail.gmail.com>
	 <81021d0953ac5825f1436af7295089f6409a0b10.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, "hongxu.jia@windriver.com" <hongxu.jia@windriver.com>, "Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com" <raj.khem@gmail.com>, "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>

On Thu, 2022-02-17 at 01:41 +0000, Mittal, Anuj wrote:
> On Wed, 2022-02-16 at 10:22 +0100, Martin Jansa wrote:
> > Ubuntu patched their docker.io package shortly after upgrading to
> > glibc-2.34 in Ubuntu-21.10, see:
> > http://changelogs.ubuntu.com/changelogs/pool/universe/d/docker.io/docker.io_20.10.7-0ubuntu5~20.04.2/changelog
> > 
> > docker.io (20.10.7-0ubuntu4) impish; urgency=medium
> > 
> >   * d/p/seccomp-add-support-for-clone3-syscall-in-default-
> > policy.patch: Fix
> >     failure with new glibc clone3 syscall adding it to the default
> > seccomp
> >     policy (LP: #1943049).
> > 
> >  -- Lucas Kanashiro <kanashiro@ubuntu.com>  Fri, 10 Sep 2021 15:34:38
> > -0300
> > 
> > AFAIK Ubuntu isn't affected anymore, I've
> > updated https://bugzilla.yoctoproject.org/show_bug.cgi?id=1711 and
> > I'm fine with dropping the patch now (it was useful before, but now
> > distributions had enough time to prepare for 2.34 changes).
> 
> In case the uninative upgrade is merged in stable/LTS branches, it
> might start showing up failures for people building on older
> distributions that aren't being updated any more.

I think you're right, you have a good point here and we need to do something
about this. Reviewing the discussion upstream, I think they proposed a different
way of handling the patch so we need to look into that.

I will look at taking our other workaround short term but we need a bug opened
and someone to look at trying to get a proper patch into glibc IMO...

Cheers,

Richard

