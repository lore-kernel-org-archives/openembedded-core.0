Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 733AE79DCA;
	Fri, 14 Dec 2018 04:45:04 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id t13so4932760qtn.3;
	Thu, 13 Dec 2018 20:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=BqsbtGoX9FT2A/OwGsltwamI9YQ593Ym42zrsEMBHT8=;
	b=ms9aCUTWpjOh2WPqZ4nUb/UXgWEhkf2R8erh8ldt6al9Y3FTpQjDUEL5danUriNp/N
	Mm4UdF9I6eY51DszXc/w7AzOS1iFrkmDCyfZ2OIODEUM4mWq2TI4P0WixAb/7RlZJOhx
	9ABUhRJIcGH1BigAyVGipkzJZPLDhceCzsnjkbnZMGylQaeNqpoalSnmpzW26FWv1vtw
	twzOv7ILh01qbN+z0rZ8aI3iYN7eYi9sKs6yT+wpeRQdAigvdDOKPLof40FBz5XfQxYn
	by2oVeBjpHX6GvPCIYzpzyIBZJz2wOSoLLgT0HkX0JMJ/4QH/OnBYlVvlMLqW34gNCvE
	q4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=BqsbtGoX9FT2A/OwGsltwamI9YQ593Ym42zrsEMBHT8=;
	b=N053S13BppbBz2ko4G+4aZF0B1Vf0fHsFbC0JvAW8dBQ8oG2T+bpL/VvE2hbC3DgjW
	BrdMuQRK7bB9R7rlcIDE+AhmpXtEE4FScX5jYV/+IBn/luEWhG52UEuuqdIpmKn0gTKc
	28LXCDrwZhRQg8RUvbSnT9ra0HjQg16vKb+uMYlCW0uhqzu6YgVUTo91JbOKjBgdH6gy
	RGnjhGVlEfpc8g7INT3mpwBAovzmh1ng0W10oW8sbpLY2zt8dn2RMdJPQ+SNVgF59INJ
	8e+J4lcJc5fKc/qgWrWeyDbXPgx8jT+wId7TuHlKk5zmiUGdvdt59M4VnqTQ3HOZ0m06
	Cu5Q==
X-Gm-Message-State: AA+aEWZQIp1dZb+WasOt/I5/FjvLblzaNp7jjHBV1lRS8l/tpg3qmjHg
	HHsS0isb9Jh7g3jqsb+sSoo58DkbfnRpYMtcdnBq3blRZgA=
X-Google-Smtp-Source: AFSGD/UwWgKhtAfKWGEGbaaYroMGh3WK65DnQDvi+HLiC9GdJ64HI5bMwTJSxH48liUwZYbStADAJ+rzkB9HvglcWio=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr1420589qtk.253.1544762705001; 
	Thu, 13 Dec 2018 20:45:05 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Dec 2018 20:44:39 -0800
Message-ID: <CAMKF1sqqqGtPnzWNnGSvRkpDuuqRmBr1O3i6pLzN_A7asQUS-A@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFT] Glibc 2.29
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
X-List-Received-Date: Fri, 14 Dec 2018 04:45:04 -0000
Content-Type: text/plain; charset="UTF-8"

Hi All

I have put together recipes for upcoming glibc 2.29 release early next year
since its such a core package, I thought it would be good for us to give it a go
and iron out regressions still when there is time to report and fix

Please git this patch a shot in your spare time on your machines/distros

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/glibc-2.29

Thanks
-Khem

