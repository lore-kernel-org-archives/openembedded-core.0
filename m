Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id F064B7F93F;
	Mon, 20 Jan 2020 15:52:35 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id z76so30521767qka.2;
	Mon, 20 Jan 2020 07:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ePe1OZRPaE6on2NSQCTNM53LDN9YfER73ka3dCTESLA=;
	b=fPdjFLeJ0ys1GsvGfcAw8NmVzorCiDSWr1DL5qQ3LrwoGztNg9ZhBxPy0WyuByb8ug
	97uumlzlMl8xcLJybhMWMx6sIopFxYEYdnu30/dJk4QNSqpAYQU9iF84BcNiLK33Ipnt
	IpSWZa77VNgzDXCu5MRoDIjBLEi24+a57SFCj8AtdnbIL4TYvQEnQod77rNYQGvoocAt
	Gy8KcR3w0iPMUkTkplFN3fy9ERQnD9wAiX5P7pier8OZwGMY7Zoam1hWEoieK2TX6Z22
	nY0jt3XTwyiApfIWB2hHkMuqLTQdpTwr45jUp1sb0G5VbW+FdPEMz8GQLEvmLFv+QK1g
	ok3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ePe1OZRPaE6on2NSQCTNM53LDN9YfER73ka3dCTESLA=;
	b=kN6GmRVk4h59W/Y3xYkKTgwLMc5O22lTiLjojLMDTolFyQtHdnZsX2bASWD/1LzAj9
	AgWbFv0BUcfFA/cyQANMJe1m54n3guleIZVWncg9DyXvTVRP3T+BgQdWqnEFe1/5QhDV
	qj8vOAgRcT5dd9eX6QbyZ4kLhmDyDb83REb2FesFbeTvvYZfqSSt0DGa5tN28G22KtlZ
	eme1AsobmGKi+0cGa5XmoieYBTKMSl0/oVedj6RgtS3rq9eEPQYQvXdLgp40fiVbih2q
	6b/eT0L1cUc6EyXiothZLHwIjts4w6Y43JGQD7dsKF0bhaukkV5lHuAwB2oQzJmG2y+E
	wJPA==
X-Gm-Message-State: APjAAAWuY1kcUSy+/HhwDeqhafqUEmEAJdnPOpvdJ1HklWxBHXRXjXkA
	mDbyOyNfkljNHV+QgxSYnNRr8aO4oazMfrgtNbud+tBe5Xg=
X-Google-Smtp-Source: APXvYqyMpR3s0738U0Fg60kYh6j8aShE4lXAkoH9Pib3iVghgYJdoJnDWo38lTBzVgXuzHXClsKm32K8Mnt4hFBxYek=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr117130qkg.71.1579535556532;
	Mon, 20 Jan 2020 07:52:36 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jan 2020 07:52:10 -0800
Message-ID: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: python2-less meta-openembedded build results
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
X-List-Received-Date: Mon, 20 Jan 2020 15:52:36 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all

Recently py2 is removed from oe-core, So I did quick patches to get a
world build going. And
here are initial failures, please help out with recipes your can or
care for. Eventually, the remaining
ones we can blacklist for 3.1 release.

http://errors.yoctoproject.org/Errors/Build/97185/

I will post more arches as they become available. If you want to try
the same for machines/distros you can try yoe/mut for meta-oe

https://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut

Thank you
-Khem

