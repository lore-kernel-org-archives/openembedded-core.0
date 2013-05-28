Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 49B676A428;
	Tue, 28 May 2013 14:06:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4SEAeAS017112; Tue, 28 May 2013 15:10:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3ge9DGDo6jOe; Tue, 28 May 2013 15:10:40 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4SEAaw6017108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 28 May 2013 15:10:37 +0100
Message-ID: <1369749977.14887.165.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Mark Hatle
	<mark.hatle@windriver.com>
Date: Tue, 28 May 2013 15:06:17 +0100
In-Reply-To: <20130528134606.GJ3192@jama>
References: <20130528132841.A450B5039B@opal> <20130528134606.GJ3192@jama>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Mark Hatle : base.bbclass: Deprecate the PRINC logic
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
X-List-Received-Date: Tue, 28 May 2013 14:06:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-05-28 at 15:46 +0200, Martin Jansa wrote:
> On Tue, May 28, 2013 at 01:28:41PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master-next
> > Commit: e1cf564ebc8e7b4fa626a645356f6a4d7f5ba064
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=e1cf564ebc8e7b4fa626a645356f6a4d7f5ba064
> > 
> > Author: Mark Hatle <mark.hatle@windriver.com>
> > Date:   Tue May 21 13:29:03 2013 -0500
> > 
> > base.bbclass: Deprecate the PRINC logic
> > 
> > The PRINC logic is now deprecated, the PR server should be used to handle
> > the automatic incrementing of the PR (package release) field.  The default
> > setting of '0' has been removed, and a warning message has been added.
> 
> How are people supposed to remove existing PRINC without causing version
> going backwards?
> 
> Do I have to choose between seeing 100 warnings about deprecated PRINC
> or 100 ERRORs from buildhistory about versions going backwards?

Sorry, this is coming out a bit backwards.

At the TSC meeting, we discussed ways of progressing with removal of
PRINC as it is causing pain and we shouldn't need it any more. We were
wondering if we could have the system warn on usage of PRINC, then
accept PR bumps to the main recipe at the same time that the usage of
PRINC was removed (taking PR bumps and removing PRINC seems to be the
only way to proceed). Initially I wondered if we could make it a hard
error, which would then force the PR bump to be in sync with the
removal. People are justifiably concerned at the idea of hard errors
though.

Mark sent me a patch, I thought it was an RFC on the list and applied it
to master-next to experiment with. It wasn't send to the list, I'm not
sure what Mark's intention was, its possible I was supposed to raise the
subject, then post the patch.

Anyhow, as you point out, the patch has a couple of issues. We need to
put back the default value into local.conf for now at the very least so
this warns, rather than gives an obtuse error. Its not going into master
until there is more discussion.

So lets reset here, Mark will post the RFC patch and we can discuss
whether there is a way we can get rid of the PRINC usage without causing
people too many problems. Sorry for the confusion caused :/.

Cheers,

Richard



