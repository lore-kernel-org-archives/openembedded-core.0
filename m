Return-Path: <akuster808@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 99DF1731C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 23:45:21 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id k129so503167997yke.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 15:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=7GuWVigRK7TZzFFGZqMBa5rQqUAwiI6TFitVDOXdZdI=;
	b=Xa0eeyYxOca9DpwOAUQr5c8DFOIjnQOqq7wR6s2a9vhZU2e8Q1UK+SNnFjCctZcpJO
	7A92FxI3gHSArZCG5lf0atesdpFhHPdUtenL+VZrCm/eFeCNDVfbAdNzIYObeBZedyVx
	79DBq+79M2REck52/4KWfP6UzpJvhcrvAw55l51YnWfJ4CYVuhtZ9zKofTNRKA3BwTVu
	mhwkJiK2Yn9obxqAzyp/bhfjHfHx5pgn/qKzEu4+z91T2e90S2DAVmqB2WYRvF0QT4yr
	GFM6vb9DcMyM6cAJ46nXRm2C+gLNUTnPppMiAM2omCdbJzd4+5QzKpo1PcWQXE/AsXwY
	ViEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7GuWVigRK7TZzFFGZqMBa5rQqUAwiI6TFitVDOXdZdI=;
	b=dN3jx5l4ih6IJbf0gxs0PTFadWq/R/y9/l2a9eK48WJO+l5hr4ur6RHsTrLGXPd3sa
	f1pVU8vcVdo0o+Uo9pGmyb279RKcZdy+79EzDVYoQD6isEqBpI6FxYAMwE4Kzs9vnymq
	rRLXCwUdPecMq8p2C83C4gIoYt2eMa7XDrz6JUOmQMJMD97DObw46w76mJTA61jxv4gU
	+J6wEN7s5Fsyl/3ZNlwLv+ZF9SYE5dG5Pims2KSsSm1ZzWI1UD/2RNSqGlBVZ0yGeWAX
	qv1yQLSk+VzkpZXXxMAfX2oFciffPXk98ZKnr6kIARib5erbXlwdaHeFMGnwj8l6y4M4
	0ocA==
X-Gm-Message-State: ALoCoQnM+Q8bh8ytU0Jf5s0eRxmh4CU9OObhkEo7u3dcPc+DMDvnFRnE0jlUKvjjQL+rs4Q3Loj8RVy1rLnJ0eFyhL5qfPRSSw==
X-Received: by 10.13.234.141 with SMTP id t135mr5135852ywe.117.1452815121631; 
	Thu, 14 Jan 2016 15:45:21 -0800 (PST)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	204sm6178971ywz.39.2016.01.14.15.45.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jan 2016 15:45:20 -0800 (PST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1452785932-32245-1-git-send-email-alexander.kanavin@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5698330E.504@gmail.com>
Date: Thu, 14 Jan 2016 15:45:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1452785932-32245-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH] openssh: update to 7.1p2
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
X-List-Received-Date: Thu, 14 Jan 2016 23:45:21 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 01/14/2016 07:38 AM, Alexander Kanavin wrote:
> This fixes a number of security issues.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>

This should apply to Jethro to as its the same version.

- armin

> ---
>  .../openssh/{openssh_7.1p1.bb => openssh_7.1p2.bb}                    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/openssh/{openssh_7.1p1.bb => openssh_7.1p2.bb} (97%)
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
> similarity index 97%
> rename from meta/recipes-connectivity/openssh/openssh_7.1p1.bb
> rename to meta/recipes-connectivity/openssh/openssh_7.1p2.bb
> index d81127c..ac824ee 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
> @@ -24,8 +24,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>  
>  PAM_SRC_URI = "file://sshd"
>  
> -SRC_URI[md5sum] = "8709736bc8a8c253bc4eeb4829888ca5"
> -SRC_URI[sha256sum] = "fc0a6d2d1d063d5c66dffd952493d0cda256cad204f681de0f84ef85b2ad8428"
> +SRC_URI[md5sum] = "4d8547670e2a220d5ef805ad9e47acf2"
> +SRC_URI[sha256sum] = "dd75f024dcf21e06a0d6421d582690bf987a1f6323e32ad6619392f3bfde6bbd"
>  
>  inherit useradd update-rc.d update-alternatives systemd
>  
> 

