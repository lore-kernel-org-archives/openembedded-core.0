Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0B92727D4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 02:03:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0423Mpw027796
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Jan 2015 18:03:23 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sat, 3 Jan 2015 18:03:22 -0800
Message-ID: <54A89F77.1080209@windriver.com>
Date: Sun, 4 Jan 2015 10:03:35 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1419610232-6386-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpyDYSHCFF+3RJTa_PgjCEvcSAGEGHKR8cH4ADgg5VuiA@mail.gmail.com>
In-Reply-To: <CAP9ODKpyDYSHCFF+3RJTa_PgjCEvcSAGEGHKR8cH4ADgg5VuiA@mail.gmail.com>
X-Originating-IP: [128.224.162.226]
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
X-List-Received-Date: Sun, 04 Jan 2015 02:03:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/01/2015 03:16 AM, Otavio Salvador wrote:
> On Fri, Dec 26, 2014 at 2:10 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> The sed-ptest package has runtime dependencies which are used only
>> when running the tests. So the 'build-dep' QA check can be skipped for
>> this specific package. Fixes the following QA error:
>>
>> ,----
>> | WARNING: QA Issue: sed-ptest rdepends on locale-base-ru-ru, but it
>> |     isn't a build dependency? [build-deps]
>> `----
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Ping?
>

Last week, I did a world build and I didn't get this QA warning.
Are there any specific build steps or configurations to reproduce the bug?

Regards,
Chen Qi

