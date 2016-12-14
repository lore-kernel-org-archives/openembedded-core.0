Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4C89177217
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 12:12:15 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id h30so36338393iod.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 04:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=ZRju95GQW0oi0yUmVUeOGtUXPB8pNZNzTCyTyPeuxgE=;
	b=p0I1BDKDiyvepHFHvRsdGWZIe53SWXK3Ei3K+xhiOmWWwF5sLKVDhMJRsLyZtf/sTi
	zK+Tb/VcPfBsIiJI1H/jy4ROvfGyBQaoDNLOj0kwy4w5D2PUa/PKcZuiBoMJRpqIWyTO
	ybZ3vr+t7Gwz6GxNsucfzKtthO315H/Una62z5jcaNQcfrhnXi6h7J68WfqgMEqGE/hi
	3sEQDP1K1aXxGiV2V1awLpSgFNwjwhiXNjZ13EfKfSEmxFCs8nHB1gojQa1GiMJVGBJw
	QDpUUeMidJx56JwxJBFgLTVjODPovJZXrG9fGGi0cVK91ip2bZpz+BtfW3ZH8hMY1FiX
	wGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=ZRju95GQW0oi0yUmVUeOGtUXPB8pNZNzTCyTyPeuxgE=;
	b=IRGWLNFG6avBeo0zpKXJK62RX2O1k/uJogdCdJytN5jdpFGSS3N9GhjlaiRIYf9+vL
	JOSOL1/d2XkBfU/3AHwXh+02tt64m0FyS0K5w8XYgj4NMNTp0p4vFu1k+pB3uElt9HQ2
	VmjvDXcPk3DG/Yd/1+pia45P9MB6/9LqQ1XidSoFsdS57k/DIHQlf1vDVw0nggoI4Od+
	kS3pLVPvEpd04xuSP4p9xVUveF3g6L5yqwaCElLC7dNfPFqzPurBSFhAdiRaB/Rjvd+s
	XvKEONGnR8zET0glp1gd46iSb5iPULTv9IpCfWryL+d0yEtTYjF+fJLgSnWK58Ixki/e
	hh9g==
X-Gm-Message-State: AKaTC02Jlb1uGCppNBE6RWcKHfk+6USBnVWLadHr6OdURUmwj64qZZQaeMLcuwm845NLOjNR
X-Received: by 10.107.157.2 with SMTP id g2mr90190685ioe.70.1481717537399;
	Wed, 14 Dec 2016 04:12:17 -0800 (PST)
Received: from pohly-mobl1 (p57A561C0.dip0.t-ipconnect.de. [87.165.97.192])
	by smtp.gmail.com with ESMTPSA id 9sm9574580itv.0.2016.12.14.04.12.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 04:12:16 -0800 (PST)
Message-ID: <1481717534.1544.21.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Wed, 14 Dec 2016 13:12:14 +0100
In-Reply-To: <cover.1481706394.git.Qi.Chen@windriver.com>
References: <cover.1481706394.git.Qi.Chen@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/4] Persistent /var/log support
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
X-List-Received-Date: Wed, 14 Dec 2016 12:12:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-14 at 17:08 +0800, Chen Qi wrote:
> Changes since V2:
> Use boolean value consistently. Update the comments to fit the use of boolean value.

Looks good to me now.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




