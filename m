Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 73B1E7CB01
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:42:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id n2so21989295wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=SHz5xTzDBM/V1foKSoCKzohDA9QyCNqpiJzEpLmtDdk=;
	b=erMkK8z6ND2r9r9KRNfGvQAzzxoHInYaMeGdHYLEiKrdRna+i8JiUACxObvQJezVf8
	LEWRfN4YTeqH3WCPYiLFLyqXaPc3qN/AK4jFJL8hR2CTzQCoYaYmFfoKasYP0yJ0kqnl
	enFp+kpxT7xVRsjDYQTydeThKgZQhHkru6c9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=SHz5xTzDBM/V1foKSoCKzohDA9QyCNqpiJzEpLmtDdk=;
	b=mDGO13G+Asqq8Vuqa5HoOD5AFERNmEGuAPFwqypwRqyv215XDz3e89XmmnQNNgXJBc
	7jYCrDi1QUl94dUzggA+e0YBDN+m0ELrASEOnBQNzTLjz6GCxC/Ce3OcDxwSi8oeO/rY
	JQqhRGFwm6hQg7annsFf98soYbEbF22dHL3bykaWlP5yi48u7O7Jbih9yPUaY47xORQn
	x5NF5S6IqxmuZ1kkXPqbUjrmsfjGokfgOXuvv2QCIHwGBXh5aV1ZjWnYKiHJgbgY755+
	ZGFNdx8Rb+04ECeG4JsQmuYiilzKj6kIy/YxJ2eiUSQUc+gjvui0B7CQy3565C14Nw5J
	IqSw==
X-Gm-Message-State: APjAAAV4OZyGZq0fV8GML68e7bfHuAUlOw6+pKpzc88MLQkmeLMq3Hw8
	h4Ojr55QS9C3wOcp/WjcdUyNIA==
X-Google-Smtp-Source: APXvYqwf1v6zaQmSs9xto2EveyJxW7yjGEwDVv0vRkoKZquFyf1gzNsiDJgW1hJznqrmnZGFgbbUtw==
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr6206825wrw.314.1551361330125; 
	Thu, 28 Feb 2019 05:42:10 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h137sm5930150wmg.41.2019.02.28.05.42.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Feb 2019 05:42:09 -0800 (PST)
Message-ID: <6fceeb5f5b442e341d151b1cd128f54283a84984.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Anuj Mittal
	<anuj.mittal@intel.com>
Date: Thu, 28 Feb 2019 13:42:08 +0000
In-Reply-To: <CANNYZj-aR8SMXd+Ce0w-EEyO6Ys_6eL3mTuVydP3t1++gPfsYg@mail.gmail.com>
References: <20190226132253.26040-1-anuj.mittal@intel.com>
	<CANNYZj-aR8SMXd+Ce0w-EEyO6Ys_6eL3mTuVydP3t1++gPfsYg@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] syslinux: upgrade to 6.04-pre2
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
X-List-Received-Date: Thu, 28 Feb 2019 13:42:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-28 at 13:09 +0100, Alexander Kanavin wrote:
> Shouldn't we wait until the final release? Is there a specific need
> for the pre-release update?

I took this on advice from Intel people that the pre release is better
than the other version. If we get the final before release, great, if
not this has fixes we want apparently...

Cheers,

Richard


