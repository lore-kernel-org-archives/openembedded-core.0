Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0208E65DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 20:09:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAJK9ZSR012394
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 19 Nov 2014 12:09:35 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 19 Nov 2014 12:09:34 -0800
Date: Wed, 19 Nov 2014 14:09:33 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Juro Bystricky <jurobystricky@hotmail.com>
Message-ID: <20141119140933.4bef2a73@e6410-2>
In-Reply-To: <loom.20141119T185456-477@post.gmane.org>
References: <cover.1415390286.git.peter.seebach@windriver.com>
	<d2ce73488a8afb7a8d10286da138810d30b4a4be.1415390286.git.peter.seebach@windriver.com>
	<1415457765.2820.21.camel@linuxfoundation.org>
	<1415703324.2820.37.camel@linuxfoundation.org>
	<20141111122956.3e842de1@e6410-2>
	<loom.20141119T185456-477@post.gmane.org>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] eglibc-use-option-groups.patch: Several fixups
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
X-List-Received-Date: Wed, 19 Nov 2014 20:09:48 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 19 Nov 2014 17:59:49 +0000
Juro Bystricky <jurobystricky@hotmail.com> wrote:

> I am not sure why the HAVE_MBSTATE_T needs to be conditioned at all, my
> understanding is
> it is defined if the file <wchar.h> contains type definition "mbstate_t".
> This typedef either exists or not and saying it not exists when in fact 
> it does might be confusing (as it already is for me) and I don't see any 
> relation with __OPTION_EGLIBC_LOCALE_CODE.

If it's not conditional, the build fails when the feature's not included,
because one of the test programs attempts to use it. It may be that something
else ought to be conditional to make that work. So it might be that your
suggested change to fnmatch would fix poky-tiny as well.

And you're right about the .out.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

