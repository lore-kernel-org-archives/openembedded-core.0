Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3FDC86C99C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 16:44:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8OGiFK5026356; Tue, 24 Sep 2013 17:44:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v_rrgvU9PFpr; Tue, 24 Sep 2013 17:44:14 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8OGiAmr026353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 24 Sep 2013 17:44:11 +0100
Message-ID: <1380041046.18603.298.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex DAMIAN <alexandru.damian@intel.com>
Date: Tue, 24 Sep 2013 17:44:06 +0100
In-Reply-To: <3145da4c2b158fd0e2684b66cd68dd769a1c94de.1380040307.git.alexandru.damian@intel.com>
References: <cover.1380040307.git.alexandru.damian@intel.com>
	<c05def412d4cd60198d038ad9c20c90e94dcbca7.1380040307.git.alexandru.damian@intel.com>
	<3145da4c2b158fd0e2684b66cd68dd769a1c94de.1380040307.git.alexandru.damian@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] package.bbclass: trigger event when collecting package info
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
X-List-Received-Date: Tue, 24 Sep 2013 16:44:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-24 at 17:36 +0100, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
> 
> Adding an event that contains the package details,
> which is triggered when the emit_pkgdata runs.
> This is used to collect package information in the UI clients.
> 
> Slight rewrite of the file-writing section as to make
> the code easier to maintain.
> 
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  meta/classes/package.bbclass | 41 +++++++++++++----------------------------
>  1 file changed, 13 insertions(+), 28 deletions(-)

Simply put, this isn't going in and it isn't right.

If you want to do this, please do this in a different class file which
hooks into the packaging code and generates the event needed, preferably
with one event rather than two.

The class can then be inherited when webhob is enabled (and removed from
influencing the sstate checksums).

Cheers,

Richard


