Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RdKuW-0007Ni-Q0
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 13:04:41 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Wed, 21 Dec 2011 12:57:32 +0100
Date: Wed, 21 Dec 2011 12:57:29 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20111221115728.GA6198@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1324465882.16323.13.camel@ted>
	<CAP9ODKoktx1ByHFbizz7-Dcs3_cS3T5nrytFLcvU=O4imkN13A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoktx1ByHFbizz7-Dcs3_cS3T5nrytFLcvU=O4imkN13A@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
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
X-List-Received-Date: Wed, 21 Dec 2011 12:04:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Otavio Salvador <otavio@ossystems.com.br> [111221 12:37]:
> On Wed, Dec 21, 2011 at 09:11, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:

>     If we change nativesdk to become a prefix, the problem can share the
>     same code as multilib and become much more widely usable rather than the
>     current special cases. Its obviously a fairly major change in recipe
>     naming though. Would changing this be acceptable?

> I second this as this makes it more consistent and predictable (with the plus
> of avoiding naming hacks too).

I think I'll second this as well...

So far, I haven't used the multilib-features, but just to be sure, there
is no problem with using prefixes both for multilibs and nativesdk?
(Like I said, I haven't studied the multilib code/usecases, thus it's
quite possible that this is a non-issue).

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


