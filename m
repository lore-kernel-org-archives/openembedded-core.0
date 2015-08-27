Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 87D6060043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 16:27:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Aug 2015 09:27:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="756614794"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.66]) ([10.219.5.66])
	by orsmga001.jf.intel.com with ESMTP; 27 Aug 2015 09:27:24 -0700
Message-ID: <55DF3A71.1020204@linux.intel.com>
Date: Thu, 27 Aug 2015 11:27:29 -0500
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1440600498-10313-1-git-send-email-anibal.limon@linux.intel.com>
In-Reply-To: <1440600498-10313-1-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [PATCH] runqemu-internal: Fixes unary operator expected in new TCPSERIAL_PORTNUM
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
X-List-Received-Date: Thu, 27 Aug 2015 16:27:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

ping

On 26/08/15 09:48, Aníbal Limón wrote:
> If $TCPSERIAL_PORTNUM is empty string causes an error because
> expands the expresion to,
>
> $TCPSERIAL_PORTNUM == "" -> == ""
>
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>   scripts/runqemu-internal | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index b317358..1b1bc9e 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -620,7 +620,7 @@ if [ "x$QEMUOPTIONS" = "x" ]; then
>       return 1
>   fi
>   
> -if [ $TCPSERIAL_PORTNUM != "" ]; then
> +if [ "$TCPSERIAL_PORTNUM" != "" ]; then
>       if [ "$MACHINE" = "qemuarm64" ]; then
>           QEMUOPTIONS="$QEMUOPTIONS -device virtio-serial-device -chardev socket,id=virtcon,port=$TCPSERIAL_PORTNUM,host=127.0.0.1 -device virtconsole,chardev=virtcon"
>       else


