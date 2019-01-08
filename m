Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id C7ABF7BD93
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 15:57:44 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id x28so2730271vsh.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 07:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=+JPVT9zHfCJe/ClRLzVj5U6zePs3QYl+Cpd6YRC+4LE=;
	b=jBPzasqNdyRJV3g4U074etXxMrOFMLNgstPGy8wFibax+shMxOI3yYEED4OSpyjxqw
	9hZ2VGQWtvxVi7doOIk+3A9FYNWwJ6s80e1GKi3sdFi/vg3YP1EglfA6PdrdMiUM4vFc
	QqqvJP/SZMRIJPyQMK7bZ8vPMOtP1LFx0gE4TgHLG37gGVy627s2a1E1dWhwCGphbdq0
	uwcub/SwRqmMruHnejGvRjToaVC+/sieVTzIT8I/IoMdxFZWMlYsgzJD7G9e7EAAUY9T
	3fcHl81n9mlw6wiCMroVAc8jigSWMxERuSmw1jhYXZzi1HRHMN+6+mjk8OLh9o9xdJPu
	ibyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=+JPVT9zHfCJe/ClRLzVj5U6zePs3QYl+Cpd6YRC+4LE=;
	b=tvGzAhoGt89qdkI/p5T656a4Ia30eKMbR5wLbPRnIhp3XqO5fk2SZjLbUCmb3VcWbz
	VjKqkffAjlFUYb9OsV+UNSQfvEkiA6OmNDtBWAZpPgtLA0TxrG5GYBziHz9xb+Aeyxhk
	tp5112na+PpUHhjJ0kbf2nuk+7kiXBxyXNRjgVHcQLYXbw+zdu4fbB0Z5H44DgJ4/jwA
	4qXvfyPwIK6gHFew3RijTW/hLwgVug3CciOudb3sH2EljRyXtQfkkwW6B3XAeNGorneG
	akprF8QKjb1ZvdY7K5i6zGyvrGEuYoYDILroBEhIe1Fo87OOz/eYssmOAS1ILdd9B9U9
	leHA==
X-Gm-Message-State: AJcUukchW0E96d9UWjlqBYXOF3lXdcqMmWCOCWxicdefcO5D9UHhy77b
	AVxeu1/PGTVXAt9Om6amkqkcjvrkxnSSY1zwFQmLF6Cj
X-Google-Smtp-Source: ALg8bN7PLOPk5Yqy+to0w8DMg2lBQjgAMAmd/DLlrUW3B4jq1ArBnk67A83pR3mTcCuANtowJzF+ko8eOV5UQIVraCk=
X-Received: by 2002:a67:f1c2:: with SMTP id v2mr907170vsm.181.1546963065618;
	Tue, 08 Jan 2019 07:57:45 -0800 (PST)
MIME-Version: 1.0
References: <1544645927-18002-1-git-send-email-alex.kiernan@gmail.com>
In-Reply-To: <1544645927-18002-1-git-send-email-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 8 Jan 2019 15:57:34 +0000
Message-ID: <CAO5Uq5RZ0gEppGrR2xu-dKbnkcj7Kznph-XgWQnPVrF7GNpt7w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] uboot-sign.bbclass: silence warnings when UBOOT_DTB_BINARY is empty
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
X-List-Received-Date: Tue, 08 Jan 2019 15:57:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 12, 2018 at 8:18 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> When UBOOT_DTB_BINARY is set to "", the keys for signed booting are
> expected to be already present in U-Boot's DTB, so don't issue warnings
> for this.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

Ping?

> ---
>
>  meta/classes/uboot-sign.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
> index 03100b8a5fa1..9e3d1d6fc1ad 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -70,7 +70,7 @@ concat_dtb() {
>                 elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
>                         cd ${DEPLOYDIR}
>                         cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
> -               else
> +               elif [ -n "${UBOOT_DTB_BINARY}" ]; then
>                         bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
>                 fi
>         fi
> @@ -86,7 +86,7 @@ do_install_append() {
>                         # need both of them.
>                         install ${B}/${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
>                         ln -sf ${UBOOT_DTB_IMAGE} ${D}${datadir}/${UBOOT_DTB_BINARY}
> -               else
> +               elif [ -n "${UBOOT_DTB_BINARY}" ]; then
>                         bbwarn "${B}/${UBOOT_DTB_BINARY} not found"
>                 fi
>         fi
> --
> 2.7.4
>


-- 
Alex Kiernan

