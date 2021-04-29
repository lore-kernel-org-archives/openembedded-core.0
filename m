Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web09.4244.1619688454570771704
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 02:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [IPv6:2001:470:b30d:2:c404:15ff:0:d19] (unknown [IPv6:2001:470:b30d:2:c404:15ff:0:d19])
	by kozue.soulik.info (Postfix) with ESMTPSA id 42853100BE2;
	Thu, 29 Apr 2021 18:27:21 +0900 (JST)
Subject: Re: [OE-core] [PATCH v3] seatd: add seatd recipe
To: Kenny Levinsen <kl@kl.wtf>
Cc: Joshua Watt <jpewhacker@gmail.com>,
 openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com,
 contact@emersion.fr
References: <20210420234341.182745-1-ayaka@soulik.info>
 <50825f3b-3c5f-1b51-d01f-eb850cca4da3@gmail.com>
 <434efd41-dd9a-ac4e-4ac4-681b982678c0@soulik.info>
 <84U4SQ.FTF38TW31Y7K@kl.wtf>
From: "Randy Li" <ayaka@soulik.info>
Message-ID: <d5f618d7-b39d-0e7b-c4bf-9ab8588c2762@soulik.info>
Date: Thu, 29 Apr 2021 17:27:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <84U4SQ.FTF38TW31Y7K@kl.wtf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 4/26/21 2:31 AM, Kenny Levinsen wrote:
> On Wed, Apr 21 2021 at 09:34:41 AM +0800, ayaka <ayaka@soulik.info> 
> wrote:
>> I also sent this patch to the upstream, seatd is the server of 
>> libseat, besides you could build a libseat with a embedded server 
>> without shipping the seatd.
>
> I have applied a more specific fix upsteam, so unrelated (but not 
> unwanted!) backend option rework can be dealt with separately.
>
> With that in mind, considering you were based on master anyway, you 
> should now be able to make the recipe without local patches.
>
>
I would send out a new recipe today
