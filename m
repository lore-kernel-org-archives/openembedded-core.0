Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TJQUk-0007lp-DK
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 17:04:18 +0200
Received: from [192.168.1.111] (host86-143-222-9.range86-143.btcentralplus.com
	[86.143.222.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id BC5E0D22B7;
	Wed,  3 Oct 2012 16:51:21 +0200 (CEST)
Message-ID: <506C50E4.9040104@linaro.org>
Date: Wed, 03 Oct 2012 15:51:16 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Michael Halstead <michael@yoctoproject.org>
References: <505837BA.2040305@linaro.org> <1347959319.13596.90.camel@ted>
	<50583F16.9070102@linaro.org> <1347964566.13596.113.camel@ted>
In-Reply-To: <1347964566.13596.113.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Best way to update gnu-config?
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
X-List-Received-Date: Wed, 03 Oct 2012 15:04:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

W dniu 18.09.2012 11:36, Richard Purdie pisze:
> On Tue, 2012-09-18 at 11:29 +0200, Marcin Juszkiewicz wrote:
>> W dniu 18.09.2012 11:08, Richard Purdie pisze:
>>
>>> The trouble was that upstream was in cvs. It was the only reason we
>>> still had a dependency on cvs and we decided we wanted to kill it which
>>> isn't something I regret.
>>
>> There is git mirror hosted on gnu.org servers which can be used instead
>> of cvs. OE-Core already has git-native.
>
> I remember the problem now, this was a circular dependency nightmare
> (git-native depends on gnu-config-native and vice versa).
>
>>> Can you share a tarball of the updated (unpatched) upstream version and
>>> we'll put it into place alongside the other tarball on the server.
>>
>> http://people.linaro.org/~hrw/aarch64/gnu-config-20120814.tar.bz2
>>
>> 11:29 hrw@puchatek$ sha256sum gnu-config-20120814.tar.bz2
>> 44f99a8e76f3e8e4fec0bb5ad4762f8e44366168554ce66cb85afbe2ed3efd8b
>> gnu-config-20120814.tar.bz2
>>
>>> Michael (cc'd) should be able to do this. Once that is done you should
>>> be able to send a patch as usual to update to the new version.
>>
>> Ok.
>
> Thanks, Michael should be able to take care of this later today (he's US
> based).

Michael: any update on it?


