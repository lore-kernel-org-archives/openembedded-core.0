Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rzuqm-0001i2-OA
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 19:54:08 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Feb 2012 10:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="110482238"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by orsmga001.jf.intel.com with ESMTP; 21 Feb 2012 10:45:48 -0800
Message-ID: <4F43E65C.3020902@linux.intel.com>
Date: Tue, 21 Feb 2012 10:45:48 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/7] buildhistory fixes
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
X-List-Received-Date: Tue, 21 Feb 2012 18:54:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/14/2012 05:40 AM, Paul Eggleton wrote:
> Analysis of the recent output from buildhistory on the Yocto Project and
> Angstrom autobuilders showed a few anomalies and annoyances; this
> set of patches addresses all of the ones I noticed.
>
> The following changes since commit e5ad03093dfc4364d1407183f458df79f347c7a1:
>
>    guile: fix cross configure failure (2012-02-10 13:38:16 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fixes4
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fixes4
>
> Paul Eggleton (7):
>    classes/buildhistory: squash spaces out of image variables
>    classes/buildhistory: sort and de-dupe dependency graphs
>    classes/buildhistory: sort FILELIST in package info
>    classes/buildhistory: use hostname instead of reading /etc/hostname
>    classes/buildhistory: fix splitting on + in package list fields
>    buildhistory_analysis: avoid noise due to reordering
>    buildhistory_analysis: correctly split RDEPENDS/RRECOMMENDS
>
>   meta/classes/buildhistory.bbclass    |   25 +++++++++++++++++--------
>   meta/lib/oe/buildhistory_analysis.py |   31 ++++++++++++++++++++++++++-----
>   2 files changed, 43 insertions(+), 13 deletions(-)
>

Merged into OE-core

Thanks
	Sau!


