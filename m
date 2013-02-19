Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U7lL8-0005qj-Au
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 12:26:30 +0100
Received: by mail-la0-f47.google.com with SMTP id fj20so6270407lab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 03:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Rr/mx1HSVLIMnd/yoswwyJ1u3yD0/FqGtRZAnrZwDjI=;
	b=GxVPaBkzvXEFn22J3Lzk2dHjnvBHmlCBuuGHdTJpZV2/iBqJqfbCtC1AS0JDZPVJdD
	sbFrDsHVJwu0fMhXaXrdcbUIMe1D6lqCFSKFT72nTigWVgb3gdqWJH10yc0TbpzCLVry
	uTn4E46jreyduLyzwvZGw/DRSyDCwUEf2fjdBF9+P9Q9lf1doxM0YREQcUu6s3FEiU/X
	ammXOEuSOdLnXLabltxU00/b35r5+OT/PYCiRKMOgeVuGR6d+fEP9wt96XhpWfIoJB8C
	05BvqSnWmk9D/JihoF9EUNfqKcdElhAWerZ4gKP3hEQWjuXo2Qe0mx6RnSMYxVoTvgU2
	LRFA==
MIME-Version: 1.0
X-Received: by 10.152.128.98 with SMTP id nn2mr13826153lab.17.1361272216823;
	Tue, 19 Feb 2013 03:10:16 -0800 (PST)
Received: by 10.114.28.73 with HTTP; Tue, 19 Feb 2013 03:10:16 -0800 (PST)
In-Reply-To: <6c5df3ee0d370bc7054d53832937ce70b6c9ee57.1361260478.git.Qi.Chen@windriver.com>
References: <cover.1361260478.git.Qi.Chen@windriver.com>
	<6c5df3ee0d370bc7054d53832937ce70b6c9ee57.1361260478.git.Qi.Chen@windriver.com>
Date: Tue, 19 Feb 2013 12:10:16 +0100
Message-ID: <CAC1BbcSiDGonDHWfKnjM47qFWwREzZ8Qjno4AW1z8MWJwFyW1g@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Qi.Chen@windriver.com
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] hwclock.sh: check for the existence of /etc/default/rcS
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
X-List-Received-Date: Tue, 19 Feb 2013 11:26:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 19 February 2013 08:59,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> /etc/default/rcS might be missing if the init manager is not sysvinit.
> So we have to check for the existence of this file before sourcing it.
>
> [YOCTO #3697]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/busybox/files/hwclock.sh |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/busybox/files/hwclock.sh b/meta/recipes-core/busybox/files/hwclock.sh
> index cc6d286..be5f94d 100644
> --- a/meta/recipes-core/busybox/files/hwclock.sh
> +++ b/meta/recipes-core/busybox/files/hwclock.sh
> @@ -20,7 +20,7 @@
>
>  [ ! -x /sbin/hwclock ] && exit 0
>
> -. /etc/default/rcS
> +[ -f /etc/default/rcS ] && . /etc/default/rcS

I'd make that -r fwiw.


