Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4442.1792752619544732381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=L3yTe70M;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=tEp18E8K;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DEC711400163
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:18 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 23 Oct 2026 06:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752618;
	 x=1792839018; bh=Cz4rS9Ar5W32dv85ULms15GZr1DEMAX7yGzwKiSWBOo=; b=
	L3yTe70MyVaxMSWt8Tn5rLYTZUUl2EBd2wbantnxjvRAWK2JOsAuxiwABoFCAMgI
	hyHd2+y7pcX64KWAQJ36ezMIBsiqAajTydkLwN9hA8OEsJO2/jZoLGIaCMXnotum
	58xn+X8hU71RLFtlxQn31j2MMYZMd4z9gLs3UeKdfL/fsVbreGToHTSA+o8hXKUK
	vmUNpqs90DP3QqTJO7nVwKQrBSuo6Wh5+7m3vHcUa8sZdN9pI2ZzWrGlpN7BJMOz
	8nbPraZPKr+Bs6R6k93iDfgJXgh1c7aBf2/GYy3HUBRNGitp0gVkGyQ8jIol1+wA
	5GAjSU+nWj1IPjmNr4TyZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752618; x=1792839018; bh=C
	z4rS9Ar5W32dv85ULms15GZr1DEMAX7yGzwKiSWBOo=; b=tEp18E8KPhrv/oryc
	ulvg8fnG9Lp7PwH62ptAf3oggq67ILQwNrrZ7GQBhL++YT2DFK8d5pEBwJn/frI5
	2Vr2zZnKUq3EcS29Xs7re+xne+9Bav79DkBsHtIGVtKP5NPuMSOTih0CjurpaefQ
	oPwkAF+4eqGBCyOIu/4uaTbHUs1sY8GZN/Sjt7pm8D9HpvuhAPwvQdp/+ucidZ5Q
	3Iq3EnwnkkHbifV4wrbb5CKov5aljfuIanaKPABsucF87yXHy2Z+mE2QqMeIHRvo
	IKXI2qfrdkYfF5oxD9JC2tbHzknUAcj39y60gscTbj7SCpYqcwOxRG5l1eog/vmH
	HoQ0A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752618; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:uH9WkhM1opn+w6DbImtViL+FwFOF2rbMTCGkncwi+5ZvJ9H
	UvBf5go06hcVJJGhK8aZ7K8+CdhwQewbFpxSsw7rg/NKxj3G799aglbsMo4RRo7a
	f+3R7Z4OMlp60ZKZyDI3aCXXLiMe4dyaXUSQQs0ZLPMeGynaqJSHXimEiZwjyCLn
	QMZfo526QyzVErWqBBIlvpkjtXhm2/JesqypuL83rNIwSe8X14qcyaeytivqs7en
	232iEwBChlv6gJz6hiEn/+wkYjBQWiOclI+L5Q/i3Fb2zY8dCrnm6Os+tQL4PNap
	hBv6R/Dx/PhXcAW0VTRadwpPleTis9hOslpJf9w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2itYdLfcuMFdbMNr7kwZtdldNH0ODedLlXefvul8L+s=:lDy63itENkSpkf/l5iypejMJL/9rO3OxmybLpr+WaNE=;
X-ME-Sender: <xms:6jvbamQetX2k86XpXkOwyzYS8b2uUOZ9kZO7l6P5i-IrA0yGNe7Ovg>
    <xme:6jvbaivdO6KQmhKhy-3GRfT_p-AYK7o-_ecq5OIMYhwTe5bTJFh9Qt3NHb-0ibFqK
    3YlJ91SYvCXNueIIzUuwjmtDBQaTV5xt-_UhzoDr-FFnJqaWGMMdmvm>
X-ME-Received: <xmr:6jvbapc4-IVQWY7PnkGlbOCykmCHy3tMTFJI-KpNtvTQ9oCUCrW6t1yfDF-2BEJxsVThcR2DV355t4Zc4X36_8m-4Y1ly7U>
X-ME-Proxy-Cause: dmFkZTGyOagm9BfzPb+YtFk66N3nGLsZpb/VPM8XjyvCI6H5ALoAzhuChEVFVvDnkE/SF/
    JqM9HdccU5QGXh85+PcHSXfPlinR50XvCANansdfjHdI2y4yWT98LB5sYItFtv/YCkRC+D
    gCz49oXUOiIA3GSaVy8hQyIFhJVj70/v42lZYRXkC6yDHyO8Mxh8BPFCEOUQWBw2ymS8E7
    RnCBWgaoCjRMBc+ufLfygswQfPbZu8I30UCpB32sT/SGJkXdSH8ooLc1ooYQLEosEVguDB
    nl2tS57Hfyetr9KYXK2lnhEOBFdFfv/pn1dtrEglp90LQOD/J+D0fLXSLeer7z4rPcHWix
    L/V70TMayneM8BnVGvkCTo+fKv0HoejEfi/MU/gO+xKfmmwf+vreth0mo2sfbuXegReGKW
    lw0t0syQPphr7EBds4PoGpXzpONOzdxIQYBD7oE8aTbFIbNuJ2jhKO3AokNRErXUVmR44z
    lvOboaXiEwKYmB9Z222X8eONTDjTqfNVQ2uXWqXOdHkfmhpmCaWt4+X6CnPaNhaW/CTW3E
    nL6Nfof3H0sC2Cc1PZuD/Snp8MW+dZ0ItQAesM/e5z2Wf8lw6HTcEtJxfZjNZaHoV7Js6Z
    CxRqiOezGR1DHXMjHT+yB7kQOSmir57qSW5735YSDqizypXOwDNe/nBBdMKw
X-ME-Proxy: <xmx:6jvbanJDMZMUIY6AFXNm7JFDYroWLTQgdBxYhGuaKSwidmCsd8zhFQ>
    <xmx:6jvbavYYz5izPiNiNfr54jqlDGVQJKndmKQXf0utT1QQBwmvEZZ9Cw>
    <xmx:6jvbaquRDTl-vXQmcrZaO80EOyUvijjRzqh9G6jQbG3506ee6IQqGQ>
    <xmx:6jvbakuxSR7rRHCVp5So6mhr2lATxcTxtQQwnTzQs5blQAz7-mqB2Q>
    <xmx:6jvbaqgqoIUqSYllaWw-W-ECq6ctorMXKpsP48VLeI3wMcBxMWQMK6Iy>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:18 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:19 +0100
Subject: [PATCH scarthgap 18/19] python3-certifi: upgrade 2026.6.17 ->
 2026.7.22
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-18-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752609; l=1845;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=unmtBA7DTtdAlr5Py6JtmUstJYPlgNOtgrlHyzQAoqw=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGMAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEgAAAAgVRzdjm9JWoTPP9+29lT4cU5TFw27a9KkZkGSS8xZzKMAAAAgPhMN2XkGVMHxOa
 PkGiPURz1GkAdA4rSb0rQUxKgwR0I=
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248535

From: Tim Orling <tim.orling@konsulko.com>

f4bc676 2026.07.22 (#428)
4c91f9c Bump actions/setup-python from 6.3.0 to 7.0.0 (#427)
01a66c5 Bump actions/checkout from 7.0.0 to 7.0.1 (#426)
eb355f4 Bump pypa/gh-action-pypi-publish from 1.14.0 to 1.14.1 (#425)
474e6fc Include tests in the source distribution (#424)
a31ef39 Bump actions/setup-python from 6.2.0 to 6.3.0 (#420)
98eb2c7 Bump actions/checkout from 6.0.3 to 7.0.0 (#419)

For full comparison of changes, see:
https://github.com/certifi/python-certifi/compare/2026.06.17...2026.07.22

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d7fa3a3c6a5e62ceade6d02d09b909b88b1c6ee)

This changes GitHub Actions workflows, MANIFEST.in and cacert.pem. The
manifest changes should be harmless.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2026.6.17.bb => python3-certifi_2026.7.22.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb b/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
index 8fc48ae75916..539d8e9003b2 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "024c88eeec92ca068db80f02b8b07c9cef7b9fe261d1d535abfd5abd6f6af432"
+SRC_URI[sha256sum] = "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

