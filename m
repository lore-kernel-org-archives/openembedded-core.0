Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 98B63731C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 07:47:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b14so9052960wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 23:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=+jcx3XOmIKtVAMZb1rwP9jjU7DGNXggUZkqewYFpQOM=;
	b=oriQCzu3tBw7ezjiPxskJ5/t69OWZ1xhyvy5AEREq/LUQM/Ra6PKSa5WWPR5I3bve0
	Aukcis992AnHVtrstTgMc5yPADiW0Rw8d9z886XNfV8eA+kO5/moOK4PD/dKm5IbS+cv
	0pGWaSramqzdCfuwwG0dAF7eeMkwLhzBEQGxb8Xl1RqHIoPNMXHoxWBqNJd0QH2xtbhp
	nzLUfXL2FKmsvXi7JzaYWE6u6F+u2mad6OCq+zN/ePpuQcLoGD7SgWQ57YlPvfIVUs7e
	COl78gCWV0vEMbkmbUmpHV200foNpl1WisJSmhjUvAR4ij7IsJoFrQuoudnOwE1xEVfh
	TVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=+jcx3XOmIKtVAMZb1rwP9jjU7DGNXggUZkqewYFpQOM=;
	b=R1wXP/OhOL4YSe4XkEgxoLBXP7eD0dfTdkhEWmPke/LWiKUEnok0BRCWTB+p/h6hNq
	xL4fHFjMFY4UtTzhN87Uk7j4JOQEvb0h1Rikd8JdRqNXQjNOaLr79D5RnYkrw7RyfQqg
	lWxMDgZ5gETE7hzfKnngIMLrKSDhRsj3lKsQQpjO5Wzh/SSbkt4dZIb3CxlR8Lv9L6D9
	kO3skaxAlXrGZawTndMIst3sEqg7cmNB02LMpFRz2a5/WgWnmI28oIg6kKivku5yBezG
	zBz0+aYo66j/Ur33QndU12KCMLs5AqOlf+agAmI6PwWi+MyfehQ0C7DWxEeHqS2kkZ6s
	A05w==
X-Gm-Message-State: AG10YORpppEjVq6N5kwtI2TB245BCtAtjTTlSs4EpcwIL1nO9JFg4kehS5P7aF69vtHiZw==
X-Received: by 10.194.5.161 with SMTP id t1mr794400wjt.38.1453362456862;
	Wed, 20 Jan 2016 23:47:36 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id kb5sm124156wjc.22.2016.01.20.23.47.35
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 23:47:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3117\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1452804997-20926-3-git-send-email-george.mccollister@gmail.com>
Date: Thu, 21 Jan 2016 08:47:34 +0100
Message-Id: <D448FD3D-8C29-4F26-AF95-068346B6FA00@dominion.thruhere.net>
References: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
	<1452804997-20926-3-git-send-email-george.mccollister@gmail.com>
To: George McCollister <george.mccollister@gmail.com>
X-Mailer: Apple Mail (2.3117)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 2/9] bash-completion: build nativesdk variant
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
X-List-Received-Date: Thu, 21 Jan 2016 07:47:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 14 jan. 2016, om 21:56 heeft George McCollister =
<george.mccollister@gmail.com> het volgende geschreven:
>=20
> The nativesdk variant is required for some recipes like git to use the =
class.

Squash this into 1/9 to avoid mid-series breakage.

regards,

Koen=

