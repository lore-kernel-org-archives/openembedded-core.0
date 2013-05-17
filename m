Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UdRMf-0003zl-67
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 22:34:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 17 May 2013 13:16:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,694,1363158000"; d="scan'208";a="335952495"
Received: from unknown (HELO [10.255.12.62]) ([10.255.12.62])
	by fmsmga001.fm.intel.com with ESMTP; 17 May 2013 13:16:38 -0700
Message-ID: <51969025.6040407@linux.intel.com>
Date: Fri, 17 May 2013 23:16:37 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
In-Reply-To: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: updates for cogl, clutter and mx
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 20:34:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2013 02:25 PM, Tomas Frydrych wrote:
> The following set of patches updates clutter and friends; the recipes were
> completely reworked and use PACKAGECONFIG to facilitate easy reconfiguration
> to match distro / machine needs.
>
> Clutter and Cogl packages are renamed to use a '-1.0' suffix instead of the
> '-vmajor.vminor' suffix of the old recipes, in keeping up with the upstream
> versioning policy, and to simplify dependency maintenance (note that dev files
> for the 1.x series are not parallel installable anyway); the '-1.0' suffix is
> with a view toward the '2.0' series which are on the horizon.
>
> The Cogl recipe is moved into a subdirectory of its own, this seemed
> appropriate as Cogl is now a seprate project in its own right.
>
> The new versions are: cogl 1.4.0, clutter 1.14.4, clutter-gst 1.6.0,
> clutter-gtk 1.4.2. The mx recipe is fixed up to build against the updated cogl
> and clutter.
>

There are some issues with this patch set, some of the included patches 
either do not have Upstream-Status or Signed-off-by tags, please review 
that.

Also, I want to confirm that these are all new recipes and will not 
cause backward PRs (ie do you need PE bumps to these)?

Finally, I think you need to update the packagegroup-core-clutter recipe.

Thanks
	Sau!


> [PATCH 1/7] Remove old clutter recipes
> [PATCH 2/7] clutter.bbclass: helper class for clutter and friends
> [PATCH 3/7] New cogl recipe (1.14.0)
> [PATCH 4/7] New clutter recipe (1.14.4)
> [PATCH 5/7] New clutter gst recipe (1.6.0)
> [PATCH 6/7] New clutter-gtk recipe (1.4.2)
> [PATCH 7/7] Update mx recipe to build with clutter 1.14.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


