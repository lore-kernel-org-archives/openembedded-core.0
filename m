Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC3D77CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:26:55 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id r16so11570757ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 11:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=yKM4e/dFBk6vulQ09Tqmo9D3S9kQbPTqizowLG+aSkA=;
	b=A/xArxK9c7Gpv8/GE9xzohSSDh5+dkAtH0cDJYz1Xc2eh7VWHnajdIGgS9tZPGkljM
	GIiGNyCzXYf16DsV645y4Vh/kB8OWwqm1GSLGDU/8MtX4N3MXOCCtJQ5/hw2hClfBiB8
	4Xx7gv/0yGIyOywHNWkeEb0WI7K/vYnfhlLtYkI1oPBIoLL+bgxn+ws/maoR/ERYPzA+
	UR9wFp/AAkiTFIvoEj2jLROWFW/nFf6VbgrqaH/hjxDJwejfNR9JJkwsqIMAJfS8CTKw
	0m4JopeibP8PAUr+w1BWwCD/3OTMGViGQeZBg9P7CT835tzjJFeUR44fx8w4IB4entGr
	HUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=yKM4e/dFBk6vulQ09Tqmo9D3S9kQbPTqizowLG+aSkA=;
	b=U/EAGSpVJOaU8uBUAQmlj7Cm+RVraGxYwT9sUhcSgr49/AxgpNn9kzugr7aaFvL9VS
	JaXYaFvzMWE36E8JX491OIQwK6G0Yye6PB7R+q8iyevTWrKai0eeehgkzLBNGpWEVTsE
	NRzU1q9vF2xfBLOuSpNFaTGgGhptXkCjxouBNiYK9zQ8HOOQcUnhlYHTJ+bKbzPgtxo/
	qmyatJdmcwFGtvgnPXge1tVOF63kiLhZWBHar5JPDDAHRV4JBpiqv42nuA5d7s1egG97
	omfCxOJ1mdiUGFSAAdEY/dmwwgbjVfJB9z5Ep1F/dbZ/WFOtXFCzp+riTjTzoJb3bmrq
	ntXw==
X-Gm-Message-State: AN3rC/7hRf83G37WwWJJbsGA5lpYdSwj+XahisqBhi+/AiKdmvOPzWE2fMz9HFM0/KLi1JoU
X-Received: by 10.36.123.16 with SMTP id q16mr18687492itc.52.1491935216782;
	Tue, 11 Apr 2017 11:26:56 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D3A2.dip0.t-ipconnect.de. [93.232.211.162])
	by smtp.gmail.com with ESMTPSA id 9sm1242365itm.6.2017.04.11.11.26.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Apr 2017 11:26:55 -0700 (PDT)
Message-ID: <1491935213.10884.208.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Apr 2017 20:26:53 +0200
In-Reply-To: <CAMKF1sqjTfvVuQp=MLP82G=WYPg7LJ0OJ=SgMJb8dsd9TxDiKg@mail.gmail.com>
References: <1491828558.10884.112.camel@intel.com>
	<1491928471.10884.196.camel@intel.com>
	<CAMKF1srOa1mWXXRvF9_EXrUFiy43_K4kAC4i9aYdpsm2hTJQNw@mail.gmail.com>
	<1491929552.10884.199.camel@intel.com>
	<CAMKF1sqjTfvVuQp=MLP82G=WYPg7LJ0OJ=SgMJb8dsd9TxDiKg@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: go-cross: incorrect dependency on tune-specific libgcc
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
X-List-Received-Date: Tue, 11 Apr 2017 18:26:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-04-11 at 10:01 -0700, Khem Raj wrote:
> On Tue, Apr 11, 2017 at 9:52 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > On Tue, 2017-04-11 at 09:39 -0700, Khem Raj wrote:
> >> I think TUNE_PKGARCH is the granularity it needs for setting GOARM
> >> anyway.
> >
> > So you are saying the patch that I had proposed initially in this mail
> > thread (go-cross-${TARGET_ARCH} -> go-cross-${TUNE_PKGARCH}) is the
> > right solution?
> 
> no, dependency on libgcc should be removed from go cross if possible.
> Its similar to gcc in that regard.

Good that I asked, because I understood "TUNE_PKGARCH is the granularity
it needs" as the exact opposite ;-}

The "if possible" part is where it gets tricky. There's this comment
next to the DEPENDS saying "libgcc is required for the target specific
libraries to build properly" and I simply have no idea how obviously
it'll break when removing the dependency in go-cross.

Anyway, I'll proceed down that route by rewriting the go.inc. Note that
Richard correctly pointed out that the inclusion of go-1.8.bb in
go-cross-1.8.bb isn't particularly clean, making such a change a bit
more complicated. But I don't want to move content around too much just
for this, so I'll leave the cleanup to the go maintainers.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




