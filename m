Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 573EF6010D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 12:16:21 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so82506200pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 04:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=mPNlTpjazh1t5UKIrcXY6gyWxePOhgDPXklDBexjsvQ=;
	b=g+gKCBIY2nM5M8uzOTbZYg9fmHVatenq5siluAY7ZXQH2u56cJBx9BEzj4uUydIuPu
	DaNY/x4IEABSJJuoQRUs15Lyjz2XU0OK0d1agNItj8NNUmDorx6kOjE0ari2ilaN2iyJ
	wdTFBf9uI/kmL6euW8YQllu+7a+OI9FeUIJzfOZklwd8OKi9hjESPjfU/nAqS3UbZP0E
	F398UDSe6iyTX0prS9Q6aqqGSXltabcAQwBQl5+JVGwb643aNbpNyg6xgTZgRNLaV95L
	qxJLO8xoR6uNPiu/Pn81EKGbavFqKvlI2Oql9nlPbaCJPBiJKofE7WiaQgdzVLJHQZsV
	hoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=mPNlTpjazh1t5UKIrcXY6gyWxePOhgDPXklDBexjsvQ=;
	b=RhkqR7GNVod4KhLQjeuu9lx7qmoqos4CjzyB+UYib+1HY0CpJLGJmSzC2UT4Xq7CqB
	BHwWKKR1tO68dk+pAidv5MW+U04jHZpPwlP9Sxbl/4T6iq1qV4QfIojYGJWymVAqonAx
	s0M+icX6Ix5ZKkgsjCHLXqHxo/QwvF95YWEdZ2YG7G+tNzBBBNkuLIMjZQnpeGE76mGP
	O5fVxyKCp9tUbXomy+3ixCo3lVsOoglyx8FeV4fNnCLitU2BVS0NsHcbpdx4BNUgeYwH
	POoSbUYtgXT+FkD7nd73CSmb91oyeQ9w39qnHo/NLucSCL2i1mlXZDAwN2krc3qcFDqb
	3vqg==
X-Gm-Message-State: ALoCoQlRX4HgqHJDTRfr+tqvMqoCOSWTv3s9AMov4BDXcmg18xdWRTT4V1r/LnogfzkEshqBH7/w
X-Received: by 10.68.166.99 with SMTP id zf3mr10113214pbb.58.1447935382554;
	Thu, 19 Nov 2015 04:16:22 -0800 (PST)
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com.
	[209.85.220.53]) by smtp.gmail.com with ESMTPSA id
	zg4sm10395075pbc.23.2015.11.19.04.16.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Nov 2015 04:16:21 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacej9 with SMTP id ej9so79767298pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 04:16:20 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.68.135.199 with SMTP id pu7mr10080256pbb.98.1447935380799;
	Thu, 19 Nov 2015 04:16:20 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Thu, 19 Nov 2015 04:16:20 -0800 (PST)
In-Reply-To: <CAJTo0Lay2uuHV_iT8L2mrNDon7jrL_rGEpa9p3e1LE=KKKTEKQ@mail.gmail.com>
References: <1447781210-23924-1-git-send-email-otavio@ossystems.com.br>
	<1447781210-23924-3-git-send-email-otavio@ossystems.com.br>
	<CAJTo0Lay2uuHV_iT8L2mrNDon7jrL_rGEpa9p3e1LE=KKKTEKQ@mail.gmail.com>
Date: Thu, 19 Nov 2015 10:16:20 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrnfYjNyBgDUbpy5Pq_Jsp4jvEDCfGBzP6SJFz31jRmqg@mail.gmail.com>
Message-ID: <CAP9ODKrnfYjNyBgDUbpy5Pq_Jsp4jvEDCfGBzP6SJFz31jRmqg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/4] lttng-tools: Upgrade to 2.7 release
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
X-List-Received-Date: Thu, 19 Nov 2015 12:16:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 19, 2015 at 7:40 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 November 2015 at 17:26, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>>  rename meta/recipes-kernel/lttng/{lttng-tools_2.6.0.bb =>
>> lttng-tools_git.bb} (85%)
>
>
> This now fails on MIPS machines:
>
> runas.c: In function 'reset_sighandler':
> runas.c:535:28: error: 'SIGUNUSED' undeclared (first use in this function)
>   for (sig = SIGHUP; sig <= SIGUNUSED; sig++) {
>
> (http://errors.yoctoproject.org/Errors/Details/22001/)

I am testing a fix for it, I will sent v4 once it is confirmed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

