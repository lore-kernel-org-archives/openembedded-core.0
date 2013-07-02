Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8386AE6D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 15:01:08 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so5593520obq.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 08:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=3/5LS+zefwDhp3SAi0+bvBHlpbZTAMdon5AIvcl7W2E=;
	b=jFFhPewpqoDIL2HWo/Q8PaZBH414u1tiriDavMxNqjNBbyWKon6alP1I2pJE2ot+Nt
	PoU+O60i+nDH4+naVCUeuFSf4EVBmLLF2pRRHhgXB+jv4zJ+ZW+rikPRKpdtDchF+xYo
	PA643eUzAbd75OUW95R7KKaC2gLK3esCK8Hvbm+RRJh7zZ6/9g1oOzfcwmONdiybakGT
	4zHOnnC2WaQvv4Wr5k8u6BcJCrIYicoDfW55xf94IPiS//3MEpSekr6aGgY9HRca0Yw/
	S5Uwq4PDDTH5YLn4uXDUbkSwYBUpQuOYLvBQJ1tcMXIEVfZtWXzbqCFotyOyWpBIWdAh
	+uvQ==
MIME-Version: 1.0
X-Received: by 10.60.80.165 with SMTP id s5mr11850683oex.55.1372777269235;
	Tue, 02 Jul 2013 08:01:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Tue, 2 Jul 2013 08:01:09 -0700 (PDT)
In-Reply-To: <8E7C3DB4-FCF4-4D17-A0FF-B7ACBBD0678E@gmail.com>
References: <51C9CE42.8020207@linux.intel.com>
	<56275DFD-34FD-49BF-B17D-79DBB877418E@gmail.com>
	<CAP9ODKoEGMAwf-kL8HO1rH0scxAQFtbWz2bfF5=VQHGDvW=n+Q@mail.gmail.com>
	<F59505EA-0C28-444B-B818-21A015E76B58@gmail.com>
	<51CB2164.5090102@linux.intel.com>
	<51D2E395.3000300@linux.intel.com>
	<CAP9ODKoCt6Gjd3s8wcGy8v0xy3kTQxYdKu1-gjeymN5Ruy59dQ@mail.gmail.com>
	<8E7C3DB4-FCF4-4D17-A0FF-B7ACBBD0678E@gmail.com>
Date: Tue, 2 Jul 2013 12:01:09 -0300
X-Google-Sender-Auth: xRYJtYDg6wAUAjz-EGxEn9jJgek
Message-ID: <CAP9ODKqQ+SX5Ez2UUHmN_YwhVNxVR8E3BCdOmMgOi4igiwdziA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Schmitt Richard-B43082 <B43082@freescale.com>,
	richard.schmitt@freescale.com
Subject: Re: GCC 4.8 Issues with fsl-ppc and fsl-arm (e5000)
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
X-List-Received-Date: Tue, 02 Jul 2013 15:01:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 2, 2013 at 11:54 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Jul 2, 2013, at 7:47 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>> On Tue, Jul 2, 2013 at 11:28 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>> Any updates on this issue?
>>
>> This is outside my skills :-) Khem did you have time to look at Saul file?
>>
>
> issue is narrowed down but fix is not coming soon. disable using neon for perf recipes on that old kernel
> see http://gcc.gnu.org/bugzilla/PR57748

I made a patch with this and will push it to master-next for test.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

