Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAPAw-0003LM-Sa
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 19:22:52 +0100
Received: by mail-pb0-f44.google.com with SMTP id wz12so2507211pbc.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 10:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=UE5pC8utq1d/TNNUkUdTGuXwnRZA8cU6CzbegVJ2QUU=;
	b=p3MMr/ljT8KkAcBcOKnD7WmDdWZeLXUHt2SQ8rfL55vO//grOcUmE9wtVxWLi6lOLG
	oitHWgEuTYUBypdbEc7NdNT142G7IkxOzY3pGoQcbzNJr+yoUYTYzzstMnJQYzMBTLBD
	jRUvtgUf3pNwZj9Sr+MkdqQaKgqpVAJ64Jr2K7KidfFGpb/niFGIqKdTfONn1mKAVQmy
	wxpV/kAX+nOKxQ55csNtS2Ee92+aInBE7THcIBhywoEEfu2mkky3QQKh5xOzOzHJ6v7K
	PKgmNLu88wewSqdo3GRTzOuMTqVfDL1htEXyhN8g138lU55/wVuqOTeBjJa8p8wQg7l/
	U1VA==
X-Received: by 10.68.211.103 with SMTP id nb7mr24788352pbc.140.1361901990778; 
	Tue, 26 Feb 2013 10:06:30 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id iv3sm1624597pbc.40.2013.02.26.10.06.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 10:06:30 -0800 (PST)
Date: Tue, 26 Feb 2013 10:06:23 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130226180622.GE13278@sakrah.homelinux.org>
Mail-Followup-To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1361900109-21869-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1361900109-21869-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: set the location of the kill binary
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
X-List-Received-Date: Tue, 26 Feb 2013 18:22:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (26/02/13 17:35), Ross Burton wrote:
> Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot, which won't
> work on the target.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/systemd/systemd_197.bb |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
> index c765c18..44cd919 100644
> --- a/meta/recipes-core/systemd/systemd_197.bb
> +++ b/meta/recipes-core/systemd/systemd_197.bb
> @@ -48,6 +48,8 @@ PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
>  # Compress the journal
>  PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
>  
> +export ac_cv_path_KILL="/bin/kill"

may be ac_cv_path_KILL="/usr/bin/env kill"


