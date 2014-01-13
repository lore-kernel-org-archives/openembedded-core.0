Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1B12F600AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 19:46:53 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hq4so2715350wib.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 11:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=49glmceijAjpz7D8NCMeC12yDNBpuQZkyPua7ZaRT60=;
	b=Xn94lDdvTWhCxAbq3+SYoCNRBfFVi/k2f20yOuRDCa8cgXkZAtKidss1CnEq4CYnZM
	cygHGT/gKrIWnIVXGyPQVxDquaK1GBOabCy9uy08Df4Z9JNhwN+fyvj0svt5RZA9Bxi2
	/RcEAxVKSslsV3Z/DqJVfUaBiYvJq1MQtJlPGIVgsOsZy/OKFO8dNKFpc2mC9fAfBSVu
	/Q3QBPyTbtouuiSh3KqU6n4v7zWDjcow4CE+YeHDYLojjWMmoa0/TJBjSvXMExjLB/ry
	FGtCn5o9c3YbK8UnbiWlG5ggXMoAIhOsWabBJcxBtV4MJx/XxlRqMAebHP3b+3fFz0Z2
	hcUA==
X-Gm-Message-State: ALoCoQnpeJvuP3KMCOKhZ8Vk+lRGQyQUYzqLrpYv6USQOgj4ZALI2PYIkA9sPpeZOF8ahXBHTV8l
X-Received: by 10.194.142.231 with SMTP id rz7mr20377wjb.89.1389642414697;
	Mon, 13 Jan 2014 11:46:54 -0800 (PST)
Received: from ?IPv6:2001:610:612::e45f:f42a:cda4:695c?
	([2001:610:612:0:e45f:f42a:cda4:695c])
	by mx.google.com with ESMTPSA id
	jw4sm12393096wjc.20.2014.01.13.11.46.53 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Jan 2014 11:46:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <52D43FBC.3010705@linaro.org>
Date: Mon, 13 Jan 2014 20:46:43 +0100
Message-Id: <3D4A3A74-15A6-4ABE-BB56-DA92F08312F4@dominion.thruhere.net>
References: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
	<52D42D89.4050106@linaro.org>
	<1389637527.19023.4.camel@phil-desktop.brightsign>
	<52D43FBC.3010705@linaro.org>
To: Trevor Woerner <trevor.woerner@linaro.org>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Cortex M3 tune fixes
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
X-List-Received-Date: Mon, 13 Jan 2014 19:46:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 jan. 2014, om 20:34 heeft Trevor Woerner =
<trevor.woerner@linaro.org> het volgende geschreven:

> On 01/13/14 13:25, Phil Blundell wrote:
>> On Mon, 2014-01-13 at 13:16 -0500, Trevor Woerner wrote:
>>> Since OE is generally used to build Linux distributions, I'm rather
>>> curious to know why OE would include tunes for CortexM3?
>> Well, Cortex-M can run uClinux.
>=20
> Is there an OE layer that adds support for building u-boot and uClinux
> for Cortex-M3/4 [1]? I've been searching, and seem to be coming up =
empty.

You don't need a layer to build u-boot, it's in oe-core already.=

