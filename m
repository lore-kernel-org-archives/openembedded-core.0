Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4B76C735
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 15:54:12 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id el20so1091401lab.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 07:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JTUjKO28dchx+U+6kv4SVj1kGSlNjT2PeIb7NLX4kSw=;
	b=jrmZ6tqX+SYotpGpPaDHUvzn67pcISReaQ43BwnyCec+IagbbKIVFUxeKYhYb9XJbg
	rMoZ8d7cwwQH0cQUNPfoizLgYoxxNrhg7371zkveC4bqFpCtp57Q+29BeeoCcmp7nK06
	6x/kd6tyHiqRWblATN8kwfhNdpcYrSV2Ey4TwT4KwAZ5Htxbn8JpJYPuZ4K0I9KGutTX
	o6mL0FT+CYYq7RpXUwwkdGt/7izP7I+GwEr7oyaSWkskHLuiBO8D3+esd73zYpq+KUvW
	jDDyKqBPqd/0XiLqV0tUXE3bA/qbcwA3rTr0E2wA6XKyRu4J/pN99GrQbPLwKSPXzfTi
	ZHtA==
MIME-Version: 1.0
X-Received: by 10.112.168.170 with SMTP id zx10mr9650649lbb.0.1385135651660;
	Fri, 22 Nov 2013 07:54:11 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Fri, 22 Nov 2013 07:54:11 -0800 (PST)
In-Reply-To: <CADkTA4NNCzjF9M1xQsvdETjtb3MiFiHjiCbaCJ6Sy3Y=p0qFoA@mail.gmail.com>
References: <1385129059-941-1-git-send-email-mac@mcrowe.com>
	<1385129059-941-2-git-send-email-mac@mcrowe.com>
	<CADkTA4NNCzjF9M1xQsvdETjtb3MiFiHjiCbaCJ6Sy3Y=p0qFoA@mail.gmail.com>
Date: Fri, 22 Nov 2013 10:54:11 -0500
Message-ID: <CADkTA4PB3s2_2W1dHV21gg2jx56gNDcnHjcb7iaQ-2AFT0hAxQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Mike Crowe <mcrowe@brightsign.biz>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] Revert "kernel.bbclass: move bundle_initramfs after kernel_link_vmlinux"
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
X-List-Received-Date: Fri, 22 Nov 2013 15:54:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 22, 2013 at 10:53 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Fri, Nov 22, 2013 at 9:04 AM, Mike Crowe <mac@mcrowe.com> wrote:
>> This reverts commit 3baa63b4d588c3262254528b406ede265dd117bf. It broke
>> builds that aren't using kernel-yocto.
>
> Can we get a log message of the breakage in the commit ? And a follow up
> question, have we simply restored the issue that the original commit was
> fixing ?

Aha. I see the other patch makes sure that we haven't re-broken anything.

Cheers,

Bruce

>
> Bruce
>
>>
>> Signed-off-by: Mike Crowe <mcrowe@brightsign.biz>
>> ---
>>  meta/classes/kernel.bbclass |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 48999fe..ba13e67 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -152,7 +152,7 @@ python do_devshell_prepend () {
>>      os.environ["LDFLAGS"] = ''
>>  }
>>
>> -addtask bundle_initramfs after do_kernel_link_vmlinux before do_build
>> +addtask bundle_initramfs after do_compile before do_build
>>
>>  kernel_do_compile() {
>>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>> --
>> 1.7.10.4
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

