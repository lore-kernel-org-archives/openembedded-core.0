Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8C155789B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 03:17:34 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f80so8197307pfa.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 19:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=anHi+v4SruDmIKTr/U01Fyo6PP9sm1n4Ph8VnDu3b50=;
	b=oJnJSM/77y3ox/uMJ8Q/+myvJzkvvJygPB2bxNx4+IKVF8jkNe0h95e0OwTfZ4G+mN
	WZCIEN2tYhYuBzz+W2JINtTP457j1r2TXmPZ7iaSnk7HhjP/n6j9xsTA6WLD670iUMNb
	0Hqk2gp5/LPiYHImYmd//LEjvA1F5J9BQyXno7GgYH1/ePNBR0I1i8OyZROc5VMBk2Nh
	0cJ7+mlzaFoY7hdyonUdmfHgCyaiePkxFbdDNdTJ+1wNuxh8dBzf9ypRUn8MLiaUxaZb
	H/eFV0zt6XkhU5yOuZmnmRteNRybcBnNIAo8QYoZGKIUsJmJv++Rmy94xlinJFq89Ais
	kVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=anHi+v4SruDmIKTr/U01Fyo6PP9sm1n4Ph8VnDu3b50=;
	b=FqFkzetoHVJKlMzrs/0t3nA4rGdgQgroHgQIE25I+jiwV89zVPWVtUKoDBuw1NFbll
	Yk9ttNt755TDhK41CyZzZwspAmHClT0y0CSeS6qQXykxuVXR2ZjlasPzd5gB1SoGmoEH
	OxXzWE94AJ1P0So68uu2AbBpfjpoiaQeVySLhSyn+l0GCb9nk2kV7O+QH+AWi/kr/Ed6
	F7LvCp1Qs+n8Qw9/Hqgewwh7c2G0s2aM0I75O4SnSG1OHSbF4LldUektuj8WFKtxDlNk
	mF7gWvxs4/uA7OLkkdAMIXFHOsc2X69Qls3OjzJJnrvllPPTv8pBo/D2Ub4EvUVxd6j7
	hplw==
X-Gm-Message-State: APf1xPBXqt9gV7CN6GVKpdoZy4uSr4i6fQVcbKuKNLhPzRZXmY+GhlX5
	gQzABnIApL9tjEwPxceYa1bb2H30WsTRGgf8dwo=
X-Google-Smtp-Source: AG47ELvt36bg4O/0vo7Ph61qeAX3bjrJuZ+Iu2xUPUMyIyrdcXyeu1psp3DeovIqTWZmcicSg8luhu4DxpE3ZuSOmmE=
X-Received: by 10.98.87.80 with SMTP id l77mr17622144pfb.32.1520306255587;
	Mon, 05 Mar 2018 19:17:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Mon, 5 Mar 2018 19:17:05 -0800 (PST)
In-Reply-To: <1520286611-27418-1-git-send-email-kamensky@cisco.com>
References: <1520286611-27418-1-git-send-email-kamensky@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Mar 2018 19:17:05 -0800
Message-ID: <CAMKF1so6ZxGFD-9BOH_g0jO=Zu0wOP1r9+2SdQ5dZGc34uaoVQ@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] systemtap: supports mips starting with version 3.1
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
X-List-Received-Date: Tue, 06 Mar 2018 03:17:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 5, 2018 at 1:50 PM, Victor Kamensky <kamensky@cisco.com> wrote:
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ---
>  meta/recipes-kernel/systemtap/systemtap_git.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index c938760..d122359 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -15,8 +15,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
>             file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
>             "
>
> -# systemtap doesn't support mips
> -COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel).*-linux'
> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
>

Looks ok. Can we enable mipsel as well ?

>  S = "${WORKDIR}/git"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

