Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.30773.1620649338839937712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 05:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20150623.gappssmtp.com header.s=20150623 header.b=Ac3U/ixn;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.53, mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f53.google.com with SMTP id h4so16387186wrt.12
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 05:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DDr0iFDUMAEC+llgoasXeYJeT/Pi1jwaD6fU7yLi+s8=;
        b=Ac3U/ixnThQWGyvD5DcNQ9w4Tx+i+nucyLRAnFio3MeMUiO5qHfe4JOvipwzRNPMnD
         r6sTSo5hZf670X30G2wVi311m2urZ2gWn7FXD5nDV4Pr0EwxvvjNHmIZEQFKM0jaZfIH
         oCeZEwTCausE3HyqWGA8rRglJvEac2sinobZ8I7LzICo40MOMsTC0vATy9RZpJARPrxx
         ApAJ4++BAWvN2KD8dsQPE7+CHfhSHE2VldMXmAOQ32y+9jEVc8Bz+2F9qYi1x2oGNvcA
         jYD/hRN5SekEjz3WGuiS6uSmgDf8JnGTVacWvUOPYdywcbVKy23fKzg6DA4Fy5G6xn/O
         Qrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DDr0iFDUMAEC+llgoasXeYJeT/Pi1jwaD6fU7yLi+s8=;
        b=IcYuIHZF4JMaKwvgeQ35MF+ag7I5E3HfgC6SH/m1zisS9mKRu6gyubqxAc6eN+3vLC
         UfpZgsQAFMhreNLl4KWc2fMkJw6hQ5vGJJtVoOLALqDJ6oj/Dg33DltwY8j8/cXO1ZiY
         M8bP6zghlpwuE6PkXrgrnl/TSQ39oz1FX9SQQu2Ub97hckjA/f7QuNfehAEnGGvmYwtM
         GShB2r0qb1p+0mPJq+dcTsGceGMCLU40hPCgLBVLlLRGwP0nrpaa8vTg74FFdMOL02Rg
         zs8tsOksHeMXIYmdj3TTmF/ij6ccIsT+ed6xiMyavi+NePimAz+ioxMfHYJaatdlJ3Ix
         LE+A==
X-Gm-Message-State: AOAM532Dsi11jITOyx7na1TCcmZXv+KfyjSoKvvPJeV1Q8HTdgIVQpWc
	9L+EO3a7KOEoFdpvtGKf0srWLXCSISZELzV1
X-Google-Smtp-Source: ABdhPJxDFn7ZELzVkswAcvl+TiuVTfdhQdG44bAL5KWMJ2ywahDRmyDCWAiEoHV0qzRgiWsWmcDMsg==
X-Received: by 2002:a5d:5903:: with SMTP id v3mr30258371wrd.405.1620649336982;
        Mon, 10 May 2021 05:22:16 -0700 (PDT)
Return-Path: <mathieu.dubois-briand@hyprua.org>
Received: from celeri ([2a01:e0a:4b9:9060:a198:f697:d53:3bb5])
        by smtp.gmail.com with ESMTPSA id m6sm23708721wrp.29.2021.05.10.05.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 05:22:16 -0700 (PDT)
Date: Mon, 10 May 2021 14:22:14 +0200
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@hyprua.org>
To: openembedded-core@lists.openembedded.org,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: Re: [OE-core] [PATCH] e2fsprogs: use default inode size for small fs
Message-ID: <20210510122214.GA99795@celeri>
References: <1673E3579AD24F09.16683@lists.openembedded.org>
 <1673E371308B0719.6806@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1673E371308B0719.6806@lists.openembedded.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I don't see much enthusiasm for this patch. As I said, maybe the way I
did it is not be the best one, but I'm open to any comment or request
for modification.

I feel like the goal of this patch is important. Without it, small ext
partitions generated with open embedded will not support any date beyond
year 2038.

Is there any way I can help to progress with this issue ?

Best regards,
Mathieu

