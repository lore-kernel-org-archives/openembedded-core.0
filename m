Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id AD63A783DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 21:13:56 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id g131so48631582oic.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 14:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=0nZGSqA22bDoXc+kozoqEzt0kBTctVtKCMJYQxmrVqw=;
	b=Z34C2BUgsFwNtg5emd+H3E+iZ50okSe+hom3VGYVvBLex64ROD6hxKgraAv3CplVIh
	oAJgDFpn2I6blWVSOeYjClyfsR0Kj4s7wwx4IYi/tINkaKHGE9s2K4crj5rfMVeSNLSg
	NCUPjo5/QNy21dphw5o+S8nQu38fqk29U52sQpfZuFQGwmATn7IJJ8N4PcOA0XJ72Uv8
	aRFbo0L9Y2RWVUjLiy0FP7bs+HeXRaqAbySNwsJ7EjNF6UIwjJKLY+V582YTdlBAmNus
	ZW6Dr/YPj5Z4GC7VLhtujuHXKMDjNlvVPDr5lHnykiLjL+wQhkgJdT3SHDyVr/6qypcD
	Be5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=0nZGSqA22bDoXc+kozoqEzt0kBTctVtKCMJYQxmrVqw=;
	b=qT+cRvZ8JM25SNrHt0ZMOu5TfXp0WsXisaYi7FKqqh8mYgh80+Ay+92lGO3so6g3wD
	/bdUG4pgaJKWDWVk5tv+NPANCrkWyLERChB5rUgBp3LWlyIoX6GZ+pMgieEOvrHRuPgT
	eM2LgLAASzONl1aFGkbk0xk9+bh88Q875L9RkMCMyefz5Sj4pBB7ewCxhbOszvjIDGfk
	t7OAkIVboqWCaN3RfwpnlcsJlBtmpgJ1FsQtzdQ47d0TSq+0j3siux3iGXNhtUYiIZTa
	eutAQFmQ1ik3nzz+mjW7lGm0rjQjTDytTUY5sXvvBa4/yeniV+XMG8WNYWsB9Js7wCOH
	3GlA==
X-Gm-Message-State: AHYfb5gyDJt6NdqLs3uxOn650npB9kF79QO93gmUz4DoDrXBFzdBD51V
	N7U/xtEJ69IQbjoAuuU=
X-Received: by 10.202.229.11 with SMTP id c11mr3734587oih.0.1502918037308;
	Wed, 16 Aug 2017 14:13:57 -0700 (PDT)
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com.
	[209.85.218.49])
	by smtp.gmail.com with ESMTPSA id 4sm2107500oid.24.2017.08.16.14.13.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Aug 2017 14:13:56 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f49.google.com with SMTP id x3so48785570oia.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 14:13:56 -0700 (PDT)
X-Received: by 10.202.184.8 with SMTP id i8mr4003280oif.266.1502918035757;
	Wed, 16 Aug 2017 14:13:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.247.10 with HTTP; Wed, 16 Aug 2017 14:13:55 -0700 (PDT)
In-Reply-To: <20170816201544.15975-1-fabio.berton@ossystems.com.br>
References: <20170816201544.15975-1-fabio.berton@ossystems.com.br>
Date: Wed, 16 Aug 2017 18:13:55 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqPkUdwoUp0Lc_M-v4842L02Q3HyuJX+JvjFJKzX+ooWw@mail.gmail.com>
Message-ID: <CAP9ODKqPkUdwoUp0Lc_M-v4842L02Q3HyuJX+JvjFJKzX+ooWw@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-native: Add python3-misc-native to RPROVIDES
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
X-List-Received-Date: Wed, 16 Aug 2017 21:13:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 16, 2017 at 5:15 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> OE-core commit 800753069f667cd1664d70b3779150c467e3b3fe remove
> RPROVIDES list to get runtime dependences from manifest file.
> python3-misc is added in python3 recipe, we need to add
> native runtime to use python3-misc with native recipes.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

