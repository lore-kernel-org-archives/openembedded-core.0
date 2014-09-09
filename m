Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3757360167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 23:12:50 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id fa1so5792790pad.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 16:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=UMrBODQI1vzOarGqGynMlRSxEau2qhlXLhI4yieUK/4=;
	b=YMmYzIik22KXny4kffuKV/ndyZrzqEciyimDwDRkJbkxGcb2u5haS8tgCaXwUfGMMO
	TyaEcUZTDEZzRYMjDwTVXLlxSf9NbxLfcxhNUKVEhk/pGCpxu4npQTCo5XEnadGw6EbT
	HoXvAXjsB/P5tRUk4Ud4OIJHk3OUdcxzsjAlgR98DeNx4n4zXMuNRLtwbkZA7r+KB244
	t4ebwZNRy6KWUrnlcc7QWCt1KZATbdUbmouCnk62cPsojj2VsncGqvS3dN/V9Ww4scAV
	w4k8gu1GCRTi3S3yl20vMnoi8z9osOwufhSNJ4vSqwnEXdioj93FHAW4VUYhyGv42X5x
	DVTw==
X-Received: by 10.66.229.8 with SMTP id sm8mr61661901pac.66.1410304372153;
	Tue, 09 Sep 2014 16:12:52 -0700 (PDT)
Received: from [10.7.100.251] (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	gi14sm3166131pbd.10.2014.09.09.16.12.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Sep 2014 16:12:50 -0700 (PDT)
Message-ID: <540F8971.6020803@gmail.com>
Date: Tue, 09 Sep 2014 16:12:49 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	akuster808 <akuster808@gmail.com>,
	"Ashfield, Bruce" <Bruce.Ashfield@windriver.com>
References: <1410227590-14190-1-git-send-email-akuster808@gmail.com>	<540E8A1F.2010800@gmail.com>
	<1410274925.19272.44.camel@ted>
In-Reply-To: <1410274925.19272.44.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Adding new qemuppc64 machine config
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
X-List-Received-Date: Tue, 09 Sep 2014 23:12:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/09/2014 08:02 AM, Richard Purdie wrote:
> On Mon, 2014-09-08 at 22:03 -0700, akuster808 wrote:
>> I forgot to mention. I will update linux-yocto_3.1x.bb too.
>
> You need to talk to Bruce about that. I'm also worried about this coming
> in this late, after feature freeze.

I wasn't targeting getting it in for 1.7.

I am just passing along it along so maybe someone else might gain some 
benefit from it.


- Armin

>
> Cheers,
>
> Richard
>
>> - Armin
>>
>> On 09/08/2014 06:53 PM, Armin Kuster wrote:
>>> apply after "linux-yocto/3.14: configuration updates and feature merges."
>>>
>>>
>>> Armin Kuster (1):
>>>     qemuppc64: add machine
>>>
>>>    meta/conf/machine/qemuppc64.conf | 16 ++++++++++++++++
>>>    1 file changed, 16 insertions(+)
>>>    create mode 100644 meta/conf/machine/qemuppc64.conf
>>>
>
>

