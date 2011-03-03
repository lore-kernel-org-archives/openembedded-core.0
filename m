Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pv17f-0006cU-VQ
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 06:30:48 +0100
Received: by yxn22 with SMTP id 22so249060yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 21:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=pNMBLuFsgWIo3c97/s5xl8NGFyZbt7YW4JSK4COrr5s=;
	b=NMfw2J662GC+yephu5/KlRgmr/gUk7qEKsFEUiKSOOn9wkEQKKWN/uAp8E7s5njCt5
	xQFt24cZmnAq2gysMXfMqJbqiW4fqQr0hwPUiFRbbW9Pb68JaMwtsi4Ez1B/IdQsyO17
	Y3HZBAishMa59EfnE1tx+oRW6WSM+KsvEn5nU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=X2ty0F36pZJHB2aphoKH85o67sqyIjPoECiIbzVpeGbktfQPRFwzVPwQFSwht0ovtV
	5aAFM1zn8HJmivnSgHGT+1jbknn37RqDPOZtRA4E8xs5I5rLaOCjui+fVoV1+qCMf4uE
	PGvob6aRvEjAPnfp1XtEqTCmlyshmDhfFj1uc=
Received: by 10.150.136.20 with SMTP id j20mr1271938ybd.29.1299130159558;
	Wed, 02 Mar 2011 21:29:19 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q29sm684780yba.2.2011.03.02.21.29.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 21:29:18 -0800 (PST)
Date: Wed, 2 Mar 2011 21:29:14 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110303052914.GB3025@sakrah.homelinux.org>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
	<1299055045-8096-2-git-send-email-raj.khem@gmail.com>
	<4D6E5425.5080107@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4D6E5425.5080107@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH v2 1/7] sqlite3: Update version 3.7.3 -> 3.7.5
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
X-List-Received-Date: Thu, 03 Mar 2011 05:30:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/03/11 08:28), Mark Hatle wrote:
> On 3/2/11 2:37 AM, Khem Raj wrote:
> > * Imported from OE commit a2c3af2d608b1b713018d688b00e03873a538993
> > * native version of 3.7.3 does not build
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-support/sqlite/sqlite3.inc      |    7 ++++++-
> >  meta/recipes-support/sqlite/sqlite3_3.7.3.bb |    8 --------
> >  meta/recipes-support/sqlite/sqlite3_3.7.5.bb |   10 ++++++++++
> >  3 files changed, 16 insertions(+), 9 deletions(-)
> >  delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.3.bb
> >  create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.5.bb
> > 
> > diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
> > index 92c4930..a5e6782 100644
> > --- a/meta/recipes-support/sqlite/sqlite3.inc
> > +++ b/meta/recipes-support/sqlite/sqlite3.inc
> > @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.sqlite.org"
> >  SECTION = "libs"
> >  PRIORITY = "optional"
> >  DEPENDS = "readline ncurses tcl-native"
> > -DEPENDS_virtclass-native = "tcl-native"
> > +DEPENDS_virtclass-native = "tcl-native ncurses-native"

this hunk is not needed I have verified so I will remove it.


