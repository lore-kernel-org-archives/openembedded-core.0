Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 80767601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 04:54:11 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id r2so10198423igi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 20:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=m2+KHv5xjuANPVamGHp63c69fOl1TKk9HfXKWUBZFqw=;
	b=WKRWMmWidWZDhCGVAXi5wL15/fo5Z/WAVuDb4zuBpoqsWIzxYvuSfUesiea538Jrbf
	4gx0NMd/0W2TSuvWoArKXDEIBFa3iLuBptDTBi6JLwfmBIlLsUwnMJVvOMDF0drWvc1i
	cxuY/Wm/gBGQE2ajxess6oHo+hkveARuK3hTrJfNTrd7gB6Q/T/8w94Vh9ZtQXSEjbxq
	N6xnTyBTA2tBAFKJigWAv4tYbpLRL0MjRUQ1aW9zDx+9rEwCtfMCQJFKy8OMRU3jf797
	/8Yvg1Y34l4pvuqFXy2lRig2QadGzeYM+tpi3PqoGeuupvjLYAgRF8mFxtBDO69aY02j
	AjZA==
X-Gm-Message-State: ALoCoQl4ZGg1nHNjCFDaw08tCPWXBKqyiw4kHVzH07QIupOXMyrarMEfp5PbCePi3mBhA9OdHBj+
X-Received: by 10.107.19.133 with SMTP id 5mr55680949iot.58.1417496051722;
	Mon, 01 Dec 2014 20:54:11 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id lo1sm1807977igb.8.2014.12.01.20.54.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 20:54:11 -0800 (PST)
Message-ID: <547D45EB.6060508@linaro.org>
Date: Mon, 01 Dec 2014 23:54:03 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1416934753.git.paul.eggleton@linux.intel.com>
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Tue, 02 Dec 2014 04:54:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 11/25/14 12:28, Paul Eggleton wrote:
> I've then added a new recipe auto-creation script, recipetool, which can
> take a source tree or URL and create a skeleton recipe to build it. 
...
>  * "recipetool create" ideally needs to become smarter and fill in
>    more details of the recipe. At some point we'll probably have to
>    make the process interactive and possibly have it automate parts of
>    the build process and examine the output; some things just can't be
>    practically detected from the source tree without building.

There is a tool "autoscan" which might be of some use here. If nothing
else, the resulting configure.scan file could be parsed for DEPENDS
information and perhaps PACKAGECONFIG items too.

