Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DC7E8FDB1
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 12:48:22 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42554.1767012493370083368
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 04:48:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HUt1dijI;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c718c5481so8737942a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 04:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1767012492; x=1767617292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEyZYh56qqexCk3GO0ntFa8h/vAxjF6JY7y2KAq8LbE=;
        b=HUt1dijIxpVLNjU6CVAV1Cl0qzrvvSezcx9dtgUAW9okywhBTrpOLCCwbuR1eWjdL3
         LRqszkssOMh9KZwZ3EFacGOI4YozlRPScluoecw5LiCPLPmCYOhIVoYqKWnLMtxwa6PD
         tHClKPPYNYrJOFZcVvU7MpO70aoxjuZmRfDb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012492; x=1767617292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kEyZYh56qqexCk3GO0ntFa8h/vAxjF6JY7y2KAq8LbE=;
        b=MT6Eqm/JzGMP+tIk09drQf4/VLMGT3+C0MzoRRDIhRVAxVMNOkHkzx5+uHzDWQ+HxZ
         8322mgjfvqeICXlMaPSXg6v687GrKVK9QNgvTGYaoWQHNc7MQL5SXF/eXtfvmT/fMhuy
         PWSa9N1a+5crGF7efyw/RVXuvtHWSgqhocigJOm/kUO2CFjM09IhHEdwFuUWgAi27iB7
         mpSRj7XD3m6x8v5DdHuAphkINbVPP3ssOmmG5DDiAfYC6Bf3Zxw7wvyCXXnZRAS781zj
         U+cZse6I3bKO7VJiLzwVaHWCa5QDdYxX9oMdVwswWmYLraroLaAn0YJlPA/+p37gWW4+
         jB9A==
X-Gm-Message-State: AOJu0YzGXUq3E4Y8JFvAiOYGsrFgZCGDsUYji2/seP1w61kchZYJMl1u
	ULcFuWGgcZFeC9qTblClqU5+gAyxJ3dCka5Yc9AxJXGt8TDJ0Bdw/VpX2ddI99pbdUYn7L9OvlW
	EIJnieaw=
X-Gm-Gg: AY/fxX7abD0esc656Qv9RvZT47jPThsySiu4w7z2jl6LbrcYCf/NBX3INJ96xmv7dzT
	XoV/cBHbcVXMwMoE2UpvEG23jRmtO5ht9Cn14sOaWhw/EjAtNHWZT/9YpP22aJ2mdBDa+8roWK3
	tnkPjZ5GrGhTvSX8teTvLzH3Af03Kzl1UiEIqW3M73Jv+hsLk9p3aF1t5o7uPPgPjTb1edpY4PA
	+7k2/GRbOa+goR3UFbZUXrol0ACnc1W2xG1AYG3g0Pju5T3HHLTf7Eix1Or//OAfWim+sHzEMoy
	J4ZSRLDHkJNRid9+uZ/ojOhqP+jgwNj6/cS9ZiQmF8uyAVIDMRs28ICCJkXFj8JZfPGnd2FqwsS
	efU63jS76sH5O9y01fEF6+zg1LnJqkSuK+wPxt2XahV9pVf3pX05Vwg+QMgxC5fK+Gqmq9B5p5o
	zEtI5NRBy6Q3uXURSvvWWNmUkt
X-Google-Smtp-Source: AGHT+IFNSkgjRGUF+oaCtQSRRoGVGX2H81FfqMLbxn1lJ+otvs6wpZbooznH0NQEvXgo2l3/P3L/rg==
X-Received: by 2002:a17:90a:c888:b0:340:ac7c:6387 with SMTP id 98e67ed59e1d1-34e92137b4amr26752166a91.7.1767012492164;
        Mon, 29 Dec 2025 04:48:12 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:54:6779:8047:e5eb:447c:8ecc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b1666sm27431208a91.7.2025.12.29.04.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 04:48:11 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/3] go: Fix CVE-2025-61727
Date: Mon, 29 Dec 2025 18:17:54 +0530
Message-Id: <20251229124755.462274-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251229124755.462274-1-vanusuri@mvista.com>
References: <20251229124755.462274-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 12:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228603

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/04db77a423cac75bb82cc9a6859991ae9c016344

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2025-61727.patch           | 229 ++++++++++++++++++
 2 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-61727.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 1433d54f06..0ea3b6704f 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -75,6 +75,7 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2025-61723.patch \
            file://CVE-2025-61724.patch \
            file://CVE-2023-39323.patch \
+           file://CVE-2025-61727.patch \
            "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2025-61727.patch b/meta/recipes-devtools/go/go-1.18/CVE-2025-61727.patch
new file mode 100644
index 0000000000..23dc35b8b8
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2025-61727.patch
@@ -0,0 +1,229 @@
+From 04db77a423cac75bb82cc9a6859991ae9c016344 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 24 Nov 2025 08:46:08 -0800
+Subject: [PATCH] [release-branch.go1.24] crypto/x509: excluded subdomain
+ constraints preclude wildcard SANs
+
+When evaluating name constraints in a certificate chain, the presence of
+an excluded subdomain constraint (e.g., excluding "test.example.com")
+should preclude the use of a wildcard SAN (e.g., "*.example.com").
+
+Fixes #76442
+Fixes #76463
+Fixes CVE-2025-61727
+
+Change-Id: I42a0da010cb36d2ec9d1239ae3f61cf25eb78bba
+Reviewed-on: https://go-review.googlesource.com/c/go/+/724401
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Daniel McCarney <daniel@binaryparadox.net>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/04db77a423cac75bb82cc9a6859991ae9c016344]
+CVE: CVE-2025-61727
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/crypto/x509/name_constraints_test.go | 34 ++++++++++++++++++++
+ src/crypto/x509/verify.go                | 40 +++++++++++++++---------
+ src/crypto/x509/verify_test.go           |  2 +-
+ 3 files changed, 60 insertions(+), 16 deletions(-)
+
+diff --git a/src/crypto/x509/name_constraints_test.go b/src/crypto/x509/name_constraints_test.go
+index c59a7dc..963bc5a 100644
+--- a/src/crypto/x509/name_constraints_test.go
++++ b/src/crypto/x509/name_constraints_test.go
+@@ -1595,6 +1595,40 @@ var nameConstraintsTests = []nameConstraintsTest{
+ 			cn:   "foo.bar",
+ 		},
+ 	},
++	// #87: subdomain excluded constraints preclude wildcard names
++	{
++		roots: []constraintsSpec{
++			{
++				bad: []string{"dns:foo.example.com"},
++			},
++		},
++		intermediates: [][]constraintsSpec{
++			{
++				{},
++			},
++		},
++		leaf: leafSpec{
++			sans: []string{"dns:*.example.com"},
++		},
++		expectedError: "\"*.example.com\" is excluded by constraint \"foo.example.com\"",
++	},
++	// #88: wildcard names are not matched by subdomain permitted constraints
++	{
++		roots: []constraintsSpec{
++			{
++				ok: []string{"dns:foo.example.com"},
++			},
++		},
++		intermediates: [][]constraintsSpec{
++			{
++				{},
++			},
++		},
++		leaf: leafSpec{
++			sans: []string{"dns:*.example.com"},
++		},
++		expectedError: "\"*.example.com\" is not permitted",
++	},
+ }
+ 
+ func makeConstraintsCACert(constraints constraintsSpec, name string, key *ecdsa.PrivateKey, parent *Certificate, parentKey *ecdsa.PrivateKey) (*Certificate, error) {
+diff --git a/src/crypto/x509/verify.go b/src/crypto/x509/verify.go
+index 99f38a0..88260ee 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -390,7 +390,7 @@ func domainToReverseLabels(domain string) (reverseLabels []string, ok bool) {
+ 	return reverseLabels, true
+ }
+ 
+-func matchEmailConstraint(mailbox rfc2821Mailbox, constraint string, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
++func matchEmailConstraint(mailbox rfc2821Mailbox, constraint string, excluded bool, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
+ 	// If the constraint contains an @, then it specifies an exact mailbox
+ 	// name.
+ 	if strings.Contains(constraint, "@") {
+@@ -403,10 +403,10 @@ func matchEmailConstraint(mailbox rfc2821Mailbox, constraint string, reversedDom
+ 
+ 	// Otherwise the constraint is like a DNS constraint of the domain part
+ 	// of the mailbox.
+-	return matchDomainConstraint(mailbox.domain, constraint, reversedDomainsCache, reversedConstraintsCache)
++	return matchDomainConstraint(mailbox.domain, constraint, excluded, reversedDomainsCache, reversedConstraintsCache)
+ }
+ 
+-func matchURIConstraint(uri *url.URL, constraint string, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
++func matchURIConstraint(uri *url.URL, constraint string, excluded bool, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
+ 	// From RFC 5280, Section 4.2.1.10:
+ 	// “a uniformResourceIdentifier that does not include an authority
+ 	// component with a host name specified as a fully qualified domain
+@@ -433,7 +433,7 @@ func matchURIConstraint(uri *url.URL, constraint string, reversedDomainsCache ma
+ 		return false, fmt.Errorf("URI with IP (%q) cannot be matched against constraints", uri.String())
+ 	}
+ 
+-	return matchDomainConstraint(host, constraint, reversedDomainsCache, reversedConstraintsCache)
++	return matchDomainConstraint(host, constraint, excluded, reversedDomainsCache, reversedConstraintsCache)
+ }
+ 
+ func matchIPConstraint(ip net.IP, constraint *net.IPNet) (bool, error) {
+@@ -450,7 +450,7 @@ func matchIPConstraint(ip net.IP, constraint *net.IPNet) (bool, error) {
+ 	return true, nil
+ }
+ 
+-func matchDomainConstraint(domain, constraint string, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
++func matchDomainConstraint(domain, constraint string, excluded bool, reversedDomainsCache map[string][]string, reversedConstraintsCache map[string][]string) (bool, error) {
+ 	// The meaning of zero length constraints is not specified, but this
+ 	// code follows NSS and accepts them as matching everything.
+ 	if len(constraint) == 0 {
+@@ -467,6 +467,11 @@ func matchDomainConstraint(domain, constraint string, reversedDomainsCache map[s
+ 		reversedDomainsCache[domain] = domainLabels
+ 	}
+ 
++	wildcardDomain := false
++	if len(domain) > 0 && domain[0] == '*' {
++		wildcardDomain = true
++	}
++
+ 	// RFC 5280 says that a leading period in a domain name means that at
+ 	// least one label must be prepended, but only for URI and email
+ 	// constraints, not DNS constraints. The code also supports that
+@@ -493,6 +498,11 @@ func matchDomainConstraint(domain, constraint string, reversedDomainsCache map[s
+ 		return false, nil
+ 	}
+ 
++	if excluded && wildcardDomain && len(domainLabels) > 1 && len(constraintLabels) > 0 {
++		domainLabels = domainLabels[:len(domainLabels)-1]
++		constraintLabels = constraintLabels[:len(constraintLabels)-1]
++	}
++
+ 	for i, constraintLabel := range constraintLabels {
+ 		if !strings.EqualFold(constraintLabel, domainLabels[i]) {
+ 			return false, nil
+@@ -512,7 +522,7 @@ func (c *Certificate) checkNameConstraints(count *int,
+ 	nameType string,
+ 	name string,
+ 	parsedName interface{},
+-	match func(parsedName, constraint interface{}) (match bool, err error),
++	match func(parsedName, constraint interface{}, excluded bool) (match bool, err error),
+ 	permitted, excluded interface{}) error {
+ 
+ 	excludedValue := reflect.ValueOf(excluded)
+@@ -524,7 +534,7 @@ func (c *Certificate) checkNameConstraints(count *int,
+ 
+ 	for i := 0; i < excludedValue.Len(); i++ {
+ 		constraint := excludedValue.Index(i).Interface()
+-		match, err := match(parsedName, constraint)
++		match, err := match(parsedName, constraint, true)
+ 		if err != nil {
+ 			return CertificateInvalidError{c, CANotAuthorizedForThisName, err.Error()}
+ 		}
+@@ -546,7 +556,7 @@ func (c *Certificate) checkNameConstraints(count *int,
+ 		constraint := permittedValue.Index(i).Interface()
+ 
+ 		var err error
+-		if ok, err = match(parsedName, constraint); err != nil {
++		if ok, err = match(parsedName, constraint, false); err != nil {
+ 			return CertificateInvalidError{c, CANotAuthorizedForThisName, err.Error()}
+ 		}
+ 
+@@ -633,8 +643,8 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 				}
+ 
+ 				if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "email address", name, mailbox,
+-					func(parsedName, constraint interface{}) (bool, error) {
+-						return matchEmailConstraint(parsedName.(rfc2821Mailbox), constraint.(string), reversedDomainsCache, reversedConstraintsCache)
++					func(parsedName, constraint interface{}, excluded bool) (bool, error) {
++						return matchEmailConstraint(parsedName.(rfc2821Mailbox), constraint.(string), excluded, reversedDomainsCache, reversedConstraintsCache)
+ 					}, c.PermittedEmailAddresses, c.ExcludedEmailAddresses); err != nil {
+ 					return err
+ 				}
+@@ -646,8 +656,8 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 				}
+ 
+ 				if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "DNS name", name, name,
+-					func(parsedName, constraint interface{}) (bool, error) {
+-						return matchDomainConstraint(parsedName.(string), constraint.(string), reversedDomainsCache, reversedConstraintsCache)
++					func(parsedName, constraint interface{}, excluded bool) (bool, error) {
++						return matchDomainConstraint(parsedName.(string), constraint.(string), excluded, reversedDomainsCache, reversedConstraintsCache)
+ 					}, c.PermittedDNSDomains, c.ExcludedDNSDomains); err != nil {
+ 					return err
+ 				}
+@@ -660,8 +670,8 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 				}
+ 
+ 				if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "URI", name, uri,
+-					func(parsedName, constraint interface{}) (bool, error) {
+-						return matchURIConstraint(parsedName.(*url.URL), constraint.(string), reversedDomainsCache, reversedConstraintsCache)
++					func(parsedName, constraint interface{}, excluded bool) (bool, error) {
++						return matchURIConstraint(parsedName.(*url.URL), constraint.(string), excluded, reversedDomainsCache, reversedConstraintsCache)
+ 					}, c.PermittedURIDomains, c.ExcludedURIDomains); err != nil {
+ 					return err
+ 				}
+@@ -673,7 +683,7 @@ func (c *Certificate) isValid(certType int, currentChain []*Certificate, opts *V
+ 				}
+ 
+ 				if err := c.checkNameConstraints(&comparisonCount, maxConstraintComparisons, "IP address", ip.String(), ip,
+-					func(parsedName, constraint interface{}) (bool, error) {
++					func(parsedName, constraint interface{}, _ bool) (bool, error) {
+ 						return matchIPConstraint(parsedName.(net.IP), constraint.(*net.IPNet))
+ 					}, c.PermittedIPRanges, c.ExcludedIPRanges); err != nil {
+ 					return err
+diff --git a/src/crypto/x509/verify_test.go b/src/crypto/x509/verify_test.go
+index 31e8149..5f7c834 100644
+--- a/src/crypto/x509/verify_test.go
++++ b/src/crypto/x509/verify_test.go
+@@ -1648,7 +1648,7 @@ var nameConstraintTests = []struct {
+ 
+ func TestNameConstraints(t *testing.T) {
+ 	for i, test := range nameConstraintTests {
+-		result, err := matchDomainConstraint(test.domain, test.constraint, map[string][]string{}, map[string][]string{})
++		result, err := matchDomainConstraint(test.domain, test.constraint, false, map[string][]string{}, map[string][]string{})
+ 
+ 		if err != nil && !test.expectError {
+ 			t.Errorf("unexpected error for test #%d: domain=%s, constraint=%s, err=%s", i, test.domain, test.constraint, err)
+-- 
+2.25.1
+
-- 
2.25.1


