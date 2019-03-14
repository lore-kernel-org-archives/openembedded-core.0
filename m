Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
	[209.85.222.51])
	by mail.openembedded.org (Postfix) with ESMTP id E9BDD7C4BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 23:44:47 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id d4so2540176uap.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 16:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vLYlEVP2VzwZwiZtQj6stR6EC9sXByFOeccDNl22zDg=;
	b=R3BVC7D1qCNHf1v6Xr4ZXNOXykC4VJXyd4xj5ZKug36hNAXds3ApAFmZRcmE2W4J40
	dWNAt79SHa6TsmWZLcMZJsLgk+sd6pTeRWvZlnfYMz9tDe6V+Lc+JYTHFUBVFw77VT7s
	3UWeqnVosOWpSuP1Wc3LicFAB29j5cYvTg882cotpDwl1QEPFy7EM5zAGbSmOVWl5roc
	HQ0g5ASMckk8eLOhUFblS3PB05e0Wrw+qiWwhBbpAQ+DFSW547OqypqoeGOmDu8Is/lJ
	RfwZSnpKu6BfvQFDJtTxflRtmpoMqHQzoJTzO0mgTGHUjXdsWLUWYbveKSvvrqKn2rWB
	SPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vLYlEVP2VzwZwiZtQj6stR6EC9sXByFOeccDNl22zDg=;
	b=eXfTNjrHrG//sk6+/s/AchkEeir4XEYTq1Oa4R9U9a828fXzPIRHigNAGMbmos125K
	5a6uQDoptcRva615cZUrWJ8ba+rXIX2/9KEXV6HFzUWCpmIob5tgefTwRQQf0bJXi8TC
	/ch4wZ8O7EbjV6Rh/RgY2yufrR2AE3v9HFVr0aEtwqwfKDEViEbdSi+wb6rV2dZc40Nq
	y7z6VJUwPk3eWi/DgrJ5SpnIDC4CvXPD2V86iuIpYw+wumya4oXlgr7S3pty+olxcwxF
	3EVJspD4gmRvL/UEhEnd7A6aEIa25iQTEvnBMQ3UemhbtGNpiistWQxITEXCpPspC6vC
	J9KQ==
X-Gm-Message-State: APjAAAV9DF//oVgYWKVOjdppjjkFcKWs2wnAIvrodQ+O4RHDp22BjZXr
	hlQDemY/NmvDuscvC86gjMB91+qd3Fgh15ZmVuw=
X-Google-Smtp-Source: APXvYqyW9kS3UrN259/HuizVM5y85J/YeEaxEWqf2ScUuwaMcKfLIANdOsQcDwYi75sLYGRsAFFY6FqWauEjm26Q+Qk=
X-Received: by 2002:ab0:2a01:: with SMTP id o1mr25881074uar.42.1552607088567; 
	Thu, 14 Mar 2019 16:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <1552593854-14059-1-git-send-email-mark.asselstine@windriver.com>
	<1552593854-14059-2-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1552593854-14059-2-git-send-email-mark.asselstine@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 14 Mar 2019 16:44:36 -0700
Message-ID: <CAJ86T=WWWxg3aLGWUQtFn+CD7ruoBh9HFoBWebafQm4MK+2RbA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [v2][PATCH 2/2] goarch.bbclass: set TARGET_GOARM as '7' for valid cortexa* targets
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
X-List-Received-Date: Thu, 14 Mar 2019 23:44:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 14, 2019 at 1:05 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> Per https://github.com/golang/go/wiki/GoArm we need to set GOARM when
> building for ARMv5, ARMv6 and ARMv7. The current code in go_map_arm()
> does not account for the Cortex* TUNINGs and as such misses several
> Cortex variants which implement ARMv7. Here we add an additional check
> that will include Cortex-A5 through Cortex-A17 as ARMv7 variants
> (ie. GOARM='7'). The Cortex-R and Cortex-M variants are also captured
> even though there are no tunings for these currently (lack MMU support
> so not supported).
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> V2
> * Cover all ARMv7 Cortex* variants

Still worried this might not be complete. It's basically fixing the
fallout from Khem's patches to remove -march options from the CPU
specific ARM machine includes, right? If so then any ARM machine with
CPU specific tuning (other than cortex) is still going to be affected.

What's the reason for parsing TUNE_FEATURES to detect the ARM
architecture level? Couldn't GOARM be set correctly just by using of
the _armv5, _armv6, _armv7a and _armv7ve over-rides?

  https://github.com/golang/go/wiki/GoArm

>  meta/classes/goarch.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 39fea5e..84977a5 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -74,6 +74,10 @@ def go_map_arch(a, d):
>  def go_map_arm(a, f, d):
>      import re
>      if re.match('arm.*', a):
> +        for el in f.split():
> +            m = re.match("cortex[arm](\d.*)", el)
> +            if m and int(m.group(1)) < 32:
> +               return '7'
>          if 'armv7' in f:
>              return '7'
>          elif 'armv6' in f:
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

