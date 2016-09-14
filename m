Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 35AEA76E5E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 20:27:00 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id pp5so1165938pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 13:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=u309wg2Fxz1681q2LtaCtYQ9EivQQD0nqfBA/7wOzzA=;
	b=nk1EYqUJOhJ8JYvFiFflgi0RYQWbsEPkIPyvI79PVFYAjbsPzU9LnaWpdj13N17LSP
	yty8dzc0wVu5YT6xs5eoOS6Q59zXB6VaZcgskfQvCoszFIU82aY/Rbd3VAQd5w085Aof
	tS4F1oxPvFnUNMPGDl1eexHgEjkFaeiUnXUO3OwubaqE8FTfw0usyQVxCxUa3QWGK9Qq
	Ir7Wp90gZXAfn4newyfgdXu3gILv60bBmrpZAzhCwk6lGr3rBHbtN7EsOct3KF7WGYZb
	iFGpnvPHNjz+vU2Q95WuYLiSPBiPidSWad8AqzaRcH9y+t5jmYjN9rwEa5ysvI+06Oex
	rYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=u309wg2Fxz1681q2LtaCtYQ9EivQQD0nqfBA/7wOzzA=;
	b=mLChkpG5hyxR16iMHKUk+CnJvmkGVpRn2/eGEeT17I00J/Wl0bsfmEQVFL4um3I6wV
	UDvOify6z53nvqu6Rn8vkJDG9PTJX/7X8UaYDKPiMAGdhcrEpkUkbS0XnaEcv9PBju49
	zFPQx5P6RffycM976PSLhEaokYyKDv8hj6yA7DE89/x3WHwp3puOg/sMhUljueQUIMrR
	SpEe1yscYAu3CJ+Vsv57DqUe651mOM5RSeZv79qq1GQhfBaSLJe/NKPegifWipd9XTO6
	0wt+qRV6Gn0e2ikRo9Kl1avQewWoG3R0CsV/MHFRjXyJEyfdctoY+3ysPTCuiX+pWaRF
	oNfg==
X-Gm-Message-State: AE9vXwPqIVkd5xYiunc4/lESlv4QEF3C6th9Ycp59OdoTDflEthZEuycWVBZmZkCt3096g==
X-Received: by 10.66.81.201 with SMTP id c9mr8017380pay.14.1473884821294;
	Wed, 14 Sep 2016 13:27:01 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4001:9ea0:350c:a305:4ade:8f1c])
	by smtp.googlemail.com with ESMTPSA id
	u1sm40072005pfu.12.2016.09.14.13.26.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 13:27:00 -0700 (PDT)
To: Sona Sarmadi <sona.sarmadi@enea.com>,
	openembedded-core@lists.openembedded.org
References: <1473856478-36621-1-git-send-email-sona.sarmadi@enea.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2fc9d775-fd1d-462c-0bc9-33d87f5470f4@gmail.com>
Date: Wed, 14 Sep 2016 13:26:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473856478-36621-1-git-send-email-sona.sarmadi@enea.com>
Subject: Re: [PATCH][krogoth] dropbear: upgrade to 2016.72
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
X-List-Received-Date: Wed, 14 Sep 2016 20:27:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 9/14/16 5:34 AM, Sona Sarmadi wrote:
> The upgrade addresses CVE-2016-3116:
>
> - Validate X11 forwarding input. Could allow bypass of
>   authorized_keys command= restrictions,
>   found by github.com/tintinweb.
>   Thanks for Damien Miller for a patch. CVE-2016-3116

thanks,
I will pull this into my local staging to build. There is a krogoth-next
YP build underway I don't want to stop.

regards,
Armin
>
> References:
> https://matt.ucc.asn.au/dropbear/CHANGES
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-3116
>
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> ---
>  meta/recipes-core/dropbear/dropbear_2015.71.bb | 5 -----
>  meta/recipes-core/dropbear/dropbear_2016.72.bb | 4 ++++
>  2 files changed, 4 insertions(+), 5 deletions(-)
>  delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.71.bb
>  create mode 100644 meta/recipes-core/dropbear/dropbear_2016.72.bb
>
> diff --git a/meta/recipes-core/dropbear/dropbear_2015.71.bb b/meta/recipes-core/dropbear/dropbear_2015.71.bb
> deleted file mode 100644
> index 6332579..0000000
> --- a/meta/recipes-core/dropbear/dropbear_2015.71.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require dropbear.inc
> -
> -SRC_URI[md5sum] = "2ccc0a2f3e37ca221db12c5af6a88137"
> -SRC_URI[sha256sum] = "376214169c0e187ee9f48ae1a99b3f835016ad5b98ede4bfd1cf581deba783af"
> -
> diff --git a/meta/recipes-core/dropbear/dropbear_2016.72.bb b/meta/recipes-core/dropbear/dropbear_2016.72.bb
> new file mode 100644
> index 0000000..1385efd
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear_2016.72.bb
> @@ -0,0 +1,4 @@
> +require dropbear.inc
> +
> +SRC_URI[md5sum] = "96226b82725a8cbecad9fc738930d1d2"
> +SRC_URI[sha256sum] = "9323766d3257699fd7d6e7b282c5a65790864ab32fd09ac73ea3d46c9ca2d681"



