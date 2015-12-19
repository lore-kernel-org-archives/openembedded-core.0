Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 19DBB731AC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 10:05:15 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id o64so61910137pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 02:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=niJHWWsPf3YbO1g5K/A8dww6L7nIlOhJ4Fl6CFd6RsA=;
	b=y0kQCKt4Q9RfqPgdT3XkX/MTYUZBKuMQLhh8XMW/BEZUvoSgONZ+gKN26/XrgyQkqx
	6/LTzDixR4qUQRrxqOlEDLt/XClJjn2r9EqojGi7roTV3DTSkxm3ddqca89cMw9G0Zne
	qBxM/NTvOfNGNbNTaxV6WlXYtRvOFb/2iHvjFDLts4UDXpJylXwNDVExCy+FamnLbQY4
	J0kX6wB2UOfzFCHSs37MJ/xWTSEw9++0+mE6sg+AbgtflbxIGMc4Bnt1TTOj2I7o+FIK
	QFFMeMQW2eqbP8UC1RbVLyepaYJJBMezBelwmM20IqqBZSsNL8cBo/UBujMWUvM1Jikp
	yLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=niJHWWsPf3YbO1g5K/A8dww6L7nIlOhJ4Fl6CFd6RsA=;
	b=AwvcDanigMAsYIxUqHUInVSi8bi6nKtqOL+6J//e9eBIqdN5rXxgFICFiuBssRd5SN
	FojVL0BbGwLrPU5/WcmlIplPQZNmw0MDMnag7/vwUl1EKpTW5avNgujmgOZYqmsNJALk
	2X0EXzhFwhp0Hdvhv0qLUYw0Oxu4uDMJ6Yqf+5oFtOFG228/bRTVCmYJSgOBCMt1xJfy
	frPzDNCZ7P3KtX7B9L3V8pv6iLBtTDUKewX4sKrklolh38v9z63s1a6t7VxMVHT6OGei
	71DFxx57zmc/7dSIShAlvK0/jxt/6p+TUfWAXxDznyaRhAskO+IVv5FCPRhYnG3s71mc
	gCww==
X-Gm-Message-State: ALoCoQnWYaQkdjbIHBf0RfiRTINYkeeLwYgcJQEIdTUN4TxzzDzNLHOIevBsljBCmqKGoa/fIDicIV+xfezdd+3SLBDbahD6ew==
X-Received: by 10.98.31.204 with SMTP id l73mr12102978pfj.144.1450519516412;
	Sat, 19 Dec 2015 02:05:16 -0800 (PST)
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com.
	[209.85.220.45]) by smtp.gmail.com with ESMTPSA id
	s84sm22949381pfa.22.2015.12.19.02.05.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Dec 2015 02:05:14 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f45.google.com with SMTP id q3so52935728pav.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 02:05:14 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.116.81 with SMTP id ju17mr11937953pab.59.1450519514387;
	Sat, 19 Dec 2015 02:05:14 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Sat, 19 Dec 2015 02:05:14 -0800 (PST)
In-Reply-To: <0aa694bda5500aef7d326fa880c77b726c8c2779.1450471022.git.bruce.ashfield@windriver.com>
References: <cover.1450471022.git.bruce.ashfield@windriver.com>
	<0aa694bda5500aef7d326fa880c77b726c8c2779.1450471022.git.bruce.ashfield@windriver.com>
Date: Sat, 19 Dec 2015 08:05:14 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqJyZq29L7=mFzCVo2=oAX3O8WtyiJ498inW5d2fJrBBQ@mail.gmail.com>
Message-ID: <CAP9ODKqJyZq29L7=mFzCVo2=oAX3O8WtyiJ498inW5d2fJrBBQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] lttng-modules: fix build issue against kernel 4.4
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
X-List-Received-Date: Sat, 19 Dec 2015 10:05:16 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 18, 2015 at 6:44 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> f4b27072


Use this revision on commit log; latest is not accurate as it moves during time.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

