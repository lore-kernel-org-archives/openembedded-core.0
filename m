Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8E96E731D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 23:50:46 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id gh9so9520967pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=G8g24xGQrfijo/+Y5Kp0ABZN80suXVdPWGdIWsCN9C8=;
	b=Q7vbOpEo9B437BXWAd3GNWCphouYPvUZMbzOWrctV3kcXBzdBv1wwVRtJvqD/JqWhS
	sS6g571X3ZIrgjLIK348ZxYqJd3LkIFufhY9UcUrOcw3R5OGHR/Ydvw6loz7MS+Zp+g7
	HlTAuB2nf/bDMbIUhhVgJvnjPwk+om81laYPHCiRvvwtPs9bCSWVuqLI7AiD0Cd1NP5f
	MKYLqAMiQjo0Wgk66wnhQ+VUCqN+kDMLinYQOa7UPiZYv8lq7DTpMow/qWkqrJFfWeGI
	mQVWs5d6Dcjgm15kSlHrTaigVpzIWCDqaNVXioX0kzbkx9GSgZFuJ63FwyR4z2GGQNn6
	hxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=G8g24xGQrfijo/+Y5Kp0ABZN80suXVdPWGdIWsCN9C8=;
	b=S7idv4TWRhB53gMWyAmbFFYYtLc5IiLdUG5B5EGv5SxCfIY45L43r/RNXdVxixlUn2
	QrH8Sp0Vn5GdYn3k92rEObhAFUCfRwEg/brrrIAEMlYNBj+UT0eG1ykdwef3gHlPsU7X
	OTEhyqGBYgim4lLn6cJcI9lMsxfikBnNPSreLak9feRIc3GQhVLmJMrN80fJEUBPBIGM
	ESy6Mv3315M5abuYGk+CXVj7lO/WCgHAxKCMiXKc/QUy6/c0GBvXCdy9RIhQTrb95W/0
	uMGN4ZLdhoUvMO/FNOFUOzc8ZcyjnAJNNkF6daKpe3pAqhd+Aweduubd4eJTUayHr4Tp
	MK8Q==
X-Gm-Message-State: AOPr4FU2ThkjpwBvhhJIU/7gu5h14/Cmf9a+aTwV0ezW3ah5w+x1ZnpCwOyX1mu5PJhv7w==
X-Received: by 10.66.246.165 with SMTP id xx5mr27105482pac.87.1463183446849;
	Fri, 13 May 2016 16:50:46 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:c53a:7e08:2482:8461?
	([2601:202:4000:1239:c53a:7e08:2482:8461])
	by smtp.googlemail.com with ESMTPSA id
	u127sm29913257pfb.82.2016.05.13.16.50.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2016 16:50:45 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>, Joshua Lock
	<joshua.g.lock@intel.com>, Robert Yang <liezhi.yang@windriver.com>
References: <cover.1463054447.git.joshua.g.lock@intel.com>
	<20160512141645.GA2567@jama>
	<1463157281.9746.114.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57366854.8060203@gmail.com>
Date: Fri, 13 May 2016 16:50:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1463157281.9746.114.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [fido][PATCH 0/1] Undo ABI breakage in OpenSSL
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
X-List-Received-Date: Fri, 13 May 2016 23:50:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 05/13/2016 09:34 AM, Richard Purdie wrote:
> On Thu, 2016-05-12 at 16:16 +0200, Martin Jansa wrote:
>> On Thu, May 12, 2016 at 01:06:33PM +0100, Joshua Lock wrote:
>>> The backported upgrade to OpenSSL 1.0.2h introduced a newer version
>>> of
>>> Debian's linker version-script which breaks the OpenSSL ABI.
>>> This isn't desirable for a stable release, thus the attached patch
>>> reverts
>>> the linker-version changes and simply adds the 2 new symbols
>>> required by
>>> 1.0.2h.
>>>
>>> Thanks to Martin Jansa for spotting the issue and suggesting a fix.
>>
>> Thanks for following it and getting it merged so quickly.
>>
>> It was already merged in fido, can we get the same to jethro (which
>> was
>> also recently upgraded to 1.0.2h)?
> 
> I'm hoping someone will give me a patch series which does this
> correctly for jethro. Its why I haven't taken the previous pull
> request.
> 

sent
- armin

> Cheers,
> 
> Richard
> 
> 
> 

