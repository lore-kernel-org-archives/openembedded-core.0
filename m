Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id E60F16B517
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Dec 2018 04:50:42 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id s5-v6so9476882ljd.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Dec 2018 20:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Vt8g9LMtUoDKIEaOrWHCxcYcnJg4OieQ7gdVsTb/JIM=;
	b=VD1Uwp1SshL3Vkwz4Zq+CgbvZJ6+k7OYXTcoTRfVJyUVD+VbK8c/y7AjU8dnU+tYRI
	Z1Te6ohp9Nk9HIZGq+Py5WJNVxcebQk0u9gJ8GQk7PB5kiGfosqmp0//9R/dAVn3WzVo
	rS8sLJkEOZjTxjY71VP9hskHjTdK0EqO2VHln5bDQ3iIECXsQ8Ix/Gq+0+STeSlnNWP6
	KHH22lXp9CHyqtfKj8fXzSLuQ4dBnzWUdhxS58PkgjWWM4qjWp1tC3yEZ/MqevUmMTtx
	VODkLWDt3zG903KKXp6Z3VRERiLvRk80WBKDkrr/saLEZwQ8WjzcGaghyjmv1CvQ8FWJ
	v44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Vt8g9LMtUoDKIEaOrWHCxcYcnJg4OieQ7gdVsTb/JIM=;
	b=V2y65fNFVOzbm+LpLvYcNL5WcHEMhUlFkxX/IRrK26+6qNMWcknDcYDUHTP2axMrGW
	s2miRyfACJzz/NKj/F7u5FvMlmg2BpiKxFxqbvv7Q8nlX/OofvpV+YNltLKZTFXK7A9B
	2zWFll2maO2B3LDM9T/uTQQESD/wHl/XfRe/ZhPonjUFpKbbk/Biqub5LZqM9/FgDS96
	ViqQpbThxHZyPhotPyuXOKgEROHAYFCq/Clqst8lYs0AJVCqASCwhi7pZc2Gi8BNyfSK
	paLw4OznysoKgyuLfOMUwjoaTG2WX2yQAht1JSa52uPP0ywx70hd0KhrL+4qe+/Ru8GG
	4VDQ==
X-Gm-Message-State: AJcUukfO++odyA0byTe4WrCMjun7ePSW/9RgY1xEcn2yg7KWWV1XBItn
	PB6ac+Ieli8IhQpKdle50x4vgbDHDCkBXW816S0=
X-Google-Smtp-Source: ALg8bN53wYWZr0W5FtLMVIKmzqQSMhAhqc5Xdukp42w18eXHXHvWMwK/9O5ByCy9obxX5Tas7Zu1tF0Asma3F74RMxY=
X-Received: by 2002:a2e:98c9:: with SMTP id
	s9-v6mr5493440ljj.166.1545627043109; 
	Sun, 23 Dec 2018 20:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20181222182512.6831-1-raj.khem@gmail.com>
In-Reply-To: <20181222182512.6831-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Dec 2018 00:50:32 -0400
Message-ID: <CADkTA4Od8ixW4XqZV9kWvQ0fA1B1cYzE3WxCht7NYbx4sR2d5g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Update to latest master
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
X-List-Received-Date: Mon, 24 Dec 2018 04:50:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 22, 2018 at 2:25 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> * sync APIs from  kernel v4.18
> * Misc bug fixes

Khem,

I have the 4.19 libc-headers and aarch64 api patches staged locally. I
didn't quite get them sent out before heading for the holidays. Do you
expect any patch or build issues with this bump ?

What I'm wondering is if I should test against this before sending out
my libc-headers series ?

Bruce

>
> Full logs
> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=39ef612aa193cc6e954ac5a01574300ccd4b7ef9..21a172dd36cae7a08492fd3a7500d7bf0daee13e
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 046a08aec2..33d6e69130 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -4,7 +4,7 @@
>  require musl.inc
>  inherit linuxloader
>
> -SRCREV = "39ef612aa193cc6e954ac5a01574300ccd4b7ef9"
> +SRCREV = "21a172dd36cae7a08492fd3a7500d7bf0daee13e"
>
>  PV = "1.1.20+git${SRCPV}"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

