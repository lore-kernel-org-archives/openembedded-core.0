Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3E30B77E35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 16:25:56 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id u73so1040890qkl.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 09:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AHhzTReg4bBt+SiJhmzbD/Di+v+NNY7VgN1E7TYUciU=;
	b=oPgwVvM+1U9Bk3KwkNbUvnKByFoBfJmizDpUv8y1/AhaCP/U711dy9alcvMk0r9T/M
	yktG+F2dP4wXsEck+zZu/g2GHXHiiAdoBw4MSESPmW+qsvEYcirZkT52ovvMskafSDMH
	j9xFqTR8QAizYtECjSs74Wuu0WD4N7idSYO9gSfitaiPnOBPxoDruRVUCoDwrmxmPW82
	5d51c+A2l6H6ThwoGnni27ER7vynabFwtHgWbtlGs/h5QLfAXol8ebGhMT5jRaVXiZdg
	KTaT2yOUub4z92g0y8rfslAx7SOzYBoKuWipf/GL2+1GsXtB+LzM/oNZ4B3sKaAdhrVm
	e7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AHhzTReg4bBt+SiJhmzbD/Di+v+NNY7VgN1E7TYUciU=;
	b=q41sFKfMC5S5BUST2571R19wx86F6F1dHYbnFL1Fm9WzP3w+c5OEt9yuy6y2pPfUX4
	QuC9tS6aiWu/YQww/k0XLMRaPwO0nAZ6FFkHolUlH3PZt1WAKddI6uZ94z2zdUQtJwuB
	fN7WbsjWh9F/cmfapvvHD4leQCEovvPl7eQTkdyazojvGMdzrNz8lqqeSsO9sa2SHOcf
	ljrDtgtbv3nmEmaW/bFZJVKWuwH9gd2Baq01jaPkfzv7IwFQKgqrXhmH1HcJjVSI8RA8
	zFpwxOQF6fHwQweQT6x37n1OwPdbh4QzkXq24rTzzKUIcVVCfof9DFruSg1H2tySjKXR
	SDkA==
X-Gm-Message-State: AHPjjUie4mONUAVFndx5JFeNK5f0Ag//He9BFTZFmnrW+6P6ncuczvl6
	sJwMroIukPr9DufaKKCr3xm7A95uqoi/I8njszo=
X-Google-Smtp-Source: AOwi7QDz1g+OqYk6BYQIJctuLB9+4uJ1jrg7OzHA8fTC6XnAt3qqJNqZzR0Zf0iBwm11wmEQyLrIzCJ2zdHgXUbQAvw=
X-Received: by 10.55.15.170 with SMTP id 42mr21343779qkp.262.1505751958045;
	Mon, 18 Sep 2017 09:25:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.74 with HTTP; Mon, 18 Sep 2017 09:25:57 -0700 (PDT)
In-Reply-To: <bdabbc35-fa12-55ae-5387-54da9204fd55@topic.nl>
References: <37a76fa5-4f25-56dd-9616-4b4b23fbb093@balister.org>
	<CAB=otbS8_F_Yhisc+ybm8X1m3GXBzCK1q16YjrWATDArwVf+Hw@mail.gmail.com>
	<bdabbc35-fa12-55ae-5387-54da9204fd55@topic.nl>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 18 Sep 2017 12:25:57 -0400
Message-ID: <CAHUNapRuc6RHNZXHGdN0TO2A0EwRgkT53bqqqM-DcwqKzUz55w@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenEmbedded Developer Meeting Oct 22, 2017 in Prague (before ELCE)
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
X-List-Received-Date: Mon, 18 Sep 2017 16:25:57 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Mike,

On Mon, Sep 18, 2017 at 8:45 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> I can probably bring some work (e.g. Zynq MPSoC board) and fun (settop box)
> hardware along to demonstrate what I'm using OE for.


Any chance you could set something up that could be on display at the
Yocto booth during the conference?

