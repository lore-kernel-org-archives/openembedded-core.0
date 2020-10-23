Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.6089.1603443434844373197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 01:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ME3vjnST;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id v5so645131wmh.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 01:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=bI3lWfWCj59gl6NroO3/yfRDkvbNh2jEYsu+e2MoK+Q=;
        b=ME3vjnST4kSb7rb12JrEslI15HpUKBHcJ4RLOru7tGNz0lL6ZqiwKNosFFXgHrHoI5
         YFUyYo71DTRs6sNkdlfH0ki7mCwuh6DINE/ebYmuesvUtLqT7NDXZmT1xfjU52qJZkEO
         XefZBasZEobmJJEogoJdnxmHk7WisR494VtCsRUqRDq1fC4w29CA/9VT9u1d5VAzDndM
         cMYEax58yeceSRVTnPDGheOWetHoWfsLF/SaGQ52Dnt/w0WWGTJ49snNhZ3z7M6rxYX/
         YOr/xdHTFgAHifaIb1HufS2bM0WSY1RdLfGYCMUCvCc/q31iqCGToUq/di6JkokQjE2h
         fJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bI3lWfWCj59gl6NroO3/yfRDkvbNh2jEYsu+e2MoK+Q=;
        b=K3RfkEMmSujjdccHEB8OPuqh/dS10x137FtGY8+YW+TtvRt7XIe9L3ODjbcy4pMzKi
         0jEg5/2qe8n2GD1Dgu6x1EOwGq82kCZyleO/DiEpY00QdKs7MdlrCrMLBob/U3cTV1i+
         /Lb+ANRDFL/fgvb25nTFX6imQw/Y+6h62HBXfc2qmXzjkpWPggANv8fzWXij6O5f0GJR
         reMqjhVYHfidETxr3DHOnLSCPPj/W+LYLZPupxHgWRuGu3CvIRhiAowUuzGaRbfR9YHa
         a5IyEVbVhS0wALAjiw2IV23L7lTlEynuEcSBnAwHg5e+bbqBz+K956xY2WSqCiDducSK
         0D2w==
X-Gm-Message-State: AOAM532hL2Oo0NYkH/y62muLDou0iekdN7oN67dt9CJhtPFot5kJaWat
	WQH7SytBQLGNZpLDvgqHM8s=
X-Google-Smtp-Source: ABdhPJxSIa4T6wMz93BfjReyu369+DR0+HoxQY6xC/Tgs3KdatdKv4X5eNwDr2iAgH9funk14sqjuw==
X-Received: by 2002:a1c:4c05:: with SMTP id z5mr1210768wmf.122.1603443433224;
        Fri, 23 Oct 2020 01:57:13 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id e25sm2095092wra.71.2020.10.23.01.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 01:57:12 -0700 (PDT)
Message-ID: <9acee59b73992f7e58c65c9c324ef28ffc528f03.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3] Add new recipe for squashfs-tools-ng
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 23 Oct 2020 09:57:10 +0100
In-Reply-To: <e5d55a34-2ec4-64d4-2d6d-8961b4bc6ba8@gmail.com>
References: <20201022092000.2917248-1-luca.boccassi@gmail.com>
	 <20201022113036.2938947-1-luca.boccassi@gmail.com>
	 <e5d55a34-2ec4-64d4-2d6d-8961b4bc6ba8@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-22 at 12:10 -0700, Khem Raj wrote:
> 
> On 10/22/20 4:30 AM, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > The main difference with squashfs-tools is the availability
> > of a shared library and a programmatic interface, rather
> > than just command-line tools.
> 
> Can you clarify which parts are under GPL-3.0+ & LGPL-3.0+ licenses.
> is it possible to ship traditional functionality from squashfs-tools 
> without using code under these licenses.

It's all defined in COPYING.md - the library is under LGPL3+, the rest
of the code (command-line tools) under GPL3+.

# License of squashfs-tools-ng

The `libsquashfs` library is released under the terms and conditions of the
**GNU Lesser General Public License version 3 or later**. This applies to
all source code in the directories `lib/sqfs`, `lib/util` and `include/sqfs`
with the following exceptions:

 - `lib/util/xxhash.c` contains a modified implementation of the xxhash32
   algorithm. See `licenses/xxhash.txt` for copyright and licensing
   information (2 clause BSD license).
 - `lib/lz4` contains files extracted from the LZ4 compression library.
   See `lib/lz4/README` for details and `licenses/LZ4.txt` for copyright and
   licensing information (2 clause BSD license).
 - `lib/zlib` contains files that have been extracted from the the zlib
   compression library and modified. See `lib/zlib/README` for details
   and `licenses/zlib.txt` for details.
 - `lib/util/hash_table.c`, `include/hash_table.h` and
   `lib/util/fast_urem_by_const.h` contain a hash table implementation (MIT
   license). See `licenses/hash_table.txt` for details.

The rest of squashfs-tools-ng is released under the terms and conditions of
the **GNU General Public License version 3 or later**.

-- 
Kind regards,
Luca Boccassi

