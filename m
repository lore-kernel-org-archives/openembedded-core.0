Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B3DC878255
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 02:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 89D6820A42;
	Tue, 17 Oct 2017 02:19:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BOZs1F8cuWWy; Tue, 17 Oct 2017 02:19:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 669E62087C;
	Tue, 17 Oct 2017 02:19:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E55FF162700; Mon, 16 Oct 2017 22:18:59 -0400 (EDT)
Date: Mon, 16 Oct 2017 22:18:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20171017021859.GA9221@denix.org>
References: <cover.1508204684.git.Qi.Chen@windriver.com>
	<97121153b1e6d33790c04c5168dbb5eb8e0e6475.1508204684.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <97121153b1e6d33790c04c5168dbb5eb8e0e6475.1508204684.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] bitbake.conf: add ssh to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Tue, 17 Oct 2017 02:19:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 17, 2017 at 09:46:32AM +0800, Chen Qi wrote:
> We changed to make tools required by testimage to be included conditionally.
> This resulted in users who use ssh for git fetching having failures.
> 
> Add ssh to HOSTTOOLS_NONFATAL to make things work for the above situation.
> 
> [YOCTO #12227]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

1. Why don't people specify what has changed between v1 and v2 of the patch?

2. A corrected/sorted patch already went in earlier:
http://cgit.openembedded.org/openembedded-core/commit/?id=50e7619aebae5351e9a41fe1b909a31b9e383f0a


>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 0eefb86..4fba9d6 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -487,7 +487,7 @@ HOSTTOOLS += " \
>  HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
>  
>  # Link to these if present
> -HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
> +HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat ssh sudo"
>  
>  # Temporary add few more detected in bitbake world
>  HOSTTOOLS_NONFATAL += "join nl size yes zcat"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

