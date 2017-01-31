Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id C6D6C73190
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:50:46 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id 203so215774776ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 04:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wdHYEvu0VMhSRHx8xDbyHmv/p9a+HP27Ogrz1CyBrd8=;
	b=H6bcxmw1xeF/ncOFU0jqVB7AJ6IXDtPS/8RuHX8/IH6Aiv3iFxk5lvSmafX74HoeET
	jPjbWmV8dhkOeR70g3gpE1V8SP9DuOlP/DaCot3243/v3SViLZ44kANs+53+7K7uFR3c
	lAWjVA3IpLuTUP+ENOex2LVZ41KmnfbV7vFYKpPgTTorsH1ZDFo/CLlE04/Fq5Es/25Q
	pC2Xo88YcfVvwNDsRfIwK1cbxtMb00RPIGgIhsvU3q+tDQFQtPOZ/LgcnC0Z0Cdzerg3
	9vM3xL0ZTGpOQJuRygbysrcSKj7rIGKE3hf6rPSoBu9FX5Ocex1SaOAjWFVvtrycny3D
	fuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wdHYEvu0VMhSRHx8xDbyHmv/p9a+HP27Ogrz1CyBrd8=;
	b=XjmjgXMc4HGmTFA7Ya9D/phS5mf1lT4bdaWO6qZESAx6UaG2w7KQPZZFWJL7btDzW/
	ZQsXMElspFaNlv+JO7gJAVjG7jcRQCGi/PLcSSA/P2qqMrgxz4JlxuCGOt0u51piO511
	NqpG+QGJN537EuTWe3zhk5HngOhSlH+srb23bR3nSAA2ml9JUnMimQIqj7BLM20idLKr
	4alIsgkUL94GYqyeAW4x0FwJCfFGwjqOGdPndpXwNXlKpZo9w8CQVYHQUVj0chF6OEBm
	BNVS9jZcz/zBrJ6VCzj9nraHlVrGYfWXLL3zr43JAvrlzsm/oLKvpolJ9OrLqAiFtPLW
	eVZA==
X-Gm-Message-State: AIkVDXJYLRpxl/EWrSZmGYoxQMrzPx41FZhMWJuxXmpjNr+XcOvqkXcnQnEI1BJszrJql6S/
X-Received: by 10.36.62.133 with SMTP id s127mr20311749its.110.1485867047035; 
	Tue, 31 Jan 2017 04:50:47 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DFEB.dip0.t-ipconnect.de.
	[93.232.223.235]) by smtp.gmail.com with ESMTPSA id
	l31sm10051399iod.17.2017.01.31.04.50.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 04:50:46 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 13:50:27 +0100
Message-Id: <907ea9c9bdc9bdababb561c42e1f5d1eab2c4217.1485867027.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
References: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/8] verify-bashisms: point out where to get checkbashisms.pl
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
X-List-Received-Date: Tue, 31 Jan 2017 12:50:47 -0000

The current SourceForge project seems to be unmaintained (last release
2.0.0.2 from 2015) while the copy used by Debian is quite active (last
commit 2016-09-30).

Ideally, checkbashisms.pl should get installed automatically via a
recipe, but for now at least provide the link for manual installation.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/verify-bashisms | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index 1bda60c..28795f4 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -68,7 +68,7 @@ def get_tinfoil():
 if __name__=='__main__':
     import shutil
     if shutil.which("checkbashisms.pl") is None:
-        print("Cannot find checkbashisms.pl on $PATH")
+        print("Cannot find checkbashisms.pl on $PATH, get it from https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.pl")
         sys.exit(1)
 
     tinfoil = get_tinfoil()
-- 
git-series 0.9.1

