Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdLt1-0000ka-QI for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 14:07:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLD079j008859
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 13:00:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08159-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 13:00:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLCxuol008843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 12:59:57 GMT
Message-ID: <1324472399.16323.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 12:59:59 +0000
In-Reply-To: <20111221115728.GA6198@ad.chargestorm.se>
References: <1324465882.16323.13.camel@ted>
	<CAP9ODKoktx1ByHFbizz7-Dcs3_cS3T5nrytFLcvU=O4imkN13A@mail.gmail.com>
	<20111221115728.GA6198@ad.chargestorm.se>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: nativesdk and native recipe names
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
X-List-Received-Date: Wed, 21 Dec 2011 13:07:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-21 at 12:57 +0100, Anders Darander wrote:
> * Otavio Salvador <otavio@ossystems.com.br> [111221 12:37]:
> > On Wed, Dec 21, 2011 at 09:11, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> 
> >     If we change nativesdk to become a prefix, the problem can share the
> >     same code as multilib and become much more widely usable rather than the
> >     current special cases. Its obviously a fairly major change in recipe
> >     naming though. Would changing this be acceptable?
> 
> > I second this as this makes it more consistent and predictable (with the plus
> > of avoiding naming hacks too).
> 
> I think I'll second this as well...
> 
> So far, I haven't used the multilib-features, but just to be sure, there
> is no problem with using prefixes both for multilibs and nativesdk?
> (Like I said, I haven't studied the multilib code/usecases, thus it's
> quite possible that this is a non-issue).

No, assuming the namespaces are kept separate which isn't an issue as
long as you never want a multilib called "nativesdk" :)

Cheers,

Richard




