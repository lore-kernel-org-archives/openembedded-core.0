Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S1nH1-0006GT-23 for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 00:12:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1QN4X6J019386;
	Sun, 26 Feb 2012 23:04:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18792-06; Sun, 26 Feb 2012 23:04:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1QN4ItS019380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 26 Feb 2012 23:04:19 GMT
Message-ID: <1330297460.31855.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Leon Woestenberg <sidebranch.openembedded@gmail.com>
Date: Sun, 26 Feb 2012 23:04:20 +0000
In-Reply-To: <CAMvUbCybn5jKbVJMdsrY7SpUoGjku3MwgOU+0WvQ+4LBituWvA@mail.gmail.com>
References: <CAMvUbCwy5UL3YWXS=2SkeKff2WDQE9EX7-CGUv9s5SH+9uSK1g@mail.gmail.com>
	<1330261561.31855.6.camel@ted>
	<CAMvUbCybn5jKbVJMdsrY7SpUoGjku3MwgOU+0WvQ+4LBituWvA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bitbake parsing of IMAGE_INSTALL += # tslib mtd-utils" extremely user unfriendly.
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
X-List-Received-Date: Sun, 26 Feb 2012 23:12:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-02-26 at 20:35 +0100, Leon Woestenberg wrote:
> On Sun, Feb 26, 2012 at 2:06 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         On Mon, 2012-02-20 at 23:00 +0100, Leon Woestenberg wrote:
>         > bitbake can really braindump on us when we insert typo's.
>          The result
>         > of bitbake 1.14 parsing this one wasn't pleasant:
>         >
>         > IMAGE_INSTALL += # tslib mtd-utils"
>         >
>         > (Yes, it's a typo. No, I wouldn't expect bitbake to give me
>         that much
>         > output :) )
>
>         I agree we need to fix that. I've proposed a patch to bitbake
>         which
>         would allow detection and a better error message for something
>         like this
>         by enforcing quoting of variables. It is a major change in
>         bitbake's
>         behaviour though so I'm taking feedback on whether we should
>         make the
>         change.
>
> If we focus on our user interface view, that would mean this will no
> longer work:
>
> SOME_BINARY_VARIABLE = 1
>
> but that might be a better compromise than what we currently have.

FWIW, internally, that is still a string even if it looks a bit like a
binary value so there is no effective change.

Cheers,

Richard




