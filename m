Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qqe76-00040h-QY
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 06:40:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Aug 2011 21:35:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,341,1309762800"; d="scan'208";a="36539756"
Received: from unknown (HELO envy.home) ([10.255.14.241])
	by azsmga001.ch.intel.com with ESMTP; 08 Aug 2011 21:35:54 -0700
Message-ID: <4E40B92A.1000903@linux.intel.com>
Date: Mon, 08 Aug 2011 21:35:54 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
	<1312285430.2344.582.camel@rex> <4E38C941.30805@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
	<4E395235.9010709@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3044150C6@shsmsx502.ccr.corp.intel.com>
	<4E3A3562.1060907@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9A79@shsmsx502.ccr.corp.intel.com>
	<4E3AA24A.7050400@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9C11@shsmsx502.ccr.corp.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B5FF85AB28@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6B5FF85AB28@shsmsx502.ccr.corp.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Tue, 09 Aug 2011 04:40:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08/08/2011 07:13 PM, Cui, Dexuan wrote:
> Cui, Dexuan wrote on 2011-08-04:
>> Darren Hart wrote on 2011-08-04:
>>> On 08/04/2011 12:37 AM, Cui, Dexuan wrote: Please remember to include a
>>> description of the problem and the approach taken to fix it. This
>>> eliminates wasted time trying to decipher it later or by people
>>> unfamiliar with the history. This is important even for simple changes.
>>> In this case something like:
>>>
>>> " The previous fix for a bug in Ubuntu 10.04 readlink, $COMMIT_ID,
>>> notified the user when a trailing slash was used. As there is no
>>> semantic difference, simply remove any trailing slashes and proceed
>>> without nagging the user. "
>> Thanks! I'll use the description.
>>
>>>> diff --git a/scripts/oe-buildenv-internal
>>>
>>> This shouldn't be a question. If the documented behavior of readlink
>>> is to return empty when the path doesn't exist, then assume this to
>>> be the case.
>> The latest manual of readlink says readlink should ignore trailing slash.
>>
>>> Also, it is a good idea to avoid contractions in printed error messages.
>>>
>>> 	echo >&2 "Error: the directory $PARENTDIR does not exist."
>> Ok, I'll change "doesn't" to "does not".
>>
>>> Otherwise, this looks good to me.
>> Please review the new patch (I paste it at the end of the mail, too)
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=dcui/bug-671&id=593e3506f4d4d9f6030100eac8c8e0af7f8ce3eb
> Hi Darren,
> Could you please comment on this new version of patch?
> I sent it out for several days ago. Maybe it was drowned in the mailing list.

Hi Dexuan, sorry for the delay, I have been on jury duty for a week, just getting back now.

> From 593e3506f4d4d9f6030100eac8c8e0af7f8ce3eb Mon Sep 17 00:00:00 2001
> From: Dexuan Cui <dexuan.cui@intel.com>
> Date: Thu, 04 Aug 2011 06:53:20 +0000
> Subject: scripts/oe-buildenv-internal: improve the error detecting for $BDIR
> 
> Thanks a lot to Darren Hart and Paul Eggleton's suggestions!
> 
> A description of this improvement from Darren is:
> "

Drop the above two lines, we don't need these in the
permanent git history :-) Simply adding a pair of CC
lines below the Signed-off-by for Paul and myself
is sufficient to indicate our involvement. If a
significant portion of the patch had been authored by
either Paul or myself, then getting our permission to
include our Signed-off-by would be appropriate. In this
case, a simple CC will suffice.

> The previous fix for a bug in Ubuntu 10.04 readlink,
> be2a2764d8ceb398d81714661e6f199c8b11946c, notified the user when a trailing
> slash was used. As there is no semantic difference, simply remove any
> trailing slashes and proceed without nagging the user.
> "
> 
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>

CC: Darren Hart <dvhart@linux.intel.com>
CC: Paul Eggleton <paul.eggleton@linux.intel.com>


> ---
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index 117b0c5..9988c9f 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -28,14 +28,22 @@ if [ "x$BDIR" = "x" ]; then
>      if [ "x$1" = "x" ]; then
>          BDIR="build"
>      else
> -        BDIR=`readlink -f "$1"`
> -        if [ -z "$BDIR"  ]; then
> -            if expr "$1" : '.*/$' >/dev/null; then
> -                echo >&2 "Error: please remove any trailing / in the argument."
> -            else
> -                PARENTDIR=`dirname "$1"`
> -                echo >&2 "Error: the directory $PARENTDIR doesn't exist?"
> -            fi
> +        BDIR="$1"
> +        if [ "$BDIR" = "/" ]; then
> +            echo >&2 "Error: / is not supported as a build directory."

I understand wanting to use stderr, but I don't see the >&2
very often in our shell scripts. Is this common practice? If
so, it's fine, I'm just wondering.

> +            return 1
> +        fi
> +
> +        # Remove possible trailing slash. This is used to work around

                                      slashes

> +        # buggy readlink of Ubuntu 10.04 that doesn't ignore trailing slash

             a buggy        s/of/in/                                     slashes

> +        # and hence "readlink -f new_dir_to_be_created/" returns empty.
> +        # See YOCTO #671 for details.


Please don't include references to bug numbers in the code. Imagine what it
would look like if we included every bug in the source! :-) Reference the bug
in the git commit comment header.


> +        BDIR=`echo $BDIR | sed -re 's|/+$||'`
> +
> +        BDIR=`readlink -f "$BDIR"`
> +        if [ -z "$BDIR" ]; then
> +            PARENTDIR=`dirname "$1"`
> +            echo >&2 "Error: the directory $PARENTDIR does not exist?"
>              return 1
>          fi
>      fi

With the trivial changes mentioned above, this looks good to me.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


