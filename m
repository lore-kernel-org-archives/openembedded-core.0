Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8E40F71AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 09:05:32 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id v186so76831192lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 01:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=jeZW54Gi1fLtNwlisU+UCEbHVE8KU8wIDajohdzAaKM=;
	b=XMVdy4nqaBoPqBi7M5bPDMHRwQN0VOP5Ynkn0rrriD/nrOBWz4l5Q8JFk6CimzMfn9
	bUFuiovsJPVK5s9DEoBweyIVeiuCzBJrI90C2RcpsPUupjKhfBEWCSMTzpTQ5TjVKg9R
	r1x2YyiGFCwF5Je9iWgvDLtSQEsPlvcipK7G1QrasjDJjU46bPGGRVNexmg5SQ/Y008J
	x6eGKlSp2o27NrRTPVT3kJG7wOOhbdjc7z6S12RsrhQA8YERKThYcoq5tlqZCRocQwSt
	sbQJS5wKlUjl3+akuEwAPwHDa0uT9xREgPk1mD+/j5CilKx3tDDCzOsten37d1zPozn4
	61ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=jeZW54Gi1fLtNwlisU+UCEbHVE8KU8wIDajohdzAaKM=;
	b=FwrJqZ2mFvPHbXo9leFXVxw9rcODBYXGfuH2gYeLcvzX4Q0M+xJwEErK7JzTAC3iix
	y5JA1T6/WSALw4cWhudLrVWoo1DSV7bp6cUBR3rkm96BF2weg1Ge4TBxU52FiHii/y5N
	qPsf6e1SIv1NL9A6JoaWmGkd8l4UZsodYPoJjY71RdouU6GrqF2iid4MykvU0W7XOcM2
	AuZ0qTpsauFBbfgG/g4czC78bcZeh2pdQmWMeb9cBfwSIRYVDwqJKdgHcOHfVgDbAA8h
	1dG6x/JaCd5cju1cd4tl3FYbkYL4Yfx5yoD6+M2ltQcGm1li+yYOZhoptggLQY8AVxbI
	Bv5w==
X-Gm-Message-State: AIkVDXKcSO1F0RcVuzb9ADOqaBZp7xMHOJSww5OxUk6Wbp3J0r/hhW8vL6mm5vjj4z7+XQ==
X-Received: by 10.46.72.9 with SMTP id v9mr11517272lja.67.1484557532301;
	Mon, 16 Jan 2017 01:05:32 -0800 (PST)
Received: from [192.168.1.14] ([176.111.205.58])
	by smtp.googlemail.com with ESMTPSA id
	t26sm6855635lja.48.2017.01.16.01.05.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 01:05:30 -0800 (PST)
To: Kristian Amlie <kristian.amlie@mender.io>,
	"Burton, Ross" <ross.burton@intel.com>
References: <b7a30224-1198-ac92-7f70-708196ca7814@mender.io>
	<1483020228-1267-1-git-send-email-kristian.amlie@mender.io>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <f181ed99-ed09-59d9-96a8-cf5d77a179d7@mender.io>
Date: Mon, 16 Jan 2017 10:05:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1483020228-1267-1-git-send-email-kristian.amlie@mender.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Mon, 16 Jan 2017 09:05:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 29/12/16 15:03, Kristian Amlie wrote:
> Rebased patchset, otherwise identical to the last one:
> 
> * Removed e2tools recipe.
> * Switched to using 'debugfs' instead of 'e2ls' in selftest.

Is anything missing here?

Would be nice to get this done so I can start on the do_image part of this.

-- 
Kristian

