Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 622E6719A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 05:53:29 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n85so6882304pfi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 22:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/D3xdaE4fu/tHhkiZDss+o7qiMH0nhEPOhNsoqeLHf8=;
	b=xOyDGGY4HHCSOipj/mgoUqaru0yWxP49gUKfK5OHTXmE/8tR26euxArNeEce1Jt8gr
	3oRbYN0sGxsiA/QXyIgA9X5khpw6xE+UWmGeeoBcDReiNi6wPn4LZUs4jBsU8zz28btk
	DzGvlRQIC93ccmfeW3vIPi2KvfoyGyl8KnXWuXLKbDXODhIlMZLL8padTIBzsmOK8oBx
	JPeYdWvC/GUcB7SMOnMCnIrU/zvvjHq56EvhoH8N5WmPRMnZfvzxzOXRDD7hpGGON0r2
	BJteqcSQ1Y2w4nPc6Y/j1rl12SHmriaQUw7CvKNQEeXsIQY+0aN9VDKSQn2JCCRUFvKI
	4bqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/D3xdaE4fu/tHhkiZDss+o7qiMH0nhEPOhNsoqeLHf8=;
	b=kPF5Qy8QZErE/61SdzZsD6V3y/KV4UZzK8w6iI+Llk+4yj3IeJhatiJ/mAnx3HKNw8
	QscaX3vDtWazfpfZaUyhiDxEJar5kZKUGO7VlJU1pWXnoKxKMr4IWPgxl76+MxbLp97H
	KehAjRTd7J5/Ac+RZTyzrA6eQAuzhfCUP2EdagvrpKq8F/U88NJkWcA2aVBCXkDedNNa
	y4PKNqUfyVm09341e3VaCJ67cC5uFyHf3hbIifZ9vzitfOLyX6BNt330d0j3s64tEdY1
	FxzVHD/K9nIIVpMeUj9K139rZH1yc07uGG87zTMdtfhZtZxRJ0d86mmyESS2xvmAsPlN
	7X4w==
X-Gm-Message-State: ABUngvfVH6qxTldlzH0kWMABE+f3JopKrherq8g+PHXTgIWrCktPEKLfaOGRsr5t2jqKPQ==
X-Received: by 10.99.178.89 with SMTP id t25mr19611395pgo.131.1478238811082;
	Thu, 03 Nov 2016 22:53:31 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:3d81:a694:3206:326e])
	by smtp.gmail.com with ESMTPSA id
	o185sm16857784pfb.24.2016.11.03.22.53.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 22:53:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 22:53:28 -0700
Message-Id: <1478238808-28688-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478238808-28688-1-git-send-email-akuster808@gmail.com>
References: <1478238808-28688-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] tzdata: update to 2016i
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
X-List-Received-Date: Fri, 04 Nov 2016 05:53:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

  Briefly: Cyprus split into two time zones on 2016-10-30, and Tonga
  reintroduces DST on 2016-11-06.

  Changes to future time stamps

    Pacific/Tongatapu begins DST on 2016-11-06 at 02:00, ending on
    2017-01-15 at 03:00.  Assume future observances in Tonga will be
    from the first Sunday in November through the third Sunday in
    January, like Fiji.  (Thanks to Pulu ʻAnau.)  Switch to numeric
    time zone abbreviations for this zone.

  Changes to past and future time stamps

    Northern Cyprus is now +03 year round, causing a split in Cyprus
    time zones starting 2016-10-30 at 04:00.  This creates a zone
    Asia/Famagusta.  (Thanks to Even Scharning and Matt Johnson.)

    Antarctica/Casey switched from +08 to +11 on 2016-10-22.
    (Thanks to Steffen Thorsen.)

  Changes to past time stamps

    Several corrections were made for pre-1975 time stamps in Italy.
    These affect Europe/Malta, Europe/Rome, Europe/San_Marino, and
    Europe/Vatican.

    First, the 1893-11-01 00:00 transition in Italy used the new UT
    offset (+01), not the old (+00:49:56).  (Thanks to Michael
    Deckers.)

    Second, rules for daylight saving in Italy were changed to agree
    with Italy's National Institute of Metrological Research (INRiM)
    except for 1944, as follows (thanks to Pierpaolo Bernardi, Brian
    Inglis, and Michael Deckers):

      The 1916-06-03 transition was at 24:00, not 00:00.

      The 1916-10-01, 1919-10-05, and 1920-09-19 transitions were at
      00:00, not 01:00.

      The 1917-09-30 and 1918-10-06 transitions were at 24:00, not
      01:00.

      The 1944-09-17 transition was at 03:00, not 01:00.  This
      particular change is taken from Italian law as INRiM's table,
      (which says 02:00) appears to have a typo here.  Also, keep the
      1944-04-03 transition for Europe/Rome, as Rome was controlled by
      Germany then.

      The 1967-1970 and 1972-1974 fallback transitions were at 01:00,
      not 00:00.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/{tzdata_2016h.bb => tzdata_2016i.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2016h.bb => tzdata_2016i.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2016h.bb b/meta/recipes-extended/tzdata/tzdata_2016i.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2016h.bb
rename to meta/recipes-extended/tzdata/tzdata_2016i.bb
index 00b0f5f..3801a3f 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016h.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016i.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "878f0ec3fd9e4026ea11dd1b649a315a"
-SRC_URI[tzdata.sha256sum] = "da1b74fc2dec2ce8b64948dafb0bfc2f923c830d421a7ae4d016226135697a64"
+SRC_URI[tzdata.md5sum] = "73912ecfa6a9a8048ddf2e719d9bc39d"
+SRC_URI[tzdata.sha256sum] = "b6966ec982ef64fe48cebec437096b4f57f4287519ed32dde59c86d3a1853845"
 
 inherit allarch
 
-- 
2.7.4


