Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id E416571DD2;
	Sat, 11 Feb 2017 02:42:55 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 75so4334653pgf.3;
	Fri, 10 Feb 2017 18:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=TCT9vDBa2V4HIhnHld3n55KdjxNiWOkio/TutZSOzTM=;
	b=SODmiyz6zhILAk6NxAiU/iGe8pWED+UY9o0m+ioSLgxq3sCYibEeyTlrkBwfM9slxI
	PhAuFr5IAi4oubeWs8EyThqj5awcXnOUa+3qzZ3eGRxcL93K7U46iyX49KdqnSPJ7yh5
	ZvLzTv2Q1EsXm+Bl5x7rpA6GNkdaHFzXCnak2C2eVoqjcdvRldstqccBnMvdUsfDF4ae
	lx44wPOCrpk/0zUNJI6ZOvl6JrNayk0rOEDk6oXtHrewuzXKu5hHN5SL7FrfeB5gq5hv
	awNEA880PZsRpBGQjCoyHBaYWOzmWCpKuTAU7xDgD4eoj7/Pd6BETiz6ANNAeHUYIFAe
	mq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=TCT9vDBa2V4HIhnHld3n55KdjxNiWOkio/TutZSOzTM=;
	b=kcCtu4KPKddmc+iMAXLV23dZdtmypQ3Dxu+h5b0CseeJCM4SysSsDGxM/9fSuFQfmF
	CgHuq3CnPFrvX7upGYsitPnaDmY0VXbCeBfqPQxxiuLjJnWLEB3YGMwr2ei7cCgFO3Do
	CHeflYyD9SYeEQF6BwMzyIa9VpqO74L13UTIUEv1P0WXyTQfImlzFIi4UZrPl02OszbG
	bcdmKPNqTTL5sqx2ztDwguud3AnDC+jCkl01/7osPh2mi1JYweIy7Glik3/rFNohJ1VX
	8MsvDU6mR/Bh9XyMDNLZy3dzp57lyd8TX7wJQzz2uiCKok5SYAReqt9Me51X2niVqrfA
	mP3g==
X-Gm-Message-State: AMke39lHRnziUEWcdSjR6/Hugeq75vqSRgXZp4QSbEQh7TB1ZVLV11IdwKMKvXJ8cv7ibw==
X-Received: by 10.99.153.1 with SMTP id d1mr14687932pge.44.1486780976328;
	Fri, 10 Feb 2017 18:42:56 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:d8b8:aa9e:752b:a51?
	([2601:202:4001:9ea0:d8b8:aa9e:752b:a51])
	by smtp.gmail.com with ESMTPSA id 9sm1597285pfk.121.2017.02.10.18.42.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Feb 2017 18:42:55 -0800 (PST)
To: Ruslan Bilovol <rbilovol@cisco.com>
References: <880586ee-3ead-9581-cb55-f6a481b68ef3@cisco.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <91af7ef6-24ce-1514-4a51-da6b5098d36a@gmail.com>
Date: Fri, 10 Feb 2017 18:42:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <880586ee-3ead-9581-cb55-f6a481b68ef3@cisco.com>
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org, xe-linux-external@cisco.com
Subject: Re: Is Krogoth release still maintained?
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
X-List-Received-Date: Sat, 11 Feb 2017 02:42:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/10/2017 05:46 AM, Ruslan Bilovol wrote:
> Hi Armin,
>
> I see that Krogoth branches in openembedded-core and
> meta-openembedded layers were last updated 3 months ago.
  Thats about the run rate between updates.
>
> So is Krogoth release still maintained?
Yes they are.

Openembedded-core  is maintained for one year after release then drops 
to community support. I have a set of changes that have some build 
failures identified via Yocto's autobuilder. I need to look at the failures.

Meta-openbedded is on list to cycle through this weekend. it has an 
informal life cycle.

> If yes, when and
> how often do you plan do update it?
Openembedded has more of a formal process where we try to do a QA'd 
release 3 - 6 month depending on the number of patches backported.
There is no formal schedule for meta-openembedded. I try align my 
efforts with the oe-core updates.

I hope this clarifies where I am at.

regards,
Armin

>
> Thanks,
> Ruslan
>


