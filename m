Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6C2F972544
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 18:08:23 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id kx10so12285517pab.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 10:08:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Be0xi8vMlHzHd0TqHHidH/xDiJ5Hhf8wy2awAZdGlZw=;
	b=Ls0OioIRcOB6sixvw0r9HBHJA4OAj4YGoVcLuGh3Ar0rg1h1s5CKoRqLz14tLHqZ11
	LYN86WN804zSu7+hXd56IozAwzTFuLc02bw2c5xBTSLoPCrO5cvNmsJmld8L+dl2Elul
	uEThKoy5U4Y4/SGvCY9KqY/o47uFOpsB6R2lildx3sMY7itPR0w+YJeZGnVN7z54QAKT
	w3V4RLZwffBIv43MgPP+ZsBiSJRV/7Zm9BidbE7uP3Q5I/85kumE7KuR+B+G/xKbfBrd
	QV3n8nbA4we6RoAHLe9zAQpLPJkcPmTi7eLU29Mcynhj8QDFD7Z5AwokhowQ6TQZTfl9
	wbnw==
X-Gm-Message-State: ALoCoQnVgmjSU1qUeJRAH5xVAQlntO2EKwZ1hnJ7LVCErlL/82uQVww4FgiQBKyCdVAmyFv5qEi6
X-Received: by 10.66.139.234 with SMTP id rb10mr53125306pab.146.1418666904734; 
	Mon, 15 Dec 2014 10:08:24 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:1d1a:5082:6eef:d127?
	([2601:c:9380:601:1d1a:5082:6eef:d127])
	by mx.google.com with ESMTPSA id qq6sm7871954pbb.20.2014.12.15.10.08.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Dec 2014 10:08:23 -0800 (PST)
Message-ID: <548F2393.4000800@mvista.com>
Date: Mon, 15 Dec 2014 10:08:19 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1417647118-19527-1-git-send-email-sgw@linux.intel.com>
	<548F2263.60807@linux.intel.com>
In-Reply-To: <548F2263.60807@linux.intel.com>
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2][dizzy] lzo: add debian patch for alignment issue
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
X-List-Received-Date: Mon, 15 Dec 2014 18:08:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


ok.

- armin

On 12/15/2014 10:03 AM, Saul Wold wrote:
> [YOCTO #6994]

