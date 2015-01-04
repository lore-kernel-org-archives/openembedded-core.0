Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id BE242609B2
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 04:31:07 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id v1so9741235yhn.15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Jan 2015 20:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=EfSfOuv4+jH9+ruAuD0y1oZwbiu36sLE2Cqp1j+7MPw=;
	b=ZMlpc9son+XqjuNl/EuAwBr6Npz+1WgCDpLtKF9ntQZ4oBGhSh66H6DjJQ873hLACM
	3IcqVwHIAtyfZ+hY6pXUXVm+Go0C1mAJ1ylca3YyYIm/y9Su+H4kMmkbf6FdBZuVsAWv
	/L8yoK5T/vMiqaZK+q2thn84h0hRODM4A90D4kzoGtfNMBvWE/Bp7JPMdYHNBp7ACsV5
	B9A1Gys9JmZW2TstqBONfZJ7W2jOap/2jzj6ONzWcBHQw04o7tHe8Dq3Ys2CNAM6MIU+
	HcmUnWz7Z3BWxymQu+PJLn4JJrWZd9qztbQYfTHKHv6/y+QkuygeQZ8S38gFll4NjC/5
	fomQ==
MIME-Version: 1.0
X-Received: by 10.170.154.195 with SMTP id v186mr13270510ykc.22.1420345868465; 
	Sat, 03 Jan 2015 20:31:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Sat, 3 Jan 2015 20:31:08 -0800 (PST)
In-Reply-To: <54A89F77.1080209@windriver.com>
References: <1419610232-6386-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpyDYSHCFF+3RJTa_PgjCEvcSAGEGHKR8cH4ADgg5VuiA@mail.gmail.com>
	<54A89F77.1080209@windriver.com>
Date: Sun, 4 Jan 2015 02:31:08 -0200
X-Google-Sender-Auth: cEiaRSdJrrfv0dvPT0C4pFiJKlQ
Message-ID: <CAP9ODKo6N5DtU4wUw23YWyGryJ4XNZbLJNfOVWpxeNETqGGDeg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
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
X-List-Received-Date: Sun, 04 Jan 2015 04:31:10 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 4, 2015 at 12:03 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 01/01/2015 03:16 AM, Otavio Salvador wrote:
>>
>> On Fri, Dec 26, 2014 at 2:10 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>>
>>> The sed-ptest package has runtime dependencies which are used only
>>> when running the tests. So the 'build-dep' QA check can be skipped for
>>> this specific package. Fixes the following QA error:
>>>
>>> ,----
>>> | WARNING: QA Issue: sed-ptest rdepends on locale-base-ru-ru, but it
>>> |     isn't a build dependency? [build-deps]
>>> `----
>>>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> Ping?
>>
>
> Last week, I did a world build and I didn't get this QA warning.
> Are there any specific build steps or configurations to reproduce the bug?

ptest?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

