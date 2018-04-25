Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7963571B1D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:01:58 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id e20-v6so19475865itc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZrmDo/a7Thh2zSB1m2WW8JkRDatyuwPGlpk5nWWZBTI=;
	b=kDkF4AmZEDpZnc9oXgnmS2AKDxDmKzpTQ9r8shytNs8LOnoNJbr32M5vSUKvg9i2IJ
	k+FXqjL7uFH66lvOAY4ztVpRPSF9DgbiIXS1pLytN+LHX0LgzoYxD33Gte2ZMHtq47uI
	E2TOuPT6LcVNlSe7ZcUeWwWWfmFEm5NUlcJuczzj/gW2XIEbDquyiEk6uBSok/n8vU++
	5h302BCtqI73dQjZDYwmI6t+ZGcsbwhOMWlia/mOly+wdF390WR51+BX6+2f4GNiutRp
	A/7dpKfKYIu4TTDlJMlSiBTRWpwMwQm2LpSKcJXdtelHgmuasw7vLF0GnNrxaX4BunBY
	j9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZrmDo/a7Thh2zSB1m2WW8JkRDatyuwPGlpk5nWWZBTI=;
	b=mL9jEy2yVMTGi2JzNjEQgSP7q2WFuVPt7vmfCpO7I/d9+vYKwqx+rvesmUf5xJziv/
	j6FHunrpWOkEnbsxhqDVLYjy/g5T+ZBiIGvHZGe0zcqYVJ5OIVQSpGnHurko0f12YkMq
	AGr9ubp6GVE3C7JWTdtsRzPfTkYR8AOckcBUMJ8cSstvIjzPDCfWUy5f+H/QZKBxX9pu
	xTpdpeNW+E8EXxGkh+wGsYHDdAs1Ze8yvoe4Q8a9tmGePdNK7B6SXpGeNCWUW60j0IJ5
	upIDUiogGAz1m353STbzWPrIp8Logx6SU+9PKfAPy0YObSIZ+0waEE8CmAm+xMnz4AX2
	N9hQ==
X-Gm-Message-State: ALQs6tAmRyHRoepXHVoiwmP3AyBxtaOu+gLc3cYqyrrAPasdIMzPU1Ny
	BMBOdNh72ncSru3KzHftU+/smyJ8
X-Google-Smtp-Source: AB8JxZrcgMEP6r11lE6rWAQhbruOeLBCmQdyT71otx4B7i8DHpeFRZbzSCkvtOb7NNs8xzNckmjdkw==
X-Received: by 2002:a24:b649:: with SMTP id
	d9-v6mr23300642itj.51.1524664919298; 
	Wed, 25 Apr 2018 07:01:59 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	u124-v6sm6533092itc.20.2018.04.25.07.01.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Apr 2018 07:01:58 -0700 (PDT)
Date: Wed, 25 Apr 2018 10:01:56 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Kevin Carli <k.carli@overkiz.com>
Message-ID: <20180425140156.GA23341@linux-uys3>
References: <20180425133142.10940-1-k.carli@overkiz.com>
MIME-Version: 1.0
In-Reply-To: <20180425133142.10940-1-k.carli@overkiz.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tzdata: fix a typo
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
X-List-Received-Date: Wed, 25 Apr 2018 14:01:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Kevin,

Thank you for this patch! A couple nitpics, however...

On Wed 2018-04-25 @ 03:31:42 PM, Kevin Carli wrote:
> Change-Id: I57f17f13aba2a2d26b9f6b72214563a86725def9

This isn't relevant to openembedded, please remove

> Signed-off-by: Kevin Carli <k.carli@overkiz.com>
> ---
>  meta/recipes-extended/tzdata/tzdata_2018c.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/tzdata/tzdata_2018c.bb b/meta/recipes-extended/tzdata/tzdata_2018c.bb
> index c4014245ed..d4fee852df 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2018c.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2018c.bb
> @@ -171,7 +171,7 @@ FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
>                  ${datadir}/zoneinfo/Asia/Dubai           \
>                  ${datadir}/zoneinfo/Asia/Karachi         \
>                  ${datadir}/zoneinfo/Asia/Dhaka           \
> -                ${datadir}/zoneinfo/Asia/Bankok          \
> +                ${datadir}/zoneinfo/Asia/Bangkok         \
>                  ${datadir}/zoneinfo/Asia/Hong_Kong       \
>                  ${datadir}/zoneinfo/Asia/Tokyo           \
>                  ${datadir}/zoneinfo/Australia/Darwin     \
> -- 
> 2.14.3

I apologize if I wasn't clear in my other email. The first thing to do would
be to submit this patch against master. Master has tzdata_2018d.bb, so we'd
need a patch for that branch first. Patches for other branches (morty, I'm
guessing here) need to have the branch name in the subject line:

	https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Backporting_fixes_to_stable_releases

