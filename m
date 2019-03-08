Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 008867CE5E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 04:20:47 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id x7so15321462eds.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 20:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vmrSz3Il1MJ1FA/uo/RuItqpwCEc+eTP4uG728T+InY=;
	b=h6Flzylhk+X0k6nkowkBhDJKdhwBMNDZ674osTpyEMyhG1bBV1q1zUMDJfOx9RnjOK
	2hi0MJi8+ez8R25uu/dl4ayeImfM2dfNlt0wiLy+D9g6KJr+mWGRhgFEPC3vBJqxrPUg
	CVQkChkFIUXdL/fuCILz8EaAeYTjiI86i2NEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vmrSz3Il1MJ1FA/uo/RuItqpwCEc+eTP4uG728T+InY=;
	b=s7NHDJPmtv3YCw5kbbavc38q3/wjiTqYaJ5bKBp80AfWYd5E7LsNTKaRdvpulfBI5R
	db3cLZuFlxqkdwWij4kARvtQqNjKTx2ZhQXbkMrbeMJl/QkbyQE2p1nyN4YjTwE83ZxE
	JRkyAWk5UE6t+vmGMoPMldJdr18Y8DXxUnRwG717VdtDsZxPDFrFLrPMDQYlqlBY9OOt
	ag1IiwSuswdHFyDPliznQQKgWt9ccmvglJGQgzUo5P3AM+Eo7tkpAKp9mPypn2457CEH
	IZBu7ViaYU2HtjP0Ada2yuRb4aYmRUABXG6yS/ncj0V+v2EtF40Jyh3sVUbSWz11W07p
	EXpw==
X-Gm-Message-State: APjAAAVKmCpy3qKhrFo+y60BPru7pfy6t3b8eZQ/l/IKiJa6Rbby7jqY
	puRTO+NdCsk4Uh1q4wg3tycpJw==
X-Google-Smtp-Source: APXvYqwaCRae7D7c7Sc5TWLz1PW0L8WAQzEWil0YJfGjuX44b9GnQsFgkDDVNp4vFG1PGgCVXyq4Kw==
X-Received: by 2002:aa7:da0f:: with SMTP id r15mr30924566eds.34.1552018848500; 
	Thu, 07 Mar 2019 20:20:48 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-606A-AF5B-88B1-B23A.dyn6.twc.com.
	[2606:a000:1401:880d:606a:af5b:88b1:b23a])
	by smtp.gmail.com with ESMTPSA id
	c50sm1897128edc.81.2019.03.07.20.20.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 20:20:47 -0800 (PST)
Date: Thu, 7 Mar 2019 23:20:42 -0500
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190308042042.GA5026@bill-the-cat>
References: <1551882973-8710-1-git-send-email-trini@konsulko.com>
	<1551882973-8710-3-git-send-email-trini@konsulko.com>
	<c7b91b44ea5055df61ce39287342dbf7926d970d.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <c7b91b44ea5055df61ce39287342dbf7926d970d.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/4] inetutils: Import version 1.9.4
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
X-List-Received-Date: Fri, 08 Mar 2019 04:20:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 07, 2019 at 09:50:51PM +0000, Richard Purdie wrote:
> On Wed, 2019-03-06 at 09:36 -0500, Tom Rini wrote:
> > In order to have more robust stand-alone network tools in oe-core,
> > bring
> > in inetutils from meta-openembedded/meta-networking.  This imports
> > the
> > recipes as of git commit:
> > commit 408204073e6bdcd8ac586e05d5b75213417673f2
> > Author: Martin Jansa <martin.jansa@gmail.com>
> > Date:   Thu Aug 16 20:39:15 2018 +0000
> > 
> >     inetutils: fix build with glibc-2.28
> > 
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> 
> Somehow in all the noise from other failures we missed:
> 
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (/usr/bin/rcp or /usr/bin/rcp.inetutils) does not exist, skipping...
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (/usr/bin/rlogin or /usr/bin/rlogin.inetutils) does not exist, skipping...
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (/usr/bin/rsh or /usr/bin/rsh.inetutils) does not exist, skipping...
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (/usr/bin/talk or /usr/bin/talk.inetutils) does not exist, skipping...
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/bin/rcp: /usr/bin/rcp.inetutils does not exist
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/bin/rlogin: /usr/bin/rlogin.inetutils does not exist
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/bin/rsh: /usr/bin/rsh.inetutils does not exist
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/sbin/rshd: /usr/sbin/in.rshd does not exist
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/sbin/rlogind: /usr/sbin/in.rlogind does not exist
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/bin/talk: /usr/bin/talk.inetutils does not exist
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link == alt_target: /usr/bin/rcp == /usr/bin/rcp
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link == alt_target: /usr/bin/rlogin == /usr/bin/rlogin
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link == alt_target: /usr/bin/rsh == /usr/bin/rsh
> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link == alt_target: /usr/bin/talk == /usr/bin/talk
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/374
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/375
> 

Hurk.   Which self-test do I need to run to see that?

-- 
Tom

