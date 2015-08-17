Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id EC76E606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 11:47:26 +0000 (UTC)
Received: by pawq9 with SMTP id q9so9461682paw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 04:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=xjA/rZJ0MXx6cqTov5mGsq7XcAhWvFVTA1QxNlu7EW0=;
	b=YONZiXV88CJ+k0JFc+G0cT0LpJdaYTF9c1v6R00BItatROkIE1edhcJ7EpyXTMTJeW
	7iqErwBTXE8obtkZRYH+2yL0h3O0u+pGkuv91PU/C7hMBBUX3Th9z5rwl9pRWXht3gCr
	XilczkBi+a3eidHn5Pz5li0kzn4Vzj9U3ARnVkVAHeqOcUWDUg71PuIixoteGXJIqJsT
	vGppU6N9MsyBCQVEW8EnlQwscVTZHo3qvz1HrZwD0Frzn8Iri5KQ8Wih2S0SodCuh4W3
	s+PFYqbI1S2CBGl+uhKhKngcQSBLMJFxbwBuO2uj4UfFT7jmBoyETTAIqXCFENNtiAEE
	k1fg==
X-Received: by 10.66.141.238 with SMTP id rr14mr1958047pab.156.1439812046312; 
	Mon, 17 Aug 2015 04:47:26 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:e89a:f9d0:8f1:69c8?
	([2601:202:4000:1239:e89a:f9d0:8f1:69c8])
	by smtp.googlemail.com with ESMTPSA id
	c6sm1440054pat.13.2015.08.17.04.47.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Aug 2015 04:47:25 -0700 (PDT)
Message-ID: <55D1C9C8.4040508@gmail.com>
Date: Mon, 17 Aug 2015 04:47:20 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1439779827-15189-1-git-send-email-akuster808@gmail.com>
	<55D15520.8040604@windriver.com>
In-Reply-To: <55D15520.8040604@windriver.com>
Subject: Re: [PATCH 1/2] bitbake.conf: Add Github mirror
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
X-List-Received-Date: Mon, 17 Aug 2015 11:47:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Robert,


On 08/16/2015 08:29 PM, Robert Yang wrote:
>
> Hi Armin,
>
> Please see this thread:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2015-July/108217.html
>

Thanks for the info.

Please drop this patch.

- armin
>
> // Robert
>
> On 08/17/2015 10:50 AM, Armin Kuster wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> This adds Github mirror variable.
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   meta/conf/bitbake.conf | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 21f1698..56e7ca7 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -571,6 +571,7 @@ DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
>>   GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
>>   GNOME_GIT = "git://git.gnome.org"
>>   GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
>> +GITHUB_MIRROR = "git://github.com"
>>   GNU_MIRROR = "http://ftp.gnu.org/gnu"
>>   GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
>>   KERNELORG_MIRROR = "http://kernel.org/pub"
>>

