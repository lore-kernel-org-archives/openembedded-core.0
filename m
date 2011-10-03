Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RAgqk-0001iZ-Ja for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 13:38:22 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p93BdEL9010515; Mon, 3 Oct 2011 12:39:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 03ouEE4gwWYw; Mon,  3 Oct 2011 12:39:14 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p93Bd9c6010509
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 3 Oct 2011 12:39:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 03 Oct 2011 12:32:40 +0100
In-Reply-To: <CALT56yPoAbv43D_CGsGHMjr+eQxhNUJAW_Ryznoi7Tz8tb7THA@mail.gmail.com>
References: <CALT56yPoAbv43D_CGsGHMjr+eQxhNUJAW_Ryznoi7Tz8tb7THA@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317641569.12684.0.camel@ted>
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@openembedded.org>
Subject: Re: [RFC] .la files cleanup
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
X-List-Received-Date: Mon, 03 Oct 2011 11:38:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-03 at 14:58 +0400, Dmitry Eremin-Solenikov wrote:
> Proposal: extend some bbclass with a task to remove unused .la files
> 
> Rationale: There are lots of recipes, which install tons of .la files
> (thanks libtool),
> but then do not ship them (correctly as most of them are unused in
> real systems).
> My proposal would be to include a special task or a
> do_install_append() part that
> will remove specified .la files. (like ${libdir}/xorg/modules/*/.la,
> ${libdir}/matchbox-panel/*.la, etc.). I see this usually done in
> do_install or in special do_install_append
> parts, but I think it would be better to handle this globally.

I think the simple append to the recipes concerned is just as simple as
any addition to core classes to try and do this generically...

Cheers,

Richard






