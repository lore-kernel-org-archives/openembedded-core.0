Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id B224F607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 23:28:33 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so32071153pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 15:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=4bs6mK4aGPuj7UjtMU7xzugkNm9AH6R+RMxda35Btn8=;
	b=d0HigIYxJG7AvC9JBZ2IBqeEzcvEcGj5iVyvoqBxQ14M6nvRwpuJ+8q4+hF0gqLWJn
	nTabAKrhdY2W9M5whWAweTvbz9Y8+1sXuPN1jOS5ejK1+Js3fQrHg/c5y0237ic4m3SS
	146QlqcCCP85kVMOy5gCK8IrwwuiBH423dm6k+Pr3ZsARh27QsHUp13RZQlI41NDEk5S
	tbvy53NVadm+9yB+ZUbEz2tqLeHL9JAGBuDrb8ZEZUUyd9AvnAeHRKqvfnsYg5WkSfTL
	l2mNEu3TQ16sNVqIMGBwyaJIs5+8qYyGTzxeBRxEhzpp+/k5eoEd2v4FkRKtr7bTgsV3
	Oc3A==
X-Received: by 10.68.218.132 with SMTP id pg4mr36460793pbc.129.1446593313710; 
	Tue, 03 Nov 2015 15:28:33 -0800 (PST)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	fk8sm31575321pab.33.2015.11.03.15.28.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Nov 2015 15:28:32 -0800 (PST)
To: Ruslan Babayev <ruslan@babayev.com>,
	openembedded-core@lists.openembedded.org
References: <87d1vqk67s.fsf@babayev.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5639431F.6000408@gmail.com>
Date: Tue, 3 Nov 2015 15:28:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <87d1vqk67s.fsf@babayev.com>
Subject: Re: Add LibreSSL support
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
X-List-Received-Date: Tue, 03 Nov 2015 23:28:36 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Ruslan,

any reason version 2.3.1 was not picked?

I believe 2.2.4 is missing  (CVE-2015-5333 and CVE-2015-5334)

- armin

On 11/03/2015 03:34 PM, Ruslan Babayev wrote:
> Please find attached the patch to add support for LibreSSL.
> 
> OpenSSL is still preferred, so you'd have add these to your local.conf
> 
> PREFERRED_PROVIDER_openssl ?= "openssl"
> PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
> PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
> 
> 
> 

