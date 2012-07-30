Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Svp8k-00007y-Qq
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 14:32:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2012 05:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="179290450"
Received: from unknown (HELO helios.localnet) ([10.252.121.40])
	by orsmga002.jf.intel.com with ESMTP; 30 Jul 2012 05:20:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2012 13:20:24 +0100
Message-ID: <3645816.kkJX61QFDT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <1343650687-2307-1-git-send-email-ross.burton@intel.com>
References: <1343650687-2307-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] buildhistory: correctly handle reductions of numeric fields
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
X-List-Received-Date: Mon, 30 Jul 2012 12:32:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 30 July 2012 13:18:06 Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oe/buildhistory_analysis.py |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/buildhistory_analysis.py
> b/meta/lib/oe/buildhistory_analysis.py index 29dc4a9..d0e0808 100644
> --- a/meta/lib/oe/buildhistory_analysis.py
> +++ b/meta/lib/oe/buildhistory_analysis.py
> @@ -300,7 +300,7 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
>                      percentchg = ((bval - aval) / float(aval)) * 100
>                  else:
>                      percentchg = 100
> -                if percentchg < monitor_numeric_threshold:
> +                if abs(percentchg) < monitor_numeric_threshold:
>                      continue
>              elif (not report_all) and key in list_fields:
>                  if key == "FILELIST" and path.endswith("-dbg") and
> bstr.strip() != '':

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre


