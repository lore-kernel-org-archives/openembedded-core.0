Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A67A3614F3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 22:20:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r89MXpcj028396; Mon, 9 Sep 2013 23:33:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fX-n30q2CTpt; Mon,  9 Sep 2013 23:33:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r89MXh8B028392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 9 Sep 2013 23:33:45 +0100
Message-ID: <1378765203.3484.148.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jeff Polk <jeff.polk@windriver.com>
Date: Mon, 09 Sep 2013 23:20:03 +0100
In-Reply-To: <1378744154-6489-1-git-send-email-jeff.polk@windriver.com>
References: <1378744154-6489-1-git-send-email-jeff.polk@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sanity.bbclass: add xz to SANITY_REQUIRED_UTILITIES
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
X-List-Received-Date: Mon, 09 Sep 2013 22:20:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-09-09 at 11:29 -0500, Jeff Polk wrote:
> xz is commonly available and is now used by some recipes
> It's reasonable to expect it to be present so error immediately
> if it's not.
> 
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> ---
>  meta/classes/sanity.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Is it in all the base distros we use as standard or do we need update
the quickstart? Shouldn't we also be adding it to ASSUME_PROVIDED?

I think there is a different bug which may sometimes lead to build
failures due to the dependency on it not being generated correctly.

Cheers,

Richard

> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index a49b405..26038cb 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -2,7 +2,7 @@
>  # Sanity check the users setup for common misconfigurations
>  #
>  
> -SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk chrpath wget cpio"
> +SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk chrpath wget cpio xz"
>  
>  def bblayers_conf_file(d):
>      return os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')



