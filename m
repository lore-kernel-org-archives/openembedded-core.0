Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBAC745D1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 11:12:39 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id r5-v6so1531953ith.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 04:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q8voZUrAXichtAxpsiEOPWnuH+yEWMuxMGvnG1sw8UE=;
	b=gjvkPB/hJmC74VXlkr/pt2yNbnGsy+sJui5XhuluXDMamXQKlUNkCbQLwsptadHiDv
	sYpVjCmG1n/OlL6DcuIahfihPlPxlB5a5hMzT0t93WJMBqQECElNSAlYA/rqxoYWa2d+
	TyjgvHeBv1FWbJ33zArNtGsMstaGPY4GrKCKbk44NNALSgdGS1BmNXcJrkxz/jdwQ4Ey
	blHjTFCNsjwKpT7qObc2s/XLiNwHufO6+TP55aKEPONpLcSYpFGgNkpkH0TkpWR5Q2h4
	nJugjOfi2RvrhKynVEiLNeqlTo05UgtaJhvwqFZ7kVyI0iYuwvR+Ivozgwb3Ap6ZsT/0
	B2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q8voZUrAXichtAxpsiEOPWnuH+yEWMuxMGvnG1sw8UE=;
	b=A60NyMJZFsFuN7XOqrxGRPw1QG8Hoj9W72vvXZHJL+Ib0TfIhppJJxti8m/wHiwowm
	9OqBb4FR6lzA9xeiHnP3TgugJYK+9NqU16xhW8Y8QJnJWhyexaIMdlodnFcagRnIfgAE
	6smNiX/Sr6XQOwp0eEOc5Wp0VQ+mUdud5uE7A4Ah+9TEO9RxMtd+Ih5p2ti8NqLmYFfx
	1L5jAxv/SwF/PhM8017i4VPCiC4xjdsrg6drC6clLXk0FToVTb6uAI1WkY5Pvih0CzIC
	ZmmkjEJYIcUlOV+IZQYJuqukhh02far+2cpUI55szwhNdFtj9Zr+Dtx5lEpQZvbX1goa
	GR4Q==
X-Gm-Message-State: AGRZ1gJFeRseXGtbDf+H4+3mPJ1ngfAqqd0GHqRJgwNx5HY5AJAQMCDB
	3wFexn8dnGJOJ6Xp7WrsfH4SnhyaTek7OzrbBvXHePEB
X-Google-Smtp-Source: AJdET5e4uauH7+jlHqxhjr/yeRzXzy5Jr0AVznJ5oatU30YvEHEDjDjI6+iytYxCS05qzjLeOKIQ74eyPpmU6YAGpVk=
X-Received: by 2002:a24:9287:: with SMTP id
	l129-v6mr4783249itd.26.1541070760215; 
	Thu, 01 Nov 2018 04:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <1541042117-20190-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1541042117-20190-1-git-send-email-changqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Nov 2018 11:12:28 +0000
Message-ID: <CAJTo0LYypr91Kg0V=ke_WhFcOcSOfN_wSsX1rdYDQrZ_Oz25sw@mail.gmail.com>
To: changqing.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apt: update SRC_URI
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
X-List-Received-Date: Thu, 01 Nov 2018 11:12:39 -0000
Content-Type: text/plain; charset="UTF-8"

Why are we using ubuntu's archive instead of the canonical Debian
repository?  The idiom for Debian packages is to use
snapshot.debian.org.

Ross
On Thu, 1 Nov 2018 at 03:16, <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> update SRC_URI since previous link is not valid now
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/apt/apt.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
> index f1cde30..50f22c8 100644
> --- a/meta/recipes-devtools/apt/apt.inc
> +++ b/meta/recipes-devtools/apt/apt.inc
> @@ -2,7 +2,7 @@ SUMMARY = "Advanced front-end for dpkg"
>  LICENSE = "GPLv2.0+"
>  SECTION = "base"
>
> -SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
> +SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/apt/1.2.24/${BPN}_${PV}.tar.xz \
>             file://use-host.patch \
>             file://makerace.patch \
>             file://no-nls-dpkg.patch \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

