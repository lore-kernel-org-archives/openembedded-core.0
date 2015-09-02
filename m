Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CC3167700A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 07:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t827Vo69004783; Wed, 2 Sep 2015 08:31:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F3QGdv0dihpG; Wed,  2 Sep 2015 08:31:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t827VYbh004762
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 2 Sep 2015 08:31:45 +0100
Message-ID: <1441179093.24871.49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 02 Sep 2015 08:31:33 +0100
In-Reply-To: <6BBD8EEF-2579-4C56-98E2-BAC8B974E3FE@gmail.com>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<1441137870.24871.11.camel@linuxfoundation.org>
	<6BBD8EEF-2579-4C56-98E2-BAC8B974E3FE@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Wed, 02 Sep 2015 07:31:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2015-09-01 at 16:17 -0700, Khem Raj wrote:
> I understand these issues, however response would engage the
> developers and keep them in loop even if it is delayed.

I'm certainly in agreement we should give responses, just trying to
explain why its sometimes not as easy as it might first sound.

> > There is a SWAT team who is meant to help try and take the load off
> > Ross/I for some of the process. The processes there are being changed to
> > try and better help Ross/I. I'd ask anyone reading this and frustrated
> > with the patch merge process, when did you last help with SWAT? When did
> > you last help with any of the random autobuilder failures we're seeing
> > or with general YP bug fixing (not just bugs you yourself run into)?
> 
> I think there could be better message reports that can be sent to
> mailing list on auto builder failures. Many devs
> may not know about the YP’s build schedules and nomenclature.

Can you give more specific examples of what you mean?

> I am particularly talking about OE-core, many devs may not be involved
> with Yocto project activities, even though those
> activities may improve the quality of OE-core. Its just the reality.
> many developers may folks chimes in when it breaks them with patches
> or reports and thats not a bad response, It
> would be much worse if they abandoned to use the project.

I've not said it is a bad thing. What I'm asking is whether more people
can devote a bit of time to fixing things which aren't their immediate
problem? For example, Martin mentioned problems with errors.yp.org.
There are a ton of open issues with errors.yp.org (see bugzilla) and if
we fixed a few of those, the reporting systems would work a lot better
and more reliably. I am struggling to find anyone to work on that right
now :(. Its just one example of where some help from others would go
help improve the core of the project for the benefit of all.

> > One problem is that we have to test the patches in a block due to the
> > long test cycle. If something fails, we can't know who broke it, that is
> > up to someone's best guess so it can't be automated. Yes, you could send
> > out block emails but those tend to confuse people. Heck, even getting
> > the autobuilder to send email at all at the moment is proving
> > problematic. I also literally spent two days last week trying to fix
> > basic issues ensuring the autobuilder actually builds the revision we
> > think its building!
> 
> I agree CI is not easy while you are also doing system integration
> iteratively.
> while the build infra issues would remain, some of these concerns can
> be addressed if we were to use some code review tool
> which can interface with auto builders and provide quick smoke tests
> on per patch bases, with sstate in place this could be achieved in
> minutes.

Speaking as someone who deals with a lot of the patches, the whole
system rebuilds far too often. Our best tests for finding regressions
(DISTRO=poky-lsb, systemd-qa, oe-selftest, multilib builds, universe
fetcher) are also some of the slowest :(.

Most of the time Ross/I do pretest the revisions we build too, to try
and make the best use of the autobuilder time and catch simple failures.

> > We are trying to send out info where and when things break and we know
> > the cause. Equally, some things have been removed as "best guess" and we
> > sometimes forget to either add them back, or follow up with a reply
> > about a likely failure they introduced :(. It comes down to simply being
> > overworked. Equally, the work in doing this is to be quite honest pretty
> > thankless and some of the lack of basic testing sometimes seen doesn't
> > really help :(.
> 
> I think its because the process is quite manual probably, you could
> send an auto email to patch when its picked to a staging branch
> and when its deleted/changed, many review tools do this automatically.
> From personal experience I now believe that with a code review tool we
> can have lot more developers participate concretely in the code flight
> and since it provides good staging it scales quite well. So I would
> think using some review tool might help, at this time

We keep saying things like this, we even agreed to try and advance
patchwork. The trouble is *who* is going to do this? Since we discussed
patchwork, who has stepped up to try and resolve the comparatively
simple issues there? If this falls to me, I can try and do it but it
will be at the expense of merging patches for a while and I suspect a
lot of people are not going to be happy if I do that.

I do continue to believe something like patchwork with some integration
work could help a lot. I also continue to be absolutely dead against
gerrit (having tried it for another project).

As I mention in my other mail, some Intel people have looked at
patchwork a bit and at least started fixing the basic problems. We've
not got to the point yet where we're changing/enhancing any bigger
workflow pieces but we will hopefully get there eventually. If you're
not happy with the progress, it needs more people involved. We are
simply under resourced ultimately :(. 

Cheers,

Richard


