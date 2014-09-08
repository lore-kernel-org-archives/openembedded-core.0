Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2034165CE7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s88BIPbu004484; Mon, 8 Sep 2014 12:18:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W2gDTfJjv5g1; Mon,  8 Sep 2014 12:18:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s88BIJs8004481
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 8 Sep 2014 12:18:21 +0100
Message-ID: <1410175101.19272.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Date: Mon, 08 Sep 2014 12:18:21 +0100
In-Reply-To: <1410174256-3263-1-git-send-email-dv@pseudoterminal.org>
References: <1410174256-3263-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: handle .dsp firmware
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
X-List-Received-Date: Mon, 08 Sep 2014 11:18:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-09-08 at 13:04 +0200, Carlos Rafael Giani wrote:
> A few firmware files use this filename extension, like korg/k1212.dsp .
> Create respective packages.
> 
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta/classes/kernel.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b02036f..4710719 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -387,6 +387,7 @@ python split_kernel_packages () {
>      do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>      do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>      do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
> +    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.dsp$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>  }

Perhaps its time to improve the regex slightly here and use something
like file_regex='^(.*)\.(bin|fw|cis|dsp)$ rather than multiple calls to
do_split_packages?

Cheers,

Richard




