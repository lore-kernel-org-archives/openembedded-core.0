Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SQQ2f-00007e-Vu
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:27:58 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 04 May 2012 14:18:08 -0700
Received: by pbbro8 with SMTP id ro8so13334049pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 14:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=sPjv4sJq4x/c0uVWLeuCok7mBXdaOCINHFmx1I36KmY=;
	b=c9upeStX5R1b3GmJzfxE2nLxC/KGHS9seZeJrDRJ3+daAO4WqXH+W+oUeJjwHB9/C5
	c/mU9nEu8I5OwBpv+vKD9WM1i+7wJPZJ1TxoUT2VM8XOZnanQaHaTA2tIsSa8GkLzA2r
	6aJ616lcpmhJQF0lYvwXw3yuT/j9GLTtP3rGhPWsglsy9K7oXTM0v07p0xK0AXOIe3hG
	ge6l2BdSHR903f5P62WjDupX4CWgZFGyTWgbbdEJzR4YlA8KS4/IM9+i9RmeIx4359ZV
	yZX2sr8Q/xynF+4lMjEtEnkCe0piiIOtghsWVVIR09unUwxn4BhLf95tN4rlJ1znsyMs
	sJaA==
Received: by 10.68.225.9 with SMTP id rg9mr22289228pbc.137.1336166288326;
	Fri, 04 May 2012 14:18:08 -0700 (PDT)
Received: from [192.168.10.254] (c-98-246-229-6.hsd1.or.comcast.net.
	[98.246.229.6])
	by mx.google.com with ESMTPS id g4sm9660788pbt.58.2012.05.04.14.18.05
	(version=SSLv3 cipher=OTHER); Fri, 04 May 2012 14:18:07 -0700 (PDT)
Message-ID: <4FA4478B.10102@intel.com>
Date: Fri, 04 May 2012 14:18:03 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
X-Gm-Message-State: ALoCoQliiKHy6XSW2KEu3GXl4NK9wpnZOu1V7jFQU9fMCmYKxpQzjG/9Ld0+pWKxV19q1pTy5G62
Subject: Re: [PATCH 1/6] runqemu: Use OE_TMPDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2012 21:27:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2012 10:12 AM, Bernhard Reutner-Fischer wrote:
> The error message erroneously talked about TMPDIR.
> Just use OE_TMPDIR everywhere to make the name of the variable obvious.
>
> Signed-off-by: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>

Bernhard, these are great improvements - thanks for refactoring this!

Full series Acked-by: Scott Garman <scott.a.garman@intel.com>

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


