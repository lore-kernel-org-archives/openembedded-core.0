Return-Path: <george.mccollister@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 47EE571CB3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 20:06:51 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id v23so176736082qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 12:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E8UUZDlqlopDvARyKKYkAmHvDZ51mNeUOJ8E46Fv0bA=;
	b=Qqn+BLfD4sakk71GoWgXGy2dvL9BFmC0syt2M3YTwodLKTPI9SOZ8KMKLLxaSsATFL
	PRzmfCiKDOiorSJ0/lWU3Cqx4WrN41c7QLtDPZgzBWzcBygzQ446KzkX7SCyGq7FzpGl
	cAE/rNuP1AsIHQKVf9v5BdZg6XQS9G0k26cDuc/4ioh169SMK5vc9DWcJZ8jrrNsfBMN
	PqKkSfc68CU6sx/Xrhrk2sSSvB+WW4gMuuLJAT/I7F7L7x1PGYmW6UcJu8ksrLhVd0Xm
	BFJorww3xh7js+jJa8I5bZjUdWOT0exQd5BYaPf9ff6qcR4W/nLqA4wccUja9Ng8E0rD
	nSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E8UUZDlqlopDvARyKKYkAmHvDZ51mNeUOJ8E46Fv0bA=;
	b=OaVs2hOzmtRDDfnvs2svg+HCQqB5Kkw8GCpzEPZicGm0o+GwioAm6RQFKzLsEhl/XJ
	GxWym+lZJ+ZThXcZ0UTXxRCMr5zQGzXn0c+5q55YICWtpiHdOA1WJ8hoa9lv8CiSCeY2
	DH7aTPMtRgp0KN+YGuZL8EkeowNA6n8aJ3UbCBi2f8VwvmGifV8GzmLvcDHJWS8S0TQ8
	8PR+k1N1sezmCF0YAp5FzJSkJnbAroBCaA7BMP0IQamYNnyv/qeut1nMfLx+BNRtImc7
	g673lAWHkGvoQ/bHwmwN0ckAVi3bYj9990tW6I/gRicdyGyo9G010/YtiVN4Fcv5ffrj
	+x7A==
X-Gm-Message-State: AMke39kNtvXeinYo6gGZn8joSBLRI3BQpnRhkSUdoAMgE/W0htXpI/jFQlYS43Hd0GU7Xx3pq54dq/3+9wCmKA==
X-Received: by 10.237.60.122 with SMTP id u55mr21192131qte.41.1486584412006;
	Wed, 08 Feb 2017 12:06:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.92.175 with HTTP; Wed, 8 Feb 2017 12:06:51 -0800 (PST)
In-Reply-To: <cover.1481043778.git.george.mccollister@gmail.com>
References: <cover.1481043778.git.george.mccollister@gmail.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Wed, 8 Feb 2017 14:06:51 -0600
Message-ID: <CAFSKS=NDQ_EDXishOScHEFt_Uf6s2vq8P7YooBM513CWbHFmTw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH 0/2] Resolve gdb-cross-canadian dependency on imp
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
X-List-Received-Date: Wed, 08 Feb 2017 20:06:52 -0000
Content-Type: text/plain; charset=UTF-8

Any chance we can get this applied to morty?

