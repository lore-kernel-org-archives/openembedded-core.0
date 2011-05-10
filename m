Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJomu-0002Jz-Ih
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 17:23:52 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2011 08:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,346,1301900400"; d="scan'208";a="690696792"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2011 08:21:06 -0700
Message-ID: <4DC957E1.5010706@linux.intel.com>
Date: Tue, 10 May 2011 08:21:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Adrian Alonso <aalonso@secretlab.ca>
References: <1305039188-3458-1-git-send-email-aalonso@secretlab.ca>
In-Reply-To: <1305039188-3458-1-git-send-email-aalonso@secretlab.ca>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] readline: delete recipe version 6.1
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
X-List-Received-Date: Tue, 10 May 2011 15:23:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2011 07:53 AM, Adrian Alonso wrote:
> * Readline delete recipe version 6.1
>    in favor of using readline version 6.2
>
Can you re-submit 1 patch that moves the the version from 6.1 to 6.2, 
that will help maintain history continuity of the recipe.  So it would
be a move and an edit as needed.

Thanks
	Sau!

> Signed-off-by: Adrian Alonso<aalonso@secretlab.ca>
> ---
>   meta/recipes-core/readline/readline_6.1.bb |    6 ------
>   1 files changed, 0 insertions(+), 6 deletions(-)
>   delete mode 100644 meta/recipes-core/readline/readline_6.1.bb
>
> diff --git a/meta/recipes-core/readline/readline_6.1.bb b/meta/recipes-core/readline/readline_6.1.bb
> deleted file mode 100644
> index b6773b2..0000000
> --- a/meta/recipes-core/readline/readline_6.1.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require readline.inc
> -
> -PR = "r0"
> -
> -SRC_URI[md5sum] = "fc2f7e714fe792db1ce6ddc4c9fb4ef3"
> -SRC_URI[sha256sum] = "f0caf608c06ccd6d56b3bee1843458d509c53f9b53dffffe07cc11d8f03fa969"


