Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.12964.1589206886013858642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 07:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G+P/gWt8;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: sakoman@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id u16so19473155wmc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dKlPHBcbPje10uG4s2Sl6jOLZGS2JtObm8DSWWO+XHw=;
        b=G+P/gWt8VsqBjewUAsQjK0r87X75Xc4MZC3+GwhpOStw3UaLd3tekqGJzI2bybR2bZ
         qIY1sKRspgp8L/uaHentc/G6s6Uell0udWm+7bK4eeBllXNMJeXTm0MVQR+VxCkbF+MY
         zoULAnOQd7L8xkpGzkx4Crooj3hanBrKUXYAcmcLhKRYpXQVqUMseEORVGECHdvlOhNj
         Nkrx5PNbfbP0vrblNXNNx79lX+Kr19/seedbf554ax1cpp6O36kca5l+yQ8cxtl12fOV
         ibbK1+SY7XsXbWrk4Br3b7xwaVPcJQIFKizMVpli8AcDC/WB7muyhrWT1+nBnlvUp9Cr
         F+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dKlPHBcbPje10uG4s2Sl6jOLZGS2JtObm8DSWWO+XHw=;
        b=HJh6TEhljjn6MmEpFgAJcPXZpJahj34hr3JhOhaqooAysQx+QS0ALb7goMOauJ/AcN
         /qRs8nsBuDrFE+boaCC+iAWZIrfLMQ72JzzJGYe9aaq7gm63k7hVlgXDLtEgv/rY9wPp
         RWJtC3V5uyiFMwOtoYpctuSVUEy8Vguc/rx63Mrdy16LShbZ0qJRxnwdcDcDapsD/sQi
         ITkWIxUQTlaDdvUPtKizxEAxHRltdz/Hh+J5jCRfMUhljOq5ccMKt5DcRxocfIIRqZOe
         P7cPiHsJz4uC+qArVmNN3Ufg+vmdiJqmI4FckBNNaTVDbZteX1TZ+0dDHSObqiSS5ayO
         JuDg==
X-Gm-Message-State: AGi0PuYLVcfw30BgmFrWmpvD80eLc0lqMDTP97TMhL3vwWPDjwDvXiX/
	jeyaYRIFnpYiPfA1uOCVmhRi4BonV3or7VHlcV4=
X-Google-Smtp-Source: APiQypK0al7xibmjeVkVeJTpqs6oahnADyBI/eYiL9TPgXM8sXZsR0iD7qcbnFlJzjnHFapZTowJ5DM/FDktjuIlqH0=
X-Received: by 2002:a7b:cf15:: with SMTP id l21mr12960084wmg.172.1589206884509;
 Mon, 11 May 2020 07:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200504162043.1137-1-pkj@axis.com>
In-Reply-To: <20200504162043.1137-1-pkj@axis.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 11 May 2020 04:21:13 -1000
Message-ID: <CAGDS+nmJAJ4cU_P4YgyHpkj4sXsfwzudJQWxHqpHk0CO1B_zfA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] libdnf: Use single-quotes around string literals used in SQL statements
To: peter.kjellerstedt@axis.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Is this patch suitable for inclusion in dunfell lts?

Thanks,

Steve

On Mon, May 4, 2020 at 6:20 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> If sqlite is built with -DSQLITE_DQS=0 in accordance with
> https://sqlite.org/quirks.html#dblquote, migration to version 1.2 of the
> history database would fail with:
>
>   History database cannot be created: .../var/lib/dnf/history.sqlite.
>   Error: SQLite error on ":memory:": Executing an SQL statement failed:
>   no such column: 1.2
>
> Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
> ---
>
> PATCH v2: Updated the Upstream-Status to Accepted.
>
>  ...s-around-string-literals-used-in-SQL.patch | 36 +++++++++++++++++++
>  meta/recipes-devtools/libdnf/libdnf_0.47.0.bb |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch
>
> diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch
> new file mode 100644
> index 0000000000..293bdcdd24
> --- /dev/null
> +++ b/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch
> @@ -0,0 +1,36 @@
> +From 96ca7d0049461df2293dd0000edcbc69b64255e0 Mon Sep 17 00:00:00 2001
> +From: Peter Kjellerstedt <pkj@axis.com>
> +Date: Sun, 3 May 2020 22:40:39 +0200
> +Subject: [PATCH] Use single-quotes around string literals used in SQL
> + statements
> +
> +If sqlite is built with -DSQLITE_DQS=0 in accordance with
> +https://sqlite.org/quirks.html#dblquote, migration to version 1.2 of the
> +history database would fail with:
> +
> +  History database cannot be created: /var/lib/dnf/history.sqlite.
> +  Error: SQLite error on ":memory:": Executing an SQL statement failed:
> +  no such column: 1.2
> +
> +Upstream-Status: Accepted [https://github.com/rpm-software-management/libdnf/pull/951]
> +Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
> +---
> + libdnf/transaction/sql/migrate_tables_1_2.sql | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libdnf/transaction/sql/migrate_tables_1_2.sql b/libdnf/transaction/sql/migrate_tables_1_2.sql
> +index 49b75315..f80ad1c4 100644
> +--- a/libdnf/transaction/sql/migrate_tables_1_2.sql
> ++++ b/libdnf/transaction/sql/migrate_tables_1_2.sql
> +@@ -1,9 +1,9 @@
> + R"**(
> + BEGIN TRANSACTION;
> +     ALTER TABLE trans
> +-        ADD comment TEXT DEFAULT "";
> ++        ADD comment TEXT DEFAULT '';
> +     UPDATE config
> +-        SET value = "1.2"
> ++        SET value = '1.2'
> +         WHERE key = 'version';
> + COMMIT;
> + )**"
> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
> index 1b4b7e4233..1b06d66b19 100644
> --- a/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
> +++ b/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
> @@ -8,6 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
>             file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
>             file://0001-Add-WITH_TESTS-option.patch \
>             file://0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch \
> +           file://0001-Use-single-quotes-around-string-literals-used-in-SQL.patch \
>             "
>
>  SRCREV = "8330eea6985c4e4b53796f858de5b6b38b1ddf5c"
> --
> 2.21.1
>
> 
