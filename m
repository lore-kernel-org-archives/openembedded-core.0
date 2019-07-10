Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 261E87EE2C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 08:37:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a15so1309062wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 01:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=DPyDf+wGdnN3tj4r09Pl1rLDSdblBHoula5eUl8BM6c=;
	b=GNstMSASvfycXfgc1IeyXIHnoCvgpdhw7IDvR61nveRpA0XCzTsdgMPdOB+x9qpJd4
	a1GfvoXD8alty0xcwuXVE+TBzdAxrMqsNYvq9bUuQT+l2XPUiCPmtLEjqb2nXfYQ4sBU
	JeC81qh0lL0tPH25gBgXqrIG5nofT8f9V2hl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=DPyDf+wGdnN3tj4r09Pl1rLDSdblBHoula5eUl8BM6c=;
	b=V9CpJVCGcx7hdDMqIiGeA3pEvzHdL68CqLSEpKix/osCvZZzuX/ltdMyPGKhgLI1Io
	DwMLRr0bcT2583v3a7tgpNOSu7QumxjPX6X9pGtZIgIIhR1rKKfDthpj5EacWRNDm1J2
	3IkacNj9iDta51KzozAii79W0Osld80rKCKWRwqf76CXIfsztQmJIA6BCs7mF9XjPOL4
	PvgnnmkWurz0CyJK3zTsZYXmalWE0tf92mkYwS+/n+KOpFDY+aufVd7E6xba4FvADkk9
	oDWEH7gRma1g780FKerjWg53z8GYoE3m55o7GH//PB7JF3dlLaUhrBaGxA2BOmrWqxhl
	gAkQ==
X-Gm-Message-State: APjAAAV49wNd/ir2gJfbnkL8GJzHtsO/yylx/apGsd8bzS9fWLlg2Xm4
	L2/L4WvLcTNIZqWOOe4icWTmLg==
X-Google-Smtp-Source: APXvYqwxV/EZ3Q92yqJwUPwjl92sbcQHn6IflOy3AafKxfcglfLxOd1cV1WvYrwgDA0dLe5sr662Jw==
X-Received: by 2002:a1c:f918:: with SMTP id x24mr3877300wmh.132.1562747866867; 
	Wed, 10 Jul 2019 01:37:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 66sm1167264wma.11.2019.07.10.01.37.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 01:37:46 -0700 (PDT)
Message-ID: <cecd25938a52f8d6941bec0ba67e51aa2363e121.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 09:37:45 +0100
In-Reply-To: <20190705162018.28251-3-ross.burton@intel.com>
References: <20190705162018.28251-1-ross.burton@intel.com>
	<20190705162018.28251-3-ross.burton@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [RFC PATCH 3/4] gtk+: remove GTK+ 2
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
X-List-Received-Date: Wed, 10 Jul 2019 08:37:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-07-05 at 17:20 +0100, Ross Burton wrote:
> GTK+ 2 is ancient, and shouldn't be used.  It will be moved to meta-
> oe for
> people who do need it, but it shouldn't in oe-core.
> 
> [ YOCTO #12673 ]

I agree its time to do this, its in keeping with various other old
software we've been cleaning up. Builds with this included didn't work
as its referenced by a selftest:

test_recipetool_create_cmake

Also the maintainers entry remains...

Cheers,

Richard


