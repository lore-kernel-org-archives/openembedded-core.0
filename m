Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B9D947C29B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:36:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43qJCq3bYlz4x
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:36:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548840999;
	bh=SW4x9L6pgymY4neOmelvb5g9XpfAfx2U2x0oV/FYD2A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=I/ZSmCX5MvjZZ7YKoyC3ES3WTr7n0NXTzlYaero7um74vDT/gqcpyrR0U55+0m/Cj
	7WR73i1lF68Oe9etze2CcBlazLwOP2m6chyVdNFf35F9QrI3mCWLhfKbxHSYXGWBKq
	NwaPjRxxPxxi1R7fDTGvk7MFQhMcWVC5eTx9ysgD7lFJaCmiBsWGAl12F/hjN34qOY
	KFpTlR8aTfSps3oMqRTu0GM7z4NyQf3v9QezV9WMYRqN9q47RgpoALDx4ICgWKwEE9
	hMPD1TqL8IUprwKVwUiwilKT23D14x6dZze9hz+eaMPE8UaRPqKvZy59FNlOMKyRj2
	AbVIMaABx8X5dSmA5mFockhnGoBsNUCLe59JFwx46QGMggU7ewZjXg+zPRXEAp+au8
	opSiDxcTENJLrdRxYvcRYMYTgAbzEkgZKhk1e05ZpgI+Okc/3dTtlbxIypbtN/cPjV
	x0SaC4i4i7hzHHbI6zya5lq+BgHr31IvJDCzH6WT4i5JLYD6iim1K6/qeNifqE2yWd
	QyMmvVFJD01E+T+tzWEdwA4MXuIdiHa3tHn/KVn2L+iT1B0cwhGzz267rPAWPXUfLn
	hZlOdJG705taMa7qnOL23E6nUdUvCo00DrPaKPCHxyFTXNwIQnbeokpf0C7aTjedvV
	PFZaiid/8u4xv5q0WBqTzmuo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:36:38 +0200
Message-Id: <20190130093638.10612-2-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190130093638.10612-1-bunk@stusta.de>
References: <20190130093638.10612-1-bunk@stusta.de>
MIME-Version: 1.0
Subject: [PATCH 2/2] ref-system-requirements.xml: Sync list of supported distributions from poky.conf
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
X-List-Received-Date: Wed, 30 Jan 2019 09:36:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 documentation/ref-manual/ref-system-requirements.xml | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 500b2f8f39..f2450ab58a 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -97,16 +97,18 @@
                 <listitem><para>Ubuntu 15.04</para></listitem>
                 <listitem><para>Ubuntu 15.10</para></listitem> -->
                 <listitem><para>Ubuntu 16.04 (LTS)</para></listitem>
-                <listitem><para>Ubuntu 16.10</para></listitem>
-                <listitem><para>Ubuntu 17.04</para></listitem>
+<!--            <listitem><para>Ubuntu 16.10</para></listitem>
+                <listitem><para>Ubuntu 17.04</para></listitem> -->
+                <listitem><para>Ubuntu 18.04 (LTS)</para></listitem>
 <!--            <listitem><para>Fedora 16 (Verne)</para></listitem>
                 <listitem><para>Fedora 17 (Spherical)</para></listitem>
                 <listitem><para>Fedora 19 (Schrödinger's Cat)</para></listitem>
                 <listitem><para>Fedora release 20 (Heisenbug)</para></listitem>
                 <listitem><para>Fedora release 22</para></listitem>
                 <listitem><para>Fedora release 23</para></listitem>
-                <listitem><para>Fedora release 24</para></listitem> -->
-                <listitem><para>Fedora release 26</para></listitem>
+                <listitem><para>Fedora release 24</para></listitem>
+                <listitem><para>Fedora release 26</para></listitem> -->
+                <listitem><para>Fedora release 28</para></listitem>
 <!--            <listitem><para>CentOS release 5.6 (Final)</para></listitem>
                 <listitem><para>CentOS release 5.7 (Final)</para></listitem>
                 <listitem><para>CentOS release 5.8 (Final)</para></listitem>
@@ -128,9 +130,10 @@
                 <listitem><para>openSUSE 12.2</para></listitem>
                 <listitem><para>openSUSE 12.3</para></listitem>
                 <listitem><para>openSUSE 13.1</para></listitem>
-                <listitem><para>openSUSE 13.2</para></listitem> -->
+                <listitem><para>openSUSE 13.2</para></listitem>
                 <listitem><para>openSUSE 42.1</para></listitem>
-                <listitem><para>openSUSE 42.2</para></listitem>
+                <listitem><para>openSUSE 42.2</para></listitem> -->
+                <listitem><para>openSUSE 42.3</para></listitem>
             </itemizedlist>
         </para>
 
-- 
2.11.0


