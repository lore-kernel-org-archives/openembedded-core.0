Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 23A4B771F5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Oct 2017 20:36:39 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id y23so10592209qkb.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Oct 2017 13:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NjRkIkaTFEyddcNkd2Zu/udJLJnAqztJrJt9MVT4NzY=;
	b=cCzbWGa/d9VfB6aNSl5+35PSfzza0fk2ggl/nW/AThylhzf3sLl0M4oQgkJtiFj41G
	bo8807jZKQxnbJSkX21ZL3OCwNDRYMjn7RZE1DWHDYk2Zs6yPjHFWic/t3mzpg0069Lt
	GS3G3mBNwPNus5BVwyymT86y4tb/SLRh2bglKqew+Kh3uwTc8vlpV0ldZU49uaX4UWUk
	khA5hJOf3EusPBqV2HPEd2N4Mje71gh14kIIo6eO29SK3ImZRyzRaIRDYFJFM0UDjtvz
	vsKW53VOVjliXnVdMKQCdQYiWKIXJl9VnThIK8N1rjuBs2z6ti7dc27Qu5vcOVGXn7RC
	k6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NjRkIkaTFEyddcNkd2Zu/udJLJnAqztJrJt9MVT4NzY=;
	b=blBF5/HC0UQrDu8ZwG2f50DdalG9m2rctr0PF9knvjqHHBOwHAHf9tfcSMPth1hHdy
	OXJQwZyEGupuZtnmUV9qhmoP1q2VXwT8Ov18AcUbXzRXsbekaWZoPYXUhL7tcHazE6HO
	z3XCTesPaEdcTMqN8vIcjDXB/JMyrxWpq2AibDTT1DrqM2GHpjrX7XrRUwcVGQfTlrDy
	ywThbaDi6WG6JTwGytQSgR/jqPm7yXTEbNTmf2XrFq1bzBdKcssxwc59a7731VlsKfVT
	NQJgzXW3epQdGzwr1XNTtARvYOg+jX/JjaMVebPez6N5oa/w4B041BYfDXGVzh9LG675
	fK7A==
X-Gm-Message-State: AMCzsaV5O8J5qm3DW/I5K+17VdNZ7IehPPw3xW7EHju4Pzn+xhN/5f0j
	P8Qkx+mcV9pg2mapmhsz8j/qnJ0a+ZAkeSTOy9M=
X-Google-Smtp-Source: AOwi7QBwSq763OWzivg7/wLd63DJ+a87y1W5PrvohDjSi9WhsSXmwwWl/3+frLfqgehgbGOTg2tXJc+OK85TqPUUB8E=
X-Received: by 10.55.115.133 with SMTP id o127mr11139629qkc.351.1508099800977; 
	Sun, 15 Oct 2017 13:36:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.199 with HTTP; Sun, 15 Oct 2017 13:36:40 -0700 (PDT)
In-Reply-To: <cover.1507250774.git.raj.khem@gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sun, 15 Oct 2017 16:36:40 -0400
Message-ID: <CAHUNapQiUifXSsXuxb=uqQLd58UON6EXvwLRC9Q07AJXa-ozhw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] Add foundation for riscv architecture
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
X-List-Received-Date: Sun, 15 Oct 2017 20:36:40 -0000
Content-Type: text/plain; charset="UTF-8"

I'm curious to know what the plan is for supporting the various -march
variants, or are we just going to assume RV64GC?

