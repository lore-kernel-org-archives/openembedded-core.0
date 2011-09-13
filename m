Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R3Vd9-0001WC-GG for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 18:14:39 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8DGFY7M028211 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:15:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id b3jzvFlu0njZ
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:15:34 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8DGFTTV028190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:15:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2011 17:09:19 +0100
In-Reply-To: <3c9ecbba125ebd7f2945ffe8d11f0ebc545e88e7.1315920902.git.edwin.zhai@intel.com>
References: <cover.1315920902.git.edwin.zhai@intel.com>
	<3c9ecbba125ebd7f2945ffe8d11f0ebc545e88e7.1315920902.git.edwin.zhai@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1315930167.13526.1.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] opensp: Fix hard path in native nsgmls.
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
X-List-Received-Date: Tue, 13 Sep 2011 16:14:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 21:43 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> This relocation issues caused following bug and introduce one partial fix bb024d:
> [YOCTO #1440]
> 
> But the environment val hacking is not working all the time, as nsgmsl may
> append wrong path in some case. This fix use search directory "-D" as solution.
> And more important, change the iputils' way to make doc: Use the sysid in
> current directory instead of parent directory, as "../" is also appended to the
> search directory then lead searching failure.
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> CC: Saul Would <sgw@linux.intel.com>
> ---
>  meta/recipes-devtools/opensp/opensp_1.5.bb         |    4 +-
>  .../iputils/files/nsgmls-path-fix.patch            |   27 ++++++++++++++++++++
>  meta/recipes-extended/iputils/iputils_s20101006.bb |    1 +
>  3 files changed, 30 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/iputils/files/nsgmls-path-fix.patch

Merged to master, thanks.

Richard



