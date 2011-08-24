Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QwK3o-0001Iz-Lp
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 22:28:29 +0200
Received: by iyf13 with SMTP id 13so2925264iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 13:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=2u8DhJIyYMAolPVzlPD8+1e8E2L6emqow2R2kH9pqJo=;
	b=a/nIx2g1kdgbp1VlcA8/YXnPjWFL/n6KN8Yf6GuXaPgg27nW5ctwtET6EnavtFdZAN
	R9JFKT+pKr1OxCdpzHgGD2qgYA17YFmSi947xcq37IRhlWyuCNE9JKD92LuAtk0lQTut
	3+MOXUFnFX3xCdQu2TUvd8s2fWumUpLmFXK+Y=
Received: by 10.231.56.75 with SMTP id x11mr10745682ibg.98.1314217415499;
	Wed, 24 Aug 2011 13:23:35 -0700 (PDT)
Received: from [172.23.8.121] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id g21sm524615ibl.58.2011.08.24.13.23.16
	(version=SSLv3 cipher=OTHER); Wed, 24 Aug 2011 13:23:32 -0700 (PDT)
Message-ID: <4E555DB2.6080105@gmail.com>
Date: Wed, 24 Aug 2011 13:23:14 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CABcZANn8NZYnA3dPzakgfMguaVV9EQ7isusAGMOQUQzHx_UV3w@mail.gmail.com>
	<4E555B61.7030803@linux.intel.com>
In-Reply-To: <4E555B61.7030803@linux.intel.com>
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: [ANNOUNCE] Devshell Usage Change
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2011 20:28:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/2011 1:13 PM, Saul Wold wrote:
> On 08/24/2011 12:49 PM, Chris Larson wrote:
>> Saul reminded me that I never sent a proper email to let people know
>> about the
>> usability change to devshell, so only those who reviewed the commits
>> know about it.
>>
>> In the new implementation, a single OE_TERMINAL variable controls the
>> behavior.
>>
> So your saying that the TERMCMD no longer works? We have to set both
> TERMCMD and OE_TERMINAL?
>
> That does not makes sense, If I set TERMCMD to use screen then it should
> use screen, with out me having to also set OE_TERMINAL?
>
> Or test TERMCMD go away at this point?

I think so using OE_TERMINAL should suffice


>
> In either case, maybe we need to update the local.conf also.

yes



