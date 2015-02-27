Return-Path: <michael.g.wood@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0AE73751
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 12:15:23 +0000 (UTC)
Received: by wghl2 with SMTP id l2so19976699wgh.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 04:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cZwf9IWH87rLYhkQdkqktZJ1vxj2FpRSiiqRba7GWWw=;
	b=AF2r1Nm6qRtBVOIze9Fw0kQylX81+4qMjbiqS8FFLW8f7fn5bpU6umtvBD8AC5fYKG
	yJLZ5F6UKzEBFZETFWAc6CCuvJUNmnBdRGG8autUfrtsxnmfjf6bAb6QEAEPTP9DabHi
	yj180JOl/MwkUQ7hp4HbdcwT9wQ8VRc8xbXKaBQ8JFdzZSYyD1YcGrI+lKtEIpx7Vh65
	PJJjSm+1jS7KHmihhB40Gkp9DGnMhi5AsRx2UveQ19Pem6TNkfi2vBzSpZoo4LIQ05to
	3W2GexKwqWr197X33j33g+/MK3z5TF2u7CjNIALdwF5cInu4opd4LXX4ioTLGTSOJou0
	58Fw==
X-Gm-Message-State: ALoCoQksgGbJP8euVR/0P35z7kdwvcWANPFgo44ZLqxHgTs1ku5Hdc5/B7fC+NibQVQPtvZvAKo6
X-Received: by 10.180.91.47 with SMTP id cb15mr5830463wib.39.1425039323364;
	Fri, 27 Feb 2015 04:15:23 -0800 (PST)
Received: from draco.icx.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id v9sm1862732wib.0.2015.02.27.04.15.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Feb 2015 04:15:22 -0800 (PST)
From: Michael Wood <michael.g.wood@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 12:15:19 +0000
Message-Id: <1425039319-20503-1-git-send-email-michael.g.wood@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1425037674-19569-1-git-send-email-michael.g.wood@intel.com>
References: <1425037674-19569-1-git-send-email-michael.g.wood@intel.com>
Subject: [PATCH] report-error: Update information on the submission process
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
X-List-Received-Date: Fri, 27 Feb 2015 12:15:24 -0000

The new send-error-report will prompt for review of items and the server is
now specified by using the -s argument.

Signed-off-by: Michael Wood <michael.g.wood@intel.com>
---
 meta/classes/report-error.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 5f155e3..9edf2ce 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -66,8 +66,8 @@ python errorreport_handler () {
             if(len(failures) > 0):
                 filename = "error_report_" + e.data.getVar("BUILDNAME")+".txt"
                 datafile = errorreport_savedata(e, jsondata, filename)
-                bb.note("The errors for this build are stored in %s\nYou can send the errors to an upstream server by running:\n  send-error-report %s [server]" % (datafile, datafile))
-                bb.note("The contents of these logs will be posted in public if you use the above command with the default server. If you need to do so, please ensure you remove any identifying or proprietary information before sending.")
+                bb.note("The errors for this build are stored in %s\nYou can send the errors to a reports server by running:\n  send-error-report %s [-s server]" % (datafile, datafile))
+                bb.note("The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.")
 }
 
 addhandler errorreport_handler
-- 
2.1.0


