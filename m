Return-Path: <ross@burtonini.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD570613B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:37:04 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id l16so3628772lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YdUsD/UoIOLdbU2U4/Kd6Y1oPH9ct88k+56EZ/2kxcg=;
	b=EN9zmXGy+5G9VZlgt0cLIAs5nP3eaexXp4PaGDY3J+SPmqBaX+Tey9pSfJunfnbLhF
	d3Ony7898mETh9X0fHu/bSZHnpqq5Ek3RdHKJRlUMuKF3Z024NFbwivFlZ7/m7O4Wr38
	89ejh305fwyvYoxT+2fptTnbgniFxkdjrvmcdJRswk7IBkYC8hpBYCuWnWtps9/Zy/g3
	Xl97MUWTMA9kIzJhdTeolA8+DBZOXie0XEGiTouU/djSuafEst/OlSaRzbvyl/t0oFHw
	zmEUThsLU3ZnWQbL48ppTaOmfri7x9RecGXRHYuVz1KUWK7leO6+A7aylQBdU6Qx/Krz
	YKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YdUsD/UoIOLdbU2U4/Kd6Y1oPH9ct88k+56EZ/2kxcg=;
	b=axn+Q0H9DDwlJiou10eMe+LBe+KQY/ChqMg5WTQjSonZ3kjVkJ8bY+iwt93WHbEfwn
	mZmmalUSSt16X0xNU5G7Y/fHG9Q3ITpFn0FO1husU5N7CBoll16vqffzsFdhg359Bj3N
	cpqghS9a14RPVVwFI7ILIsPoHxNodtYnzQjm4a+58Mma329oOmbX/SNhsBQVAtjXCFOc
	iB+ZCQ6WggScCntcocYOhGyv6BP18Jeo5WiD4xRm3o8BfxFCUtalpUkPzYzZOAPV5q9M
	dmwx5ecarcrVkJxdq7fKn2krS6TFLHsMo9WSSf9wn3wcPgeK8Ayktl8sDau1ikYrkMBN
	UTQQ==
X-Gm-Message-State: APjAAAXLMvkfVQGrqqkk3cMTRslQqk6SDx5lnP3I2d/DZ5ISwK1v+nUn
	tFfkPb+sIpTOYJtSKdepgkqo3JltdrOT8Jyqd9ACYw==
X-Google-Smtp-Source: APXvYqyflgC2bbhGbgtJsKjmuPrfpJoQjN7c5ofQeNKFi8vhjnMS+VI5cg1ZjnkdcwcnOgrrrZ2ipxN0/1E75rXxeO4=
X-Received: by 2002:a19:7515:: with SMTP id y21mr16988606lfe.45.1582216625228; 
	Thu, 20 Feb 2020 08:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20200220150318.20003-1-malus.brandywine@gmail.com>
	<18c55700df9ee84ea44fbffc93ba4e9f3c0e1663.camel@linuxfoundation.org>
	<CADz_WD7JjTriaEv2Yo0WpjxfMAuR4o-ML70zbZJne+6kYR+5TQ@mail.gmail.com>
In-Reply-To: <CADz_WD7JjTriaEv2Yo0WpjxfMAuR4o-ML70zbZJne+6kYR+5TQ@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 20 Feb 2020 16:36:53 +0000
Message-ID: <CAAnfSTvx1F6fA6venmAywZ-=TXLVzPcSMbnBW84E=byW25+=Wg@mail.gmail.com>
To: Nataliya Korovkina <malus.brandywine@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Set default CONNECTIVITY_CHECK_URIS to https://www.yoctoproject.org/
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
X-List-Received-Date: Thu, 20 Feb 2020 16:37:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2020 at 16:30, Nataliya Korovkina
<malus.brandywine@gmail.com> wrote:
> https://www.yoctoproject.org/ is good enough until the project is on.
> https://www.example.com/ doesn't exist for at least a year while I'm
> witnessing it, so the instructions of "Quick build" don't work
> out-of-the-box.

$ GET www.example.com
<!doctype html>
<html>
<head>
    <title>Example Domain</title>
...
<body>
<div>
    <h1>Example Domain</h1>
    <p>This domain is for use in illustrative examples in documents.
You may use this
    domain in literature without prior coordination or asking for
permission.</p>
    <p><a href="https://www.iana.org/domains/example">More
information...</a></p>
</div>
</body>
</html>

Works for me, and everyone else presumably.

What specific issues are you seeing?

Ross

