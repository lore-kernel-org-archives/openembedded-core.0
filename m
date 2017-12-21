Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 053D57875D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 06:40:55 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f9so13799527wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 22:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=to:followup-to:from:subject:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=2xiDDtNF6QffWJzZSC9NCi02emlG+YZUTw4Hc9q2mQ0=;
	b=qbT1O8S6I4T0Xvk7JPSiI0wgOgUle18WNo/0sxEJ4kM7ABDnZlIpkEZNlvZdwvhRRp
	gcPwzcCUfh+FJ+xADWV1PCjekMrtUv039GnjOTqorURBjMMtadBlFwt7R5tpkeNoVYW/
	DggxU7V/Y/tAMSIIS2JRtFSMBT6PzIfMKfcqytBTvIK+tEWp4YprcmIiG7nfNSHhbuB2
	jKHC3mqbPz73DjVqU0Ot7mfS+dZOQpyLziR/1ESmx//lxdpvj7O2lfuKteW4HBFGnJwb
	8onLNmVNU+a0i+9IB+Ug9eONmTgdlyqlSzR47NPUF4CqA2m2Y2dU03n0khT8qQbZfmKW
	QZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:followup-to:from:subject:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=2xiDDtNF6QffWJzZSC9NCi02emlG+YZUTw4Hc9q2mQ0=;
	b=U2NXhOO8k4KMZz2Nw/JqPbOkzqyfZBGvtZboZ1M86lMU1getgF4LTKdp5VglidAbgb
	T7nvGZrMAorMCOuJNSt+evS6Sgt4AQZBuCDeNOSX/DEnEUB4Xtlt+8Enok1G5ItxQxSf
	6hRorYf+H1CECMSBOB/nsmdQtFhJ04toN3kBb8a7VpLn8tgyumRZpqfS9JpwL84jm+Jp
	ZuLaw3h9rKjxkjDNFzhqLp1H48IwXQl7c07tJcUdJd6xgp+I+sbljAa2sKVs2Xe+9vKi
	ZFKOdVssg57DFzTIWKR7rFSxiMmi7jw5TzkZq9u4Z+yDL5zNmwmGyt03pHNSESQmX7hq
	pq4Q==
X-Gm-Message-State: AKGB3mKryOwZ4xn0IXHVzSK1BNi3deqKeKxD07jRrX2MfV3Ph+fto7aI
	ipaNgvFh1dpdpyfkBGtSkWhUg/mp
X-Google-Smtp-Source: ACJfBovySngYiUQwDchEhp30++DP3lar3W2o4V6Q8ZKI8fYpaYafSaJXZoDuoFxed8726Xspr58Jkg==
X-Received: by 10.80.145.14 with SMTP id e14mr8887294eda.34.1513838456827;
	Wed, 20 Dec 2017 22:40:56 -0800 (PST)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	g7sm17071138edf.50.2017.12.20.22.40.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Dec 2017 22:40:55 -0800 (PST)
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Followup-To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
Date: Thu, 21 Dec 2017 07:40:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
Subject: MS Windows machine?
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
X-List-Received-Date: Thu, 21 Dec 2017 06:40:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

Anyone tried to cross-compile for MS Windows target with Yocto/OE?

Regards,
Steffen

PS: Fup set to <openembedded-core@lists.openembedded.org>

