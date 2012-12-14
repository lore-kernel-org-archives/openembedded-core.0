Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1TjYU1-0001on-Uu
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 17:51:34 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 1315AF8120B; Fri, 14 Dec 2012 09:36:59 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 828D4F811EC;
	Fri, 14 Dec 2012 09:36:58 -0700 (MST)
Message-ID: <50CB55C3.2070409@mlbassoc.com>
Date: Fri, 14 Dec 2012 09:37:23 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50CB4B04.2080202@mlbassoc.com>
In-Reply-To: <50CB4B04.2080202@mlbassoc.com>
Subject: Re: libsoup and gnutls
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
X-List-Received-Date: Fri, 14 Dec 2012 16:51:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-12-14 08:51, Gary Thomas wrote:
> Using the latest recipes (libsoup-2.4_2.38.1.bb, gnutls_2.12.21.bb)
> I am unable to open an HTTPS server.  It always gets this error:
>    TLS support is not available
>
> I can't tell how to configure/use libsoup so it will only try to
> make an SSLv3 connection instead of TLS.
>
> Any ideas?

Solution: install glib-networking

Perhaps this should be in RRECOMMENDS for libsoup?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


