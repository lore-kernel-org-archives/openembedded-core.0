Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7811865D56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 14:33:55 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id rd3so14613139pab.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 07:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=KotCy5Tx1NCNdvlJIqiORI+lpjQsAsydZx20H5oVve0=;
	b=kX0rGAVPH9WcCUM+UIsulFQWwxbSOil5el68lZ6JqH+aVppKAMo4IwqI1dq/Y3kReC
	Jx8brxfuuPqKYfUO40IweO+QIvmHilnttD4XjoAhQjL7UUt3biHSAwhUZ4P65vCIBRuB
	h6NaQvaxtiWi5IPg9O91G0WZ2JG7dm9l6oU33tYcKOxvvLP0aU7NmqQ2tuPf1FLpja8o
	hQHD91/EaKHApPkU0+wclm2EP0rosBo9tSov5ucGJREuGjiwnJ1Oh+Zm5Vq8trZqCznQ
	+ug6wV+tdD1WAOai2ogQRVIl2+GrfVGtYzucRIijXu8UzeBtm4ej/m/IuCT4y7jymMSx
	pijQ==
X-Received: by 10.68.219.102 with SMTP id pn6mr59647478pbc.135.1408631636280; 
	Thu, 21 Aug 2014 07:33:56 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:2933:84ae:665a:84e2?
	([2601:c:9380:601:2933:84ae:665a:84e2])
	by mx.google.com with ESMTPSA id h4sm39064821pdi.30.2014.08.21.07.33.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Aug 2014 07:33:55 -0700 (PDT)
Message-ID: <53F60350.4010005@gmail.com>
Date: Thu, 21 Aug 2014 07:33:52 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1408316808-13486-1-git-send-email-akuster808@gmail.com>
	<1408606690.1669.103.camel@ted>
In-Reply-To: <1408606690.1669.103.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] nettle: update nettle to version 3.0
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
X-List-Received-Date: Thu, 21 Aug 2014 14:34:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/21/2014 12:38 AM, Richard Purdie wrote:
> On Sun, 2014-08-17 at 16:06 -0700, Armin Kuster wrote:
>> With this update, LGPLv3 or GPLv3 where  added to many files.
>> Each supported algorithms govern which license they want.
>> Many are stated as  "ether v2 or v3 or both in parallel".
>> Update license to be v2 or LGPLv3 or GPLv3.
>>
>> The previous verion had one GPLv3 file so the license was incorrect.
>
> With this change, "bitbke gnutls" stops working.
>

  gnutls is targeting to port to nettle 3.0 in gnutls version 3.4.

what should I do?

- Armin

> Cheers,
>
> Richard
>

