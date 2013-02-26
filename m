Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UATkq-0006Es-0T
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 00:16:13 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2013 14:58:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,743,1355126400"; d="scan'208";a="268098564"
Received: from unknown (HELO envy.home) ([10.255.12.203])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2013 14:59:37 -0800
Message-ID: <512D3E58.1030905@linux.intel.com>
Date: Tue, 26 Feb 2013 14:59:36 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
	<04ccee436225f0a27f74cb9e7cb7b94b3796c965.1361862860.git.liezhi.yang@windriver.com>
In-Reply-To: <04ccee436225f0a27f74cb9e7cb7b94b3796c965.1361862860.git.liezhi.yang@windriver.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] mkdebugfs.sh: convert the tab to 4 spaces
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
X-List-Received-Date: Tue, 26 Feb 2013 23:16:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

And NACK on this one :-)

Shell scripts should use tabs.

--
Darren

On 02/26/2013 01:24 AM, Robert Yang wrote:
> [YOCTO #3848]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../e2fsprogs/e2fsprogs/mkdebugfs.sh               | 74 +++++++++++-----------
>  1 file changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh
> index 5dfa380..41a13cb 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh
> @@ -6,44 +6,44 @@ DEBUGFS="debugfs/debugfs"
>  yes | mkfs.ext4 test.img
>  
>  {
> -	CWD="/"
> -	find $SRCDIR | while read FILE; do
> -		#TGT=${FILE#$SRCDIR}
> -		TGT=$(basename "${FILE#$SRCDIR}")
> -		DIR=$(dirname "${FILE#$SRCDIR}")
> +    CWD="/"
> +    find $SRCDIR | while read FILE; do
> +        #TGT=${FILE#$SRCDIR}
> +        TGT=$(basename "${FILE#$SRCDIR}")
> +        DIR=$(dirname "${FILE#$SRCDIR}")
>  
> -		# Skip the root dir
> -		if [ -z "$TGT" ]; then
> -			continue
> -		fi
> +        # Skip the root dir
> +        if [ -z "$TGT" ]; then
> +            continue
> +        fi
>  
> -		if [ "$DIR" != "$CWD" ]; then
> -			echo "cd $DIR"
> -			CWD="$DIR"
> -		fi
> +        if [ "$DIR" != "$CWD" ]; then
> +            echo "cd $DIR"
> +            CWD="$DIR"
> +        fi
>  
> -		case $(stat -c "%F" $FILE) in
> -		"directory")
> -			echo "mkdir $TGT"
> -			;;
> -		"regular file")
> -			echo "write $FILE $TGT"
> -			;;
> -		"symbolic link")
> -			LINK_TGT=$(ls -l $FILE | sed -e 's/.*-> //')
> -			echo "symlink $TGT $LINK_TGT"
> -			;;
> -		"block special file")
> -			DEVNO=$(stat -c "%t %T" $FILE)
> -			echo "mknod $TGT b $DEVNO"
> -			;;
> -		"character special file")
> -			DEVNO=$(stat -c "%t %T" $FILE)
> -			echo "mknod $TGT c $DEVNO"
> -			;;
> -		*)
> -			echo "Unknown file $FILE" 1>&2
> -			;;
> -		esac
> -	done
> +        case $(stat -c "%F" $FILE) in
> +        "directory")
> +            echo "mkdir $TGT"
> +            ;;
> +        "regular file")
> +            echo "write $FILE $TGT"
> +            ;;
> +        "symbolic link")
> +            LINK_TGT=$(ls -l $FILE | sed -e 's/.*-> //')
> +            echo "symlink $TGT $LINK_TGT"
> +            ;;
> +        "block special file")
> +            DEVNO=$(stat -c "%t %T" $FILE)
> +            echo "mknod $TGT b $DEVNO"
> +            ;;
> +        "character special file")
> +            DEVNO=$(stat -c "%t %T" $FILE)
> +            echo "mknod $TGT c $DEVNO"
> +            ;;
> +        *)
> +            echo "Unknown file $FILE" 1>&2
> +            ;;
> +        esac
> +    done
>  } | $DEBUGFS -w -f /dev/stdin $DEVICE
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


