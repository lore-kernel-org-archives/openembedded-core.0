Return-Path: <akuster808@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6F93A731D5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 02:26:58 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id b14so249788qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ePhz6TPiUXO4nGPjzkU2V9xZi15eLe3JFV1xZNYv1fQ=;
	b=InxAQtTRtmWcfgezDLo24272CWznKoi5K6uCKtuxv9waLdfng1C9IRZHOuMo5/Dx7d
	xUbcXVBVWETUe8wrJitRM8GoSxqN1zeC76n9xbIPuzMGwY/n7krK0tI8nilgAIzoYtFP
	Djom0ONR5CvyK3fVJPXVMoRoyjMVQnTJ5AxVuufQS0ZDxfyACjYoGK/tv5XDwbPZ1yWm
	eU8fSeMyjK+MXx0OfP7bhpbcgRMeYeG/EnLa/frpeAGhcaMxfNDXZSVqADQ0MDUdbkke
	UdPHXa6xUXTg1alJIZg/Id5LKpiQGGmpb3bt5wOmJ7i9tRMvZRL9DrkruaEZhi7vTv4C
	s4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ePhz6TPiUXO4nGPjzkU2V9xZi15eLe3JFV1xZNYv1fQ=;
	b=igHDA5d4DxQYpWFMT5koG7fg6iMHVmXrcUj9HNA/gbRymlvKRaAFsYv/mTK0gUZeFN
	FMSS8XpZblDZxVvp3Ryo5cFneV0NlhzaRP5261lyji3hVPerVxhOYqUSSRf7gae6qF8Z
	rGFB42yrAWa2xzUdQPYYkEkLKa5OZtzCuwAUoN6kbm04CtYeyAHn/k3MzfMFtkU5h8Df
	96rXxwZ0ypNRsttAthY8f9og5edHTsOPHcmouJlrKnK+Aernd2VllkHBkzZjvnsEunbT
	zOFhLugE93JrhQl1Prq2VT/WWYOiH7bbsAb958J6LKfSip8jczs7qfigvBYoFpCOxqC2
	+Ymg==
X-Gm-Message-State: AOPr4FUKjItwpL6SQUg/STx2/mq/eIL/5iIx6Battk3Hu8TBCWjpLimDtoL7/jDnhQoETg==
X-Received: by 10.140.19.174 with SMTP id 43mr32895013qgh.44.1463452019574;
	Mon, 16 May 2016 19:26:59 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:213a:5f79:bc19:2f7c?
	([2601:202:4000:1239:213a:5f79:bc19:2f7c])
	by smtp.googlemail.com with ESMTPSA id
	n1sm243882qkn.3.2016.05.16.19.26.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 19:26:58 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1463415451-21779-1-git-send-email-akuster808@gmail.com>
	<C6187355-EA77-4B31-8638-C5D64613DE0E@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <573A8171.50002@gmail.com>
Date: Mon, 16 May 2016 19:26:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <C6187355-EA77-4B31-8638-C5D64613DE0E@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
Subject: Re: [master][krogoth][PATCH] python-numpy: fix build failure with python-matplotlib
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
X-List-Received-Date: Tue, 17 May 2016 02:26:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/16/2016 09:44 AM, Khem Raj wrote:
> 
>> On May 16, 2016, at 9:17 AM, Armin Kuster <akuster808@gmail.com> wrote:
>>
>> From: Armin Kuster <akuster@mvista.com>
>>
>> numpy/core/include/numpy/npy_common.h:149:10: error:
>> |          #error Unsupported size for type off_t
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>> meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>> index 191e5a1..109deb0 100644
>> --- a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>> +++ b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
>> @@ -11,6 +11,7 @@
>> #define NPY_SIZEOF_PY_INTPTR_T 8
>> #define NPY_SIZEOF_PY_LONG_LONG 8
>> #define NPY_SIZEOF_LONGLONG 8
>> +#define NPY_SIZEOF_OFF_T 8
> 
> Why does the test to select size of off_t fails ?
core/include/numpy/npy_common.h

  #if NPY_SIZEOF_OFF_T == NPY_SIZEOF_SHORT
        #define NPY_OFF_T_PYFMT "h"
    #elif NPY_SIZEOF_OFF_T == NPY_SIZEOF_INT
        #define NPY_OFF_T_PYFMT "i"
    #elif NPY_SIZEOF_OFF_T == NPY_SIZEOF_LONG
        #define NPY_OFF_T_PYFMT "l"
    #elif NPY_SIZEOF_OFF_T == NPY_SIZEOF_LONGLONG
        #define NPY_OFF_T_PYFMT "L"
    #else
        #error Unsupported size for type off_t
    #endif

its gotta match one of them. X86-64 has NPY_SIZEOF_OFF_T  value set.


> we might need similar fix for mips64 too.
yep, I just built mips64 and ppc64 and they both fail like aach64.

will send v2 to fix those as well.

-armin

> 
>> #define NPY_NO_SMP 0
>> #define NPY_HAVE_DECL_ISNAN
>> #define NPY_HAVE_DECL_ISINF
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

