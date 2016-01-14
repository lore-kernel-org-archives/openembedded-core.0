Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1105B731EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:47:08 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yy13so28685093pab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=53LcD5OjF1g0D0Hi9Bnu31kpHHcHUIaDyWVV1yZ4wDg=;
	b=wOo1QeGU7oBXGs4YiZwUjbYDyPrvpUuLAjbumm4nASN3S2qy18R4TzyU7/FpRAuQyY
	rpFQCLpVtqhMTW6LwgIQHT4ZTszKuGjUSDCo03gdIB4cvEUEDhaq7Wz6fFyO3Ntfbx/O
	WHZS1/pLf16lgEamnGQ1/vz6ocSO7teLxUVIbRXWNQF/hL7EjzDsUlEhpjXvGQBsBxU4
	6qMBKFoEcD5S8rY+e+E5HeNCSEqGnORGJrNmiwAbMTDBKzWOJdZfzWEIn4xvemjFYb2B
	mZf968Jk4EmByYHv4KzeTBsozI1jPpIV+Lcc+8QqjI/7Cq9JYRCK3FSir4x+i20+CsiM
	uMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=53LcD5OjF1g0D0Hi9Bnu31kpHHcHUIaDyWVV1yZ4wDg=;
	b=Jp3R9oYdXTHFaHpSTCePRm64opgwDRgUDOiVVw0vX86RTpc9oGu3uU/I7nH5eVcsNf
	PksgXzttibWXFN2z0L8nBL0H9yjoA2bHx+XIwuzqLT+7qKlgwuvrQiuJvrsdmDo8P5wH
	TWSzvkrHmFS9hLnuGz/DnjZgd0B9CT6kThnomUEBCE3V4TP/NCFXT93Ox9Ne7d6RtoPY
	Kxup8hWl2ZWnUYBFNy9Jd11NqEcr7KMGW+5owDdk0tyiEQTlb/BMsMrXypSVb9ymz+34
	fXTGyPuD56dEj+ZEg6wlCYPd7uVtVo6+NXGo9Mw5gVjjavLJHMABw54PACQ/uwvi4NFT
	IqRA==
X-Gm-Message-State: ALoCoQkUBnS2upiZvN5g0D8ZjJTnDHZGIYhcgP700UCT+MqcF9NKBdHIm5fby891Wp4xA67tmOQ8Eep9OPXm2bn/CpBJ6DaZjA==
X-Received: by 10.66.161.133 with SMTP id xs5mr9188071pab.70.1452804429927;
	Thu, 14 Jan 2016 12:47:09 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by smtp.gmail.com with ESMTPSA id
	f21sm11290704pfd.6.2016.01.14.12.47.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jan 2016 12:47:09 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:47:04 -0600
Message-Id: <1452804424-17632-3-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1452804424-17632-1-git-send-email-danismostlikely@gmail.com>
References: <1452804424-17632-1-git-send-email-danismostlikely@gmail.com>
Subject: [PATCH 2/2] opkg-utils: store alternatives in nonarch_libdir
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
X-List-Received-Date: Thu, 14 Jan 2016 20:47:10 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

opkg-utils-native stores alternative info in /usr/lib, so do the
same on the target.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index b242d1f..1bc561c 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -34,7 +34,7 @@ do_install() {
 
 do_install_append_class-target() {
 	if [ -e "${D}${bindir}/update-alternatives" ]; then
-		sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${libdir},g'
+		sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${nonarch_libdir},g'
 	fi
 }
 
-- 
2.7.0


