Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id EC746601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 19:58:26 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id j35so117905698qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 12:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=8Owb2JAc7vBNGkH8v5lyOoKqgs1wOKMIRgJdFV+F0TM=;
	b=vh5JxtmrPw1LYu7+XqKSs/E1fsFm6TEWcVP7lontj0qgLwy2+JUHV7fUrn+AvG4Q+S
	cimhDaepra/YIP8VoV7D5p+tE0YnlYNdPMcQwI2KU/CE4nlVBaYJEMdXluFwkKVLvrnc
	SYt4ej/OduynSwKYLEYI7i8P1LzzuTqXCusF0Cx84fCDZGvJRnIVfBeZTmFb1WNEETnD
	li5m5YQ0ou8CuNDnLq1JJNjn2A17Ol+VWtJLfr9hFgMuu3GdAHNQEbwKZ4bngiVIj9jR
	Iu1lAmuDSseZQp7+wNwL2ZYLBcjkWhv4p9vhUGMf98Y86Hu5HQ480qth2kWsXCLnsG4s
	2nOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=8Owb2JAc7vBNGkH8v5lyOoKqgs1wOKMIRgJdFV+F0TM=;
	b=aORS6HMBjy9UI5g1Ai23isLSJB7oOX/7FUnAYvlywMAtQu+RiqKgxzguwVl0QpT6dv
	U/Y94sRGfjs8nYKryeZCO5ic1x9OvxvC8jE8QXk2TgHFXIKT6lPkVFMEbTCSQuApzg2F
	ynH9Sc1+4zB47pDMFpPOUWhOyuCksGytGr7dkD1ZRy1fgaDBv2iOFb3Uta6uxs+IEzvh
	O3dfiFBvnY3hgEev4PI9qwdDs8ndKHmcbdS7/HSBBE2JS8NYtroNPAV7b1lq7JDfQsXp
	RJeTG/gpe7aGZ2lkPsLuVUy5si5rRyzEzGP459gVEamwp2CzwfyEaP0zX2EPEcKxAzUA
	4P3w==
X-Gm-Message-State: AD7BkJICQBeb1QwG2bMdnb8gdxNrSoJLk+ccU0yCxMUvcmzQTNeYI2SFcALPNf7PMYwwxA==
X-Received: by 10.141.23.211 with SMTP id z202mr40046699qhd.52.1459195107150; 
	Mon, 28 Mar 2016 12:58:27 -0700 (PDT)
Received: from [192.168.1.139] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	j8sm12353831qhj.19.2016.03.28.12.58.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Mar 2016 12:58:25 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <56F59D2B.2010108@gmail.com>
	<1458978069.3073.62.camel@linuxfoundation.org>
From: Cliff Brake <cliff.brake@gmail.com>
Message-ID: <56F98CDF.7080205@gmail.com>
Date: Mon, 28 Mar 2016 15:58:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458978069.3073.62.camel@linuxfoundation.org>
Subject: Re: How to use externalsrc with git workspace
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
X-List-Received-Date: Mon, 28 Mar 2016 19:58:32 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 03/26/2016 03:41 AM, Richard Purdie wrote:
> HEAD is a revision, not a branch and the fetcher became a bit more
> picky about that difference. Your local tree must have HEAD on some
> branch which would usually be master so setting branch=master is likely
> correct, or don't set that parameter at all? master isn't just a remote
> thing.
>
> The piece which says "use the HEAD revision" is the SRCREV =
> "${AUTOREV}" line.
>
> Cheers,
>
> Richard
>
We typically set up our projects to use git submodules, such that the top level
calls out a set of submodules which are the actively developed applications and
other bits in the system.  These submodules are externalsrc trees for bitbake,
and include a bitbake recipe (bitbake recipe is embedded directly in source
code).  Sometimes these submodules/externalsrc trees track branches (typically
release-xyz, or develop-xyz), but almost never master.  Sometimes they may be at
a tagged version that is not at the HEAD of a branch.  In the end, I want to be
able to build exactly what is in the externalsrc directory, and accurately
include the git version in the PV.  Branches/tags may change at any time and I
don't want to have to edit the recipe every time this happens.

Repo might be used in a similar fashion to manage a tree of components that get
built.  What we are trying to avoid is having to edit the git version in the
recipes to lock down versions for a set of components for a build -- git
submodules or repo work much better for doing this.

I tried nobranch=1;rev=HEAD, but then that conflicts with ${AUTOREV}.

The git fetcher could have an option like head=1 in the SRC_URI, that told it to
use whatever is in the git workspace, and allow AUTOREV to figure out version. 

Perhaps a better approach might be to figure out a function for PV that simply
extracts the git version of ${S} -- that is really all I want.  In this case, I
might even need a SRC_URI, as I'm not really fetching anything -- its already there.

Thanks,
Cliff

