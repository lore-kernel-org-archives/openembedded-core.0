Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SIovS-0007WL-8K
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 00:25:06 +0200
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 13 Apr 2012 15:15:43 -0700
Received: by mail-pz0-f44.google.com with SMTP id z14so14537726dad.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 15:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=gLPgnl3uM0wpTkPhLjbioeqycqxeZhUG59T5F3+WbJI=;
	b=k2E/4nCDXVeNX3xhOpOd71Tv5nEQpvb/czAARfOpn3fU9BTZeVCMNsRlynqyuZggfy
	kwd6kT6zZDXL/eVW3OstlsRLFfCNvuE1BNj+y4iIMpK54LzpF1A46J7EKch1PsI8+Mzw
	89tZQPSLXux7KwxafaZJeWE3WUAJgQln1w/la8eiQkW9CYROi8JtMJ4WC4aZTV7tmEFY
	sez6qXt/ffKeICjzrkDnB4W72VCHluX9w70/PzM+htMBJZ9/77A5pbqRdtDj8LGHRs7w
	Dn91QrIy04ggHQCvxLHQR1xp8mvqCnLMkKWCJdaQ38QfOqvObdBcVXvTjdEddLut+d7s
	dM5A==
Received: by 10.68.238.42 with SMTP id vh10mr7939972pbc.70.1334355343136;
	Fri, 13 Apr 2012 15:15:43 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id sx2sm1757246pbc.26.2012.04.13.15.15.40
	(version=SSLv3 cipher=OTHER); Fri, 13 Apr 2012 15:15:41 -0700 (PDT)
Message-ID: <4F88A58B.9040100@intel.com>
Date: Fri, 13 Apr 2012 15:15:39 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334349764.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1334349764.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQkHfdiVkhYM7HDr63sXaSVILJcSUWV0i3gCkLLr74vy2P8iKX3771gpdRiJNfYDgP0i+9Wn
Subject: Re: [PATCH 0/2] linux-yocto: (hopefully) final fixes
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
X-List-Received-Date: Fri, 13 Apr 2012 22:25:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/13/2012 01:55 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here are two last commits for linux-yocto. One is a pending
> SRCREV update for the romley. It's included to make sure that the
> meta branch head matches the SRCREVs. Otherwise, we are relying
> on branch renaming for everyone. There's no risk, and this is already
> in use by the BSP layer.
>
> The second commit is a change that I've been working on all week
> with Andrea and his work on extending linux-yocto-tiny. The
> work that was done to support out of tree features was missing
> .cfg and defconfig support. This meant that you could run into
> patching issues.
>
> To fix it, I pulled back changes that I made a few weeks ago
> to allow all types of fragments, features, and defconfigs to
> be supported. The diffstat is largely a movement of code from
> the recipe back to the tools (where it belonged), but the intent
> stays the same.
>
> I've tested this on every use case I could find ..
>
>    - core BSPs
>    - Nitin's x32 use case
>    - Andrea's use case
>    - kernel.org test case
>    - Constructed tests with fragments, nested features, etc.
>
> Andrea has also tested his use case.
>
> These all pass, and the code fixes an intended feature for 1.2 as
> well as fixing the immediate bug in question.
>
> This is for YOCTO 2250.
>
> Cheers,
>
> Bruce
>
> cc: andrea.adami@gmail.com
>
>
> The following changes since commit 023a12b70b1bbbd3625ab5a6df2ae9943a14bea5:
>
>    linux-yocto/meta-yocto: update hardware reference SRCREVs (2012-04-13 16:35:59 -0400)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
>
> Bruce Ashfield (2):
>    linux-yocto/3.2: add igb support to romley
>    linux-yocto: allow .cfg, .scc, .patch and defconfigs to be processed
>      in order
>
>   meta/classes/kernel-yocto.bbclass                  |   74 ++------------------
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +-
>   5 files changed, 11 insertions(+), 71 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



