Received: from mail-yh0-f54.google.com ([209.85.213.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rjohnweber@gmail.com>) id 1UJoSm-00056t-Iy
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Mar 2013 18:12:09 +0100
Received: by mail-yh0-f54.google.com with SMTP id 29so317751yhr.41
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2013 09:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=tvIQqvs12tOVnwfz79LmD5AfeACTKQ6CMd+ubXIczHo=;
	b=DsfP2KpLbBfa1GETqOVN69YSVUIyu8tNb4FNu1etnRyhu/wvkPmyv1sTMu7esmSfuN
	bA7LKglXae1ovTd0iNaBlYQSY66jHoDDhUG4Z9/4A2aQ0KVK/Yoh90r5/y1ljd6IwcEZ
	yrcXKS1oJj2F8jzKYfAHXIlL+4m2qAGz7sGUm8Ihp2n60mwP1KS+rcSarYY/qSnK6jyy
	TCe815ua1xspbl8H5o7kMn/PpT7rBJvWyaawW0gesU/hDWe9eYbAJs0JRpQA2S5E+hSK
	oE2lbJy8AkRmaYU7KQ6lrdZqCiEtd5LjaPQWoedC38rjn1CsLGVzG3Z0wuPz39+z4V47
	syxg==
X-Received: by 10.236.114.35 with SMTP id b23mr5345104yhh.0.1364144111091;
	Sun, 24 Mar 2013 09:55:11 -0700 (PDT)
Received: from goober.local ([75.76.228.60])
	by mx.google.com with ESMTPS id j27sm14225888yhf.10.2013.03.24.09.55.09
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 24 Mar 2013 09:55:09 -0700 (PDT)
Message-ID: <514F2FED.70603@gmail.com>
Date: Sun, 24 Mar 2013 11:55:09 -0500
From: John Weber <rjohnweber@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
	<1364070660-13157-2-git-send-email-otavio@ossystems.com.br>
	<20130324160139.12fbb4d7@e6520eb>
	<CAP9ODKoRemde2dC+emOkvu=UG927k3suOZE-Yzdppjp_LG3NeQ@mail.gmail.com>
In-Reply-To: <CAP9ODKoRemde2dC+emOkvu=UG927k3suOZE-Yzdppjp_LG3NeQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] linux-firmware: Do not deploy license files in packages
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
X-List-Received-Date: Sun, 24 Mar 2013 17:12:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Showing my ignorance here, but is a manifest created with all of the packaged 
licenses?  Is it possible for the developer to ship that if they see fit?

I think what Otavio was trying to do was to keep /lib/firmware from being 
cluttered with license files.  At least, that is the benefit as I see it.


On 3/24/13 10:42 AM, Otavio Salvador wrote:
> On Sun, Mar 24, 2013 at 12:01 PM, Eric Bénard <eric@eukrea.com> wrote:
>> Hi Otavio,
>>
>> Le Sat, 23 Mar 2013 17:30:58 -0300,
>> Otavio Salvador <otavio@ossystems.com.br> a écrit :
>>> We don't ship license files with packages and firmware packages are no
>>> different; drop them.
>>>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> there may be a good reason to distribute the license files together with
>> the firmware's binairies : it's often requested by the firmware's
>> license.
>>
>> For example in bcm43xx
>> 2.      Restrictions. Licensee shall distribute Software with a copy
>> of this Agreement.
>
> In this case we'll need to have a -license package for each license as
> we often have more than one fw covered by same license. I'd like to
> someone to comment on this so I can send a patch to fix it.
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


