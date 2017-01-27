Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0B97777459
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 17:45:34 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 19so18955690pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=7K821nnwDZVYQ1crpHil5/2XpZD3toinKKd6GUM13C8=;
	b=nUL3+XkCHPqnS39THvYcremzf13ZdJKyyPVlF9tggAeojMw5827uKqt2rXlf7dzJ6A
	bQLMLF5tNaZY2djUpHwIKkfJXLH8UnL8OnKwkooDiDszTpdb5cG+Sz5UJVx+V64Yr85E
	8ZcWzLcm+o2Tq06k+F6ISiaExgsfU70VzYyV/ldpR4nSJ0eeMDBYcQLz30OWDmoplTyJ
	uO/fqQTARIw/WHuXaSJI5l1IFDDe2ugDV/pVlz4xLLJ6k4mzCZ655Lx+wqZwqtq/omSH
	Dm6Yok82sKRZWR6b3lotZRdlqUZqKps5XQMmmskEZKhx0bLqmuY591ihZwcFdlFaLxZN
	RqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=7K821nnwDZVYQ1crpHil5/2XpZD3toinKKd6GUM13C8=;
	b=Jg68ZT06G+W4NqbBFWj2OP0ilSvxpb22XoABcqQ4O0GZmftF8yk82Un0Y5lTXKqy3u
	zyeb6fV2CRa+rF7+FuzOCIBwBHFCxcJIoJU8Hx/UQjGC8D3UwDCL10qfrjKp+C91K9jd
	RVz5YmK2sy6DPsWIZQZZWv0Vb/0g8fCbGkhmSVcW1db4lIpqApC8cSpo0zZVSY9K+oU9
	PrSZbVLil5Cis/VgtuxWZimwWzLcAIqWJBKm7H9dni7ib0jAcENgFVr/Y7IpY/JfL+eV
	Sca/1QXniVqniMvnpguuYOf9wKnAggfW7s3QepR1V62u4ShGtGgb5E7AFxvVCrtMJQul
	H3rg==
X-Gm-Message-State: AIkVDXIhBuaYSQlVKV3ye5TqTMOTb7lJjGPxawKyaGlQ3WafFmXj76aJ+1TOpjPSzq5tJA==
X-Received: by 10.84.213.9 with SMTP id f9mr14194079pli.138.1485539135128;
	Fri, 27 Jan 2017 09:45:35 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:6d8d:a1ec:12d:52de])
	by smtp.gmail.com with ESMTPSA id
	s64sm12914238pfe.27.2017.01.27.09.45.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 09:45:34 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1701270739140.15334@uk63952.mitel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <659f3ec3-3bff-4890-f363-101b360d48de@gmail.com>
Date: Fri, 27 Jan 2017 09:45:33 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1701270739140.15334@uk63952.mitel.com>
Subject: Re: what is the working directory for configure/compile/install tasks?
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
X-List-Received-Date: Fri, 27 Jan 2017 17:45:35 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/27/17 4:44 AM, Robert P. J. Day wrote:
>   i'm aware that most tasks are defined in terms of commands that
> explicitly use directory references with "S", "B", "D", WORKDIR, and
> so on and so on. but if i want to define a do_configure() task that
> does nothing more than invokes the top-level "configure" script, how
> would i refer to it?
> 

do_configure () {
	${S}/configure
}

