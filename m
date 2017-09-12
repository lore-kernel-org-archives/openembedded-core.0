Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id C6934783F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:22:54 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id q80so27765399ywg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=lvEu/7GHiCCv9jIZFQI+n3XY3KP9/2xxwjWrp7JcZ/I=;
	b=CUNlKvStGY5Y7gnzDYS1E9d5l8Yaa4T3xR+E5VnQ9zmNl27u8sxDOZ5ojxI36+mCq9
	7miB4rTsfBBw3JRjSIChHZ1HW84xHFiS81gYSBD2HT+1ofCxpCwYaPg7fpWA4+2JErcG
	Tu5GErtY8xhv9J/CWKzm2dzGwEGmPWgfO+nvLwdqI5FK/PdQChpMfJndEyh+WAidq891
	mRQruJ/Y+HxNFxN3B9DZphP+aXvzEtCWOt7wqgakc63/TYOLKaH74KcYGOnwxPlJGiiM
	c+pZYAc1iiXnslbqqn6LQAFfIisF+vaYj0lEJNM5rpYGrL0OpcjChGlFfoT+qq01OL+X
	+Obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=lvEu/7GHiCCv9jIZFQI+n3XY3KP9/2xxwjWrp7JcZ/I=;
	b=NW1KlyMeJZKtdC8L1P/Uqn5OnsmIepw2cCQVp/TYSZ7X158oOM1lm/SamZiDR79wdk
	itzhnctIQdqkF/tvIKGh1B/TxZbtvN02Fh3E7PAsXCF7XdaXKNZ1jhACKHtRMSVaVbAf
	O5/E2nRByBhsiTPWYZoGxgyMntHmXxj1bs8KbqX5xuHTMSBQPc7LB/t5UnqIfffbBX9T
	ddDEWhoWRcO6tBxahQi9ehiJIFZRl10rog2EmAPuBc8QEs8FQRK9JKPxb8A4Jf56Jp/n
	jprXuJv9gBibgcywhRusGJ9QFyEOj+fgbjsN+gpg04xfx0iPKPoBIjcltwbbiEBItCJy
	2J3Q==
X-Gm-Message-State: AHPjjUj5qtCZ0JuIKj4HIi1h+XzwqjL7w0HPeuu1yzFiwvdV0N9ugShB
	7xPb4l1B2e+1JrbUfcg=
X-Received: by 10.129.120.80 with SMTP id t77mr12326451ywc.149.1505218975381; 
	Tue, 12 Sep 2017 05:22:55 -0700 (PDT)
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com.
	[209.85.223.181]) by smtp.gmail.com with ESMTPSA id
	g125sm3766339ywf.33.2017.09.12.05.22.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 05:22:54 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f181.google.com with SMTP id g32so28031070ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:22:53 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDrDV5mgAck26vwZ2KuLn03uWVsc/ruqHEXeS+5Rvlj/qiDFp+0yESXLiJeMQy7eozBkFoFTmEtO/SuOsKRDSE=
X-Received: by 10.202.199.129 with SMTP id x123mr4631215oif.67.1505218973368; 
	Tue, 12 Sep 2017 05:22:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Tue, 12 Sep 2017 05:22:52 -0700 (PDT)
In-Reply-To: <CAGgRHJpJ87iJzPj3icuxNFxSLvEy5fvp19P1VmbQ9Sq1OR3B1w@mail.gmail.com>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
	<1505209529.18640.15.camel@linuxfoundation.org>
	<CA+chaQcH+Sk7G24o3SGSn=Yw=cvStUHXdU+LtC7A0wts0p9Uhw@mail.gmail.com>
	<CAGgRHJpJ87iJzPj3icuxNFxSLvEy5fvp19P1VmbQ9Sq1OR3B1w@mail.gmail.com>
Date: Tue, 12 Sep 2017 09:22:52 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqK=SS-hUwc53AQQTVBQFfys11hfEfHR5uQBA2hJJyeOw@mail.gmail.com>
Message-ID: <CAP9ODKqK=SS-hUwc53AQQTVBQFfys11hfEfHR5uQBA2hJJyeOw@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v7 00/12] Revamp the Go support
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
X-List-Received-Date: Tue, 12 Sep 2017 12:22:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 8:57 AM, Matt Madison <matt@madison.systems> wrote:
> On Tue, Sep 12, 2017 at 2:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Interesting I've seen this issue only for PN-staticdev package
>> ERROR: QA Issue: go-dep-staticdev rdepends on bash, but it isn't a build
>> dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
>>
>> and the bash is already in RDEPENDS (the warning is shown in our builds,
>> because we use busybox as RPROVIDER for bash).
>>
>> So maybe this file isn't always included? Or something else might be
>> non-deterministic.
>
> Depends on which patch set you were testing against.  One of the
> recent go.bbclass changes moved the sources from the -staticdev
> package to the -dev package (which is more appropriate, since the
> sources are also the header files).  I thought I had updated the
> go-dep recipe along with that, but I may have missed it.

You're right. I am fixing it now ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

