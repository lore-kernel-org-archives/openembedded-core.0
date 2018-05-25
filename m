Return-Path: <daniel.diaz@linaro.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E81F674C68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 14:32:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x12-v6so32720455wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vM9rEmUOpc00ioONJqx4zq9XrhnU0rl7wvfzaa9jkV4=;
	b=h1c7QzDVwg2RhSn0QmRkCyIiLx4mJZcUHNTHy4dlzJJM2oVcGLVGRJFMZ+K2qZW/cc
	48wlMWt1Hl01F9O9uAR9WY2sHRm38vaJnTlODnAUJz9H9YTud7ZZnNRKlx97T1d3f6MY
	cKwC8QgD+tIcTk9VcrsjbZJlhCkBgk53jBxr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vM9rEmUOpc00ioONJqx4zq9XrhnU0rl7wvfzaa9jkV4=;
	b=Y33ATWKxsSwv78vKJ2fQDpV6/axcMIOS3QOGfNsGd/O9btXfw4IxjKSRMIVKCz/guN
	DaNVDgc+8GBZLDY3fHdOEdffuf9s7HZG5lCy9ecLczr0WSR1l1pEKIp/qGlt7ZHIpru4
	PCqxxdh9z4KgMtpNTrye3vIS/FbJS3RWfGi1l6WHXeR2GplwHKaVqwW0AjFi63F0OZ5/
	Rx46LqrfXraLJfjZY2NB04QbTllVa8XiD0EAi/RnJnVdIoGF7y1dhR5A2cIrvFmls+QU
	JAKvsy4vjwEWpKARl5b6K0RYGlwthRnO7wJwcOeYICnDEnV0bcQPG/+LetVGpw5RjSYW
	3pAA==
X-Gm-Message-State: ALKqPwe4DD21oadOBXgeOvK6MPKWca6/cY4GQszc0PDc+pXtCwp11nFo
	3ZlWfYILDnYmskPHleKxwVaSXd+BY93IsAfq4elGGw==
X-Google-Smtp-Source: AB8JxZpqnpL9UDlTw+qup+CzEWMaeki+E9Cs7GpHncBkkqC4TvmdmxCHyafkSNfoSmT0Bon1jkCHVqqpNg5ko7ZRLM8=
X-Received: by 2002:a2e:6e10:: with SMTP id
	j16-v6mr1909808ljc.61.1527258755351; 
	Fri, 25 May 2018 07:32:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:ea12:0:0:0:0:0 with HTTP; Fri, 25 May 2018 07:32:34
	-0700 (PDT)
In-Reply-To: <20180525052518.GD1395@jama>
References: <1527194374-2490-1-git-send-email-daniel.diaz@linaro.org>
	<CAHUNapS-0876NrNQB8=hwNSOHz3GSAFxZ2MkkovhvseSQgdPAg@mail.gmail.com>
	<20180525052518.GD1395@jama>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Fri, 25 May 2018 09:32:34 -0500
Message-ID: <CAEUSe7_H5YGLoiRTurNsMdr2FhDVsLxs=ZmE1uSDk636FcxK-g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: bump to release 20180515
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
X-List-Received-Date: Fri, 25 May 2018 14:32:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!


On 25 May 2018 at 00:25, Martin Jansa <martin.jansa@gmail.com> wrote:
> I think it means that he didn't test it very well, because just renaming
> the file without updating SRCREV didn't bump anything and the old
> patches still apply cleanly.

Thanks for pointing that out! I was thrilled that updating PV and
building and having all tests passing as it did before went smoothly.
No wonder.

Will follow up with v2.

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org

