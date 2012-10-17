Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TObNV-00047Q-Gh for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 23:42:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HLSqvl010192;
	Wed, 17 Oct 2012 22:28:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08886-10; Wed, 17 Oct 2012 22:28:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HLSgYj010186
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 17 Oct 2012 22:28:43 +0100
Message-ID: <1350509329.2185.136.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 17 Oct 2012 22:28:49 +0100
In-Reply-To: <CAP9ODKpprdTNmgJCZvir9jM7mnpS9RN17G_s=mbNW0RL4ZvQww@mail.gmail.com>
References: <1350500844-10356-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKpprdTNmgJCZvir9jM7mnpS9RN17G_s=mbNW0RL4ZvQww@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFT][PATCH V2] eglibc-2.16: Use tar ball instead of svn SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 21:42:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-17 at 17:42 -0300, Otavio Salvador wrote:
> On Wed, Oct 17, 2012 at 4:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
>         Adapt the recipes to fetch a tarball.
>         Tarball is generated from latest 2.16 branch
>         which has e500-math_private.patch already applied
>         hence we remove that patch.
>
>         Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> What the motivation to move to the tarball?

svn:// recipes depend on subversion-native. Having switched to the new
ubversion version, we've in a nasty position of it being hard to
ASSUME_PROVIDED with the API breakage.

Building subversion-native is a pain and delays the core part of the
build significantly. Switching to tarball recipes should improve our
build speed a lot.

So its mainly for performance reasons that we should do this.

My only question is whether we need to include the svn revision in the
tarball name?

Cheers,

Richard





