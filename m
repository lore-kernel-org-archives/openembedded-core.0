Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RiUCi-0005gS-3d
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 18:00:44 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RiU5c-0002PJ-IV
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:53:24 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 16:53:23 +0000
In-Reply-To: <1325695637.20759.32.camel@ted>
References: <1325689535.28005.59.camel@phil-desktop>
	<1325691189.20759.14.camel@ted>
	<CAEsOVNcsY-dNYBz1Y6BVAQ-N7hVyaxOMcsniev9z455m9GYh5A@mail.gmail.com>
	<CABcZANmEZ6Oy6q7gL2WCCtphSA7fEHJsM0dre0tNpXvPdn2crQ@mail.gmail.com>
	<1325695277.28005.76.camel@phil-desktop>
	<1325695637.20759.32.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325696004.28005.80.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: sstate compression
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
X-List-Received-Date: Wed, 04 Jan 2012 17:00:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 16:47 +0000, Richard Purdie wrote:
> Just to note that looking for multiple versions can cause a fair bit of
> network traffic as for http:// mirror urls it will have to wget each in
> turn.

True, though I suppose if the fetching was to be moved into python
(rather than an external wget) then it would just be repeated GETs over
a single persistent connection which wouldn't be all that much overhead.
And, even with non-persistent connections, the amount of data involved
in establishing an extra TCP connection and sending a GET is fairly
negligible compared to the size of the download you're going to end up
doing.

>Better would be one file name and dynamic detection of the
>compression format I guess.

Yes, or that.  It's a shame that "tar -a" doesn't have the capability to
determine the compression method using magic numbers instead of the
filename.

p.




