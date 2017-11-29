Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4A58B60778
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 07:41:35 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j124so1191614pfc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 23:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NEFuvakX/9dJsPGLpwAj+6BtifC9K0bbDLfaTSXHpFU=;
	b=VU9ZE3DZghbcTXrBRRUxVgqd2MFyxlMQQuh1/Yen4Dcg3FX3VHmQFiTX76nVr79G3G
	MUorkg8Bc8TeUEINktYHKOs06cgMcgH4B23T9+lXg9LkI2nmYayMhoPhzaw2v47CsiwA
	qeFc22CSYIxtipylkyou1ARiycU6mbSn5VfZvpjndm4Z4MCBKcq6JalsW88/s3qxUPsE
	D06cjiPjxFZPtjWgPWNBWtIBBwgsrFFY8FVyVyoZcyUYlp02LfZpYX7k7nMo5Fm1ypXh
	ZH45gFEIiUlfFDL2EE5BJXW8DZ30mDM0QR1Ggq3H5eSjfqS8esPb1kOwrWXNtT8I2IOd
	f3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NEFuvakX/9dJsPGLpwAj+6BtifC9K0bbDLfaTSXHpFU=;
	b=mdnsp5FuC4qgz32MUpF/10BxRM93z9IuYDyruHMG1eU12y6GWMdlVAI4LXa22QTWKM
	D+va7dTitI35Buq+y8i0Wm6CIeGDYU9LeInVpRLGJeO8GXdJqiGoi5Uk/y3u8SroUi2u
	m8yAwjVf7YncPMJrflhnqQVcmK2qQJ0cpIh1q9i3rweptFZF5Ew+bi+Nkpa2hYRVjbpO
	f3JCnJaPHAG1zbKttYYaftAd19Wc80TtNIT4sl/TjFlSwdCJjmhtanS8VTeJSOVsAD7M
	mkMYEFHpKOMJJp/lxB6Luw1qAN5lWsb/aeTYbaSHxbckfwG6ZUpuH0AoB/KLt6QiWpm5
	1fug==
X-Gm-Message-State: AJaThX66eKzacO5XniiotUuAQU471er8oHglNZIb5CUk44TQCAw4/yKB
	XQanB/2KsOxZO0N0wXFwWBqZorUJcLxrLmZCABE=
X-Google-Smtp-Source: AGs4zMYFfXxTp27MZiNcOj5SjNlXgAqDyMwWqaMg48NROYsM39WqSu49NmWO5j4i1Eb/E6Z6g7QA5lMcFKkgBguHznA=
X-Received: by 10.101.73.203 with SMTP id t11mr1942507pgs.446.1511941297348;
	Tue, 28 Nov 2017 23:41:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Tue, 28 Nov 2017 23:41:06 -0800 (PST)
In-Reply-To: <CAD3vsf7S+QhF5_qQbLVt9DrzGrwZb_HUX3BNL=iMgp8CVtgn6g@mail.gmail.com>
References: <1511460302-27041-1-git-send-email-akuster808@gmail.com>
	<CAMKF1sr2ZAM0sH19g0Y0Ewbb7D61x6igA4NBXd0wrXYBx9Wvvw@mail.gmail.com>
	<CAD3vsf7S+QhF5_qQbLVt9DrzGrwZb_HUX3BNL=iMgp8CVtgn6g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Nov 2017 23:41:06 -0800
Message-ID: <CAMKF1sr+QA-u-7HzECytK_-ejPc_9kwxvbskxr1_PgqecnA-xQ@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Morty][PATCH] binutils: Fix build issue on Centos 6
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
X-List-Received-Date: Wed, 29 Nov 2017 07:41:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 28, 2017 at 8:07 AM, Jagadeesh Krishnanjanappa
<jkrishnanjanappa@mvista.com> wrote:
>
>
>> From: Armin Kuster <akuster@mvista.com>
>>
>> >
>> > Per Yocto Compatable: The following change was made to fix a build issue
>> > we are seeing on
>> > Centos 6. Not expecting this to be merge.
>> >
>> > binutils-cross-canadian-arm-2.27-r0.47: task do_compile:
>> >
>>
>> does installing https://people.centos.org/tru/devtools-2/6/x86_64/RPMS/
>> help ?
>>
> The above link points to gcc rpms of v4.8.1/2, but the  "-Wstack-usage"
> option
> was introduced in gcc v4.9.x; so I think the problem exists with the above
> rpms.
> Ref: https://sourceware.org/bugzilla/show_bug.cgi?id=19854
>

Then you might need to install devtool version 6

https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/


> Regards,
> Jagadeesh
>
>> > gprof' cc1: error: unrecognized command line option
>> > "-Wstack-usage=262144"
>> >
>> > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
>> > Reviewed-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> > Signed-off-by: Armin Kuster <akuster@mvista.com>
>> > ---
>> >  meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 7 +++++++
>> >  1 file changed, 7 insertions(+)
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
>> > b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
>> > index ae14642..30e3bc6 100644
>> > --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
>> > +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
>> > @@ -12,6 +12,13 @@ EXTRA_OECONF +=
>> > "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VEND
>> >  # e.g. we switch between different machines with different tunes.
>> >  EXTRA_OECONF[vardepsexclude] = "TUNE_PKGARCH"
>> >
>> > +EXTRA_OEMAKE += "WARN_CFLAGS='-W -Wall -Wstrict-prototypes
>> > -Wmissing-prototypes -Wshadow'"
>> > +do_configure_prepend () {
>> > +       sed -i ${S}/bfd/warning.m4 -e "/Wstack-usage/D"
>> > +       sed -i ${S}/bfd/configure -e "s/-Wstack-usage=262144//"
>> > +       sed -i ${S}/binutils/configure -e "s/-Wstack-usage=262144//"
>> > +}
>> > +
>> >  do_install () {
>> >         autotools_do_install
>> >
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

