Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T8seu-0000KK-Jt for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 14:55:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84Cgm72017024;
	Tue, 4 Sep 2012 13:42:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16861-06; Tue,  4 Sep 2012 13:42:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84CgeCO017018
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Sep 2012 13:42:41 +0100
Message-ID: <1346762559.30964.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 04 Sep 2012 13:42:39 +0100
In-Reply-To: <cover.1346584261.git.Martin.Jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] sstate-cache-management.sh fixes [YOCTO #2897]
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
X-List-Received-Date: Tue, 04 Sep 2012 12:55:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-09-02 at 13:13 +0200, Martin Jansa wrote:
> Fixes some issues reported in YOCTO #2897
> 
> The following changes since commit c2109b765b24a7ffe4781257ad3fe4641a3b2a49:
> 
>   sstate: Ensure master.list exists if it doesn't already (2012-08-30 22:44:52 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib jansa/pull
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
> 
> Martin Jansa (4):
>   sstate-cache-management.sh: fix regexp in checksum grep
>   sstate-cache-management.sh: fix regexp in AVAILTUNES grep
>   sstate-cache-management.sh: look in meta* above oe-core dir when
>     looking for available tunes
>   sstate-cache-management.sh: don't hardcode available machines only to
>     qemu*

Merged to master, thanks (along with 5/4 and 6/4 :).

I do agree with Paul, we need to find a better way to do some of this
but that is something for the future...

Cheers,

Richard



