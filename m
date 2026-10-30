Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18313.1793384585097682731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 11:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=RRdL/qTn;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=KISIxeaJ;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2C25914001BA
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:23:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 30 Oct 2026 14:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793384584;
	 x=1793470984; bh=wAsbLz8hYhEiqWbT7fBUdR0PY9hFeFNY6+Vf4Qtc3kM=; b=
	RRdL/qTncHKadQe0EIFn3Nr5Rkie1iNcgvWQum0JPGjd6Ni96etkW4V/lp0Cgnkd
	tpPWCRttB5/RhbTz9jcfWLKX63LOO4y/42lVM3++ZzKIvE+OL3rfPmoaNnFM9BxC
	820K7huoJSwsr5LZu3KWVrCCfClkQOPVI2DrXDIwu8OjMeokkqLVn0L5ex3hgpiw
	OpwjnNFFU3j20DR/N6g7IvWTJOZdfZt3EKqiJchB7eptPxul2+vnuBuiUIk6zByp
	rbesuDltyycrekSoe7EMBBmjt5qb98JQaqVFmNWzu8//eLBGMt4Ld2QsDHZT1hs+
	p28VFiT+kfeqfZxGH8wOcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793384584; x=
	1793470984; bh=wAsbLz8hYhEiqWbT7fBUdR0PY9hFeFNY6+Vf4Qtc3kM=; b=K
	ISIxeaJoXR0+hKE8Saq/gK/SGmd0FOiPp/IxDsxYGX0TUG8KXRplO/ZK/Ko86uoA
	mtyqdc0IYSH3vldk0lSq7hFRxxEOt12+rMaOtSzkhYCVVh9NjibJ2svfOYAozlGX
	XQTes149mM25e/zpO/jZeZv+2flGfU5V+k3lPgU3evCWXp2Onz4jw9XOjuriqcFT
	CxYgWy4XFn5f/hKgcEpOtWghMPqysyGwHuHL2WYjvNzh9tKpNFVNBhO/K/Pjx3YW
	vhrVA3aAWR5nEiTuvMJN8xtrcivV/gjoEJItsBDj6sVKGsY/ji9ZzkWiqByDi9IH
	ArVJ+FsHBMlIhH9DBa1AA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793384584; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:YXXXtDDvXso+su9UblEu3IEP+4+SC1AZ61eZQqEKdph+1KM
	9NuFCdWN6a5tWFO/Ngm1Xusseb/PhQA6M/lycurgRaOcWw1It2hlB7VjikD48Ghz
	6jfVHU25dRzli8ENKLQYyDbHQfe2SNhCP8e7kf+Zz8fyZ6QISwyzpWyfHgPyjY6/
	dmxdLdlwXuBcRXuiXigSC0J34SAACo0H/XCehapp/r4XO5i1FIgUfFjzzB0qTR9z
	6e3I1doDP8IEJr8rEDc6istYJz84+qRz7+RqKxaqewnD1A5fKI5Pnz+J7BS7SHCW
	mntQ6eA9ICpVkcRMwZUGfOFUPg/OvRRZ5Xxqwig==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:U+eOTSAhs09p9zLqcx9ZE68neGlCIC37V6SEHfpN6HM=:u9U8UKoT59jxCCdO0pvSfp+rbgk3K6PD4cHd2olt8xA=;
X-ME-Sender: <xms:iODkaqxhc-CdzvaLqpT8CFM1tQCekkn2k-4ytCt8BkEH-rEzPOJ2rg>
    <xme:iODkasS9BEYnxqGyPMyq0dcoc9Mra1zlwb1NM94DtDhoSMlEi6v1s2mQTAIymk6kx
    tda4G6NGfcT0iISujuvsEUBC2SdHwRNiJekjovjSl_go_SHKWKlIQc>
X-ME-Received: <xmr:iODkap_aey-739PdmzbDf79jJ_zJpCXHtROWIKfBofUpYacKqNK4LXHA0l2AGOf1Oa-jos1_PF0BVhqzGRWYb37oMhTnisk>
X-ME-Proxy-Cause: dmFkZTFVH/rizmXRJOEmsrCbV5KeyvxyhMeIsVZB4IMKtDwPVJOtwdV9R4B8/lQbJ6qDSk
    Or2J3H9+NC71SSlXMp6PcrLC0b27Zj+bNJFPaHbV48NI4WQ09oT+MjFt+znFjgM//nPu5A
    A5uq0EqN9RxmbEUVklWFB5XoLJj5kA4OipeoslAJ17eKAsbn5zVjPSbeKvDT10lvz0olCR
    I5aqt6LR+SMlszCf/xpT3D2OeHqqtscL8i8bhHIzq036LtaXZuBVTuojW1Ko/9plqMOFjv
    YBEVDFpmp3ialN2mSZu8uUpi4YmnVL3pw6Ythbb+YXtNrlFR17orMYEUGLzUnnwKDx5vZC
    fMReDJv7FjrTNRYqxHMG6wl6TyGdYAcS6hBcOVCGL0Yysuf4OKM+iBc/25m20lLh/z1uYq
    gxtHm6ovQ0BK9Fw04rAJTeIvpu1v0/c461KBjVoFaajivTaVO3Ya0hHzYu3J2XnmL7tu7w
    EnE4XcjBmD1hxg/QjigT/gkv8jY43jLY+MoLhXnWjkgQlBvbuPWhnYc+bUyBnVPrmku4ju
    /Guwwla/WWM0QCmF8UdnrEoOokLrY38oN4+vc0JOx0dfyf+yqbAZcZQ6oDjrx1lM3sEU4+
    LezLyFdt89MO9dxHkhr6QSNxokoDxm3lEQQZ7NCRdfRLJeCkCibw2I8RQxrQ
X-ME-Proxy: <xmx:iODkaro4lRKtqETIHC8cVpH337wUvYC-ZybDHTRyhkkPqolYypu5BQ>
    <xmx:iODkaunAvnuckYu-YbJ2yS8p5mbdKohnQp_4Q005ZZhBLlfofqvD0Q>
    <xmx:iODkaqJk7ZPZbvLQDi02T2cnIi3ph1Frf0nhUbuX7GWc4b4sAxKeRw>
    <xmx:iODkarwXamE4Yuq54xlpMQnELQvvg9Z7K1mp9d9DzcsFAaeakk8pfw>
    <xmx:iODkarWx_NRzTfH1WSWmq98APQhKgjZWDboDas-pEf3KJnsI5ceyJu2U>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 14:23:03 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 30 Oct 2026 18:22:57 +0000
Subject: [PATCH 2/4] oeqa: selftest: signing: Use supported method to set
 auto-expand-secmem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-selftest-fixes-v1-2-1ba0fc952001@pbarker.dev>
References: <20261030-selftest-fixes-v1-0-1ba0fc952001@pbarker.dev>
In-Reply-To: <20261030-selftest-fixes-v1-0-1ba0fc952001@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1793384581; l=1436;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=u9U8UKoT59jxCCdO0pvSfp+rbgk3K6PD4cHd2olt8xA=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAgJJ7VCZ33EMoQ+We+50drpJ9V6IR3D6PsHHrU2DIHqLIAAAAhAMQGIrcOzrK0Y2
 UftELctRVRlJ6mqU40TtcPM37/jUTt
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 18:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249069

Using a `|` character with `gpg --agent-program` to specify arguments
for the gpg-agent process is not officially supported. The docs describe
it as "a regression test suite hack" [1].

As we are already placing the gpg homedir in a temporary directory, we
can instead create a gpg-agent.conf file to specify this option.

[1]: https://www.gnupg.org/documentation/manuals/gnupg24/gpg.1.html

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oeqa/selftest/cases/signing.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 0471ddfd7e92..6269536d1d61 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -33,7 +33,10 @@ class Signing(OESelftestTestCase):
 
         nsysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native")
 
-        runCmd('gpg --agent-program=`which gpg-agent`\|--auto-expand-secmem --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path), native_sysroot=nsysroot)
+        with open(os.path.join(self.gpg_dir, "gpg-agent.conf"), "w") as f:
+            f.write("auto-expand-secmem\n")
+
+        runCmd('gpg --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path), native_sysroot=nsysroot)
         return nsysroot
 
 

-- 
2.43.0

