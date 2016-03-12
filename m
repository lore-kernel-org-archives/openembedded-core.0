Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id F086260588
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 02:58:41 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id z76so167553263iof.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 18:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=aU47QhLxLmZ7ugGTJgBiT+WbsgYanxgKgFfEb8DPRvI=;
	b=B2R8E4dtooO0t7bUDuJzRH9xtEAbcbG39Ml5wOIk0ycFQKCZZ7VpPq64hlZm54kT3v
	FAvHq+LcmJ0tNRgDIYFFdsNmupcSyQjeFbBRtbXkLwgh5/F//tJnYq5UjCr/0aA5pqTt
	aUpW2hTrPfEJLxaADzs8v6c1bRhXQEUBLI5ufeWmnRb883yARZfqWnwdvEkAtHYvbUgh
	T6w0lWNXt0noNyVQTSKen3p8QbUS8qx31k5TZf3VB93Wd0LgRufQFdP05XVKjG037pXA
	+CtD/XirgYoWh57LIq8X/E/gyYkqtlujuGOPTW+1+g0S10bH/ZYTyea1WHN1XWRflXoo
	HHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=aU47QhLxLmZ7ugGTJgBiT+WbsgYanxgKgFfEb8DPRvI=;
	b=EJJb5b3kPQkhyP1dG3JTnalhQZL3xUmYP9k/gSElMtjMjnhl3xpRFR0Y8kJPqfCA5F
	g+rZHFs3R3ruLQJqrL/2UMoqSrr4gRYSVUq0rODX7U1gUGeKrrn1aBSOclVb/URcRjlL
	vWLaE/deKY8K41hL7Sd7GsUibxq3CmOnuUMjrzQrZss2wEfjwqYUPcRWBdhPkEssG+pr
	MtDqZ7CL/ZJ0Px/h0gmPF8GKHejpquyDe6qraovox69ogsImsTbx0OM6fvRVNqMvUmjV
	cCI1ysOHC82Kyt0ablNILwYRhuLCVCEU0uxvYerQIX/j/i2C552MCL2O93Bchb0qIcTw
	hgmA==
X-Gm-Message-State: AD7BkJLf9Bv/xy/izzs+shpqaNMGv+k9HOW5yPNhSdkDco0ljGHoq6OYAcDWKwmG4JIpzA==
X-Received: by 10.107.169.35 with SMTP id s35mr14946363ioe.91.1457751522121;
	Fri, 11 Mar 2016 18:58:42 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	x9sm2026735igg.17.2016.03.11.18.58.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2016 18:58:41 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1456761746-419-1-git-send-email-ross.burton@intel.com>
	<56E32888.2000301@gmail.com>
	<CAJTo0LZCxp20cT-Te0mDW+X59Pgrr+MUtO1ArgOJoVzfc-rEmA@mail.gmail.com>
	<56E33A51.2020807@gmail.com>
	<1457738209.2804.259.camel@linuxfoundation.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56E385E8.8060105@gmail.com>
Date: Fri, 11 Mar 2016 21:58:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457738209.2804.259.camel@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro][RFC 1/2] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Sat, 12 Mar 2016 02:58:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/11/16 18:16, Richard Purdie wrote:
> On Fri, 2016-03-11 at 16:36 -0500, Trevor Woerner wrote:
>> Hi Ross,
>>
>> On 03/11/16 15:49, Burton, Ross wrote:
>>> On 11 March 2016 at 20:20, Trevor Woerner <twoerner@gmail.com
>>> <mailto:twoerner@gmail.com>> wrote:
>>>
>>>      ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libx11'
>>> (but
>>>      virtual:nativesdk:/z/dragon410c-repo/dragon410c-tw
>>> -jethro/layers/openembedded-core/meta/recipes
>>> -graphics/libsdl/libsdl_1.2.15.bb
>>>      <http://libsdl_1.2.15.bb> DEPENDS on or otherwise requires it).
>>>      Close matches:
>>>
>>>
>>> That's an awesome comment.  Clearly my testing wasn't optimal,
>>> there's
>>> another patch required.
>>>
>>> Can you verify that
>>> cherry-picking 55ca1fb8f0e81ff739b3c46897e43356d1f760c3 solves
>>> this?
>> Yes, verified. Cherry-picking 55ca1fb8 solves the problem.
>>
>> Thanks! :-)
> I just merged the fix to the branch, thanks for testing.
>

Thank _you_ people for being so fast to respond to the issues your users 
find!

