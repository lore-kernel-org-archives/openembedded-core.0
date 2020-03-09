Return-Path: <ayoub.zaki@embexus.com>
X-Greylist: delayed 963 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Mar 2020 07:45:24 UTC
Received: from mailrelay3-3.pub.mailoutpod1-cph3.one.com
	(mailrelay3-3.pub.mailoutpod1-cph3.one.com [46.30.212.12])
	by mail.openembedded.org (Postfix) with ESMTP id 37E5B60CB6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	message-id:from:references:to:subject:from;
	bh=LT9Yy+t/9Jf7Ix1Ssbl2MmYmw77NNvYPsUAnLKGPb+E=;
	b=LQ0ZaU+6U9NKylsYiFUrmkSxjOeddpwO8xQYpxmyfbUp4zjmHBKNXb6SLShv0jCrIQVkpfUiKqvRf
	lqg27nSxyJcaS0Cy8POYUABl5ihT3py8XBIe5F3quRaLY8GkaPHdO6hIORL1zM8ERIoCdVG2CX3Bbb
	gwuOxX2dTYNjwt3qwE2G60fMCqJJmT9gFWdXEIMa+Tmf9heNlPjZtpYkY5qDxYIAiWQ6oTuWDxgeKG
	cwn/amTw8qwMsYJmzsj+bMtAyjOhLVR+fIe31nSgVvRSlPB8iHD1NskWRDPw8SxkY+fgc0b6k76P79
	LQROuXbxgG18kwjSucMfndKa+M1vD5g==
X-HalOne-Cookie: 3fb003f15bb33bb750b2d05634fe537ed8d00dff
X-HalOne-ID: b178e58d-61d7-11ea-9e61-d0431ea8bb03
Received: from [192.168.178.22] (x4dbe6e2e.dyn.telefonica.de [77.190.110.46])
	by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id b178e58d-61d7-11ea-9e61-d0431ea8bb03;
	Mon, 09 Mar 2020 07:29:21 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
	<20200304172415.GA29456@localhost>
	<01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
	<20200306100422.GA17785@localhost>
	<877e317932176664bc7b0120439c56d4dda791af.camel@linuxfoundation.org>
	<20200308214610.GB1425@localhost>
	<CANNYZj_4sTc9vjhm1+S1GbjN=8SjChWt+gksxxKLXEZXeK9nPQ@mail.gmail.com>
	<20200309002308.GD1425@localhost>
From: Ayoub Zaki <ayoub.zaki@embexus.com>
Message-ID: <f99fbcc5-bb47-a177-f1e9-815d3cf4e5c0@embexus.com>
Date: Mon, 9 Mar 2020 08:29:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309002308.GD1425@localhost>
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Mon, 09 Mar 2020 07:45:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

On 09.03.20 01:23, Adrian Bunk wrote:
> On Sun, Mar 08, 2020 at 11:08:08PM +0100, Alexander Kanavin wrote:
>> On Sun, 8 Mar 2020 at 22:46, Adrian Bunk <bunk@stusta.de> wrote:
>>
>>> It is on YP to make it clear to users whether or not Yocto comes with
>>> the same set of security guarantees as distributions like Ubuntu or
>>> Debian.
>>> If it is the duty of every user of Yocto to track and fix CVEs,
>>> then this has to be stated clearly instead of implying the opposite.
>>> This gives users the opportunity to mitigate, instead of unknowingly
>>> shipping insecure products.
>>>
>> Do you have any actual evidence for actual users shipping insecure products
>> because they mistakenly believe Yocto takes care of security for them?
> Nothing to discuss in public.
>
>> This
>> has been the situation from the start of the project, certainly this was
>> the case 5 years ago when I joined it, and the only person ever to make an
>> issue out of it is you. Everyone else seems to understand the deal they're
>> getting by using Yocto without a commercial support contract.
>> ...
> You are saying that 'track and fix CVEs' is on users.
> Let's check what YP is telling users.
>
> Click on the "Is Yocto Project for you?" link on the YP frontpage:
>
> https://www.yoctoproject.org/is-yocto-project-for-you/
> 13. Yocto Project follows a strict release schedule incorporating
> security patches in all supported releases. This predictability is
> crucial for projects that are based on Yocto Project and allows the
> development teams to plan their activities. Developers can choose which
> Yocto Project branch on which to base their activities as a function of
> their needs. The development branch will ensure access to the latest
> features while the stable branches will reduce the pace of changes. CVEs
> (common vulnerabilities and exposures) issues are supported for the
> latest 2 releases.


Adrian is making a point here, The Yocto Project by claiming that it 
supports security patches for Stable releases is misleading the Users!

I work with different customers and some of them think that by using and 
pulling the latest releases they will get the CVEs automatically fixed!

YP should state that CLEARLY! Of course it will impact the choice of 
going with Yocto or Not ( probably NOT in this case).

>
>
>> Alex
> cu
> Adrian

Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg


Mobile   : +4917662901545
Email    : ayoub.zaki@embexus.com
Homepage : https://embexus.com
VAT No.  : DE313902634


