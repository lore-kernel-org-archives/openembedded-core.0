Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SDERu-0007sO-KW
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 14:27:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 78AFF315AA06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 14:18:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id r7XVfCgX5bw4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 14:18:21 +0200 (CEST)
Received: from [172.22.22.61] (drms-590cf1a1.pool.mediaWays.net
	[89.12.241.161])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id A6F2B315AA05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 14:18:21 +0200 (CEST)
Message-ID: <4F74530D.10408@opendreambox.org>
Date: Thu, 29 Mar 2012 14:18:21 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAGiJk9esiphHKT9GaH8dLgOFB_xbLDr86PX-rzzsR8X66OVNaQ@mail.gmail.com>
In-Reply-To: <CAGiJk9esiphHKT9GaH8dLgOFB_xbLDr86PX-rzzsR8X66OVNaQ@mail.gmail.com>
Subject: Re: Fetching code via git over ssh.
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
X-List-Received-Date: Thu, 29 Mar 2012 12:27:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 29.03.2012 14:13, Samuel Stirtzel wrote:
> Hi,
> as I have set up a git server on one of my PCs and secured it with ssh.
> I tried to use the repository in a recipe, cloning via "git clone
> ssh://user@server/~/repo.git" works.
> But bitbake tries to fetch the repository via scp instead of git (also
> if I add protocol=git).
> 
> Tried something like this in my recipe:
> SRC_URI = "ssh://user@server/~/repo.git;protocol=git;branch=master"
> (note: the git repository is in the home directory of the user, so the
> tilde is not causing an error)
> 
> 
> Anyone else tried to fetch a repository on a ssh secured git server via bitbake?
> 

Use git://user@server/path;protocol=ssh


