Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 88D07609BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 16:38:57 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCD008354W3LSA0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 23 Sep 2014 11:38:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8E368204A1; Tue,
	23 Sep 2014 12:38:27 -0400 (EDT)
Date: Tue, 23 Sep 2014 12:38:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-id: <20140923163827.GB2480@denix.org>
References: <1411297735-12300-1-git-send-email-dv@pseudoterminal.org>
MIME-version: 1.0
In-reply-to: <1411297735-12300-1-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: use one package split for all firmware filename extensions
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
X-List-Received-Date: Tue, 23 Sep 2014 16:39:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Sep 21, 2014 at 01:08:55PM +0200, Carlos Rafael Giani wrote:
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta/classes/kernel.bbclass | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 4710719..78b33ce 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -384,10 +384,7 @@ pkg_postrm_kernel-image () {
>  PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>  
>  python split_kernel_packages () {
> -    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
> -    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
> -    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
> -    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.dsp$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
> +    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')

Can we also add .elf to the list? Thanks!


>  }
>  
>  do_strip() {
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

