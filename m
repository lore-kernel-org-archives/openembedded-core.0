Return-Path: <scerveau@connected-labs.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2429060889
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 14:19:00 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u56so8175287wes.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 07:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=Il8XEKu/vwI1uFxzWzd3FB8H6JmuZEvHzx9iQhnG80Y=;
	b=b94Gm1LnvjjrjCrPQXrmzqcQfmLb/UdCb2mJjkX+Em+wtYAH3EulzpFPhbD1CdcHwh
	ZGG8l4z9mwZGRAp/UlQ97H9Jy8TLUc+41/A7F2F0MvT2pNl6EvGyU47j1xVv5Md5MTpg
	pviYRKt0JMi9meltdNM4uIHJyiv3s7HB3MwQWqsCSGwzr6jCtHK4MvYUwRjihypaeyd4
	HzsRXrPXkKxC3fQUMYy0F+CNrSxswKjBS8cSO6iaBbuZ4D1/K7UURSvBiaKEASyzUQy4
	C3ihNyoanWuV2NIGQ8NuuBkDNQvF/7SjWxUKjcQ2xThImxkLmvk8FIgUk8BO3MaWG1uH
	eVuA==
X-Gm-Message-State: ALoCoQnqcTOpHttr+EWRjN9PTbDtgF/oTFfxx2wm3wU5T6JD2Pzk0auU3QoNI1itvgQdA7k6wqgE
X-Received: by 10.194.221.6 with SMTP id qa6mr44154052wjc.39.1404137940791;
	Mon, 30 Jun 2014 07:19:00 -0700 (PDT)
Received: from maupiti.mpl.mstarsemi.fr
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id
	pq9sm41616841wjc.35.2014.06.30.07.18.59 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 30 Jun 2014 07:19:00 -0700 (PDT)
From: =?UTF-8?q?St=C3=A9phane=20Cerveau?= <scerveau@connected-labs.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jun 2014 16:18:44 +0200
Message-Id: <1404137924-14085-1-git-send-email-scerveau@connected-labs.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [dora][PATCH] e2fsprogs: Fix populate-extfs.sh
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
X-List-Received-Date: Mon, 30 Jun 2014 14:19:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the use of command dirname on ubuntu 12.04.
dirname does not accept space in file name.

Signed-off-by: Stéphane Cerveau <scerveau@connected-labs.com>
---
 .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
index 26a8d89..47f5b5b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
@@ -28,7 +28,7 @@ DEBUGFS="debugfs"
 		[ ! -z "$DIR" ] || continue
 		[ ! -z "$TGT" ] || continue
 
-                DIR="$(dirname $DIR)"
+                DIR="$(dirname "$DIR")"
 
 		if [ "$DIR" != "$CWD" ]; then
 			echo "cd $DIR"
-- 
1.7.9.5


