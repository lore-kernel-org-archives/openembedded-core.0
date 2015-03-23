Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB116AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 11:58:42 +0000 (UTC)
Received: by ykcn8 with SMTP id n8so70154338ykc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 04:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=FoGbQv7FMv0XrHbok3toP1iWZOCHblvGE2vD4hRtNj8=;
	b=nVP3jwTrILeZmJ8W6zVdz1AB6LqpwuG7O3KprlcxW37Z3deS3V6N2Ea9fuqKmbWL9s
	TSlmansdtuXjgMD8N3SFfRH5DKoDUOeoPjdIumIoiDcqZIEVD3VqZurZC1gD/QWuxZD+
	z94j5BVtNLTUhTQifcQnrwnQBb/yheDIWfrSyiQ7uMHjOl2DLGrorlGjdiH4kuVsE3/Y
	9uMucbWakasmi7CGL1zH+3/3bGOL64aaAR88sENJogezMbhuzDo0P3Jc8amBXGEKiLuB
	r5A7LgmanXQwWulP96Zndjgr0tMk/oM4lGnUbfx+GNTDA+OmSj9Ajmy4DjyvR8/7NyaU
	ng6w==
MIME-Version: 1.0
X-Received: by 10.236.32.38 with SMTP id n26mr2624432yha.67.1427111923996;
	Mon, 23 Mar 2015 04:58:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Mon, 23 Mar 2015 04:58:43 -0700 (PDT)
In-Reply-To: <1427109526-31351-1-git-send-email-net147@gmail.com>
References: <1427109526-31351-1-git-send-email-net147@gmail.com>
Date: Mon, 23 Mar 2015 08:58:43 -0300
X-Google-Sender-Auth: qolG55bPefgkWw_4uxyIV-dRCD4
Message-ID: <CAP9ODKrYVb77bUAd_6ARiOG3+U5Ej3Us9Akz4+267xg8miMcMg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Jonathan Liu <net147@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix firmware path to match linux-firmware
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
X-List-Received-Date: Mon, 23 Mar 2015 11:58:43 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 23, 2015 at 8:18 AM, Jonathan Liu <net147@gmail.com> wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_219.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index 5ecdda9..f2d3c13 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -112,7 +112,7 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
>                   --enable-split-usr \
>                   --without-python \
>                   --with-sysvrcnd-path=${sysconfdir} \
> -                 --with-firmware-path=${rootlibdir}/firmware \
> +                 --with-firmware-path=/lib/firmware \

Seems like the fix should be done in linux-firmware, not here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

