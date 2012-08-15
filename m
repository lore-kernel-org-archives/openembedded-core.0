Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1T1bKE-0007HN-7A
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 12:59:46 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 9D3EFF811FB; Wed, 15 Aug 2012 04:47:51 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 61962F811E1;
	Wed, 15 Aug 2012 04:47:50 -0600 (MDT)
Message-ID: <502B7E58.5010002@mlbassoc.com>
Date: Wed, 15 Aug 2012 04:47:52 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <502A3A26.5090008@mlbassoc.com>
	<1344944787.23275.384.camel@phil-desktop>
	<502A3C00.6010609@mlbassoc.com>
	<20120814135946.GA5597@mi.fu-berlin.de>
	<3873D957-9816-4F94-B331-C3B7CB68FF37@dominion.thruhere.net>
	<502A6515.2050007@mlbassoc.com>
	<1344976258.7750.33.camel@x121e.pbcl.net>
In-Reply-To: <1344976258.7750.33.camel@x121e.pbcl.net>
Subject: Re: wpa-supplicant & EAP-TLS
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
X-List-Received-Date: Wed, 15 Aug 2012 10:59:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-08-14 14:30, Phil Blundell wrote:
> On Tue, 2012-08-14 at 08:47 -0600, Gary Thomas wrote:
>> I don't see anything explicit on this topic.  That said, the latest version
>> (1.0) is dual licensed GPL and BSD and the OpenSSL license is BSD compatible
>> from what I can tell.
>
> Yes, wpa-supplicant itself has been OK in this respect for some time.
> (The dual-licensing option has actually been removed for the very latest
> versions of wpa-supplicant and it's now under the BSD license only, but
> this is fine for OpenSSL compatibility purposes.)  However, there are
> quite a lot of other SSL-using programs which are only licensed under
> GPL terms and linking these with OpenSSL is problematic for some people.
> In an ideal world the oe-core license machinery would be able to detect
> and warn about that conflict, but I don't think we are quite there yet.
>
> As a general rule, we don't want to build and ship multiple SSL
> implementations when one will suffice.  GnuTLS seems to be the most
> compatible (in license terms) which is why it is generally the default.
> However, DISTROs which don't need to worry about the OpenSSL-GPL
> conflict for whatever reason might legitimately want to use OpenSSL
> globally, and DISTROs which aren't too bothered about potentially
> shipping both might legitimately want to use OpenSSL for specific
> packages like wpa-supplicant even if they have GnuTLS elsewhere.

I looked a bit into this and found that OE-core is already rather
schizo on this topic, so I'm not quite sure what needs to be done
here (i.e. should there be a DISTRO_FEATURES switch that chooses only
one?)  It would seem that all systems (at least those with wpa-supplicant
included) will already have both SSL libraries installed.

opsnssl is used in these packages:
   midori
   socat
   curl-native
   openvpn
   bind
   telepathy-idle
   dhcp
   xserver-kdrive
   tcf-agent
   python
   rpm
   git
   task-core-basic
   mailx
   libzypp (=> sat-solver, zypper)
   wget

gnutls is used by these packages:
   cups
   wpa-supplicant
   neon
   curl

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


