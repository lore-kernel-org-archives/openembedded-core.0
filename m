Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RIRBM-0003t4-1J
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 22:31:40 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BCCB511000B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 22:25:43 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 18D4211000B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 22:25:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g229044144.adsl.alicedsl.de
	[92.229.44.144]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 22:25:42 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id D424C3C490; Mon, 24 Oct 2011 22:25:41 +0200 (CEST)
Date: Mon, 24 Oct 2011 22:25:41 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111024202541.GA14251@mail.adw-basketball.de>
References: <4EA5C803.1030205@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4EA5C803.1030205@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Dependency problem in mysql ?
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
X-List-Received-Date: Mon, 24 Oct 2011 20:31:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2011 at 10:18:11PM +0200, Eric B=E9nard wrote:
> Hi,
>=20
> while testing a build from scratch of a configuration which was
> working, I increased BB_NUMBER_THREADS to  "8" and PARALLEL_MAKE to
> "-j6" and started to get problems with mysql (log at the end of this
> mail).
>=20
> Reducing BB_NUMBER_THREADS to 4 "solved" the problem.
>=20
> Any idea what dependency could be missing in mysql ?
>=20
> Thanks,
> Eric

None,

you just hit a parallel make error inside mysql I think.

Bye Henning


