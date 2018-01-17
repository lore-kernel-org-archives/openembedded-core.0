Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id DBEFF6093B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 16:12:46 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id n81so13484103oig.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=1VsdQGuBL9SrUErchuAz51/63UbFJvbywdS6qakhhU4=;
	b=x+gZxto83pjbPu29Pv5XJt2rhBRq8z4RZtsCJTnJwHYF0s1JI0qk3ogcsnGBL+c6JE
	RwuUPNpfmZuLA0LwlBWMiAZVpQICas4stAXpbfNYBmpPoJlsfUapQUfXHlaTgXiPdrNL
	kZus2vkmHTQBYMjvKJEs5NnRLY7CclIlCmTmTH/Hz0Q6TZLNi8/XFRXuA14sTxnuRN7p
	uGjL5Vaxm3//mfgZUTMkbnJxs0AS9QIhZgs8FaE6XF56eS0kpxoO/CO1Q4sTPIVsQNXK
	t8K2w9hZkjgLqOQRN82jAi+mA87UWAxk/OaimrmKjq281tlcsDynWwfrh6SMXCV9mGfw
	R8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=1VsdQGuBL9SrUErchuAz51/63UbFJvbywdS6qakhhU4=;
	b=Y4qbN2Aw4EVBFe3uI14CX0M1KTnXFYDvB/ZMtipVPC3EUoHkeuFlI4edw5H+cZ6VCB
	0kiEf/Tr/Qn2IoZ8If9cZkBe3xLo8EzYKnZZxcKdPD2malybSRhO4XT3vuOhnYANfqKt
	MtzMyZYOU16v0QxtGA/dSix24r2YaAHwksTkRolHMXvEkzsP2yK6tGt5dY69w/FN8K+Q
	bG+QfTwywp1yqQSJ1V57BxdOkCms03oMTHmvNjvZq+mMOdK/jLRxnxqUNfKKeSOlpkB8
	gAAMC9LC0xKco5CiTEBk1iixrSK/cFSq5SLecbTZFRx15nGVuuq+E4sLNDHhWfQw4Hia
	Wq+g==
X-Gm-Message-State: AKwxytdRmB3KJy1Rs3bfAS1rCMEw9drKrK3hc1T8JRCnehUPB6nbeeQt
	UL2NSTgmX/u3tJqUWYmWgUq0vXyC
X-Google-Smtp-Source: ACJfBosdS8eY5CQwuL99KYZdYk1/rZ+1++/dwrXUnrY6DW88X2LQA355vr1B63kbI85kUIkiNaqD/w==
X-Received: by 10.202.241.138 with SMTP id p132mr1387626oih.122.1516205567328; 
	Wed, 17 Jan 2018 08:12:47 -0800 (PST)
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com.
	[74.125.82.174]) by smtp.gmail.com with ESMTPSA id
	t90sm2261599ota.14.2018.01.17.08.12.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 08:12:46 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f174.google.com with SMTP id p36so9234523otd.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:12:45 -0800 (PST)
X-Received: by 10.157.40.6 with SMTP id m6mr1665675otb.55.1516205565573; Wed,
	17 Jan 2018 08:12:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Wed, 17 Jan 2018 08:12:44 -0800 (PST)
In-Reply-To: <20180116132516.27653-2-ross.burton@intel.com>
References: <20180116132516.27653-1-ross.burton@intel.com>
	<20180116132516.27653-2-ross.burton@intel.com>
Date: Wed, 17 Jan 2018 14:12:44 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrWTqffYr8+=bpKYD0r+gia1yOGKbYkZQ+fMS0hivTCEg@mail.gmail.com>
Message-ID: <CAP9ODKrWTqffYr8+=bpKYD0r+gia1yOGKbYkZQ+fMS0hivTCEg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] piglit: override install target name instead of do_install
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
X-List-Received-Date: Wed, 17 Jan 2018 16:12:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 16, 2018 at 11:25 AM, Ross Burton <ross.burton@intel.com> wrote:
> Simply override the install target, instead of reimplementing do_install.
>
> Apart from being neater, this also stops the recipe expecting that cmake is
> using the Make backend.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

