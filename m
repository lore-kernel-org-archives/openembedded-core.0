Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5BCCA5FAC
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 16:35:57 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10602.1768926956323717441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 08:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NhmznVWU;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6581234d208so222508a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 08:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768926955; x=1769531755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9mE9lcV5jX5246vU2AoiZjON8UeEKzBxZHXu0+cxG+o=;
        b=NhmznVWU4Z2Xeiy607Qb4Ispby3aghI3VFkBlzWqdHunzSF0OJ+9QNU5Khg/AHjBlz
         8Ud2kE7xQmxu2DRpt4UhJvKuDaMxEK3xlsSCKl3MxqSPa0mMK1Hq06wQoAaJjBRK9IR2
         m97u57NbySL+I/48tHMx2vYwZIBzh8MG/HrY9Cv5KX80FqSwFe2ZcPuuUxZ6M/t7kI6R
         CdTVdlymIby98kE7BXnOkvHhYH3YpvUJJlqd5L2U7mlIiKf2aq7Jlq4mpIKtBAHyhswf
         fsp3PgLKhPKT2u8KRlwuJ5qHXRt4xlZes+7bwyu8y6YYxrj2WjLPVLv61JIF3jCqai0+
         TBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768926955; x=1769531755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mE9lcV5jX5246vU2AoiZjON8UeEKzBxZHXu0+cxG+o=;
        b=MySFniRkXedx9ew3lLZG0bga5Bqq0IVsXjKrZmAYFEt+UgrmPMQz2c0tWguqBqvfDj
         Bnsc6A2KFQzYYdQ17aokbgzuFr4KbrLp1ZHILdrBsyJ2kYkINZnUpHMaSJziM/JXyqPi
         IDYQWJnpiVcPKM8HFaFUYCBpaAQhLhGsrxcxhfqu5phKj1Nza7+I/PIJxYF2uWQ9mwuL
         s0UTr3uEIJJr0x89RC3zkYegbkb2S8fSng93zIMCarlU8+0ppxmtnv4fgei12oZz1FHK
         VtXrm4duVctSbITOFzlfMdOMEqai4xDeg/lezooS90ZIsKbFiI86gfN/zKeRBSNFvb5I
         BWBQ==
X-Gm-Message-State: AOJu0YxMnnBJeiU3Al1TJy5qFjw/Eb1trRERYQkrGdLsnF6flIn0sST3
	d+9jbhj/XD+NbWOc/CPU3nxHXkN5tjFXhsNMHFcdErCJZ6W8QPqEpJbz3YXfPg==
X-Gm-Gg: AZuq6aJ2vTu0Zg5Yr62tswp80VtYW3UYJvUxY5IbQgHhtP1cR56R0Hoj5WN/bDfByb7
	izcMDbJpnraUPAtex5fMopq4hw6T4OhueT/004ya2QG/H++l/aCy3AmFt58SUcq4CW10zI12jsc
	1w9bhdGVicVqU+7rqj3oD/5R4lHajI9GAtMEXTbcGmhVa2GV+6umzDiOVQvviASOnOmXrLox9Ti
	sJGhNFBDml/VX4jWtpj9hYQQm7PwpU76m8QsG3ResiriFaqPnEQKMxsYfME2P5At7HA5S32xciv
	9Wa0ucbBZ2JsnJhy407fx8ir/GT6XTPhmgOlWO+bN3Zfk416yBYM31tkZRtKXZERF4k2qbd1BrF
	/0XejGNGrdV1I5tGGP+qGcbY5A1M7zs1JMfYy1IG1wSXh8Nc34MG8sN6Xd7cW7Ev8mEOnBtL9DX
	zYcrnwrhIqxFEnwfrhcy6cdkG8
X-Received: by 2002:a17:907:6d06:b0:b73:3e15:a370 with SMTP id a640c23a62f3a-b8796bb87cfmr1358893066b.57.1768926954323;
        Tue, 20 Jan 2026 08:35:54 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959f6e53sm1473375066b.47.2026.01.20.08.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 08:35:53 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2] lsb.py: strip ' from os-release file
Date: Tue, 20 Jan 2026 17:35:51 +0100
Message-ID: <20260120163551.1841281-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 16:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229744

From: Martin Jansa <martin.jansa@gmail.com>

In gentoo the file looks like this:

NAME='Gentoo'
ID='gentoo'
PRETTY_NAME='Gentoo Linux'
VERSION='2.18'
VERSION_ID='2.18'
HOME_URL='https://www.gentoo.org/'
SUPPORT_URL='https://www.gentoo.org/support/'
BUG_REPORT_URL='https://bugs.gentoo.org/'
ANSI_COLOR='1;32'

' were added with:
https://github.com/gentoo/gentoo/commit/2f590e35c9d3d13d5673163527120b2de97fdc80

before that the os-release file looked like this:

NAME=Gentoo
ID=gentoo
PRETTY_NAME="Gentoo Linux"
ANSI_COLOR="1;32"
HOME_URL="https://www.gentoo.org/"
SUPPORT_URL="https://www.gentoo.org/support/"
BUG_REPORT_URL="https://bugs.gentoo.org/"
VERSION_ID="2.18"

The ' is stripped from the ID later in distro_identifier with:
    # Filter out any non-alphanumerics and convert to lowercase
    distro_id = re.sub(r'\W', '', distro_id).lower()
but not from version which results in a weird NATIVELSBSTRING like:
    NATIVELSBSTRING      = "gentoo-'2.18'"

And similarly the directory name in sstate-cache:

oe-core $ ls -d sstate-cache/gentoo-*
"sstate-cache/gentoo-'2.18'"   sstate-cache/gentoo-2.18

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: rebased to apply properly (v1 was based on debug commit)

 meta/lib/oe/lsb.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 3ec03e5042..1fc3b968a0 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -16,7 +16,7 @@ def get_os_release():
                     key, val = line.rstrip().split('=', 1)
                 except ValueError:
                     continue
-                data[key.strip()] = val.strip('"')
+                data[key.strip()] = val.strip('"\'')
     return data
 
 def release_dict_osr():

