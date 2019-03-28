Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9667CDE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 12:08:14 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id e80so18066278ote.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 05:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fFCsWPmKXhb2l3R/oNnsyA17ob7HYJCG4dMyze2MuME=;
	b=TcZFnwjBRTJsytJRxI+6gR9/h5gRvvYZZMRMfbEsvWH0aYTu5BhWb7hn6V+ygEOCcS
	QB9Fpu1P1bn5XXGBEqbJ8s61aXZb5XmCEo93uxiFmt4CN3mA5aZNGJx1Bj59x8t9uvGM
	HXWAlr0McwAaE4ggwhua+vYbFQHFM3Jiom9h+rAdvNXKjfpTJOpstghvJjZgfnukcKnV
	fVSv3FwtzprqfwM/f4wi5ffRstJhTokwyIcGqZPQ76lxdzVl/mDN2qMBG32nV++XSOL0
	2BKLfJrJHZoeE9+NjUx5plRMestQJr9yZd7olkYzR7MwAs/16hhsqsqIoNJF0K3BpdqJ
	zW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fFCsWPmKXhb2l3R/oNnsyA17ob7HYJCG4dMyze2MuME=;
	b=k1M7j/TQCf9xE34Tx79BPB3k1/YS6L1lfOrZmZtNkqnEO4dMEjIKWkHzy7IdP2n+Dd
	oqvLjfA/eLxA/4SvdQ4wsnJLAAVH0Zi3hj80NuPvm/5lScP9Ktyg3NdJddXC/6FXTv1E
	RpYcYVBoBagKKLGHtObv/Da4NcJfTQif5kIPSMjgsmj8Q1loVY9e4Gu58+tXw6PQwpDE
	VhkXvyh4SSq6Gwo6nfc5Tyq3pymipyHRhGQTxosdoPGCxpQsbvNMHOJ8vFHQN4BQJyja
	QYROUS8Ae/i9X2NZjc1xATvBfzqGB7IPdYdGuZnOLyBN4GNTXEqBE2nQ8ekF5di8SVSy
	RKzg==
X-Gm-Message-State: APjAAAWH8DWTSctpk3fePGoxYLFwL7mQbOgn5P0d+XUyh3iRzi6LD7a6
	NXv8bgkqhWUPd9IcBLJ2h3YKCjKv07sby6iXW2OWP/Oa
X-Google-Smtp-Source: APXvYqyTTpC9aLCITmCUULq5S/kz2z8dqADlkiztk78SirgXdjGZx+vinE6NGr0hBw4NWeQFD+KiqTVxI4TAHok2QSg=
X-Received: by 2002:a9d:4a9c:: with SMTP id i28mr14037579otf.326.1553774895953;
	Thu, 28 Mar 2019 05:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
	<20190327140922.109867-6-alex.kanavin@gmail.com>
	<21d76d15-fb59-6b0c-cad6-814236b66616@windriver.com>
In-Reply-To: <21d76d15-fb59-6b0c-cad6-814236b66616@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Mar 2019 13:08:04 +0100
Message-ID: <CANNYZj8dG=S-k3g_G_7wiU6D5ZzCs4iug2spToPMDFv9yzmefQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] binutils: fix upstream version check
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
X-List-Received-Date: Thu, 28 Mar 2019 12:08:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2019 at 13:06, ChenQi <Qi.Chen@windriver.com> wrote:
> I just sent out a patch to change the PV to "2.32".
> If it's 2.32, does this var still needs to be set?

No, it does not need to be set then, but changing PV to 2.32 is
otherwise problematic - see my other email I just sent.

Alex

