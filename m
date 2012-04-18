Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SKWYg-0003tv-L3
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:12:38 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 18 Apr 2012 08:02:57 -0700
Received: by pbcuo15 with SMTP id uo15so30437111pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 08:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=Fbl8LsRDlesMdcDQKyXSTGmPnHCjqQMm9+NNkcjeguQ=;
	b=kqBv9GZkNOriABYi1+JLfnMbJ1fIaKZk79I8FM0i6Z3MWI3nuMBDSgDYow6kPKZWZ+
	mTzhIntVEC+eOH/9PzgOzahnhToJDlAohy+t8ED/kUNcIyMjcuJLxp6HREsWgfKm6Vf+
	eSY9hpPaTSMzbMTu531AJ+1CqRXJV2aSpF2q3JDCSuifetBZ+cCo0GRRd3y78CHdIwzb
	ApZPzf25RJrEmn2ZloPBE1mqD8v+xCet8OHX9MaTJBQ48ki5JO/HUvXqQCJsCYyRP2IH
	55Jd2TKg4B58zPx8SW98msAI8qvHKrm+N7neMNtbxxW0AxtZvpdO8SXPUoQRMeFxKti6
	jabg==
Received: by 10.68.218.33 with SMTP id pd1mr7110744pbc.42.1334761375772;
	Wed, 18 Apr 2012 08:02:55 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id wi8sm20812816pbc.11.2012.04.18.08.02.53
	(version=SSLv3 cipher=OTHER); Wed, 18 Apr 2012 08:02:54 -0700 (PDT)
Message-ID: <4F8ED79C.10509@intel.com>
Date: Wed, 18 Apr 2012 08:02:52 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334699045.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1334699045.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQkSuHk1ES3Pn5cibLCDxTwDqZqdOJSh+JrGvyDRrUtZRy7KS0q/hZLclH5QAprpbEJ9UtSK
Cc: denys@ti.com
Subject: Re: [PATCH 0/3] linux-yocto: -rc4 pull request
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
X-List-Received-Date: Wed, 18 Apr 2012 15:12:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2012 03:01 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's a set of 3 fixes that should be considered for -rc4.
> I split things up as much as I could, in the order that they
> should be taken.
>
> 1/3: linux-yocto: .diff is a valid patch extension
>
> This was reported on IRC today, it was an easy fix to an obvious
> problem. I doubled check the old cases and the new .diff case. I've
> also confirmed that patch.bbclass and these patch extensions agree.
>
> 2/3: linux-yocto/meta: beagleboard: disable CONFIG_PREEMPT
>
> This is the merge of Denys' fix for the beagleboard boot issue
> (aka YOCTO 1892]. With this booting on the xM is fixed. I've merged
> it into the tree in a named config, so we'll be able to easily identify
> it in the future. This same change is in the 3.0 kernel, and staged
> in the 3.2 and 3.4 trees as well.
>
> 3/3: linux-yocto/meta: remove kernel config audit warnings
>
> This is from Yang Shi @ Wind River. It fixes the issues reporting
> on the mailing list during the beta testing. The qemu* BSPs on 3.2
> and the hardware references on 3.0 now audit cleanly during the
> kernel build. This is one of those items we promise with each release,
> and it took a bit longer to acheive this time.
>
> Yang and I looked at these and only obselete / invalid options are
> removed or are tagged as 'hardware' to declare them valid and remove
> a warning. The functional changes limited. Yang boot tested the
> changes and I've re-run the audit testing here.
>
> (my master branch is a bit out of date, but I had to switch to my
> secondary builder for testing, and didn't want to disturb it. There
> are no changes in master that would impact this testing).
>
> cc: Yang Shi<yang.shi@windriver.com>
> cc: Denys Dmytriyenko<denys@ti.com>
>
> Cheers,
>
> Bruce
>
> The following changes since commit 5326847ef821c382aac26b474ab0e35939c463b7:
>
>    Hob: fixed a little view issue about package selection page (2012-04-16 12:56:25 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (3):
>    linux-yocto: .diff is a valid patch extension
>    linux-yocto/meta: beagleboard: disable CONFIG_PREEMPT
>    linux-yocto/meta: remove kernel config audit warnings
>
>   meta/classes/kernel-yocto.bbclass                  |    2 +-
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!





