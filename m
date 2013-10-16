Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C5E0B6CC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 12:12:44 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9GCCeIm028808; Wed, 16 Oct 2013 13:12:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VuXkmG0aB2kY; Wed, 16 Oct 2013 13:12:40 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9GCCXl8028802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 16 Oct 2013 13:12:35 +0100
Message-ID: <1381925550.29912.463.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rongqing Li <rongqing.li@windriver.com>
Date: Wed, 16 Oct 2013 13:12:30 +0100
In-Reply-To: <525E3378.3070604@windriver.com>
References: <1381902795-3187-1-git-send-email-rongqing.li@windriver.com>
	<CAP9ODKpm_zpo+TyFDe0TSAXHs=MvFjouPjRNE0GcE9i6Lk_7Aw@mail.gmail.com>
	<525E3378.3070604@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: repeat to tar archive file five time
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
X-List-Received-Date: Wed, 16 Oct 2013 12:12:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-10-16 at 14:34 +0800, Rongqing Li wrote:
> 
> On 10/16/2013 02:24 PM, Otavio Salvador wrote:
> > On Wed, Oct 16, 2013 at 2:53 AM,  <rongqing.li@windriver.com> wrote:
> >> From: Roy Li <rongqing.li@windriver.com>
> >>
> >> [YOCTO #5287]
> >>
> >> tar failed and reported that file changed as we read it, now
> >> we workaround it
> >>
> >> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >
> > You must be kidding right?! loop 5 times?!? why not fix the root cause
> > of the change?
> >
> 
> Sorry, I do not know the root cause, and I see many people spent
> lots of efforts to investigate, but do not find the root cause,
> sometime we suspect it is the building servers kernel issue,
> if it is true, we can not fix the building servers, we only
> workaround the code.

This workaround is not going into master, its horrid. Do we know which
versions of the kernel on the server have the issue. I'd much rather
tell people to fix their broken filesystems for example and refuse to
run on them.

Cheers,

Richard


