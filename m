Return-Path: <denis@denix.org>
X-Greylist: delayed 3603 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 10 Apr 2016 23:51:45 UTC
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by mail.openembedded.org (Postfix) with ESMTP id A05C977190
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 23:51:45 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5F00090WTVMD80@vms173007.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2016 17:51:37 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
	a=WGCPVbEeGTWB7tZQ8_kA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 5e615592; Sun, 10 Apr 2016 22:51:37 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 96EC8161F7C; Sun,
	10 Apr 2016 18:51:31 -0400 (EDT)
Date: Sun, 10 Apr 2016 18:51:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Robert Yang <liezhi.yang@windriver.com>
Message-id: <20160410225130.GK16135@denix.org>
References: <cover.1428410929.git.liezhi.yang@windriver.com>
MIME-version: 1.0
In-reply-to: <cover.1428410929.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] unique -dev package
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
X-List-Received-Date: Sun, 10 Apr 2016 23:51:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 07, 2015 at 05:58:13AM -0700, Robert Yang wrote:
> Hello,
> 
> I think that one recipe should only have one -dev package, I'm not sure
> whether this is right or not, please feel free to give your comments, we

I know it is already 1 year since this change. But I can't seem to find any 
discussion or any explanation to why this change was required and what 
specific problem it was supposed to fix. Please point me to a clear reasoning 
of this change. Thanks.

-- 
Denys


> still have about 30 recipes in oe-core which have more than one dev
> packages, more info:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7481
> 
> // Robert
> 
> The following changes since commit fbaddd724855a829698d853a70eee86118d6a5e7:
> 
>   package_manager: call createrepo with --dbpath pointing inside WORKDIR (2015-04-02 12:00:55 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib rbt/dev
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/dev
> 
> Robert Yang (2):
>   xz: remove xz-dev from PACKAGES
>   bzip2: remove bzip2-dev from PACKAGES
> 
>  meta/recipes-extended/bzip2/bzip2_1.0.6.bb |    3 ++-
>  meta/recipes-extended/xz/xz_5.2.0.bb       |    2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

