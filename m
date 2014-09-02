Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB306AC7B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 07:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s827B5wV023773; Tue, 2 Sep 2014 08:11:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jjT5jfv9mqYy; Tue,  2 Sep 2014 08:11:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s827B49p023770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 2 Sep 2014 08:11:05 +0100
Message-ID: <1409641865.29296.261.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Date: Tue, 02 Sep 2014 08:11:05 +0100
In-Reply-To: <CAGNsrLCzz-9h9kD5f7jUWuC+qFVyOhrp5gTDMAZ6TWyLc9Cj-Q@mail.gmail.com>
References: <1408720803-11737-1-git-send-email-lpapp@kde.org>
	<5400C6A5.6040001@linux.intel.com>
	<CAOMwXhPptiMrE7_VNi1rLtv0qzVf=0CHSJ5nn=dTi8GxBtFtHQ@mail.gmail.com>
	<CAOMwXhP+A40Kcb-KcgCh8rh-oNXh-9DjyBJ4hAunJ7Q7_i8VUA@mail.gmail.com>
	<CAP9ODKqCq4FZj920GW1ztu_r73MgKuiTfZtThbfZKi2710_BGg@mail.gmail.com>
	<CAGNsrLCzz-9h9kD5f7jUWuC+qFVyOhrp5gTDMAZ6TWyLc9Cj-Q@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for ccache builds with the SDK
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
X-List-Received-Date: Tue, 02 Sep 2014 07:11:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-09-02 at 09:22 +0300, Fathi Boudra wrote:
> On 1 September 2014 21:04, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > Laszlo,
> >
> > On Mon, Sep 1, 2014 at 2:47 PM, Laszlo Papp <lpapp@kde.org> wrote:
> >> Just in case the severity is not clear. Without this change, the Yocto
> >> SDK breaks the build for our software since we do prefer to use ccache
> >> for speeding the build process up. We are probably not alone with that
> >> ...
> >
> > Saul request is very valid. He is asking you to conform to the commit
> > guidelines we use and it is no-sense you to expect that he or someone
> > else does this for you.
> >
> > So I think if you expect this to be merged you need to fix and send a v2.
> 
> fwiw, we've been hit by this maintainers behavior. Several patches are
> stuck in the queue after 10 days of non-activity, followed up by a
> nitpick comment.
> It's a source of frustration for the submitter and is killing his
> motivation. Such comment could come earlier, while he's in the heat of
> the action and he's usually more receptive to the review.
> 
> As a result, we lose a contribution. The
> project/maintainer/submitter/end-user doesn't benefit from the
> contribution.
> 
> my 2cts.

There are two sides to this. There can be frustrations on the submitters
side, equally, we don't have that many people prepared to review other
people's code. Code review is a pretty thankless task (as this thread is
showing) and trying to pull together all the different patches, testing
them and ensuring there are no regressions takes significant time and
effort.

In this case, the commit message does not match the guidelines. It is
not the reviewers responsibility to rewrite it so it does.

The other big problem that we see is that once a patch hits master, the
submitter considers their job done. If there are regressions found, we
sometimes see a "not my problem" attitude to getting those regressions
fixed. Obviously the change can be reverted but that has its own set of
problems too.

Personally speaking, I just do not have the time to try and do
everything I'd like to do. Ideally I'd read and reply to every patch in
real time with comprehensive review. For better or worse there are other
demands on my time (such as writing my own patches, mentoring others and
so on). This means I try and do an best effort and this applies to
others doing this work too. Even my best effort leaves me working crazy
hours and is actually likely having an effect on my health :(.

So I do regret people are frustrated, we doing the best we can with the
people available. If more people want to step up and help consolidate
patches that would be great but these kind of threads aren't going to
encourage it. 

The kernel gets around this by having subsystem maintainers. With
OE-Core, its certainly true that particular contributors do have
"ownership" of parts of the system in my mind and their changes to those
parts of the system are easier to review and accept. It would be good to
see more of that kind of ownership too but that trust takes time to
develop and its not something many are willing to work on. The layers
model obviously tries to help that too.

Cheers,

Richard


