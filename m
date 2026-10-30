Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18314.1793384586225537324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 11:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=pAkgV1hw;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=tyBmvphO;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 90BA214001AF
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:23:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 30 Oct 2026 14:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793384585;
	 x=1793470985; bh=QHQlvAUlrpENwPNpVzuKdJLghqigtexaARokWR9NwtE=; b=
	pAkgV1hwt8PQJzEeOo55iBhFnfXTNo4fAzonx++PJ3s0SJX9GD7+4WPpEEcRvLvX
	uUHuaeHBjnAPPDlgtX1sn359jaqzFQzT0Tb+Hh5+8avn5JWDmgcwpMudq+rWYprl
	rG3hK9aZjoyIMEtZbankELK1OUhpZmlkgCq/YQt7KwJxMr41FNi+w/5P4PZsDs1T
	L58Ego/H5MdYw58Clz7g3Vhq5wQQLg97o+6Sm9zTR4ZjKYjwYTtfsSEUUaxZ5Cbq
	ny9MkZojJbWeTqVZ+AliB1khXAZ2gvhBRdw5sxXT/0SeFZ0tuxLE6xwCsV64yPeC
	KrRO6kJc41SV0Leq13Sf2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793384585; x=
	1793470985; bh=QHQlvAUlrpENwPNpVzuKdJLghqigtexaARokWR9NwtE=; b=t
	yBmvphOK2IQX/5/mSRamEB0PAghyEyVE1cKMncj8swaMGJH48YrqCDNy5twbDdQF
	6MBYPOinlBU4DoMuBwnwHiJbNMhvEbuZaqxgoxGqA7geQ8lbxz6RpzRGfwMujYUP
	qrlqtzwQBUtrVd2zTiAJCID5TAQpjuc/VGvec/o/3uAbgoKbQf7qAesVcxd5L2bC
	nd3Pmgmti1HGgWQdY/91S5caZHJr8QpsaosNND4u5AaqNTTc30XE2O86bQ/Z9hXs
	fWesR8ezP2xPv3aW/BebWK40mnvp/fMv/TQo0wfG3hnXb3yCnCaFxvsyNSXNlUP+
	G8rvjc4GQwGvrDc7/s5iQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793384585; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:f3EX7YMWVCMSh30I8nKAh78X7kvtaFKX/4dJlExfXJjt/UM
	DmgWswvv9Qw1uXCJSlCp0Wx5KEmzolK0RRY9uLZtLyg6iPOSkeXY/2jMPB6ILWiT
	Gu/bTz1P8UVBR8iCvfKbnsyWo6jJqSXD0S/dbBQKdjksMBjrBlkrHoj7UCtkJVzk
	dN1278HQeqjuo7S1UHMZ3PrAVaqShsNISHvp2oOWria/CYoQDIJu9X+tCeWqTaDj
	KGnRzra2n/4oU8VGTvX3Y/FSv4qpjQQde4flI/zxpKxQml9TIm+t08H5hJo+NYCF
	z7Ox8jJvgXu336/AZrYMeoh7RcZkbwmNTIbhgjQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:yiiWm31qP9tYzACp8RB/lcIzOGT01a43HNNDPvyvJec=:saOgvBd40xKqvlgaYxO1mSuovGKs5cpa5P3ap2JH7yg=;
X-ME-Sender: <xms:ieDkar4cGjJWq1pSQkTP1omHau9S5RJTn4cfMHcjPCjxACkmKHpsaA>
    <xme:ieDkam6QrOYXNg9Sc8qWWkHHoXz9V3649vS7ybq1vrPyELNeTTwrrAGGLySGsn4Gw
    nAFGq5UNgTqXPM9dbCAkzbBCVPAJp2uEZ4x8OznItWzSdyckIazrw80>
X-ME-Received: <xmr:ieDkagFJ7f4MkX9dHBbDYT3GUZHTbfQmSvHFdq-bY5cLbfGo9pndoI_KL3EBjgUCVCn488oDLirQWIVeQa48mLbXgE6tiJs>
X-ME-Proxy-Cause: dmFkZTE82P92HZkC+ZomUHxemSV8RkNuGwYsZL2mbexosF0T7TBU9rApGbwo0b/68f/O19
    vATzYUr3Fo+kkppN5zngdozwXkckfNgwKLOBa9S4aRvvYTHxpozQdT9y9qQ3fn1CBWNH3P
    XUExcsB2Sz3P1eGEsfF22/J0fyVkW5BeB62Vni8KlZi2EMoxPbPXKSJsLhVYHj3ULJgLl9
    XFirCZdHEQc43ptyAbOayYpSFIZOPxg2HSODz4nbCpTbdJGZfV9NXbnjo9Ugflq94hh6KT
    MJT4DQCsG2hNuXb7kIsKU58IYWFy1DFB07MUttVFlPXBFcVbbNYgc7yAlefskUMNMMZ0oF
    PQBOaj+f9XOWoitzsdXosbLgTzr3Xc+baMIdqp8mfKCOHBGhcKma6xEVvv2CLCpYZXhRmw
    sTPj1f9WkIg7XP1un85gnxwY9ZtDqTuJTGseUWKYw9nRDVa8ZcriJrfZb4a6MiX0WOo0Qc
    1gA2hy3edZ4fIGOhS9ug/tzTSXXTYKHdHfSyQrNtaDvaNQFQh+2heQqUA44ODdHlFQMdAF
    nkh7XqdNMgt+SjYglM+k9QIPSpFAFwSwKqiOxFDzqqvhWg4/wtXZ4z7njftDGjmkEK45NW
    O9iJs9iyujY+xtcGTly9mPtEYrOepDPxEt3oY8gcEMOvvcWgeWbPSI4J9omg
X-ME-Proxy: <xmx:ieDkanREZQ2NST9gRZmZh4838v9yS7b87jj4lK90lCDEQI0Loo5xxQ>
    <xmx:ieDkahvbVEzpWU6nImptF3eTM6c6eI7xxf0HlmOkhLFOr0kzDCYPaQ>
    <xmx:ieDkaux3d8FMV8A3Ztk0JXuSs4QEAUrsEu-nSIm5Y2R7eN54xZvqYQ>
    <xmx:ieDkaj7KwMY9X2LqhO8ZW114yObFrlTKuTqfGu4Va5Qc7Q7xODeETw>
    <xmx:ieDkaufM9V4Nfj_K18x4V99EMolV0YmviqT9eChTiLqU3VUItSx495pj>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 14:23:04 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 30 Oct 2026 18:22:59 +0000
Subject: [PATCH 4/4] oeqa: selftest: Use raw strings where required for
 regexes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-selftest-fixes-v1-4-1ba0fc952001@pbarker.dev>
References: <20261030-selftest-fixes-v1-0-1ba0fc952001@pbarker.dev>
In-Reply-To: <20261030-selftest-fixes-v1-0-1ba0fc952001@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1793384582; l=2406;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=saOgvBd40xKqvlgaYxO1mSuovGKs5cpa5P3ap2JH7yg=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAgbpgBhHroxBw8kfgbTi+30PYcXtvh9ujgEVnDGuJpCqcAAAAhAOKt22PwC/U8o5
 ttCuurg7vpiD8zTGbDYlzKfMaBQC1r
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 18:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249071

We need to use raw string literals to avoid misinterpretation of escape
sequences.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oeqa/selftest/cases/bblock.py       | 4 ++--
 meta/lib/oeqa/selftest/cases/buildhistory.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblock.py b/meta/lib/oeqa/selftest/cases/bblock.py
index cb99d32bb5d0..6ed1172f2e9b 100644
--- a/meta/lib/oeqa/selftest/cases/bblock.py
+++ b/meta/lib/oeqa/selftest/cases/bblock.py
@@ -35,7 +35,7 @@ class BBLock(OESelftestTestCase):
             for recipe in recipes:
                 for task in tasks:
                     find_in_contents = re.search(
-                        'SIGGEN_LOCKEDSIGS_.+\s\+=\s"%s:%s:.*"' % (recipe, task),
+                        r'SIGGEN_LOCKEDSIGS_.+\s\+=\s"%s:%s:.*"' % (recipe, task),
                         contents,
                     )
                     self.assertFalse(
@@ -62,7 +62,7 @@ class BBLock(OESelftestTestCase):
             if tasks:
                 for task in tasks:
                     find_in_contents = re.search(
-                        'SIGGEN_LOCKEDSIGS_.+\s\+=\s"%s:%s:.*"' % (recipe, task),
+                        r'SIGGEN_LOCKEDSIGS_.+\s\+=\s"%s:%s:.*"' % (recipe, task),
                         contents,
                     )
                     self.assertTrue(
diff --git a/meta/lib/oeqa/selftest/cases/buildhistory.py b/meta/lib/oeqa/selftest/cases/buildhistory.py
index 1edc60c72d0e..43bcc1bd3648 100644
--- a/meta/lib/oeqa/selftest/cases/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/buildhistory.py
@@ -55,7 +55,7 @@ class BuildhistoryTests(OESelftestTestCase):
 
     def test_buildhistory_buildtime_pr_backwards(self):
         target = 'xcursor-transparent-theme'
-        error = "ERROR:.*QA Issue: Package version for package %s went backwards which would break package feeds \(from .*-r1.* to .*-r0.*\)" % target
+        error = r"ERROR:.*QA Issue: Package version for package %s went backwards which would break package feeds \(from .*-r1.* to .*-r0.*\)" % target
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 

-- 
2.43.0

