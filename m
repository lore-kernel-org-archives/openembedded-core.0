Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4boA-0001Kj-U1 for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:02:35 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GH3TrJ032113 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 18:03:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JjpGy8UK12S8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 18:03:29 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GH3NqI032100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 18:03:25 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 17:57:10 +0100
In-Reply-To: <1315925099-9259-1-git-send-email-eric@eukrea.com>
References: <CAP9ODKqCg-GOR-HLcuXzrgCVM2tt0anUCTeAEVoqGVFVG4YkEQ@mail.gmail.com>
	<1315925099-9259-1-git-send-email-eric@eukrea.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316192238.20858.45.camel@ted>
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	p8GH3TrJ032113
Subject: Re: [PATCH v2] qt4: fix generated sdk
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
X-List-Received-Date: Fri, 16 Sep 2011 17:02:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-09-13 at 16:44 +0200, Eric B=C3=A9nard wrote:
> - qt4-tools-nativesdk : actually the qmake binary which gets installed
> comes from the native recipe. This patch fix this problem by laucnhing
> configure twice : once to compile qmake using the right toolchain for
> nativesdk, and a second time using the native qmake to compile all the
> other tools for the nativesdk. Then we install the right qmake.

I was reading through this and wondered why we can't this use the qmake
from the qt4-tools-native recipe?

Cheers,

Richard





