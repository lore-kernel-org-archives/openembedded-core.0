Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E2C69780F3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 18:28:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2AIRmW4009373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 10 Mar 2018 18:27:52 GMT
Message-ID: <1520706468.10851.164.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, "Bystricky, Juro"
	<juro.bystricky@intel.com>
Date: Sat, 10 Mar 2018 10:27:48 -0800
In-Reply-To: <20180310074659.GA7868@jama>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C66B245@ORSMSX112.amr.corp.intel.com>
	<20180310074659.GA7868@jama>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] gcc6.4 upgrade
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
X-List-Received-Date: Sat, 10 Mar 2018 18:28:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2018-03-10 at 08:46 +0100, Martin Jansa wrote:
> On Fri, Mar 09, 2018 at 11:56:58PM +0000, Bystricky, Juro wrote:
> > 
> > I forgot to mention that if there are no objections against this
> > patchset, I intend to do the same/equivalent upgrades for other
> > releases with gcc 6x (rocko, pyro, ...)  and also upgrade gcc5.x
> > and 4.9x where present.
> Thanks for this work.
> 
> It might be a bit easier to do and review this by starting with rocko
> (with just small change on top with newly backported changes) and
> just
> cherry-picking the necessary changes down to pyro and then few more
> down
> to morty (similar to Andre's backports in his branch).
> 
> With single big patch it's difficult to make sure that all the
> branches
> got all the changes and to review what's "new" compared to 6.4.0
> which
> used to be in master.

I do agree with you that in an ideal world, this is how it should be
done.

I also realise part of the problem here is a few different companies
have patched gcc 6.x in older releases and not submitted the changes
with upstream stable. I appreciate there could be a ton of different
reasons for that. It would be nice to try and share this work earlier
and more often to avoid having patchsets quite this large.

It is tough to have someone step up and try and make changes to gcc in
OE-Core since the test matrix is quite large and fixing all the issues
that can come up is non-trivial.

I'm therefore very grateful for Juro taking this on and I don't
particularly want to have him go back and redo the patches again,
particularly for feedback at v2.

I've been doing my best to guide Juro, equally I'm trying to do a
number of things at the moment (M3 still isn't ready and the
autobuilder is a wreak) and I clearly haven't given Juro enough
guidance to get this 'right'. For that I do feel bad.

So now I have a horrible choice. Do I push this back to Juro and have
him do this again as you comment. I know I'll have to provide mode
guidance, I'm travelling and its hard on everyone. Do I feel guilty for
my part in this and sort the splitting up myself to avoid impacting
Juro (with the impact on my time/sanity that entails)? Or do I take the
patch and risk upsetting some of our key contributors for ignoring
review?

I'm spelling out the issues here because as a community/team, we need
to get better at guiding people through things like this. It does have
an impact on whether people step up in the first place and may be part
of the reason nobody wants to touch gcc in the first place...

Cheers,

Richard


