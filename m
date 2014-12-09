Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id B9F5072392
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 15:47:25 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id rl12so736030iec.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 07:47:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=EP9zdpdyTJrh1wuVu7urfD4GjMJdCetvNNnFZPRM2hw=;
	b=inKG6CJv8tkObtgRWKo50gSxhi591DI1goiy6saZylv/aDrOvj408bzLgNBKa4oJ9t
	HikZ2y45Oj1c1sF+KlfPdfYn0urUG9JiCCITTsrxPk3Eme65CGPqu8tpT1SvzMBdIRO3
	piGnHrsqy7LVkwB3+ROSS2eYhO55OL+4oP4AunqFgPZGy2W1ws1bdDWDGj9mnM3J9oKA
	yp3VM3p05AFuxZIRm+WMF/CmrPfp8hVwEWxcpp2Ox1OYLq1oGSdxoiSjETBD2ZHiDPFq
	WS0zLCxxYcwj0zMsPZTof3LnGGSgMiqqjIs94sKLX0z4MHVWtSzWbxfGfbek4dvfsYV3
	y8yA==
X-Gm-Message-State: ALoCoQmZFLNg7UsRC7ZgrEmAq08EgExdqTDPhKgRdJV4C3Tubq7zPX+2bs886RYsjMjX6Twcrdzx
X-Received: by 10.50.154.72 with SMTP id vm8mr2897824igb.47.1418140045536;
	Tue, 09 Dec 2014 07:47:25 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id g139sm694385iog.41.2014.12.09.07.47.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 07:47:24 -0800 (PST)
Message-ID: <54871983.1060106@linaro.org>
Date: Tue, 09 Dec 2014 10:47:15 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<547D45EB.6060508@linaro.org>
	<4967625.9osgGDJBx1@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <4967625.9osgGDJBx1@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 09 Dec 2014 15:47:26 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 12/02/14 09:01, Paul Eggleton wrote:
> On Monday 01 December 2014 23:54:03 Trevor Woerner wrote:
>> On 11/25/14 12:28, Paul Eggleton wrote:
>>> I've then added a new recipe auto-creation script, recipetool, which can
>>> take a source tree or URL and create a skeleton recipe to build it.
>> ...
>>
>>>  * "recipetool create" ideally needs to become smarter and fill in
>>>  
>>>    more details of the recipe. At some point we'll probably have to
>>>    make the process interactive and possibly have it automate parts of
>>>    the build process and examine the output; some things just can't be
>>>    practically detected from the source tree without building.
>> There is a tool "autoscan" which might be of some use here. If nothing
>> else, the resulting configure.scan file could be parsed for DEPENDS
>> information and perhaps PACKAGECONFIG items too.
> Interesting - I was not aware of this tool. I've added support for running it 
> as well as picking converting AC_CHECK_LIB lines over to DEPENDS (with a note 
> about some of them possibly being optional). Thanks!
>

Finding "AC_PATH_X" in "configure.scan" is probably a good indication
there's an RDEPENDS on "libx11". Maybe "recipetool" could check for that?

