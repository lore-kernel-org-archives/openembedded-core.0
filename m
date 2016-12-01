Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4B27671B24
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 16:16:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2016 08:16:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,282,1477983600"; d="scan'208";a="1093232409"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by fmsmga002.fm.intel.com with ESMTP; 01 Dec 2016 08:16:39 -0800
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20161201161420.7019-1-edwin.plauchu.camacho@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <918cd74d-f5f9-65e7-3c26-28872f167f22@linux.intel.com>
Date: Thu, 1 Dec 2016 10:22:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161201161420.7019-1-edwin.plauchu.camacho@linux.intel.com>
Cc: "Limon, Anibal" <anibal.limon@intel.com>
Subject: Re: [PATCH] AUH: status email indicates the URL of the log folder
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
X-List-Received-Date: Thu, 01 Dec 2016 16:16:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

This is not the correct list. AUH goes to the Yocto list, I believe.


On 12/01/2016 10:14 AM, Edwin Plauchu wrote:
> Upgrade status email should indicate the URL of the log folder instead of the tar URL
>
> [YOCTO #10670]
>
> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
> ---
>   upgradehelper.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/upgradehelper.py b/upgradehelper.py
> index 239fd88..3954e1f 100755
> --- a/upgradehelper.py
> +++ b/upgradehelper.py
> @@ -616,7 +616,7 @@ class Updater(object):
>                       publish_work_url = ''
>   
>               statistics_summary = self.statistics.get_summary(
> -                    publish_work_url, os.path.basename(work_tarball))
> +                    publish_work_url, self.uh_work_dir)
>   
>               statistics_file = os.path.join(self.uh_work_dir,
>                       "statistics_summary")


