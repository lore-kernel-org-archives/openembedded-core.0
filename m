Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBBgF-0004sm-LX for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 22:33:35 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94KYTj6022557 for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 21:34:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id an-yKsKki1c2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 21:34:29 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94KYQf5022543
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 21:34:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 21:27:56 +0100
In-Reply-To: <4E8B6564.4090002@balister.org>
References: <4E8B6564.4090002@balister.org>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317760084.14671.99.camel@ted>
Mime-Version: 1.0
Subject: Re: Bringing an image from OE to OE-Core
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
X-List-Received-Date: Tue, 04 Oct 2011 20:33:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-04 at 15:58 -0400, Philip Balister wrote:
> I'm about to start bringing some images I use from OE to OE-core. The 
> first issue I saw is there is no task-proper-tools in oe-core (where 
> oe-core means the set of layers created by the Angstrom setup scripts).
> 
> Should I add task-proper-tools to meta-oe, or is there a better way to 
> add a full features set of tools to an image? Basically, the image is 
> more desktop like than embedded.

The core-image-lsb is the OE-Core image with the full fat tools
included. I'd suggest starting from that and see what is missing.

I'd also note we have IMAGE_FEATURES which you can add tools-sdk to
which may or may not include more of what you want (basically a
development toolchain+tools).

CHeers,

Richard





