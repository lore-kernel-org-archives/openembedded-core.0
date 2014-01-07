Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 430066C8C9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 18:27:24 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id hk11so10891532igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2014 10:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=aheRNBllAYU+AsVF/KnrMXRaVELztwqj68JQIGZFxy0=;
	b=kDyrKgpPUuIdvFAtbq1Q2G2jE58zePTMskwGsYc7pw1lO8CVtcQkCC0DvWrnXkfpcg
	s80r7wr4x36PvEgxE2iyRON2Kgbj07UbJXjgJ9/WKbfpivIN6VPwRXAGF8/gcvu8QQU9
	lLJLYygHkzxF46063PPY5IxfBBulrWuADxzAXIGPRIg4VzPSsPrUGXyYa9rZwDafRjdO
	FZW3KSBUiE/aOgXVo0suGgGzCyDtQ/hxy+l+GHnm6Y9vTVTuBXXDNZ7ruERJ01C05edp
	t3Rs1PDB0OXEweh16VDiG6u6Ta78B66wJivXaWQVPDC9HL9rtn2QnNPF/8K1b+Sx70Kr
	0TlA==
X-Gm-Message-State: ALoCoQn7pJkLwTG0jUql3eK+r3Y7YRwMedbbGIobeOrLoONxL9pINuCXNVA6PEtjd749pDZA9aN5
X-Received: by 10.43.171.134 with SMTP id nu6mr1521052icc.92.1389119244694;
	Tue, 07 Jan 2014 10:27:24 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id gc2sm4593502igd.6.2014.01.07.10.27.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 Jan 2014 10:27:23 -0800 (PST)
Message-ID: <52CC470A.9030302@linaro.org>
Date: Tue, 07 Jan 2014 13:27:22 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Qt in OE-core
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
X-List-Received-Date: Tue, 07 Jan 2014 18:27:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello everyone,

question:
Should some version of Qt be included in openembedded-core, or should
all recipes to add Qt be part of their own version-specific Qt layer?


background:
openembedded-core[1] used to include recipes for Qt3, but as Qt3 became
old these recipes were replaced with Qt4 and the Qt3 support was broken
out into its own layer[2]. We're now at a point where Qt4 is getting old
and Qt5 is "current". At some point we'll have to replace the Qt4
support in [1] with support for Qt5. But we expect users will still want
to use Qt4, so if the Qt4 support in [1] is replaced by support for Qt5,
the Qt4 support will need to be broken out into its own layer. Qt5
support is currently being developed on it's own layer[3].


This email thread is *not* to discuss when we should replace Qt4 with
Qt5, then question is: should [1] include *any* Qt support, or should Qt
be always in its own layer to be added as required by the distribution?


If we decide [1] should provide some Qt support, then we can discuss
when we should replace the Qt4 support with Qt5 in [1]. But for now it
would be nice to reach a consensus on whether or not [1] should include
any Qt support at all or if it wouldn't just be easier to always have Qt
support in its own version-specific layers to be added as required (if
needed) by the distribution configuration.


Thanks for your feedback.



[1]
http://layers.openembedded.org/layerindex/branch/master/layer/openembedded-core/
[2] http://layers.openembedded.org/layerindex/branch/master/layer/meta-qt3/
[3] http://layers.openembedded.org/layerindex/branch/master/layer/meta-qt5/

