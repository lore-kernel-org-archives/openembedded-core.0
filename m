Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id C1E7B6AFF3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 13:22:21 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id xn12so1622785obc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=D7haW+dTo8XDDFSZAMW2/VTEioHIL4LPmua1bEgvgyw=;
	b=malHnMQcOFxA3vN7qUvcxhTVowrEglw7qZEAqEhioTfvXjHIWCFQYjNDitQb9+rX/i
	eTHBpKzWnua0nRpCsWPzWxWATPZiUQdnRTX4mE+oGYIgnQAb3GDnlkbnLvCpl+1sUzhL
	JpA4PRLwuPYNnKC/M6qapMLss/u8Wbptwqj0Ei+u80H5eo6zGPXc1j1E99oidMYhTFwg
	AP6dpshkjaweQszni+1d6RK2a+/Fhm8fjNoaO4pwoC97jlpsXztJjR1VtJvJbAiA+r+U
	u3TCD6PT+BijRdCU7i3cII8EtyFMtS5I7oBMiQWXSkpXfrDCZMi3Y58XSXXPivdtRH6y
	Lmhg==
MIME-Version: 1.0
X-Received: by 10.60.103.211 with SMTP id fy19mr5957369oeb.103.1372944142635; 
	Thu, 04 Jul 2013 06:22:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Thu, 4 Jul 2013 06:22:22 -0700 (PDT)
In-Reply-To: <CAJTo0LayixMzPK3sQUgxn-6XdsEFdeHk_hOuFkLF3CJUfufrUw@mail.gmail.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
	<00bec2da9d29234cce3b6c97076812ea400370fe.1372890071.git.sgw@linux.intel.com>
	<CAJTo0LayixMzPK3sQUgxn-6XdsEFdeHk_hOuFkLF3CJUfufrUw@mail.gmail.com>
Date: Thu, 4 Jul 2013 10:22:22 -0300
X-Google-Sender-Auth: CSnsTEAhSrPSS8GJErfwfb48USg
Message-ID: <CAP9ODKrBaLLXMRaAj7VmzDQisEQNcVr1dEdZv9qTdWgryaRw9g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] packagegroup-core-basic: Only build libpam if it's enabled
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
X-List-Received-Date: Thu, 04 Jul 2013 13:22:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 4, 2013 at 7:37 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 3 July 2013 23:26, Saul Wold <sgw@linux.intel.com> wrote:
>> util-linux will check for the exisitance of pam header files and change what is
>> built, so only build libpam when pam is enabled for DISTRO_FEATURES
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>  meta/recipes-extended/packagegroups/packagegroup-core-basic.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
>> index c73d173..03dabbf 100644
>> --- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
>> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
>> @@ -104,7 +104,7 @@ RDEPENDS_packagegroup-core-multiuser = "\
>>      cracklib \
>>      gzip \
>>      libuser \
>> -    libpam \
>> +    ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
>>      shadow \
>>      sudo \
>>      "
>
> Do we even need to mention libpam in here?  If pam is enabled, shadow
> will have a runtime dependency on it.

Agreed :-)

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

