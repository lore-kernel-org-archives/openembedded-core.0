Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3D87C6D145
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2013 12:33:54 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id k1so2531658oag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2013 04:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=iafVhSPLyHcTfNlmcGeM5T1d2arIeqONJxghLC/JO9w=;
	b=wcBOjFrzu6N6XXWCXP2/mhyM25X7BGwzFEQGlGv+w3oXJRleyh2uqjh7QqfD/axNVY
	41L5ohhTwaPf7s5yTvLK01tFrYwynwQG6q+bUnCT3JNx1WffQr1LU0RRhn8HzJMFBp0R
	orYOghvl28znW3qLmRWmYB/bmKon+v/HN5Bfj+kdLgoPXfqfobfL1/lnacHkUFNpkpe7
	eBU4c7mGZEG6+6Kd8FcyCmzDCscw4xHY5O01LKUXbjsuaf6IWYi18wLFZ8XTGgSIpLTp
	OrXZR1g7xTlwcCo0W0dlrQSn/DAaII1ryOBO7pmKvMkrvL463knT3Khe2uCxusezPg6A
	cxuw==
MIME-Version: 1.0
X-Received: by 10.60.47.228 with SMTP id g4mr15457669oen.10.1385210033548;
	Sat, 23 Nov 2013 04:33:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sat, 23 Nov 2013 04:33:53 -0800 (PST)
In-Reply-To: <CAP9ODKrrie-HbKxLpxHdRGutbkyhTPKz=0DRALPDRm3xWoE61w@mail.gmail.com>
References: <1385159983-29270-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAP9ODKrrie-HbKxLpxHdRGutbkyhTPKz=0DRALPDRm3xWoE61w@mail.gmail.com>
Date: Sat, 23 Nov 2013 10:33:53 -0200
X-Google-Sender-Auth: Z1FUIGelbwuNE-tJPEaelDw1-3o
Message-ID: <CAP9ODKrqt8LXfz0LZiS=W_kUeqgHpNAA67UgQE=p+MXX94CH=A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: patches@linaro.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH dylan & dora & master] image-mklibs: ensure sysroot is correctly set when calling gcc
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
X-List-Received-Date: Sat, 23 Nov 2013 12:33:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 23, 2013 at 10:33 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Nov 22, 2013 at 8:39 PM, Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
>> [YOCTO #2519]
>>
>> When getting gcc from sstate, it is possible to get a gcc with a bogus
>> sysroot configuration, as discussed in [1] or in [YOCTO #2519].
>>
>> mklibs script will eventually call gcc, so we need to make sure that it
>> provides gcc with the right sysroot location.
>>
>> [1] http://lists.openembedded.org/pipermail/openembedded-core/2013-September/084159.html
>>
>> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>
> Nice; once this is merged this should be considered to Dora as well,
> shouldn't it?

Sorry, I didn't see the subject :-) perfect.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

