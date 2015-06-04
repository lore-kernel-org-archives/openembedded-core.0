Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 51EFE736BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 08:39:39 +0000 (UTC)
Received: by oiww2 with SMTP id w2so26500545oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 01:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=g1XjAVY7cGTxgelOUoMzE7Ut+Inm5HWG4eYlH79wrz8=;
	b=rHVtCAe49O2w/+Q2o/UsEe8EcoRprZCOtG1NNtNiAJtmLJTnyAGhCNenLOtgFVhVj8
	g4iUXvPIg9uipnanb0kuuopLvmUazgRobu+FK54xPHNxKnl7i7LRUzfp1rKxz2mKMo0u
	2hIE4cL5c0itJwx5YXoq/grvGIUNC3lXl8SGN9vLXzDNUvrvJhb60vPhO8IBdZIvOX9Y
	cSgZ59bjTZIJmyrYinQuwFRSPw9rMozakTqvIVKnCapyGYZ6HrudDAhioa2cjWukMieQ
	tDsX/xKtDzcz9htHg1rlc1caeBhrWNruDy4nXjT1yqFisuJqu7ljOrmMX5Gq62HeWqDL
	1CwQ==
MIME-Version: 1.0
X-Received: by 10.182.181.103 with SMTP id dv7mr30999369obc.25.1433407180337; 
	Thu, 04 Jun 2015 01:39:40 -0700 (PDT)
Received: by 10.202.44.23 with HTTP; Thu, 4 Jun 2015 01:39:40 -0700 (PDT)
In-Reply-To: <1640EBA1-D4F4-4878-810B-4F968E8D871C@gmail.com>
References: <1433388666-8923-1-git-send-email-armccurdy@gmail.com>
	<1640EBA1-D4F4-4878-810B-4F968E8D871C@gmail.com>
Date: Thu, 4 Jun 2015 01:39:40 -0700
Message-ID: <CAJ86T=V=ygyy8=Sw2gZkVzvx46dcbdU0Qx6zLEEAy=YXkK2ZDQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] python-numpy: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 08:39:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2015 at 11:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Jun 3, 2015, at 8:31 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>> meta/recipes-devtools/python/python-numpy_1.7.0.bb | 4 ++++
>> 1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/python/python-numpy_1.7.0.bb b/meta/r=
ecipes-devtools/python/python-numpy_1.7.0.bb
>> index d4fd279..28ad97f 100644
>> --- a/meta/recipes-devtools/python/python-numpy_1.7.0.bb
>> +++ b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
>> @@ -30,6 +30,10 @@ CONFIGFILESURI_i586 =3D " \
>>     file://config.h \
>>     file://numpyconfig.h \
>> "
>> +CONFIGFILESURI_i686 =3D " \
>> +    file://config.h \
>> +    file://numpyconfig.h \
>> +=E2=80=9D
>
>
> can we use x86 override instead ?

Yes, I'll send a v2.

I'm hopeful that this set of fixes will be acceptable for fido, which
is why I initially went for adding i686 over-rides instead of a more
widespread clean-up to replace i586 with x86.

>> CONFIGFILESURI_x86-64 =3D " \
>>     file://config.h \
>>     file://_numpyconfig.h \
>> --
>> 1.9.1
>>

