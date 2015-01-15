Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9D76571144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 03:51:11 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id p6so10558633qcv.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 19:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=RD3ka8F2Gb1AOrvrmJm+2eub2y/fVh5FlS4s8fobZd0=;
	b=yU1DEI4Bc1l1KVULzEHMXx9yt2WmVwVkk7AGZjZrXAT5OQ0eqDVVCVZ1oQIbyPO1DY
	H1+fBZINGOa6mkpTLtnsEXnn0TW7M8MFdIFowPTESzxTp1q7wVMwRBlhKlJDzPR5D4GF
	cpv5VT06H2ByteXOoADSe7R+ZtNm01eZ2TCH/30QCTm2rFhXSLbWQ+1kPh7hq4Rxuczz
	PcbZ4TPu62tu6NEh2qVuv5H8/kzeHDQnoY0EZNDZ6JVxByF6J1Z8HAgHRZAzE/yvaZ9V
	+S7CryQlU0T4il2hm+ikJEV/pYwJs0myLoWvstbFp3BIYomV3y7WT6maKPCYbfePeDqS
	nOZQ==
MIME-Version: 1.0
X-Received: by 10.224.46.200 with SMTP id k8mr12730450qaf.89.1421293872714;
	Wed, 14 Jan 2015 19:51:12 -0800 (PST)
Received: by 10.96.35.34 with HTTP; Wed, 14 Jan 2015 19:51:12 -0800 (PST)
Date: Wed, 14 Jan 2015 21:51:12 -0600
Message-ID: <CACS+7ZQe+N6mWE8uPR2nmE8dcEtFjmzH8NfGfX_iVVgsp8y6eQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] dpkg: fix host contamination
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
X-List-Received-Date: Thu, 15 Jan 2015 03:51:12 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc
b/meta/recipes-devtools/dpkg/dpkg.inc
index c3c51eb..11d0eea 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -36,6 +36,8 @@ EXTRA_OECONF = "\
  --without-selinux \
  "

+EXTRA_OECONF_append_class-target = " TAR=tar"
+
 do_configure () {
     echo >> ${S}/m4/compiler.m4
     sed -i -e 's#PERL_LIBDIR=.*$#PERL_LIBDIR="${libdir}/perl"#' ${S}/configure
-- 
2.1.0

