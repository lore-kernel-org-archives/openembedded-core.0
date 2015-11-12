Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 21B497721C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:03:31 +0000 (UTC)
Received: by wmec201 with SMTP id c201so34483062wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe_de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ZmSe23yOpDuWs7PGT/ij6fVjItDCqcLad0cIDAH/K8k=;
	b=QqcK914VhpD0sKBJfD03PTMIKtyfdjvyTRZuWystdz77yglMvrgZgzgntvvYcMtOxT
	NDVN9URtn99P5lWhhKG7xlVlO24cFej70ULNAsRGg3vTUiLG+7ACJVUhyn0C0aMAqQBL
	Y8gZ2SCGiIe3XsCUpMr7NYAh1cKma4ca3OQfcdtLJYpvtQNRXb00Ofaw383ldWwPuiBy
	fN3HjOioghEE5x3e++0hY6QOIQg+t2nynHnjIBted+/SmmfeFbaTNYL6INrDuvTare1t
	9KZspSq94ssC+ie/rqT57oTH6pNjVFUS6zZkBra+JXbzNNdW3IIZPu58dJkrcNpe2qLS
	tnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ZmSe23yOpDuWs7PGT/ij6fVjItDCqcLad0cIDAH/K8k=;
	b=jKiXo5/WWhf9TSPZ/4eSIfsRQCT9enhn2FJJcDuD/nE7ZPKhvrpP2TM1gvRc7kvyqT
	Rcnhl/w+CsoxrMToXLdhmNVsa9BnqJvqxOe4RC6eUsdLRUYjLMGsng2P7IjsG7hi1ssZ
	4XmG/1Xj2SdplVtt1rsKBw6egx4gKyNehB6jMXd29zn1UGxoA5lvwOguHnz1KzYgoLzz
	A7rUfyz9S0q2YOrcLSIje0hLLtPQlBSjXdI54NCxwKGmmwqHYkVQem48QYRz0W1BbQV+
	4gq/LC5HcSd0sGyH5CKtMQ/S83Ai27Svm4dkOcm5ftFBLyFgZ6s7YXIfPvtvW51MvkpF
	cuEw==
X-Gm-Message-State: ALoCoQm9Cq33QoIfAQum2aGdTJKAPezKPMILy3bN+Dbwa7AodRX67LxwT3aaGU2xV6ASJG512Qgq
X-Received: by 10.28.125.201 with SMTP id y192mr10870248wmc.23.1447337011358; 
	Thu, 12 Nov 2015 06:03:31 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	q141sm15216774wmg.3.2015.11.12.06.03.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:03:30 -0800 (PST)
To: openembedded-core <openembedded-core@lists.openembedded.org>
References: <1447161703-4174-2-git-send-email-sledz@dresearch-fe.de>
	<564352C5.9060208@dresearch-fe.de>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <56449C31.4070802@dresearch-fe.de>
Date: Thu, 12 Nov 2015 15:03:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <564352C5.9060208@dresearch-fe.de>
Subject: Re: [PATCH] busybox: add UPDATE_ALTERNATIVE for syslog-service
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
X-List-Received-Date: Thu, 12 Nov 2015 14:03:32 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

This fixes [YOCTO-8688].

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

