Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1Sfb8t-00017t-FB
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 20:21:08 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga11.intel.com with ESMTP/TLS/RC4-MD5; 15 Jun 2012 11:09:22 -0700
Received: by dano14 with SMTP id o14so4361622dan.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 11:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=S8i0bo1bBB3G1iYUiAtU5MzIJ7FJT/PQIr2HiRQnwXc=;
	b=W4FDQ0+5fbT/35F1cVDpCKEsvMRa/X0/QaI8U5Nrv2+zFys/+VBBQQ1Qo1N+8Lm0FU
	DjzT7SOMOqInvhJ50vLS58lWmjtPgRh7RRP85woi8qNFmEegckBnReqA0L1W0PYRQBuo
	FumaWTDm9ZcECofxfGCXAB3aINeVET4bc3cDYoqEgUnNgB0/XGY1h9D8KrU1SpF8BXPw
	iqU/2RaHIpRjLa2tUWTVnMqimipKcupT9781Ag5DpIE1iqLO+efVZW0t1CDro0/JqWUJ
	oDCK7ELND3jtvTMUxZ35vJUOmJwpg2af53e9Dc8q8gJNEfHO0vbEKWxZNR09gHOjXWCJ
	O+KA==
Received: by 10.68.228.130 with SMTP id si2mr7688609pbc.59.1339783762390;
	Fri, 15 Jun 2012 11:09:22 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id wn3sm13955661pbc.74.2012.06.15.11.09.19
	(version=SSLv3 cipher=OTHER); Fri, 15 Jun 2012 11:09:20 -0700 (PDT)
Message-ID: <4FDB7A4E.3040700@intel.com>
Date: Fri, 15 Jun 2012 11:09:18 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339541557.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339541557.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQnYWu3wJ70auyey4u6BlbefGt/vjOmBvZCjxyKfV+yi9a0lopZaf8jypDrXgEvOvP7YoiNu
Cc: dvhart@linux.intel.com
Subject: Re: [v2: PATCH 0/2] linux-yocto/linux-yocto-rt: updates and 3.4-rt support
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
X-List-Received-Date: Fri, 15 Jun 2012 18:21:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2012 03:56 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> v2: changes.
>    - Fixed the machine_machine SRCREV
>    - Sent the oe-core vs yocto patch for yaffs2
>
> Original text follows:
>
> When I sent the initial 3.4 kernel and kernel recipes -rt wasn't
> building, so I didn't include it. I've since refreshed the patch,
> and done build/boot testing. 3.4.1-rt9 is up and running.
>
> I've also got a yaffs2 update, and rc6 cleanup from nitin for the
> 3.4 kernel repository in this pull request.
>
> cc: Darren Hart<dvhart@linux.intel.com>
>
> Cheers,
>
> Bruce
>
> The following changes since commit 5ed855d12cddf2de535c3f6d05d3dfe85d69d99d:
>
>    openjade-native: Ensure we reautoconf the package (2012-06-12 16:34:30 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (2):
>    linux-yocto/3.4: update yaffs2 and drop rc6
>    linux-yocto/3.4: create linux-yocto-rt recipe
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |   32 +++++++++++++++++++++++
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   14 +++++-----
>   2 files changed, 39 insertions(+), 7 deletions(-)
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>

Merged into OE-Core

Thanks
	Sau!



