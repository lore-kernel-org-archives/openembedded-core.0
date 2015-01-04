Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 25581725DC
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 05:38:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t045csFh023915
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 3 Jan 2015 21:38:55 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sat, 3 Jan 2015 21:38:54 -0800
Message-ID: <54A8D1FB.7090406@windriver.com>
Date: Sun, 4 Jan 2015 13:39:07 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1419610232-6386-1-git-send-email-otavio@ossystems.com.br>	<CAP9ODKpyDYSHCFF+3RJTa_PgjCEvcSAGEGHKR8cH4ADgg5VuiA@mail.gmail.com>	<54A89F77.1080209@windriver.com>
	<CAP9ODKo6N5DtU4wUw23YWyGryJ4XNZbLJNfOVWpxeNETqGGDeg@mail.gmail.com>
In-Reply-To: <CAP9ODKo6N5DtU4wUw23YWyGryJ4XNZbLJNfOVWpxeNETqGGDeg@mail.gmail.com>
X-Originating-IP: [128.224.162.226]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sed: Skip 'build-deps' QA check for sed-ptest package
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
X-List-Received-Date: Sun, 04 Jan 2015 05:39:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2015 12:31 PM, Otavio Salvador wrote:
> On Sun, Jan 4, 2015 at 12:03 AM, ChenQi <Qi.Chen@windriver.com> wrote:
>> On 01/01/2015 03:16 AM, Otavio Salvador wrote:
>>> On Fri, Dec 26, 2014 at 2:10 PM, Otavio Salvador
>>> <otavio@ossystems.com.br> wrote:
>>>> The sed-ptest package has runtime dependencies which are used only
>>>> when running the tests. So the 'build-dep' QA check can be skipped for
>>>> this specific package. Fixes the following QA error:
>>>>
>>>> ,----
>>>> | WARNING: QA Issue: sed-ptest rdepends on locale-base-ru-ru, but it
>>>> |     isn't a build dependency? [build-deps]
>>>> `----
>>>>
>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>> Ping?
>>>
>> Last week, I did a world build and I didn't get this QA warning.
>> Are there any specific build steps or configurations to reproduce the bug?
> ptest?
>

It's in DISTRO_FEATURES.





