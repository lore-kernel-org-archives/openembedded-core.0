Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TFdGz-0007Vo-Pj
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Sep 2012 05:54:25 +0200
Received: by eaad12 with SMTP id d12so1239121eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 20:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=s83TcdbuHMCXrOsVX8M+5FTsbE3f8r9X6nyDGHDJUVw=;
	b=N8AZ4Za1U7TEO5O9WRukj8L+VGGD2kfGvu9wYDxvMIJo0kJe/mB1Khnt/mC1848lIF
	zqOW/nGCXWf7eTJ8sUw6OnPx4F+Kw78CGldq1/b1Y5FUlzWN8DzYaYJxH1c72rSqxqDd
	RU5W+16AhnDspnHz8t3bjkZY0DhOMF1qDSEWqrdqqM/zV/L7NC6ShsXV35SHTVCbOAI9
	3zWVAZopIB9XYHYrbSPt2fKSea2aB79YMyWqPSHroW0KV7GlRGK0l4kzir1nMcXCV7VC
	qBZX3zu0XlUp2XZtk+i/iBtn5jGEYnzrEMTbbScw32fKcxw0e3Gz9HRSJOv+q12aWklb
	5S/Q==
Received: by 10.14.220.134 with SMTP id o6mr10899889eep.35.1348371699874; Sat,
	22 Sep 2012 20:41:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Sat, 22 Sep 2012 20:41:09 -0700 (PDT)
In-Reply-To: <505D606C.5080406@windriver.com>
References: <505C6C8A.9000800@windriver.com> <1348235937.10108.78.camel@ted>
	<505CC452.9040906@windriver.com>
	<CAMKF1srm1JLHray=JEJtRoBjwKvg8KFGno95fjRz+SFN+Fu-Pg@mail.gmail.com>
	<505D606C.5080406@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Sep 2012 20:41:09 -0700
Message-ID: <CAMKF1sqMtA1LhK98khoDAXAK83_gmTokfez8RpFC7gwRHdv=KA@mail.gmail.com>
To: Florin Sarbu <florin.sarbu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils fails to set ld.gold as default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Sep 2012 03:54:26 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 21, 2012 at 11:53 PM, Florin Sarbu
<florin.sarbu@windriver.com> wrote:
> What exactly do you wanna see in the output? I can post the variables you
> are looking for.

why cant you pastebin the whole file ? anyhow you are probably looking
at a red herring
build will create three linker binaries

1. Default linker - <cross>-ld
2. Gold linker - <cross>-ld.gold
3. GNU ld - <cross>-ld.bfd

1 above will be copy of either ld.gold or ld.bfd depending upon what
you have chosen
as default.

run <cross>-ls -v

to see the version of linker. If it is gold then it will say so



>
> Florin
>
>
> On 09/22/2012 12:53 AM, Khem Raj wrote:
>>
>> On Fri, Sep 21, 2012 at 12:47 PM, Florin Sarbu
>> <florin.sarbu@windriver.com> wrote:
>>>
>>> It is enabled. As I said earlier, ld.gold gets created, it's just that ld
>>> is
>>> not pointing to it even though the flag says --enable-gold=default. It
>>> still
>>> point to the regular cross ld. Another config option that creates ld.gold
>>> is
>>> --enable-ld=yes, so at this point default looks exactly like yes.
>>> Just to be extra sure, I did try to add the extra space as you suggested
>>> but
>>> the behaviour is the same.
>>
>> post the output of
>> bitbake -e binutils-cross
>
>


