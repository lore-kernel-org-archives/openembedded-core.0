Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 70E1977D6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 19:17:38 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id v72so1058496ywa.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 12:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to;
	bh=EHxRiNCMbpr9mYV+8XYcIDC6rmwh70N4lQECVgw+iZU=;
	b=LeGhfFAaH7LxupKiY3ZnrGZGvyCegYTOsLopJusdX2oZWpn3yhmL6sIt0GXRypRbgY
	2gWF7BDevJjgIyefWawXCAWqIYFWExh8D0kaR0WVcKU4giD6Jbz0AnQ7QRMPdj/elOFn
	UWFgz/xQHbdkcuJfzbyKZQNeIVJRLAxxCi2o7qXsRX7Opemqld1Kxipq6HPEdsZZEq7O
	hySj59lKTd4CQCIsDkvEEv2VSlZLoPuiAiHQPZymDMrTy/IJ+UowImR1pZGoBgheXevf
	o0ijPlNhYs9jDkghAaVQ5hqkjWq9Nez6sG6+9SNLXXoG8mok0HkbUsO+4dAUU7TuuPhL
	6bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
	bh=EHxRiNCMbpr9mYV+8XYcIDC6rmwh70N4lQECVgw+iZU=;
	b=jD48LB+4b5qXpPNj48vUEoGCK2YX6XgJCpy43HJbSthJjragyO1w62ZdVCsyUo0Yn8
	DC4ln9zl/2f93dDbEHUf2zIThG9MkpjLUIc/VhHXn/SFx6XiK0qVSvHWSXrOPFW/i1/r
	l3uezaFX6yciD5uMPoVuKU7OClVuEgBURpf15n55aVrBFitkpyegbbYZZOt4s6bMAmVg
	ulScPd2J2IWMvAJAcCI6mJfn2j2w8UFtGY8HtFg3/7ahKI/EiRrhQG1qZMTp4AmwXMSc
	9hfnNEaz21g0TlmBlIuK8jeNwNdD8jT34TI4afLnISBftXgFtiAzNJ6vycPg90srDdp1
	Px4A==
X-Gm-Message-State: AHPjjUgL7IKTn9+c9LmWHk3ydoEx41r+OMoalDo32QbsNfHgNX5q0FLL
	5AxU6kH86WLeRAxsJmQ=
X-Received: by 10.37.246.7 with SMTP id t7mr28362477ybd.130.1505762259947;
	Mon, 18 Sep 2017 12:17:39 -0700 (PDT)
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com.
	[209.85.223.179]) by smtp.gmail.com with ESMTPSA id
	z77sm3289246ywd.31.2017.09.18.12.17.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 12:17:38 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f179.google.com with SMTP id q11so4658872ioe.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 12:17:38 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDeE0x70Z3LUNP8TZjLRFon+jok4A6tdTZ7112BnjTgjyG9rjSiALWg2/eLDXz5q+IIoXOtu4Zc20yn8H3rv4c=
X-Received: by 10.202.177.195 with SMTP id a186mr22841448oif.32.1505762257858; 
	Mon, 18 Sep 2017 12:17:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Mon, 18 Sep 2017 12:17:37 -0700 (PDT)
Date: Mon, 18 Sep 2017 16:17:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq6rzVbzwxWbwzeW4Y71eXNSaHJOPvAXZxSvU1-CQKRtQ@mail.gmail.com>
Message-ID: <CAP9ODKq6rzVbzwxWbwzeW4Y71eXNSaHJOPvAXZxSvU1-CQKRtQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Go SDK automated test
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
X-List-Received-Date: Mon, 18 Sep 2017 19:17:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hello folks,

I did try to understand the automated test infrastructure but ended
lost on how the code was designed. So instead I wrote down a step by
step test so someone which knows better the autotest infra can
translate it.

git clone https://github.com/golang/dep go/src/github.com/golang/dep

. /opt/oel/17.1-snapshot/environment-setup-i586-oel-linux

export GOPATH=$PWD/go

cd go/src/github.com/golang/dep

i586-oel-linux-go build github.com/golang/dep/cmd/dep

This will generate a dep binary on the $PWD; is it possible to someone
wrap it on OEQA test?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

