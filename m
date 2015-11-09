Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id B2A9D65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 16:36:49 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id fUcl1r0070BmcFC01UcmZF; Mon, 09 Nov 2015 16:36:49 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=E4sw3vpl c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=0Bzu9jTXAAAA:8
	a=-An2I_7KAAAA:8 a=kj9zAlcOel0A:10 a=qtqOOiqGOCEA:10 a=Q4-j1AaZAAAA:8
	a=lnZETNIDpv_otoEM2dMA:9 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1ZvpQz-0001mf-O6; Mon, 09 Nov 2015 16:36:45 +0000
Date: Mon, 9 Nov 2015 16:36:45 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20151109163645.GA6647@mcrowe.com>
References: <cover.1416554582.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1416554582.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH V2 0/2] Use ALTERNATIVES to manage 'nologin'
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
X-List-Received-Date: Mon, 09 Nov 2015 16:36:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Friday 21 November 2014 at 15:27:45 +0800, Chen Qi wrote:
> The following changes since commit 4a888b2ab61662c7f749b5d1e64af92ed613d8eb:
> 
>   gtk+: drop part of patch adding useless file (2014-11-20 14:08:57 +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib ChenQi/nologin-alternatives
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/nologin-alternatives
> 
> Chen Qi (2):
>   util-linux: use ALTERNATIVE mechanism to manage 'nologin'
>   shadow: use ALTERNATIVE to manage 'nologin'
> 
>  meta/recipes-core/util-linux/util-linux.inc | 3 ++-
>  meta/recipes-extended/shadow/shadow.inc     | 7 ++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)

These patches never seem to make it into master as far as I can see. I
couldn't find any posted objections.

They now require some minor tweaks to apply but appear to work correctly
for me and solve my -dbg package conflicts.

Is there any chance of them being applied?

Thanks.

Mike.


