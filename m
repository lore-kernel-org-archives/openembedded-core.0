Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C868A6086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 22:52:49 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4NMuVaq018014; Thu, 23 May 2013 23:56:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SWO6GIv1revZ; Thu, 23 May 2013 23:56:31 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4NMuNqi018010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 23 May 2013 23:56:26 +0100
Message-ID: <1369349549.14887.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Thu, 23 May 2013 23:52:29 +0100
In-Reply-To: <519E359B.2010203@mlbassoc.com>
References: <519E359B.2010203@mlbassoc.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Shortened git hashes causing pain
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
X-List-Received-Date: Thu, 23 May 2013 22:52:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-23 at 09:28 -0600, Gary Thomas wrote:
> The shortening of the git hashes in this commit
>    commit 77fc40a0f843e2488b356d90b64ef436c11c9973
>    Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>    Date:   Sun May 19 13:21:55 2013 +0300
>      bitbake: fetch2: Shorten long srcrevs
> is causing some problems.
> 
> I have a simple .bbappend for gtk-sato-engine (attached) which
> just applies a one-line patch.  When I build this recipe, I
> get two different work trees (this is from scratch):
> $ ls -l tmp/work/cobra4430p82-amltd-linux-gnueabi/gtk-sato-engine
> total 8
> drwxrwxr-x  3 gthomas gthomas 4096 May 23 09:12 0.3.3+gitAUTOINC+4740ad8d53aba4368ce3e03b06cfdc69eb86dcdc-r0
> drwxrwxr-x 11 gthomas gthomas 4096 May 23 09:13 0.3.3+gitAUTOINC+4740ad8d53-r0
> 
> Note: it doesn't seem to happen for the virgin gtk-sato-engine
> recipe, only when my patch is applied.

Try moving the cache directory in tmp/ out the way. I suspect some kind
of caching issue since there should not be two work directories. What is
the contents of each?

Cheers,

Richard


