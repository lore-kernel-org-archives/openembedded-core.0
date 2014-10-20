Return-Path: <paul.betafive@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8B76065C9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 10:34:37 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id k15so3053842qaq.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 03:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=EsJ/rs0nRywCxLSYUZKf8ROfpUNUTxp8wpVE0V33MJY=;
	b=uVw6yoyiPGbEaJFraUZTiMRGIOofvPI/MwEGWLOUDNhh98uLcQczDUft7b7vpfTTiY
	uGHVizngst1qHkgKaIdpQk5pwGc4hwQgdouJnxpkiwofyXOjVO28j4Mai3bbItHlaMfV
	aSU5R24VrFnyToLzUWgdT1HFvzLUskaKT6M//FmwI8ob8Rxk1REqLebeTd21wvBAmaAr
	8Iotbqb3ldaASAoHJSk2ej6Nb3xi8ThkJaw8MvPwOvKI1FKUFm7lDv6X1JcEshEpKXU0
	x0FJ20qE3PZmyXq1JQ7GW3jejAqHCpKlBKZS04ADWuXIhgmQJLQCDzi5/zj3ABKr4h7L
	zh3g==
X-Received: by 10.140.34.102 with SMTP id k93mr27802799qgk.21.1413801278316;
	Mon, 20 Oct 2014 03:34:38 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Mon, 20 Oct 2014 03:33:58 -0700 (PDT)
In-Reply-To: <5444D64D.2030802@windriver.com>
References: <5444D64D.2030802@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 20 Oct 2014 11:33:58 +0100
X-Google-Sender-Auth: Jb1wjlNEpU-k02ASorMkTJ-66qA
Message-ID: <CANyK_8eZFzB9OYYxeV+95=6Yz8wmae7P+-FVKxjexRnjx6eAqw@mail.gmail.com>
To: Liu Jian <jian.liu@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] hdparm: hdparm man pages can not be forbiden
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
X-List-Received-Date: Mon, 20 Oct 2014 10:34:38 -0000
Content-Type: text/plain; charset=UTF-8

On 20 October 2014 10:30, Liu Jian <jian.liu@windriver.com> wrote:
> "--enable-doc-pages" can control if man page of a package is added
> to the file system. "none" and "target" are the two only values.
> default value is none. But man page of hdparm is still included if
> --enable-doc-pages equals none while man page of hdparm should be
> included if target is set.
>
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
> meta/recipes-extended/hdparm/hdparm_9.39.bb | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/hdparm/hdparm_9.39.bb
> b/meta/recipes-extended/hdparm/hdparm_9.39.bb
> index 58ceb91..e2ad37d 100644
> --- a/meta/recipes-extended/hdparm/hdparm_9.39.bb
> +++ b/meta/recipes-extended/hdparm/hdparm_9.39.bb
> @@ -8,12 +8,12 @@ LIC_FILES_CHKSUM =
> "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
> file://wiper/GPLv2.txt;md5=fcb02dc552a041dee27e4b85c7396067 \
> file://wiper/wiper.sh;beginline=7;endline=31;md5=b7bc642addc152ea307505bf1a296f09"
>
> -PR = "r3"
> +PR = "r4"
>
> PACKAGES += "wiper"
>
> FILES_wiper = "${bindir}/wiper.sh"
> -FILES_${PN} = "${base_sbindir} ${mandir}"
> +FILES_${PN} = "${base_sbindir}"
>
> RDEPENDS_wiper = "bash gawk stat"
>
> --
> 1.8.5.2.233.g932f7e4

It looks like this patch has also been corrupted by your email program
and is also against an old version of oe-core. The current version of
hdparm is 9.43 not 9.39 and it looks like this change is no longer
necessary.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

