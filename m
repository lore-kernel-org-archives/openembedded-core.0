Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TRoBc-00042Q-7Q
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 19:59:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Oct 2012 10:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,654,1344236400"; d="scan'208";a="233027956"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by orsmga002.jf.intel.com with ESMTP; 26 Oct 2012 10:45:20 -0700
Message-ID: <508ACC30.30900@linux.intel.com>
Date: Fri, 26 Oct 2012 10:45:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1351022257-15219-1-git-send-email-ross.burton@intel.com>
	<508AB9D5.1030902@linux.intel.com>
	<CAJTo0LbDAuE59KdzpYNrjjCwuYMi7Eo8YDCS6FgY=T8KUNkq5w@mail.gmail.com>
In-Reply-To: <CAJTo0LbDAuE59KdzpYNrjjCwuYMi7Eo8YDCS6FgY=T8KUNkq5w@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libxkbcommon: new window system-independent XKB library
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
X-List-Received-Date: Fri, 26 Oct 2012 17:59:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/2012 10:22 AM, Burton, Ross wrote:
> On 26 October 2012 17:27, Saul Wold <sgw@linux.intel.com> wrote:
>> My prior email about this being merged was wrong!!
>
> Really?
>

Ok, I am really confused now!  Your right the version'ed one is in 
master, which is this commit, your other commit with the git version is not.

Also, the git version had a change xorg-lib-common.inc also.


Sorry about the confusion

Thanks
	Sau!

> $ git show 3cabe899c11c65c7a1853b0d2b6fe459098dd4af
> commit 3cabe899c11c65c7a1853b0d2b6fe459098dd4af
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Tue Oct 23 20:57:37 2012 +0100
>
>      libxkbcommon: new window system-independent XKB library
>
>      Used by Wayland, Clutter, and more.
>
>      (From OE-Core rev: 2e4b2d2b8d6f2aeb37654f305bcf6c1c2ffc04f9)
>
>      Signed-off-by: Ross Burton <ross.burton@intel.com>
>      Signed-off-by: Saul Wold <sgw@linux.intel.com>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
> b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0
> new file mode 100644
> index 0000000..7304080
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
> ...
>
>> Maybe your missing the require xorg-lib-common.inc?
>
> Nope - it's only vaguely a xorg-lib and there's a good argument to
> move it up directly into recipes-graphics.
>
>>> +DEPENDS = "util-macros flex-native bison-native"
>>> +
>>
>> You have a different DEPENDS set than the git version.
>
> Yes, the release has fewer dependencies.
>
>> Should there be a libxkbcommon.inc that's shared between the git and
>> "version" bb files for the generic header / license stuff?
>
> Ah. Ignore the git version, that's been succeeded by the release packaging.
>
> Ross
>
>


