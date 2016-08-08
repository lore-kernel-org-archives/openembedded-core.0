Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 46B0F771A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 21:31:09 +0000 (UTC)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBM006GA13LAU50@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2016 16:31:08 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=kj9zAlcOel0A:10 a=7z1cN_iqozsA:10	a=SGiVMpSyAAAA:8 a=sozttTNsAAAA:8
	a=Q4-j1AaZAAAA:8 a=TgLPWmAk6Of_aVH097kA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 087f5d71; Mon, 08 Aug 2016 21:31:08 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 37FAC1620E6; Mon,
	8 Aug 2016 17:30:57 -0400 (EDT)
Date: Mon, 08 Aug 2016 17:30:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: George McCollister <george.mccollister@gmail.com>
Message-id: <20160808213055.GQ8521@denix.org>
References: <cover.1470672689.git.george.mccollister@gmail.com>
	<da75f7dd900ec6188699011a2d49ca8afbaffefb.1470672689.git.george.mccollister@gmail.com>
MIME-version: 1.0
In-reply-to: <da75f7dd900ec6188699011a2d49ca8afbaffefb.1470672689.git.george.mccollister@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: marex@denx.de, trini@konsulko.com, denys@ti.com,
	andrew.bradford@kodakalaris.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] kernel-fitimage.bbclass: do_assemble_fitimage(): cd to $B
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
X-List-Received-Date: Mon, 08 Aug 2016 21:31:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Aug 08, 2016 at 11:37:53AM -0500, George McCollister wrote:
> From: Andrew Bradford <andrew.bradford@kodakalaris.com>
> 
> Prior to assembling the fitimage, ensure that $B is the cwd due to
> bitbake commit 67a7b8b021badc17d8fdf447c250e79d291e75f7 "build: don't
> use $B as the default cwd for functions".
> 
> Without this change, do_assemble_fitimage() fails like:
> 
> Log data follows:
> | DEBUG: Executing shell function do_assemble_fitimage
> | arm-ka-linux-gnueabi-objcopy: 'vmlinux': No such file
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_assemble_fitimage
> 
> Signed-off-by: Andrew Bradford <andrew.bradford@kodakalaris.com>

Tested-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta/classes/kernel-fitimage.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 9a3caf5..7cca180 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -189,6 +189,7 @@ EOF
>  }
>  
>  do_assemble_fitimage() {
> +	cd ${B}
>  	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
>  		kernelcount=1
>  		dtbcount=""
> -- 
> 2.8.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

