Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1XsT-0001Vr-ME
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 08:14:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2011 23:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="46327293"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2011 23:09:16 -0700
Message-ID: <4E685C0C.3080900@linux.intel.com>
Date: Wed, 07 Sep 2011 23:09:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1315454900.git.sgw@linux.intel.com>
	<968b5b20ecf5bf9372217781135ead2acf8013a2.1315454900.git.sgw@linux.intel.com>
In-Reply-To: <968b5b20ecf5bf9372217781135ead2acf8013a2.1315454900.git.sgw@linux.intel.com>
Subject: Re: [PATCH 1/1] python-native: add link for python2
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
X-List-Received-Date: Thu, 08 Sep 2011 06:14:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2011 09:10 PM, Saul Wold wrote:
> Add link for python2 as some configuration tools search from a python2
> and could find the host python instead of the python-native.
>
> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> ---
>   .../recipes-devtools/python/python-native_2.6.6.bb |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python-native_2.6.6.bb b/meta/recipes-devtools/python/python-native_2.6.6.bb
> index 2b00d32..503bd96 100644
> --- a/meta/recipes-devtools/python/python-native_2.6.6.bb
> +++ b/meta/recipes-devtools/python/python-native_2.6.6.bb
> @@ -42,4 +42,7 @@ do_install() {
>   	for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
>   		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
>   	done
> +
> +	ln -sf ${D}${bindir}/python ${D}${bindir}/python2
> +
This is the right idea, but clearly this is the wrong execution for 
shared state, I tried a ${STAING_DIR...} variant but that also failed, 
what am I doing wrong?

I see this type of ln usage in other recipes.

Sau!

>   }


