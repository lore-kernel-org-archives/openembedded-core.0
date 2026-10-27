Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31664.1793141377164807293
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 15:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KTkegRb3;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-49e1251674cso179123fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 15:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793141376; x=1793746176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6a218T7J9CdQ1Gy8YvoxIqc3NS5Dxw8wEwvBF+qx970=;
        b=KTkegRb3bTaLsRA8VH9DVo51oyIEAMObkTz0ffChVMGVWYoQg+o35yAkpECe6fc5hH
         qlTtZ10GmnRSbLoB2UfJ0RYGB3d06Dnz07GBkWg7bro67LqMF1I24W8V9k4zmnKkYwlP
         yN2UZ+Pg5XumGdNjQt1dqu24EsIXjeY+8bNMr/qKWyY9zpz7X6XypM5OlFC4VZDQSFXj
         YqSxACsfct1VaTVQCz+/SPSc44jemljfqdI3v9cKWEUhhIaYoDRkWObbfsC7mTSV3u7x
         XOf66441L7GgEKyOr3cd8HOJEINdWxADdhx3GdqDd8lCfJPg0h5O7vF66uHoTWfITYbM
         KGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141376; x=1793746176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6a218T7J9CdQ1Gy8YvoxIqc3NS5Dxw8wEwvBF+qx970=;
        b=UlrQdEuIk3rjR6B+lHV1JZCQlVTsQtmhtFEXNj56YI66wRC1zqmotY/S/poc2tVN6Q
         upBqdKVuWhInCwpuzN7c6uYIkrOsPV9ViRfQlXFIS/Lzo/t9iQGwcUpuzdf/c0Fh0in+
         Fr3Kpt/Zg4VQye77jFQCrm8gieC6gOMJLIqoQaZC9utRNqbXAxaqWuU/Pw+jt3YsJkFI
         97nFA+7hSK/JwVTVFlSr+k4q/+xm0eZC36kXkw5W5UtZ4NMk5ywNJG76tiFkB3gcl0LX
         TiDlVYf4o7DRlb/5jg9Jq5PRjRx2ks20f4NiTWDBN6dkLfE09gYro54IdyB9Tgoe7+wn
         9QFg==
X-Gm-Message-State: AFq9FYKEaeBISPjPiklZqhanUSEDCpv14CBv9cyqAE8ub9GN2sb+v/Y+
	VdvznacvtcQpVSsealTFbTHynljkveQtRw/9bRuDOLgrwe+INc8vhFVsNYe17A==
X-Gm-Gg: AYBFou0u3vezoBg5I5/xprI/kUyN0ZwUJOBjA0CArMx7uAUej8d4/yv+r+j4OSr+QRK
	fVBE1SbwWKVLRj2o4UOmcwVfU4wYSGvADNelir6vOjY1L0gQQzsSG8Sb2FcBT1QlncEyCgxCXyB
	4dKPgpQR51Ka6tlbIm5sfTaQIkdVZyxbHbVdCuzVuEEWdgffnGtKJUU+Q/gScZRhsHHyQ6Rwabe
	UaIVONtUso/2BVnEcMdUQ471M/Q27OeDBJnvFKGtcOPhOHnnmN6SNFF46gvg6AiGxuEBev7MoWM
	PPNeGRd+/xfrX5k87+dhKkBYRia2e+jbICgoX6LQMhu64w9gx6xsfF4mBt0DdLEhK+2uELPj9os
	Mh8w2Ez4PfwiNMtsAKnUWTJQb0GP/Jwfe7/beoSlQX6hyBeJscLYKi2EvO2V1AMVTLS1ldh70zy
	DLiClJjjmJIGIlW8uahPlGlm9ilgy0uWGwxBzyL/Mv8ciks7UJS/MNfNw/67RphBQDR84OOKPV8
	uUqUR5pLd3MQ8tIDsEHOSpvH0qWXJU8zxNp6hGVmfSDpEnHF3gQnK+fEZZiGsZs16iCXOMTtDNV
	chhTP+pUKYWedttcSPGVYSIZFBmy
X-Received: by 2002:a05:6870:b51f:b0:4a7:1d07:b4e9 with SMTP id 586e51a60fabf-4a8bba9aa74mr730596fac.43.1793141376251;
        Tue, 27 Oct 2026 15:49:36 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1109])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b7979514sm1111037fac.17.2026.10.27.15.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:49:35 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 0/7] Implement SPDX for deploy tasks
Date: Tue, 27 Oct 2026 16:47:14 -0600
Message-ID: <20261027224931.385138-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026214627.2388650-1-JPEWhacker@gmail.com>
References: <20261026214627.2388650-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 22:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248764
Content-Type: text/plain; charset="utf-8"

The SPDX use case for file system image has been well defined since SPDX
was first implemented, however there has always been a desire to also
express SPDX output for other non-image deliverables (primarily, those
that have a do_deploy task or similar). These types of tasks cannot
easily use the traditional method of having a separate SPDX task that
runs to create their SPDX output as this causes lots of problems with
the way dependencies are specified. Instead, it is desirable for these
tasks to directly produce SPDX output that can be consumed by other
tasks that depend on them.

This patch series adds support for this. Any sstate task that starts
with "do_deploy" can now be added to the SPDX_DEPLOY_TASKS list and it
will run a postfunc to generate SPDX output that describes what is being
deployed. For classical do_deploy tasks, this is setup to be easy by
automatically capturing all the deployed output files in the SPDX data,
but other tasks can be added as well.

Finally, the do_create_image_spdx task is removed and replaced with a
SPDX deploy postfunc using this new system. This means that any task
that depends on do_image_complete will automatically also get the SPDX
output for the image, simplifying the dependency handling.

V2: Fixed SPDX documents missing at SBoM creation time when the
documents were not a direct dependency of the SBoM, and were present in
a sstate object. Previously, these sstate objects were not restored
because they were "covered" by the later sstate tasks, but now they are
restored if they are depended on by a task that creates SPDX output.

V3: Fixed a bug where dependencies that are not in the taskhash could be
missing when the final SBoM is created and added tests.

V4: Fixed some testing errors that revealed that EFI providers have to
be MACHINE_ARCH (and consequently, wic-tools)

V6: Fixed a bug where eudev/systemd initramfs-framework was not being
properly detected and the wrong link was in the SPDX due to the switch
between the two not being detected.

Also, deploy.bbclass now always adds do_deploy to SPDX_DEPLOY_TASKS, so
any recipe inheriting that class gets it automatically.

Joshua Watt (7):
  spdx: Skip dependencies that are not in the taskhash
  spdx: Add ability for deploy tasks to create SPDX
  oeqa: Add SPDX deploy SBoM test
  classes-global/sstate: Keep SPDX generating setscene dependencies
  classes-recipe/deploy: Add do_deploy to SPDX_DEPLOY_TASKS
  spdx: Replace do_create_image_spdx with deploy task
  layer.conf: Fix initramfs-framework not knowing which udev it has

 meta/classes-global/sstate.bbclass            |  38 ++-
 .../create-spdx-image-3.0.bbclass             |  32 +-
 meta/classes-recipe/deploy.bbclass            |   2 +
 meta/classes-recipe/nospdx.bbclass            |   2 +-
 meta/classes/create-spdx-3.0.bbclass          | 178 ++++++++++
 meta/classes/spdx-common.bbclass              |   2 +-
 meta/conf/layer.conf                          |   2 -
 meta/lib/oe/sbom30.py                         |  46 ++-
 meta/lib/oe/spdx30_tasks.py                   | 316 ++++++++++++++----
 meta/lib/oe/spdx_common.py                    |   2 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |  11 +
 11 files changed, 529 insertions(+), 102 deletions(-)

-- 
2.56.0

