Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RZ3pw-0001or-B4 for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 18:02:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB9GtMcG002509
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Dec 2011 16:55:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01776-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2011 16:55:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB9GtEPx002503
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Dec 2011 16:55:15 GMT
Message-ID: <1323449725.5309.187.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 09 Dec 2011 16:55:25 +0000
In-Reply-To: <CAP9ODKpvAYr7e+9bS4Uyq8F_nsVdjoBchZPttqbcJGsoZDfCiQ@mail.gmail.com>
References: <1323427912-10122-1-git-send-email-otavio@ossystems.com.br>
	<1323440295.5309.164.camel@ted>
	<CAP9ODKpvAYr7e+9bS4Uyq8F_nsVdjoBchZPttqbcJGsoZDfCiQ@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] connman: update to 0.78
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
X-List-Received-Date: Fri, 09 Dec 2011 17:02:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-09 at 14:38 -0200, Otavio Salvador wrote:
> On Fri, Dec 9, 2011 at 12:18, Richard Purdie:

>  
>         f) Reorder variables in the file so as to make the diff
>         unreadable and
>           hard to review
>
> This was indeed done and I am sorry but it does seems more easy to
> follow now.

In future please do this as a separate commit which just changes the
order. I will start just outright rejecting patches which combine code
changes and unrelated ordering changes since it makes the patches
unnecessarily hard to review.
 
>         So all things considered, this kind of change is a nightmare
>         to review
>         in this form and the commit message only covers half the
>         changes it
>         makes. We need to do better than this...
> 
> 
> Not easy to accomplish as the difference between meta-oe and oe-core
> on this was huge. It could have been  done better, sure ... and a v2
> patch will come shortly.

Thanks. I think the best way to improve this in future would be to keep
code changes and ordering (or whitespace) changes in separate commits
(and also enable rename detection on the change you send).

Cheers,

Richard




