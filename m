Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id BFE5860807
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 23:17:34 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 8C7B8184786;
	Wed, 13 Mar 2019 19:17:35 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id 7UrMmTv_BZyt; Wed, 13 Mar 2019 19:17:35 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id E2340184783;
	Wed, 13 Mar 2019 19:17:34 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com E2340184783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552519054;
	bh=RJ6XCXQIr4PCh2DQ9wxs7PHvvJoGxLhMyUZTBPe8ud0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=sEKqHfr6Whe+pgrFslsz+/pIER/Rq5MhVjwQaGjcJW4T8eEy6zgDkxx+RqGOUotsO
	ZIfUjCm2V9OcCyyl6sNh5s3gEbTK6GidxK4lp0wb0DUcpXIJeSA4jmwn1S/QP6ePPn
	8Uocooi56LJOL9Lee//rWrnGoWxbxEU6XYPGl51crKBg6qR4DhVuUAgyKLVk9BV76a
	40puiTf5tJT0G4wvGp8FX3AuMFndnSOYnuwn37/cpJ0+DLqxPr1vFST5w8M2J4CeDV
	Qrk1s7pFUphp3Sw3KRI6sDEvDONq3V4taVxQHGj0iBKb5jU4vArxE4jyzrrs75lafk
	RYBq7kddLgXSw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id o8fmdhxPvFFV; Wed, 13 Mar 2019 19:17:34 -0400 (EDT)
Received: from joraj-alpa (unknown [107.159.43.215])
	by mail.efficios.com (Postfix) with ESMTPSA id B3F9A18477E;
	Wed, 13 Mar 2019 19:17:34 -0400 (EDT)
Date: Wed, 13 Mar 2019 19:17:34 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190313231734.GD14253@joraj-alpa>
References: <20190313205332.9674-1-jonathan.rajotte-julien@efficios.com>
	<13babe98-b9e6-c0cc-e890-ea83a1b95cfe@gmail.com>
MIME-Version: 1.0
In-Reply-To: <13babe98-b9e6-c0cc-e890-ea83a1b95cfe@gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Sumo][PATCH 1/3] lttng-ust: update to 2.10.3
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
X-List-Received-Date: Wed, 13 Mar 2019 23:17:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Confusion on my end, disregard this series and the following [1] [2].

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280107.html
[2] http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280110.html

As for the confusion more info here [3].

[3] http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280112.html

Cheers

On Wed, Mar 13, 2019 at 04:08:42PM -0700, akuster808 wrote:
> 
> 
> On 3/13/19 1:53 PM, Jonathan Rajotte wrote:
> > Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> 
> please provide more info on the update. is this fixing something? is it
> a bug fix only release?
> 
> - armin
> > ---
> >  .../lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb}        | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-kernel/lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb} (90%)
> >
> > diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> > similarity index 90%
> > rename from meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
> > rename to meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> > index d79a47931c..b5c43200d6 100644
> > --- a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
> > +++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> > @@ -23,8 +23,8 @@ PE = "2"
> >  SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
> >             file://lttng-ust-doc-examples-disable.patch \
> >            "
> > -SRC_URI[md5sum] = "4863cc2f9f0a070b42438bb646bbba06"
> > -SRC_URI[sha256sum] = "07cc3c0b71e7b77f1913d5b7f340a78a9af414440e4662712aef2d635b88ee9d"
> > +SRC_URI[md5sum] = "ffcfa8c1ba9a52f002d240e936e9afa2"
> > +SRC_URI[sha256sum] = "9e8420f90d5f963f7aa32bc6d44adc1e491136f687c69ffb7a3075d33b40852b"
> >  
> >  CVE_PRODUCT = "ust"
> >  
> 

-- 
Jonathan Rajotte-Julien
EfficiOS

