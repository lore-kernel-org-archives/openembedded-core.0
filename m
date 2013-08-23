Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5A79B60896
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 20:29:15 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id f8so1157854obp.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=dmv0eqPHtlJ9p5BDI1YF+EseZrzuWhCYigu+5YV2u90=;
	b=rB1wDomtG/zRJF4k4ri+m63Z0a5dBEFGdvTpSnlECy6IfCTxfMAodkF2Saz5UEh7Ln
	S2OtDzRxrK6mUs/ECMZt3CCY+3JdEf1JVozolihg0qoo5EACCYQdXXYjog5PS66To/mN
	vlhlMPz1V+9GD3nMi/UZKphSc3OJMUMUxKgOJb1boHX6zajbJTGmCDyYaCE3r+8dAsIy
	SBe1tM3rMdbHfwFCoc+0S8w7nIbREWE5m8RG1MxdmBGIivIEgUYgq9XoizxY6BUc1+ZW
	CnDN7I69yAaRichR3jf/nNxHO/U+jQOQ/ZF9nz1heJtjFgA6wJ2JlfWzjt763gMqNiDo
	PQGw==
MIME-Version: 1.0
X-Received: by 10.60.43.131 with SMTP id w3mr1358984oel.10.1377289755263; Fri,
	23 Aug 2013 13:29:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 23 Aug 2013 13:29:14 -0700 (PDT)
In-Reply-To: <CADkTA4Ok48K9m9HBA_LsqmiYY1CD1UUtFHspcfd65a+kkaq9dQ@mail.gmail.com>
References: <1377281368-11114-1-git-send-email-otavio@ossystems.com.br>
	<5217BF57.2080904@linux.intel.com>
	<CADkTA4Ok48K9m9HBA_LsqmiYY1CD1UUtFHspcfd65a+kkaq9dQ@mail.gmail.com>
Date: Fri, 23 Aug 2013 17:29:14 -0300
X-Google-Sender-Auth: rCDo_u0t0f67WYxFoAMGbqTzYvo
Message-ID: <CAP9ODKqpcMueZYiAhSahJOJ+sdE-pKKpPTNe1ec9SNsJhDh7dQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot, u-boot-fw-utils-cross, u-boot-mkimage: Upgrade to 2013.07
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
X-List-Received-Date: Fri, 23 Aug 2013 20:29:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 23, 2013 at 5:07 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Fri, Aug 23, 2013 at 4:00 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 08/23/2013 11:09 AM, Otavio Salvador wrote:
>>>
>>> This upgrades the U-Boot for 2013.07 release. This removes the
>>> 2011.03, 2011.06 and 2013.01.01 versions so we keep a single one in
>>> core. The following recipes has been upgraded:
>>>
>>>   - u-boot
>>>   - u-boot-mkimage
>>>   - u-boot-fw-utils -> u-boot-fw-utils-cross (renamed)
>>>
>>> The 2013.07 u-boot and u-boot-mkimage recipe updates were based on a
>>> patch sent by Laszlo Papp <lpapp@kde.org> but the
>>> u-boot-fw-utils-cross needed some more work as it uses the
>>> UBOOT_MACHINE to find default environment for use so it is indeed a
>>> cross binary and not a native one.
>>>
>>
>> As I have mentioned before, until we have a solid test against the reference
>> bsps in Poky, I will not accept a straight-up update, the last version of
>> 2013.01.01 has a DEFAULT_PREFERENCE = "-1", so it's not used, it was also
>> pointed out that we accidently drop the 2012.04 version with the
>> MPC8315e-rdb was relying on.
>>
>> I will take the addition, until we have some test results against the core
>> bsps that say it works for them, then we can clean this up.
>
> Agreed. I was going to say the same thing. And yes, we do have plans to
> get things cleaned up and update the reference board. I simply couldn't do
> everything while grinding out the 3.10 kernel :(

It is fine with me. I can rebase it when the addition has been done
but the addition should be updated to upgrade it from 2013.01.01 as it
was not in use and this could allow fw-utils update.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

