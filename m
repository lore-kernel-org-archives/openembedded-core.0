Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AB08C601DF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 May 2015 07:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4N7FcAT013841; Sat, 23 May 2015 08:16:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1m3Gtr9rrUVf; Sat, 23 May 2015 08:16:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4N7GO8l014067
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 23 May 2015 08:16:35 +0100
Message-ID: <1432365384.12832.53.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Sat, 23 May 2015 08:16:24 +0100
In-Reply-To: <1432276145-31264-1-git-send-email-mike.looijmans@topic.nl>
References: <1432276145-31264-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/3] RFC: Integrating gitpkgv functionality
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
X-List-Received-Date: Sat, 23 May 2015 07:16:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-22 at 08:29 +0200, Mike Looijmans wrote:
> Follow-up on the discussion here:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100345.html
> 
> This is an implementation of gitpkgv in OE-core. It modifies the fetcher
> to optionally provide an incremental numbering scheme for GIT repositories.
> 
> These three patches implement this, and provide the functionality in three stages.
> 1 __init__.py: Allows fetchers to provide alternatives to formatting a version string.
> 2 git.py: Implements such alternative formatting in gitpkgv style.
> 3 bitbake.conf: Sets GITPKGV so that it becomes backwards compatible with gitpkgv.
> 
> v2: Rebased and added bitbake.conf patch to set GITPKGV
> 
> Mike Looijmans (3):
>   fetch2/__init__.py: Make get_srcrev output configurable
>   fetch2/git.py: Add gitpkgv_revision alternative version information
>   bitbake.conf: Set GITPKGV variable

FWIW this looks quite neat to me, thanks!

Cheers,

Richard


