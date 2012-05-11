Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SStwg-0003Sh-CJ
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:48:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2012 10:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="142862740"
Received: from unknown (HELO [10.255.12.250]) ([10.255.12.250])
	by orsmga002.jf.intel.com with ESMTP; 11 May 2012 10:38:05 -0700
Message-ID: <4FAD4E7D.6070101@linux.intel.com>
Date: Fri, 11 May 2012 10:38:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336617615-25713-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1336617615-25713-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/2] typecheck.bbclass: update per current variable typing code
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
X-List-Received-Date: Fri, 11 May 2012 17:48:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2012 07:40 PM, Christopher Larson wrote:
> From: Christopher Larson<chris_larson@mentor.com>
>
> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
> ---
>   meta/classes/typecheck.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/typecheck.bbclass b/meta/classes/typecheck.bbclass
> index 646cd4e..353532d 100644
> --- a/meta/classes/typecheck.bbclass
> +++ b/meta/classes/typecheck.bbclass
> @@ -7,6 +7,6 @@ python check_types() {
>       if isinstance(e, bb.event.ConfigParsed):
>           for key in e.data.keys():
>               if e.data.getVarFlag(key, "type"):
> -                oe.types.value(key, e.data)
> +                oe.data.typed_value(key, e.data)
>   }
>   addhandler check_types

Merged this into OE-Core

Thanks
	Sau!


