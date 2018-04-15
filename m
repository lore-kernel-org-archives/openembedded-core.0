Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 02F41744D3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2018 08:12:20 +0000 (UTC)
Received: from [172.16.1.14] (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id D43B9BFE7C;
	Sun, 15 Apr 2018 10:12:20 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>
References: <6c43a914-cf60-6d05-766c-1c1bfc92d13e@pseudoterminal.org>
	<CAMKF1spKY4WjXg1c=70w0TjMwqVNGQD3FdLdL_A7La5rEdh7kw@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <ba83f506-26bf-dfef-d9d5-df352e4703ba@pseudoterminal.org>
Date: Sun, 15 Apr 2018 10:12:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spKY4WjXg1c=70w0TjMwqVNGQD3FdLdL_A7La5rEdh7kw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: dropping commerical flags in mpg123 and lame recipes
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
X-List-Received-Date: Sun, 15 Apr 2018 08:12:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please note that the Fraunhofer page is from May 2017. These sources 
suggest that the final patent expired in December 2017:

https://madfileformatscience.garymcgath.com/2016/04/05/mp3patent/
https://www.tunequest.org/a-big-list-of-mp3-patents/20070226/

Fedora now added LAME and mpg123 support, since they consider the 
patents expired: 
https://fedoramagazine.org/full-mp3-support-coming-soon-to-fedora/

Fraunhofer terminated the mp3 licensing program in April 2017: 
https://www.iis.fraunhofer.de/en/ff/amm/prod/audiocodec/audiocodecs/mp3.html

(German source) wikimedia now allows mp3 uploads: 
https://netzpolitik.org/2017/wikimedia-erlaubt-upload-von-mp3-dateien/


On 2018-04-14 16:16, Khem Raj wrote:
> On Sat, Apr 14, 2018 at 1:30 AM, Carlos Rafael Giani
> <dv@pseudoterminal.org> wrote:
>> The lame and mpg123 can be built only if the commercial flag is whitelisted.
>>
>> However, the remaining mp3 patents expired in December, and no more
>> royalties exist. This is why in GStreamer, the mpg123 and lame plugins were
>> moved from -ugly to -good.
>>
>> So, can we drop the commercial flag in mpg123 and lame?
>>
> We probably need more clarification see
> http://www.audioblog.iis.fraunhofer.com/mp3-software-patents-licenses/
>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


