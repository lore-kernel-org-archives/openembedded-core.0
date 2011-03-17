Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0FtW-000225-Eo
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:17:50 +0100
Received: by gxk3 with SMTP id 3so457347gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=+QQ3x6EXoUhKBzNZFzmYqBIJACtbFEHsTt2LwcEPHhU=;
	b=QLxWqPiINkWAkQr4V1XYNzkz4mG4ymGOqmuhUFwlHXgt7wNst9/eX2MIXwyH6tXfVW
	BoFcOoEuBAWFMj8ig1Doaia1olHPFCz1wose9NedsxqmWsyOLprggxLy+J00lmhjvZwZ
	NN/kahoCl4n1Any2cnvs0glU2pysDJUBXcHrI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vZCrsSo3eaoTNLxw3ohhl7jkhP7B3qgzci0U1tgsBo8/2SPbWgAqGydlV/tw+/XDJo
	mu9l85ntCxPK5mk32hHt8VZ7gS0RGtpNFIumGtlCDTQcRduIStfD6ILZwvWELxKVuTAj
	qm8suATb14QK3sgpG7e56HLyQCngPPdP9AC1s=
Received: by 10.150.73.8 with SMTP id v8mr22725yba.259.1300378565261;
	Thu, 17 Mar 2011 09:16:05 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id q29sm67146yba.2.2011.03.17.09.16.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:16:04 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:15:55 -0700
Message-Id: <44b4179f5b66a52fe5d45672525f60d81ba4c20b.1300378309.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378309.git.chris_larson@mentor.com>
References: <cover.1300378309.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378309.git.chris_larson@mentor.com>
References: <cover.1300378309.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/4] poky-init-build-env: unbork for zsh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2011 16:17:50 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 poky-init-build-env |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/poky-init-build-env b/poky-init-build-env
index 82590f2..3c8aa53 100755
--- a/poky-init-build-env
+++ b/poky-init-build-env
@@ -25,7 +25,7 @@
 # being sourced.   To workaround the shell limitation use "set arg1" prior 
 # to sourcing this script.
 #
-if [ "x$0" = "x./poky-init-build-env" ]; then
+if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./poky-init-build-env" ]; then
    echo "Error: This script needs to be sourced. Please run as '. ./poky-init-build-env'"
 else
    if [ -n "$BASH_SOURCE" ]; then
-- 
1.7.2.3



