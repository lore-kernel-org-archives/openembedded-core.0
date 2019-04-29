Return-Path: <abuse@basmevissen.nl>
X-Greylist: delayed 324 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Apr 2019 11:02:02 UTC
Received: from hosting.emcodev.net (hosting.emcodev.net [178.18.92.162])
	by mail.openembedded.org (Postfix) with ESMTP id 2169760720
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 11:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id D44B3212001;
	Mon, 29 Apr 2019 12:56:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at hosting.emcodev.net
Received: from hosting.emcodev.net ([127.0.0.1])
	by localhost (hosting.emcodev.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fOqZ3BWeWug7; Mon, 29 Apr 2019 12:56:37 +0200 (CEST)
Received: from emcodev.nl (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id C6F6F12B6DD;
	Mon, 29 Apr 2019 12:56:37 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 29 Apr 2019 12:56:37 +0200
From: Bas Mevissen <abuse@basmevissen.nl>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
In-Reply-To: <CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
	<CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
Message-ID: <a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
X-Sender: abuse@basmevissen.nl
User-Agent: Roundcube Webmail/1.3.7
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte-native: reduce c++ requirements from c++17 -> c++11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2019 11:02:03 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable

On 2019-04-29 11:29, Andreas M=C3=BCller wrote:

(...)

>>=20
> Understood - hope to find time till tomorrow for this. Need to find an
> old machine for test because otherwise further fixes might remain
> incomplete again.
>=20

Why not add the g++ option --std=3Dc++11 when test building this recipe?

$cat test.cc

#include <string>

using namespace std::literals;

int main()
{
	return 0;
}


$ g++ --std=3Dc++17 test.cc -o test
$ g++ --std=3Dc++11 test.cc -o test
test.cc:5:22: error: =E2=80=98literals=E2=80=99 is not a namespace-name
     5 | using namespace std::literals;
       |                      ^~~~~~~~

-- Bas.

