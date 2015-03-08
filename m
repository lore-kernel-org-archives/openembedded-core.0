Return-Path: <mike.looijmans@topic.nl>
Received: from smtp02.online.nl (smtp02.online.nl [194.134.41.32])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB186AC33
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Mar 2015 12:29:20 +0000 (UTC)
Received: from smtp02.online.nl (localhost [127.0.0.1])
	by smtp02.online.nl (Postfix) with ESMTP id 1CB01A2E7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Mar 2015 13:29:20 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Mar 2015 13:29:20 +0100 (CET)
Message-ID: <54FC409F.9040107@topic.nl>
Date: Sun, 08 Mar 2015 13:29:19 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: OE <openembedded-core@lists.openembedded.org>
References: <1422713174-18522-1-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1422713174-18522-1-git-send-email-mike.looijmans@topic.nl>
X-Online-Scanned: by Cloudmark authority (on smtp02.online.nl)
Subject: Re: [PATCH 0/2] RFC: Integrating gitpkgv functionality
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
X-List-Received-Date: Sun, 08 Mar 2015 12:29:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-01-15 15:06, Mike Looijmans wrote:
> Follow-up on the discussion here:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100345.html
>
> This is a preliminary implementation of gitpkgv in OE-core. It modifies the
> fetcher to optionally provide an incremental numbering scheme for GIT
> repositories.
>
> These two patches implement this. The change in __init__ is basically ready for
> public consumption. The modification to git.py is a prototype that I've used to
> test feasibility. It imitates gitpkgv perfectly for the recipes I tried.
>
> To make this ready for production, we should provide better names and likely
> a GITPKGV or similarly named variable that can be used in recipes instead of
> "${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}".
>
> Mike Looijmans (2):
>    fetch2/__init__.py: Make get_srcrev output configurable
>    fetch2/git.py: Add gitpkgv_revision alternative version information
>
>   lib/bb/fetch2/__init__.py |    9 ++++++---
>   lib/bb/fetch2/git.py      |   25 +++++++++++++++++++++++++
>   2 files changed, 31 insertions(+), 3 deletions(-)
>


-- 
Mike Looijmans

