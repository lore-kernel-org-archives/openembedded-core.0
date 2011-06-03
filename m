Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QSN8P-0000Gq-NN
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 07:41:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jun 2011 22:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,313,1304319600"; 
   d="scan'208";a="6385510"
Received: from unknown (HELO [10.255.13.71]) ([10.255.13.71])
	by azsmga001.ch.intel.com with ESMTP; 02 Jun 2011 22:38:11 -0700
Message-ID: <4DE87343.6010209@linux.intel.com>
Date: Thu, 02 Jun 2011 22:38:11 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306856806.git.Martin.Jansa@gmail.com>
	<4fdf0bdf57b56d363e0b2ae8747e85fc84fbf8ca.1306856806.git.Martin.Jansa@gmail.com>
In-Reply-To: <4fdf0bdf57b56d363e0b2ae8747e85fc84fbf8ca.1306856806.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 1/1] create-pull-request: allow '+' in	git PROTO_RE, ie for 'git+ssh://'
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
X-List-Received-Date: Fri, 03 Jun 2011 05:41:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Martin,

No objection if this is a valid URL. I didn't include this because 1) I
didn't know about it and 2) it isn't listed in the git pull man page,
which is what I developed to. Is git+ssh... equivalent to ssh:// ?

As a minor nit, please include a body message for anything more
complicated than whitespace or typographical fixes.

Thanks,

--
Darren

On 05/31/2011 08:48 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  scripts/create-pull-request |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index 19b640f..d52098e 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -102,7 +102,7 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
>  		case "$REMOTE_URL" in
>  		*@*)
>  			USER_RE="[A-Za-z0-9_.@][A-Za-z0-9_.@-]*\$\?"
> -			PROTO_RE="[a-z][a-z]*://"
> +			PROTO_RE="[a-z][a-z+]*://"
>  			GIT_RE="\(^\($PROTO_RE\)\?$USER_RE@\)\([^:/]*\)[:/]\(.*\)"
>  			REMOTE_URL=${REMOTE_URL%.git}
>  			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#$GIT_RE#\4#")

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


