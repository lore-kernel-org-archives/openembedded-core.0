Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9843372670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Dec 2014 08:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBP8i91a032288; Thu, 25 Dec 2014 08:44:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pwAOoGXBWj9d; Thu, 25 Dec 2014 08:44:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBP8hsx2032285
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 25 Dec 2014 08:44:05 GMT
Message-ID: <1419497071.6428.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Thu, 25 Dec 2014 08:44:31 +0000
In-Reply-To: <f7818c823b514c419bf578416843c68538accf0f.1419473606.git.hongxu.jia@windriver.com>
References: <960042129c61baae9bdf304c256f8d2e8dd578da.1419309149.git.hongxu.jia@windriver.com>
	<f7818c823b514c419bf578416843c68538accf0f.1419473606.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 6/6] groff: upgrade 1.22.3
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
X-List-Received-Date: Thu, 25 Dec 2014 08:44:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-12-25 at 10:19 +0800, Hongxu Jia wrote:
> Rebase groff-1.22.2-correct-man.local-install-path.patch to 1.22.3
> 
> Refer what debian did, we add perl to RRECOMMENDS_${PN}, here is the
> explanation in groff 1.22.3 README:
> ...
> Additionally, producing `PDF' output directly with the `gropdf' device needs
> a working installation of `perl'.  The same is true for some other
> preprocessors like `chem'.
> ...
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...off-1.22.2-correct-man.local-install-path.patch | 32 ---------------
>  .../groff-correct-man.local-install-path.patch     | 45 ++++++++++++++++++++++
>  .../groff/{groff_1.22.2.bb => groff_1.22.3.bb}     |  7 ++--
>  3 files changed, 49 insertions(+), 35 deletions(-)
>  delete mode 100644 meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
>  create mode 100644 meta/recipes-extended/groff/groff-1.22.3/groff-correct-man.local-install-path.patch
>  rename meta/recipes-extended/groff/{groff_1.22.2.bb => groff_1.22.3.bb} (89%)

Given the original error message, if you build this on a machine
with /bin/perl, does it not still give an error at rootfs time?

Do we need to correctly set the path to perl in the recipe?

Cheers,

Richard



