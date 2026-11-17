Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2091.1794939644948836100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=SFwbjLzM;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso35592f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939643; x=1795544443; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQIjwBqlecGa6uVsqqr7TsxIuwNMwFYwlIj9P1euRgM=;
        b=SFwbjLzMjxBm+4j3jv0bGtdwduEg4VuSC7bH2oKIRG+nsXZOFuQMAIdAt7ap55QyMs
         wFjVLK4RinyqlJ10MYwC1TAY6aGN29o7gS+y+6B+8DyUlQ2pB5ddhdWVn6+cYfJHUB28
         EgOvVdfX/OoJjPme6WS1+wJND7gRR+YcYxeJBWVtzfs9kHTGOXZrBWwujT+e6m/Bt5Dt
         wBPbKD722/d0l5UYDZwYMuz68m3oR1vqKmV644v3m6weTZO4ghky+6fxF7w7DUShxr8o
         J6CEg8nHrgu8knRDzi0L4cbnEbq9ncITC1S74iUnisyOlTVPEVThfd+dBQeciHp2757r
         ou7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939643; x=1795544443;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQIjwBqlecGa6uVsqqr7TsxIuwNMwFYwlIj9P1euRgM=;
        b=xDrzTLkwSrW+c063g2pSS0L10n2yncaVP/a4wiQZAMp4lJKUOVzvBeiTPEV6BljDqO
         oJbZfxim+Gb3l2DwQPQ0ZbmKvsMHC2d+ubixqstt72osPou0lbKibMP8UNOIXz7Kmt4f
         b3d8Km5ILRvVAVaZ/s86OnF3cIKXlNcVc9yu4P5Ir6rYhH+zwz05JCcPThg8Kt8Cc5IB
         teCbF7oSrXaLNNw8nYOpkduvlLwAlhWCB7sVw5cIEpcVmzk2uwr2Zo4wu3CZtDU9ilpE
         mcAnLkDJW3cx6y/18jNDnwZk/RhszXtvKm/k9uZzyGvtyzMtG55S50bUYnyZJOAIqpAa
         M99A==
X-Gm-Message-State: APuU4Z8G7J5y2mjZaQLMBLdOa0nKBP7RubIyRw/3fxVrfsBXFkTQ+FyP
	jO0NRgY9XXdK4n3WTDsDO4lDOnRBjkrJEy5Ps1yGsQbM3+95eGFlWw1ZP8d1OtpkUycgBTlb+eb
	D7vm+lMU=
X-Gm-Gg: AZFdTZfO+FB1LO7CY6MVUsjqfrjZZZhwKAXDWGlMB8JIu+rb9mCpiPE7KX9SImeYi+u
	faHg/uCvXDQ0RZql+pOrztGJnWdT5c9Oiv0DIyH+m+G9GLbapybmPsRDtNYgmbNQ8azZPTGkkdS
	DB34OoluEMSIk914/hcV2tyUlosaa1UYGBJEcFL29D3Gw1sHD/bOG/qNoZzSs+LVetZr2IwkYAV
	Q3ZNtXM6cDpF/I1d0uFSm5Tp8AtsXGWwA0kzMdXEhMIsDDNMjzv7mx/LQF3lD6FV5c6vy1a0boK
	URPt/8bJzKDRsvAIFJbt/fuRzsXx6sXfm51ClApoS98mqXa+w6+T7h3ARBS4f118+NRFhywlDAC
	Vajc9kXYNBF2KHOjE53mBxol1s046JY9RjDZf5Af5MMtkRHkU4prrZhxNryOS/2d6kDWYtno4yU
	fLXEHmbWLFiR7XTseugJu3F5jyYdX40UwBrwXoqVFVnqfQFHht6j/CnDCrSyFZ/e4IXw+7MAO1G
	Y1fgg51EFO7X5oZASdVZBO39Ml+USMZKLk2WhwQ2NplhOo/QJmQzQh+ICw0+eDrtuI5IFfMLmdc
	Y0Cw05Knws3UK0HqB63gym6bS6pQKYwioF4BiS9+ecA5EKqEWAyHr/63wpZVkx+QnSRIpd3r5TS
	4spluLe5wjCO59ZhTBENRrvvGLy+p
X-Received: by 2002:a05:6000:46c5:b0:48e:6357:c76d with SMTP id ffacd0b85a97d-4a63d2cf09cmr367227f8f.21.1794939643081;
        Tue, 17 Nov 2026 10:20:43 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:42 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/17] spdx30_tasks: Fix duplicated revision in Git PURLs
Date: Tue, 17 Nov 2026 19:20:15 +0100
Message-ID: <c89778d7b63f5badc1d6d9b52c78c3b0f8e3a41b.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250482
Content-Type: text/plain; charset="utf-8"

From: KAZUYOSHI AKIYAMA (秋山 和慶) <kazuyoshi_akiyama@jp.honda>

_generate_git_purl() generates invalid PURLs of the form
`pkg:github/<owner>/<repo>@<rev>@<rev>`.
purl-spec only allows a single `@<rev>`.

oe.spdx_common.fetch_data_to_uri() already appends "@<rev>" to the
download location, and urlparse() leaves that suffix in parsed.path.
Therefore, the parsed repository name(`{repo}`) includes `@<rev>`.
So, need to strip the revision suffix before splitting out
the owner(`{owner}`) and the repository name(`{repo}`).

While here, replace str.replace(".git", "") with str.removesuffix() so
repository names that contain ".git" elsewhere are preserved.

Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e31479ddbaf58d5c2eda2b0051e1a821d46e6f7c)
Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/spdx30_tasks.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 862e57c3d12..62fc41f51a0 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -425,11 +425,14 @@ def _generate_git_purl(d, download_location, srcrev):
 
     for domain, purl_type in git_purl_handlers.items():
         if hostname == domain:
-            path = parsed.path.strip('/')
+            # oe.spdx_common.fetch_data_to_uri() appends "@<rev>" to the
+            # download location, which must not become part of the
+            # repository name
+            path = parsed.path.strip('/').partition('@')[0]
             path_parts = path.split('/')
             if len(path_parts) >= 2:
                 owner = path_parts[0]
-                repo = path_parts[1].replace('.git', '')
+                repo = path_parts[1].removesuffix('.git')
                 return f"{purl_type}/{owner}/{repo}@{srcrev}"
             break
 
