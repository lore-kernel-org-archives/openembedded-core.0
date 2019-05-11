Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 721D37E066
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 01:42:10 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id c6so4097892pfa.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 18:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/0ZsesYnMsDFEWbJoIMmDy+c2/KlTs/VS2DYIpRzdzA=;
	b=tBkseicWvqRP3rOAdbahJIfcYo82c6O8ltehf/m694W0Ra+cn7VAHUdqGiR9eNCgSf
	t1ECPK3esw16uvz//nKLDkHpBcBWc1RGiJ69vLb4ORa3kMX/oL47mTTpxNycDdSs4Pj7
	wQI4T+/JiRYmd3pkL1wtAORZUxQhr2wVGU1PNgdgyt0thDe9G4tMgMne6t2/XEWGPlWF
	wpvMCIHaZu7U5zhECr7ejYPLHJBx5c1FPuXnJNrgmpedWa1Jr20IhqPP7BSnnCDqQjz0
	ppSUBwuIpydonp7ZjFU4QRkiNkxUYku+kaFwPF8XN0qvZcf5IgSCWK25wVCibpxR6G0r
	aR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=/0ZsesYnMsDFEWbJoIMmDy+c2/KlTs/VS2DYIpRzdzA=;
	b=OsKGVoyEvGaLw1lK6jYrUzaY58Ddzr9S3Icfw80fKLHRFbRjEQMoYIzTgr+ZUvDzxd
	zhaJQB4IHKGmpBQsp2aBAVWxFaYBKI7PsXZeXiTwU9NVNY6dZfB+cwOrhW3XGbpPhLw6
	T+yml1H7/qxPOJGhGZY6uDxFAb79NY4HrZr6cUKZURrV/Pq+JfBy5fFYuQtz9d1X3Ev1
	XYju465vfXurpoSRZ9AdHyNN/xCbRJu2rVec/Ypbn+zl+r6Wsy0t8+sFvawKUQcfUxko
	Fu9K9QLotfyNN51k/qWjPuB7TxC3mZbLk0WLr/byAnOK5fS+dEpmGQaN30Aff4tejQYQ
	l2gg==
X-Gm-Message-State: APjAAAWzKa3MZfNyFTmI0aJD0wtT4tjiKFi1kt4CaNwetA6akaboCm3s
	NcV10nqvE1ACLxhYoLiRiTqKIO+TyHk=
X-Google-Smtp-Source: APXvYqwjOmpHiulD4K4QWDfwbY33L7ib+5kgOoA3dpK9wiPpgGiFYnyJPOo34nZdkyegOquoJ4lc7Q==
X-Received: by 2002:a63:6a41:: with SMTP id f62mr17329228pgc.392.1557538931081;
	Fri, 10 May 2019 18:42:11 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:6095:8839:3497:2f69])
	by smtp.gmail.com with ESMTPSA id
	o20sm5903043pgj.70.2019.05.10.18.42.10
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 18:42:10 -0700 (PDT)
To: richard.purdie@linuxfoundation.org,
	=?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Bas Mevissen <abuse@basmevissen.nl>
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
	<CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
	<a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
	<CALbNGRT_FRQfA0jpP7DHsFOxnt97JW-KEjyGXOkW9V2w+Ujgyw@mail.gmail.com>
	<CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
	<ec77d08feb85f543bbc79372d276092c10336035.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b53e6c90-2a8d-7ae7-b5f7-e7a80b258da3@gmail.com>
Date: Fri, 10 May 2019 18:42:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <ec77d08feb85f543bbc79372d276092c10336035.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte-native: reduce c++ requirements from c++17 -> c++11
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
X-List-Received-Date: Sat, 11 May 2019 01:42:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 4/29/19 6:51 AM, richard.purdie@linuxfoundation.org wrote:
> On Mon, 2019-04-29 at 15:47 +0200, Andreas Müller wrote:
>> On Mon, Apr 29, 2019 at 2:21 PM Andreas Müller <
>> schnitzeltony@gmail.com> wrote:
>>> On Mon, Apr 29, 2019 at 12:56 PM Bas Mevissen <abuse@basmevissen.nl
>>>> wrote:
>>>> On 2019-04-29 11:29, Andreas Müller wrote:
>>>>
>>>> (...)
>>>>
>>>>> Understood - hope to find time till tomorrow for this. Need to
>>>>> find an
>>>>> old machine for test because otherwise further fixes might
>>>>> remain
>>>>> incomplete again.
>>>>>
>>>>
>>>> Why not add the g++ option --std=c++11 when test building this
>>>> recipe?
>>>>
>>>> $cat test.cc
>>>>
>>>> #include <string>
>>>>
>>>> using namespace std::literals;
>>>>
>>>> int main()
>>>> {
>>>>          return 0;
>>>> }
>>>>
>>>>
>>>> $ g++ --std=c++17 test.cc -o test
>>>> $ g++ --std=c++11 test.cc -o test
>>>> test.cc:5:22: error: ‘literals’ is not a namespace-name
>>>>       5 | using namespace std::literals;
>>>>         |                      ^~~~~~~~
>>>>
>>>> -- Bas.
>>> Did that but on CFLAGS (copy & paste from another place in recipe)
>>> and
>>> since issues popped up I thought it was right :(
>>>
>> Looked into:
>>
>> There is no easy way to get vte-native to build with c++11. Even if -
>> patches possibly introduce functional changes/errors (and the result
>> of oe-selftest is questionable with a massively patched vte).
>>
>> So I see two ways to go:
>>
>> 1. set vte-native requirements to c++14. That worked here with
>> CXXFLAGS_append_class-native = " --std=c++14" but looking into logs
>> of
>> centos 7 there are several '--std=gnu++11'. Have no idea where they
>> come from so chances are high this patch is going fail with c++14.
>> 2. revert vte back to 0.52.2 and forget the idea to get recent
>> gnome-terminal back in near future. That requires vte 0.56.1 and was
>> the reason I sent the update here.
>>
>> My preference is 2.
> 
> I'm willing to try testing a c++14 patch if that helps, we can fall
> back to 2 if that fails?
> 

Can we require centos7 and other hosts which use old compilers to 
install the additional packages to have newer compilers ? e.g. for 
centos installing devtoolset-7 will fix this issue

> Cheers,
> 
> Richard
> 

