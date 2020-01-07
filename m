Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 487577C4DB
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:58 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id k25so27745299pgt.7
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mRk2a3oQtX4sJK+5lOOe462/0JYSVf3VN3quqGx26WE=;
	b=AFPGR+PJDNo0VLG0vJW5OVnYAHeP5EaGQoGF/QPkbMptguAXy+a6sFJU7mOCl1BNLO
	0dmWrMRFGR9QH0CO272QWWFzgzjji274/B827XA+W5fK8Bou03I6os+jnqrFsLjr7NFY
	OBmCaW/u0U/+lzslZj2KlwZY+5fFpNoNl0BA5HptKnwC4aK9wvJlc+DueDLyqlTXi75A
	hV3FTNGTI25KE6ZaN8XHQWaTz+LIGLK510Q+Fv0a6J3VsdnW0wm5QtHWnY2WQD2DsFiy
	TvgMm7yEg9ypnnG0pb+38I7rbt4TGSet2HKDJqXoEeUxvwZgV+ojGJbrayeldeJz5TWx
	5ayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mRk2a3oQtX4sJK+5lOOe462/0JYSVf3VN3quqGx26WE=;
	b=CtXgF8RRud7ziQGJM09JBln7nMXCk1RX4i3i5iPgsn2MUvJNcTk2aBlE+aoZNn8glu
	c/WPewK7utLiAfWH5cNMnqt6VCppqE46C55PDhUReCiQnVJhUygQfBj6a+wpeJHi8qtl
	43s3mFqmiCJNApvNO5dHmfdh+7NzO8InLOgVSgohHDB+4jwoYGDsdMS29YvfEDQU0oQX
	nPIhBMRxz/eCq4eLw1TvwVXvEbCcULl41E3trpiqutBxgJ66r30w6lFEBGgODRDkLrYi
	CQlqwAUzeJ1TKnj5xV362usWt/DumzkqwwztkK2QUbiv0h98DLopS4dVuGEdzKPs2Kdm
	V0qA==
X-Gm-Message-State: APjAAAXsXtdJgKLRKJTu9Opbsz//3HjFOrnGerFZJ+rYW/0/dhfTlRab
	YVXo2pie+JU2gLDYEOJrBFpRBCmJ
X-Google-Smtp-Source: APXvYqzGqgyccha2mDE1/EYjT7RQIEPZ+moGOVapK+zYS8d2KyommJbsQf/Ya3rqLR0o8HssZmU6Ig==
X-Received: by 2002:a63:d041:: with SMTP id s1mr115552543pgi.363.1578364499157;
	Mon, 06 Jan 2020 18:34:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.58
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:26 -0800
Message-Id: <ad2622b515f30e88977720e60c343cef126575cc.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 21/28] podfix: only alter normal files
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:58 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23d38b2ad6f7a39e5c1ffd092322942474935c33)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/podfix.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/podfix.bbclass b/meta/classes/podfix.bbclass
index 54fff6a0a2..cc8210a27e 100644
--- a/meta/classes/podfix.bbclass
+++ b/meta/classes/podfix.bbclass
@@ -16,6 +16,9 @@ python pod_strip_version() {
     for root, dirs, files in os.walk(d.expand("${D}${mandir}")):
         for filename in files:
             filename = os.path.join(root, filename)
+            if not os.path.isfile(filename):
+                continue
+
             with opener(filename, "rb") as manfile:
                 manpage = manfile.read()
                 m = bad_re.search(manpage)
-- 
2.17.1


