Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4748D6C1D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 13:03:38 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d17so17515339qto.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 06:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=hHRi2/l/RUDG9E3WRh1HwzTuDIvNuPuEg0RhisEFRu0=;
	b=vBDI+Tljz/yiJosnCy3UOqoPNe7ZF109c0bp+d9sHfe/hd19ARF02hL4n9YiwBJkWt
	/y1SDDmTsNvW6MKMWMVf4FlqrBkNdXg8B/ydo7YfTXwNc3GC7HNCeMN2OyEkUiaDAZs0
	ULW5IuuENeuJMcXAKfg8BFcWc4sCr5UKf7QTanYdcfjcrnG3Woq+BRxpaAuTVXFFbrTD
	RxRE7qzECBrkv5ZVcXlJloVNyJSIbxboFkl2aBHmTIKVBgSLo38MOzIT856ytn6++7tN
	KmmGrMTLR25+Tid7KnqjgzKdm55tI6AQCOG7IIEOmwvmkNhf8gq5rFOSqYxi/VWAroaF
	lMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=hHRi2/l/RUDG9E3WRh1HwzTuDIvNuPuEg0RhisEFRu0=;
	b=hj0qD9mmqjM+Syt9++KM+tYXcAbB8FGejcQmVkgRWLzm2K3euLBISg/Pe8Gb/i9eOu
	VB4DNlJzHbYTEDgrkl2Gi+skBI2D0T4HHrzBJ61TjfgXxVufzDXvjdx7tX33hwu6FC63
	j7ZgeKEy6WzOdI5j0yReBw1/j7p92KVvrXL7+M0jvZxzkxcGj/Qj5zNngOYxfVgriWld
	McUKAtRRB/2GGTBx1nyxJxXUzSSgbt3syS1qExe1C/YIhc0c5Mv61LKG7JR0eKTECXiM
	X8hXF1XVAmkT+qagPVr4Fgrdsg8FgpNkpO6kU4Aijjkfmp+DFRBIvl21uKr/ihj/oGv7
	O17Q==
X-Gm-Message-State: APjAAAWJ3uYiS5HMaXskzW4wf16jk8IFERrzOFhc2slkl+1LqaRRVhLM
	hGVSfFs7gQBJWB4+zuvGa5NDQW/j7uSAu1eBbLV0vRpTan3i5Q==
X-Google-Smtp-Source: APXvYqx1Hy7cpEecU+UNDOryun1sVNLgST9e+o4UUGCi1jtdGfLG6bWSv1MIhkhZV0vpKrn1Ij6qsvzZJebccS5QInA=
X-Received: by 2002:ac8:768e:: with SMTP id g14mr9074764qtr.378.1571835818613; 
	Wed, 23 Oct 2019 06:03:38 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Oct 2019 14:03:12 +0100
Message-ID: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: new meta-oe failures from master-next
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
X-List-Received-Date: Wed, 23 Oct 2019 13:03:38 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard

New master-next I see these fails

https://errors.yoctoproject.org/Errors/Build/91645/

First two are important one's we already know why
ti-display-sharing-fw fails to fetch

