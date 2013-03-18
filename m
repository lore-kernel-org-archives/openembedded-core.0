Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHPrI-00085q-3y for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 03:31:34 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2Nk7T025848 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 02:23:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zTuwlvrAwjBx
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 02:23:45 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I2Nf6l025843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 02:23:44 GMT
Message-ID: <1363572871.4315.37.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2013 02:14:31 +0000
In-Reply-To: <1363572312-13399-4-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363572312-13399-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1363572312-13399-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: Re: [PATCH 04/13] distcc: Fix case where ${B} != ${S}
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
X-List-Received-Date: Mon, 18 Mar 2013 02:31:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-18 at 02:05 +0000, Richard Purdie wrote:
> Add patch to fix out of tree build failures.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/distcc/distcc_3.1.bb          |    1 +
>  .../distcc/files/separatebuilddir.patch             |   19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta/recipes-devtools/distcc/files/separatebuilddir.patch

I sent the version before I squashed an Upstream-Status into the patch,
final version will have that...

Cheers,

Richard



