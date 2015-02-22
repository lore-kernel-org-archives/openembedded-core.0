Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C8497606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Feb 2015 08:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1M8sWiV023296; Sun, 22 Feb 2015 08:54:32 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BFrWkVRR42lw; Sun, 22 Feb 2015 08:54:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1M8sIEJ023279
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 22 Feb 2015 08:54:29 GMT
Message-ID: <1424595258.11836.72.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 22 Feb 2015 08:54:18 +0000
In-Reply-To: <alpine.LFD.2.11.1502220334160.12252@localhost>
References: <alpine.LFD.2.11.1502210434001.12954@localhost>
	<1424522044.11836.70.camel@linuxfoundation.org>
	<alpine.LFD.2.11.1502220334160.12252@localhost>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: questions about WORKDIR and S usage and files/ stuff
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
X-List-Received-Date: Sun, 22 Feb 2015 08:54:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2015-02-22 at 03:35 -0500, Robert P. J. Day wrote:
> On Sat, 21 Feb 2015, Richard Purdie wrote:
> 
> > On Sat, 2015-02-21 at 05:09 -0500, Robert P. J. Day wrote:
> 
> ... snip ...
> 
> > >   sticking with those non-patch files, it makes sense that all of
> > > them should be processed relative to their location in ${WORKDIR}
> > > (which is where they've all been copied), but occasionally, i'll
> > > see a recipe that sets:
> > >
> > >   S = ${WORKDIR}
> > >
> > > then refers to all those files relative to ${S}. sure, that'll
> > > work, but it always struck me as dangerous in case you ever need
> > > to use a separate S directory down the road, then you'd have to
> > > change the entire recipe.
> > >
> > >   as an example, consider base-files again, which sets:
> > >
> > >   S = "${WORKDIR}"
> > >
> > > but not for any reason that i can see since that recipe consists
> > > of nothing but explicit files, and all of their processing is done
> > > with respect to ${WORKDIR}, anyway, which strikes me as the right
> > > way to do it. so, a question -- what is the point of the
> > > base-files recipe setting S to that value? doesn't seem to have
> > > any purpose that i can see.
> >
> > See the recent patches which actually added that.
> 
>   sorry, i don't know what recent patches you're talking about ...
> that variable setting above has, according to git blame, been part of
> the base-files recipe since back in 2005.
> 
>   what am i misunderstanding?

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=4eb3db9a2ca8eaff64b64b8f56dac25d4734571c

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=cf72ede74d35746a10d0708942287548f9c72f30

and some of the surrounding patches. I'd assumed base-files was part of
that series, clearly it wasn't but there were many other recipes changed
at that time.

Cheers,

Richard




