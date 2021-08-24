Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web10.36750.1629794585372939239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 01:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=dUZ9dBJm;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from skn-laptop (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id 0A5AA440F31;
	Tue, 24 Aug 2021 08:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1629794583; bh=e2hSQKLU7kOUMyK6Bnm4gl2qvgTs5VdXjSuwyezBT8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dUZ9dBJmogg2DoBqjikApJTZjpNxgaSHVV2H/qPPqB9y63MaremFI/Yz9iLA0shPN
	 6C+CLHkNkr8uHEV7LghuRLj+WmKwKmmBP1BOdmTNWeUtiV0uB82pl09ZM1hErj+7IR
	 a1fVx6YQ5GbopU62L0TOlcYbWk6nevR0kU0+C7fTyw/xMYxDHljx7ipTi0uUQPUD8I
	 v0fIRVpzuWfU+aW42J4bFLqj3CiJRWQu4XkMmNJ2bh7w9lt6/04EX1jdBoUcA+mBRR
	 d7IehZBoooY3fU7XAXEa9Vi2PckWq1nKfUCmtAVAtTtz9ksJQdJqbhoDn/Tagh59e0
	 AxJ0QY/PnZcTw==
Date: Tue, 24 Aug 2021 10:43:01 +0200
From: "Sean Nyekjaer" <sean@geanix.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] lib/package_manager: Use shutil.copy instead of bb.utils.copyfile for intercepts
Message-ID: <20210824084301.ozzwiuyzwt3r4exn@skn-laptop>
References: <20210506075100.1984260-1-richard.purdie@linuxfoundation.org>
 <20210506075100.1984260-3-richard.purdie@linuxfoundation.org>
 <20210823123150.4l3pkck4hg3kpi54@skn-laptop>
 <c7aeb4413ec3937439e4ceee8a030dc4eb237ec7.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <c7aeb4413ec3937439e4ceee8a030dc4eb237ec7.camel@intel.com>
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on 13e2a5895688
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 24, 2021 at 08:14:58AM +0000, Mittal, Anuj wrote:
> Hello,
> 
> On Mon, 2021-08-23 at 14:31 +0200, Sean Nyekjaer wrote:
> > On Thu, May 06, 2021 at 08:51:00AM +0100, Richard Purdie wrote:
> > > If the scripts/postinst-intercepts is owned by root/root then the
> > > copyfile() calls
> > > will fail due to chown issues. We don't care about ownership of these
> > > files so
> > > use shutil.copy() instead which won't perform any chown.
> > > 
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > Anuj will you backport this to gatesgarth?
> 
> gatesgarth isn't being maintained any more.
> 
> https://wiki.yoctoproject.org/wiki/Releases
> 

Hi Anuj,

I know, but gatesgarth is left in a broken state because of
edc8051bc0 image: Add directories to PSEUDO_IGNORE_PATHS
was merged ;)

/Sean
