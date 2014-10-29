Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1517C70350
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 01:53:11 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id q9so876900ykb.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 18:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=fF+jb703KbECJ8XnPiGB6r0s1ugdZNrVmgi4oKB+Bx4=;
	b=OaU+TYveNO2bpFSVBMZC83ghirsHIVsyufdhEmm8MHMBc4/F/Ottu7xWLXkn7v4Zpc
	t8UKjqLB091CUNlPaGAZ97qYBlqhq4U47s1LHHs6OMpOP3+tKSdycLgZsortpdNnEEzN
	mxTTIm9UhOsc4vMAWHyL69hKCFcNN1FCyWZOyEQCzC2vn+fqatT4D85it6eCm60C2hMB
	rZVKR3bErX3dMY1CVL81R/IwoMjBq1xoPQdnBYyM4HQOely7kV89ZEKtbNf5byHCUlmM
	FoXDtznpag9Kg3WNsSJ8V3euqMMkPqd//VMx8CySKSGxPZUNB6rZsPtNXDWURfy2u9uX
	AMwA==
MIME-Version: 1.0
X-Received: by 10.170.117.73 with SMTP id j70mr8333640ykb.76.1414547591360;
	Tue, 28 Oct 2014 18:53:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Tue, 28 Oct 2014 18:53:11 -0700 (PDT)
In-Reply-To: <CANyK_8cFPyXs2R5+x3AiMNnPW4Q6hWnNdsjTHrf50M4F6VGJQQ@mail.gmail.com>
References: <CANyK_8cFPyXs2R5+x3AiMNnPW4Q6hWnNdsjTHrf50M4F6VGJQQ@mail.gmail.com>
Date: Tue, 28 Oct 2014 23:53:11 -0200
X-Google-Sender-Auth: jvswd2TpCqkpfuaxWTwMH8hYrfE
Message-ID: <CAP9ODKpt0qN5a2z2mfy5c-zVUkWjLcs_JzB6Pr4D7ddosf5RyA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg Status Update
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
X-List-Received-Date: Wed, 29 Oct 2014 01:53:12 -0000
Content-Type: text/plain; charset=UTF-8

Hello Paul,

On Tue, Oct 28, 2014 at 9:33 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
> I'll be releasing opkg v0.2.4 in around 2 weeks and will be following
> that with v0.3.0 in the next month or two. The v0.3.0 release will
> incorporate some useful features, including cache improvements and
> package file extraction improvements. A dependency will be added on
> libarchive which will replace the crufty manual handling of tar and
> gzip formats which used to be in opkg. Due to these changes, I'd
> definitely like to get this tested before the v0.3.0 release and so
> I'll be tagging release candidates. If anyone would like to help with
> testing please let me know! I have a meta-opkg layer
> (https://bitbucket.org/opkg/meta-opkg) which makes it really easy to
> test opkg release candidates and git commits in OpenEmbedded, it even
> has a readme file with instructions.

I'd like to say my public 'Thank you' for this work. opkg is a
critical piece of software in several Free Software projects and
commercial products. Being involved in past with APT and Debian's
development I know it is not an easy task so I do value your work on
it.

Please let me know when you want a specific test on it and I try to
find some time to do it or allocate someone to handle it.

> Also, my circumstances are changing over the next few months. I've
> come to the end of the 'active' part of my PhD research and I'm now
> writing up my thesis part-time. I'm also starting full time employment
> in January. This will make for a pretty busy schedule and I don't know
> until I settle into the new routine how much free time I'll have to
> work on opkg. This would be a great time for someone to step up and
> help move things forward to v0.4.0 and beyond. I'll still be involved
> in opkg development and I'm happy to continue my role as maintainer,
> but I just want to make it clear that my time will be limited and any
> help with development, patch review and bug triage would be much
> appreciated!

Except the 'pretty busy schedule' and 'limited time' parts it is all
good news :-) I wish you all the luck on those new challenges :-D

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

