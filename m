Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7ABED78C64
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 17:38:50 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id d7-v6so1933286uam.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 10:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Cq4H7ABU+D4pr2mhxvjhuvAt/jlL63EeMkV2CAM6HOY=;
	b=oHAaJsZBRyC0NI7RjBf6Beg+wVzSp4SBkLXPK0fpdm80ZYlcwAnT4Zom6LMTn7v/b5
	JKBBN98O13uJaMnERKwOaPKwChqjoi6f5vJtDSwXB33EskvIcTZlu2VqqfvhOM4SZEPD
	8YNMDcmkDrZvl+fTEfrqPuSd4Rh02iMqh/O2wL5EqT5VTq2YG7TgTqJ233dbEN4/TACp
	yyJ3ucf/DNXrQ72Yc9u04Scw0dMRlctuDhZq3HrURNWNPsyXQFvQj5NF00e9oHedGuNS
	hv2eUadnd2j55O3690uZVfmtcItYlQoLawIcRRDhH1anb7+dS/jBaFMdP+orRgIUhHyx
	1RkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Cq4H7ABU+D4pr2mhxvjhuvAt/jlL63EeMkV2CAM6HOY=;
	b=E+jAV8I738MFv01KeFl9Ta2BhzZ3O4q4bO2uFYavV9C0RyiqGpxlxycS+C4aNfcgdR
	yXE7kExjX93B4gQ59G7uUnjY3m6zJslkzFt5QINalKT+WjZryXHaI6LlJEaqfnAnpIr2
	UgYL3YJ661sYKryz0ho4cb3jMsQBn2TYOvCxjoI2J1HdI41XX+NpKKlBVSNwtNsJgqYK
	bShI3NupyZBdMXN13pxA0HhDjx4976/igk4DEXIxuweWSUQc/5r5nm7Qb1CKNChLeLPw
	dFQo0PR5c2jc7jnnN9Xf9i73r/sI/H4X1qmWzs4HXv8OtWuUwCwje5H5oeNboL04X7q/
	Mt0g==
X-Gm-Message-State: APt69E2wT/BgM+n1nrxDnfEqx8qQQfWLFH8lfHe/bBdcUjxP8LyfPezV
	Q8tytdBG5Gle1KbUhnP9wwWp8Ttx29NOKFtlriE=
X-Google-Smtp-Source: ADUXVKKB7k7FckrLaHIdQV0CGPAZAQttb603bj1aSL79GGKRPlnt/0BST0CTRH/801R5wgxxbySjd0F93lbXNH6eoNU=
X-Received: by 2002:ab0:4045:: with SMTP id
	h63-v6mr1014089uad.66.1528825131208; 
	Tue, 12 Jun 2018 10:38:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 12 Jun 2018 10:38:50 -0700 (PDT)
In-Reply-To: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
References: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 12 Jun 2018 10:38:50 -0700
Message-ID: <CAJ86T=V8kntC=VVCuLUiBJDpqgZFDcATr5fLmhin0a4qn6ruCQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] openssh: stop adding -D__FILE_OFFSET_BITS=64 to CFLAGS
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
X-List-Received-Date: Tue, 12 Jun 2018 17:38:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 7, 2018 at 11:48 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Openssh takes care of enabling large-file support automatically via
> the AC_SYS_LARGEFILE in the configure.ac, so additional help from the
> recipe is not required.
>
> Even if it were once required, defining __FILE_OFFSET_BITS (ie with
> double leading underscores) looks like a typo and probably never had
> any effect anyway?

Ping.

Any issues with this (the whole series of 7)?

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> index 7b6ee5c..7cf34eb 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> @@ -46,9 +46,6 @@ SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
>
>  inherit autotools-brokensep ptest
>
> -# LFS support:
> -CFLAGS += "-D__FILE_OFFSET_BITS=64"
> -
>  EXTRA_AUTORECONF += "--exclude=aclocal"
>
>  # login path is hardcoded in sshd
> --
> 1.9.1
>

