Return-Path: <net147@gmail.com>
X-Greylist: delayed 1416 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 May 2014 13:01:47 UTC
Received: from mail-pa0-f44.google.com (unknown [209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 78AD46FA84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 13:01:47 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id ld10so9099242pab.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 06:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=lABL4hvHbPfxtJeRJ/ml0M+KinZ9MWj8bffgUkESaxM=;
	b=fqaZc0Uagd26IBUfgIznuDO7yNNIz9owzgiIhszSPMAx6+r5puOSuacm/Aa4rOET7i
	hGxEYarTHbIpvuh5ENpxQEUj5U+yfb97YwJ27cwB03dGmRe+FrUiW9kQFO+K/j/mGOAc
	o06ref+2AmwHFNKKwMR2h9zPqJNw86/qmKw2KJf0J38lnZ37FdYKvvyPBrj5wNtDJr0T
	D+5jLGEsluXnCjssJlbrzHbOVkRnzyabcO7491cTxJV0FQ9LqIwO0C2vYhPgc8Tz3/nl
	iayABjJKFJypPDde4zZEs99CzGb9VhTxi7DIDa8fLjkExewgejvLkuzO4/6qjBRvU51J
	QWlQ==
X-Received: by 10.66.164.104 with SMTP id yp8mr36300139pab.89.1401194292762;
	Tue, 27 May 2014 05:38:12 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	og3sm18529557pbc.48.2014.05.27.05.38.10 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 May 2014 05:38:11 -0700 (PDT)
Message-ID: <5384872F.9030702@gmail.com>
Date: Tue, 27 May 2014 22:38:07 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <cover.1400861586.git.sgw@linux.intel.com>
In-Reply-To: <cover.1400861586.git.sgw@linux.intel.com>
Subject: Re: [Daisy - Initial Pull 000/111] Please Review
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
X-List-Received-Date: Tue, 27 May 2014 13:01:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/05/2014 2:19 AM, Saul Wold wrote:
> Richard,
>
> Here is the first pass at fixes, a number of these are requests
> from the list, along with the 29 CVE Fixes.
>
> I also have a bitbake patch set, which I will send to bitbake-devel.
>
> Sau!
Please also include 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=ab6f21f62c108756d910a9a5d13cad00e21ae247 
to fix building on hosts that use GCC 4.9.
I have tested it with daisy branch on Arch Linux which uses GCC 4.9.

Regards,
Jonathan

