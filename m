Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 96C4D6E671
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 11:44:59 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id 1so30934337qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 04:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=nE2ByBazbK2v+xBpNbJqu/OaAO/T6DUygcvHSf7dD7Q=;
	b=FoyZFqq2rYNgdoMWq9uZ+VJS2EX4RZYuflXNbcHnIiu5RURoFreCgvOg5WX8/B5gko
	wYxSWbAZE5Ct40BqO50JGxNoDsy5a5X8vP/dfXRMef4xE/MKsE31m6PD3VhbKPGqszac
	eFz4e7bMiRlaBLvlyb8dUmOp2ryIM9Midc7a/FyJaXwNJQqg9y7GNExc/MXhDjOUYjcr
	IpAUv1tGCCjBNsPXIqarQCiFOoZQSbLaRFni+5JWnMO+m+j3aHOSLlM71JJs6kfLn88n
	dcWKt1ZPhCA/Nvb8yC/8odloXmEiTIMTWfChi+jOmQS9r+RqxVHGmZVUAKQD2gn0hKjw
	iS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=nE2ByBazbK2v+xBpNbJqu/OaAO/T6DUygcvHSf7dD7Q=;
	b=YNnXH6CJkBCms1Wq0dyZuWCiqraUm5F7zxPFb1owJO6RlokUbKUclfCloZ9PaGTfS/
	OengNjwVW9tW6kJEsGoGIpGZ0gYiICh3IdTOrKnUQCCrbgQrm215vHjPr/QKwJj0/lSe
	cTHG/M/1PN9CsY7SkLQk8SK9MOJRdbZfULN/Y/8ukScL6d9srz3S2JhhYFSKo1Cs3xMS
	3nU9oWl4lNqiirvDXlgM1WHLdlF1jsLxPBYyIH4VAIyqrKsIyoDgu0eL4vq31Z1hdOaR
	uvKVxIzm+xDMnRKB/DBrrizl0D1kQvzsK1Oj/6dpsKdfs0euz87G14AXLG92n/j64mTz
	lhYg==
X-Gm-Message-State: AMCzsaWQcxff4Jqj5V3BooNm79CilobdbOYDRdyEhKnQmqdC0XsrrMoj
	+Eez6HYz2/c+0JcxEm0qdtCRRdj0
X-Received: by 10.13.217.65 with SMTP id b62mr185601ywe.46.1508154300143;
	Mon, 16 Oct 2017 04:45:00 -0700 (PDT)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	n68sm3366007ywe.64.2017.10.16.04.44.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 04:44:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id v132so24627710oie.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 04:44:58 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Q5+hpuxf7MrB2Zm0K2ob6jOyHSJnfRQtnsI/UL1O4GdI9GaoRcRW3yVjuR4fvnsPwUO0hDF8Qt21GwF8kAwts=
X-Received: by 10.202.205.66 with SMTP id d63mr5127029oig.352.1508154298172;
	Mon, 16 Oct 2017 04:44:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Mon, 16 Oct 2017 04:44:57 -0700 (PDT)
In-Reply-To: <1507922729-17240-1-git-send-email-pbarker@toganlabs.com>
References: <1507922729-17240-1-git-send-email-pbarker@toganlabs.com>
Date: Mon, 16 Oct 2017 09:44:57 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpESN1iuWUnWLtEf9-p9GgaKFRe-3EPB41dCnsy-rUJdA@mail.gmail.com>
Message-ID: <CAP9ODKpESN1iuWUnWLtEf9-p9GgaKFRe-3EPB41dCnsy-rUJdA@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Define GO386 for go cross-compilation
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
X-List-Received-Date: Mon, 16 Oct 2017 11:44:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 13, 2017 at 4:25 PM, Paul Barker <pbarker@toganlabs.com> wrote:
...
> My hope is that these patches are suitable for inclusion in the rocko branch
> (after the 2.4.0 release now). If not then please flag this and I'll look for
> alternative solutions. I don't think that leaving all go binaries as broken on
> qemux86 if they happen to use floating point operations is a valid option for
> the rocko branch.

I support the backport as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

