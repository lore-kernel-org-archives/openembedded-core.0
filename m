Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE1F72F89
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 10:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2MAR8lu024077; Wed, 22 Mar 2017 10:27:08 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0ZEbqRNDzimk; Wed, 22 Mar 2017 10:27:08 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2MAR3lE024072
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 22 Mar 2017 10:27:04 GMT
Message-ID: <1490178423.13980.168.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 10:27:03 +0000
In-Reply-To: <afcb3771cf109ba4d11e81a79eaadef62f9437a3.1490174366.git.Qi.Chen@windriver.com>
References: <cover.1490174366.git.Qi.Chen@windriver.com>
	<afcb3771cf109ba4d11e81a79eaadef62f9437a3.1490174366.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] runqemu-gen-tapdevs: fix file path in example
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
X-List-Received-Date: Wed, 22 Mar 2017 10:27:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-22 at 17:23 +0800, Chen Qi wrote:
> Fix the path in example so that '/usr/bin/tunctl' could be found under
> this path.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/runqemu-gen-tapdevs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
> index 9e5e5b9..994efd0 100755
> --- a/scripts/runqemu-gen-tapdevs
> +++ b/scripts/runqemu-gen-tapdevs
> @@ -29,7 +29,7 @@ usage() {
>  	echo " is the number of tap devices to create (0 to remove all)"
>  	echo " is the path to the build system's native sysroot"
>  	echo "e.g. $ bitbake qemu-helper-native -c addto_recipe_sysroot"

If we change this, you also need to change the above to remove -c
addto_recipe_sysroot.

Cheers,

Richard

> -	echo "$ sudo $0 1000 1000 4 tmp/work/x86_64-linux/qemu-helper-native/*/recipe-sysroot-native/"
> +	echo "$ sudo $0 1000 1000 4 tmp/sysroots-components/x86_64/qemu-helper-native/"
>  	exit 1
>  }
>  
> -- 
> 1.9.1
> 

