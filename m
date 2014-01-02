Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0806B8D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 14:25:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s02EPksW019099; Thu, 2 Jan 2014 14:25:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DLVFWwnyU5VN; Thu,  2 Jan 2014 14:25:46 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s02EPe1c019096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 2 Jan 2014 14:25:41 GMT
Message-ID: <1388672736.11527.101.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 02 Jan 2014 14:25:36 +0000
In-Reply-To: <351b3404860f88138d7721c83d5fcfd928668a47.1387832257.git.paul.eggleton@linux.intel.com>
References: <cover.1387832257.git.paul.eggleton@linux.intel.com>
	<351b3404860f88138d7721c83d5fcfd928668a47.1387832257.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] Fix license notices for OE-Core
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
X-List-Received-Date: Thu, 02 Jan 2014 14:25:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-12-23 at 20:59 +0000, Paul Eggleton wrote:
> * Fix up LICENSE:
>   - Replace reference to Poky with OpenEmbedded
>   - Remove reference to bitbake and meta-extras that aren't part of this
>     repository
>   - Clarify license statements
> * Add a COPYING.GPLv2 file in meta/ for the GPLv2 parts
> * Add a COPYING.MIT file to meta-skeleton consistent with the other
>   meta-* directories
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  LICENSE                   |  16 +--
>  meta-skeleton/COPYING.MIT |  17 +++
>  meta/COPYING.GPLv2        | 339 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 364 insertions(+), 8 deletions(-)
>  create mode 100644 meta-skeleton/COPYING.MIT
>  create mode 100644 meta/COPYING.GPLv2

FWIW this broke everything which depends on the checksum of the LICENSE
file. I merged a fix for that and alerted Scott to the issue in the
manuals.

Cheers,

Richard


