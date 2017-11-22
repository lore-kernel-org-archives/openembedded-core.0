Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id C7ACB70057
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 13:13:49 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id f134so18159385lfg.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 05:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LTj4peMeRAH01FFIgtdYg2sTAR8OpV10TLFZMILkza4=;
	b=LcQ9ss/GiHKO5tvKcuVN/gzzz8Djf5rBvG6ZAqYUZkA1c03Nity4ak1eKYL6GAOKO1
	UV7RjU97iQHaUxeHONhPOr/ZL5UJTEzjWbYC47M0YA4g/OKyZW/0aEXC3FGNmxQ7xVcU
	hrzvPiIOGRM8u+0D+3OMKJEWWDIXbxK4bIbHxMnCdRS5NzdpS9K0C91vXdkcPojvxjSA
	78RNo+G8dn5K6VVril88yp2M87b/k2G/mUZ90CneTncrmmCuvf88g6LXm3eG9PFFQYDG
	R+ToSCNWw8ioT/oc8uvkoNgdLJIlLfoc/HsEMWnFgu/qJSsyVBt3hLWubS/9Q1iRUi9J
	HOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LTj4peMeRAH01FFIgtdYg2sTAR8OpV10TLFZMILkza4=;
	b=PfcAtEw5S6iaYnC2fmiR6nVWzLJF/4tOoW+hsDyBeJI8vv+/q6vHOlJtRlQUi6Uu/O
	xR2nBqc9Mt0MdUV2tT9zTbhSzY7d4xM2muyse/CE0JviXUdW58OfbdzdJKL+aSk8saKN
	L0zSkcIhiZYjHLNwuNJvuFpWx0yvYzLl+JhAbm9iMdUuw7DSYDhN2xyQHTkEUIMe157q
	24apa7y1TQWhuGoo4B47OpuH7ZHv/IX13aFVpY5lE9hPu7gF4i19EsogobuF5PEV8fJF
	3xDKsd2MBF55VwgiGrxr6D6oi3mdEgw0A2aL3vf8uKbKiq2FKJm/eb7+hDez9gI32ev8
	BKGw==
X-Gm-Message-State: AJaThX7fiN7CMRCiUx9Hevz7q/8fIqzoriwuEEKRtzdiNkpjXOnoW6y1
	s9Sl/l4OAKJur1fWn3vzA2TjGxVoGHk=
X-Google-Smtp-Source: AGs4zMaj+H8ml3QAY1Ws+jbrOVtiPYwEgejRPBZIjBSS5rYudn1CM/ea4FCm9Er7VHyV34NYYFT0Dw==
X-Received: by 10.46.65.203 with SMTP id d72mr7174074ljf.136.1511356429862;
	Wed, 22 Nov 2017 05:13:49 -0800 (PST)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	b185sm2788585lfg.10.2017.11.22.05.13.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Nov 2017 05:13:48 -0800 (PST)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 14:13:38 +0100
Message-Id: <1511356419-32334-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <6a525f12-f5ea-d079-83d8-46e6394be8ff@linux.intel.com>
References: <6a525f12-f5ea-d079-83d8-46e6394be8ff@linux.intel.com>
Subject: Re: [PATCH v6] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Wed, 22 Nov 2017 13:13:50 -0000


On 13/10/17 12:37, Alexander Kanavin wrote:
>> ...
> 
> Bear with the pre-release freeze period please; once rocko is out
> patches will start flowing to master again.

So now that rocko has been out for a while, can we get this in please?
Already reviewed, and rebased patch is included.

-- 
Kristian

