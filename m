Return-Path: <will.newton@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 390697826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:26:18 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id j26so1074891iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+3opY3xvlUbms5IH4MK0NwDM4H++AiEpI9MK2Vq0AIw=;
	b=TSmvd0Vl33Awl6/wFGMwcnLe5IV3UADTH0JNVRy6B6R11myZCdEiYD01NtEdnL/zQq
	gBpl2smJd77A+gJt9iQ+YZfZKQXXUAfGUKzK5oThSWj08P/snc2BFbdI+4vL24fht5wq
	IfeF57T/arfLY0XeitUL8sUDijoQV7uT9I0OHMczKqEshxSwL8tKynmgL9Cj7TsRTXdj
	Xv4syuLggneH5Pw41Q9LmrwE10XgZjMTsJYoIUd+lmpaiWPqvH7z1HGe8GsXFcxNsHpq
	uw51c5831u7dlGgqllouKKJMTnxYtHUKGkjzP3exi8b/oA/Tv6U1N+jVxAJEnM/+J+2e
	3/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+3opY3xvlUbms5IH4MK0NwDM4H++AiEpI9MK2Vq0AIw=;
	b=mjcQqH4Br0lKin35urQwZYNp9Qy61pZI6zqZ9Lrem3Nb/7yFA2RMJPjfzLk6gwGnZT
	EUSCe7O56I2beltFfeXzznhTGVotm3wjpqHe2hW83QhqPFrNLXgWl5CxepchVMNOs+4W
	OnJqRtWTozscywe/77ao+1go+Lb+t7JntduTiGOOSBHcwycgTNfjq8OXkp9H8DA/KpIH
	hS4+5GJfaevcbXtZpz3Jxg82g2QKTxcs0bQ+n2QBU7z9JMxKC0GpoAhbkd+7jhIiZWnz
	q3ARorJcYvXM2TnSlJSnJhS8UdSukIQbd3TYu5zOMCPGeRY/flQmbE3mQAK1ihD+meCT
	f7SQ==
X-Gm-Message-State: AHPjjUj9PAxcD1o4xjCbc4X7nJ+civHmeHVjluu5BbHoYuAxgBJNfXf0
	ohSmnslMuXklCga5pBsILI8kGhEVLoy8W6XoWx4=
X-Google-Smtp-Source: AOwi7QAPMg0UUqWm90KEYMSkwl4lFAO8hHqJn+pOByWVABc9tBhMi6Cojx2wwpizDNpEZE2NAstUC+bqrkO5ouoh0n0=
X-Received: by 10.107.28.129 with SMTP id c123mr18894241ioc.303.1505741180143; 
	Mon, 18 Sep 2017 06:26:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.181.161 with HTTP; Mon, 18 Sep 2017 06:26:19 -0700 (PDT)
In-Reply-To: <20170911124558.2863-5-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
	<20170911124558.2863-5-otavio@ossystems.com.br>
From: Will Newton <will.newton@gmail.com>
Date: Mon, 18 Sep 2017 14:26:19 +0100
Message-ID: <CAFbHwiSZswkrn2u6_4U7gOd7r=vDzAVGNPdBT+CD_k2Soc0ifQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 04/26] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Mon, 18 Sep 2017 13:26:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Armin,

Would it be possible to get this patch backported to the Pyro branch?

It fixes running Go programs on Raspberry Pi 1 systems which without
this will die with illegal instruction errors.

Thanks,


On Mon, Sep 11, 2017 at 1:45 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> From: Will Newton <will.newton@gmail.com>
>
> The previous logic applied a regex to TUNE_FEATURES which could
> set the GOARM value to 7 incorrectly, for example when dealing
> with an arm1176 core. Simplify to check for the presence of
> "armv7" instead. At the same time add a check for "armv6" and
> set GOARM to 6 in that case.
>
> Signed-off-by: Will Newton <willn@resin.io>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v6: None
> Changes in v5: None
> Changes in v4:
> - new patch to consolidade in a single patchset all golang changes
>
> Changes in v3: None
> Changes in v2: None
>
>  meta/classes/goarch.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 7960ac5f9e..0f0d8b6a60 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -45,8 +45,11 @@ def go_map_arch(a, d):
>
>  def go_map_arm(a, f, d):
>      import re
> -    if re.match('arm.*', a) and re.match('arm.*7.*', f):
> -        return '7'
> +    if re.match('arm.*', a):
> +        if 'armv7' in f:
> +            return '7'
> +        elif 'armv6' in f:
> +            return '6'
>      return ''
>
>  def go_map_os(o, d):
> --
> 2.14.1
>

