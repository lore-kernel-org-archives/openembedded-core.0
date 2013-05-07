Received: from smtp.knology.net ([64.8.71.112])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyle@farnsworthtech.com>) id 1UZm4W-00075F-O9
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 19:53:07 +0200
X_CMAE_Category: 0,0 Undefined,Undefined
X-CNFS-Analysis: v=2.0 cv=fYgvOjsF c=1 sm=0 a=gvO/T8MMVPT0XnXDMvgFBA==:17
	a=-TtDL2fbfKMA:10 a=dWUxHrtDoX8A:10 a=8nJEP1OIZ-IA:10
	a=4Du6mIFzAAAA:8 a=sHfyraJjmcgA:10 a=-8UqIoMTsdHWfWJnQ4sA:9
	a=wPNLvfGTeEIA:10 a=gvO/T8MMVPT0XnXDMvgFBA==:117
X-CM-Score: 0
X-Scanned-by: Cloudmark Authority Engine
Authentication-Results: smtp02.knology.synacor.com
	header.from=kyle@farnsworthtech.com; sender-id=neutral
Authentication-Results: smtp02.knology.synacor.com
	smtp.mail=kyle@farnsworthtech.com; spf=neutral;
	sender-id=neutral
Authentication-Results: smtp02.knology.synacor.com
	smtp.user=kfarns@knology.net; auth=pass (LOGIN)
Received-SPF: neutral (smtp02.knology.synacor.com: 216.186.251.41 is neither
	permitted nor denied by domain of farnsworthtech.com)
Received: from [216.186.251.41] ([216.186.251.41:7199]
	helo=host.farnsworthtech.com)
	by smtp.knlogy.net (envelope-from <kyle@farnsworthtech.com>)
	(ecelerity 2.2.3.47 r(39787)) with ESMTPA
	id 43/13-22204-64B39815; Tue, 07 May 2013 13:35:03 -0400
Received: from [192.168.1.18] (unknown [192.168.1.18])
	by host.farnsworthtech.com (Postfix) with ESMTP id 7973E81365
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2013 12:35:02 -0500 (CDT)
Message-ID: <51893B46.3090205@farnsworthtech.com>
Date: Tue, 07 May 2013 12:35:02 -0500
From: Kyle Farnsworth <kyle@farnsworthtech.com>
Organization: Farnsworth Technology, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <51892728.3090609@farnsworthtech.com>
	<51892D8A.5030806@windriver.com>
In-Reply-To: <51892D8A.5030806@windriver.com>
X-Enigmail-Version: 1.5.1
Subject: Re: SDK meta-toolchain
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
X-List-Received-Date: Tue, 07 May 2013 17:53:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/07/2013 11:36 AM, Mark Hatle wrote:
> On 5/7/13 11:09 AM, Kyle Farnsworth wrote:
>> I'm a bit confused about what exactly meta-toolchain is building?  It
>> seems to be bitbaking gcc and creating a toolchain with the prefix
>> x86_64-oesdk-linux- (default SDK_PREFIX) but I'm not sure what it is.
>> Is it a cross-compile for my target MACHINE or a compiler for my build
>> machine?  Based on the prefix name I am assuming the latter.
>
> There are two ways to generate an SDK.
>
> * targeted SDK -- This is a meta-toolchain* recipe that lists
> -exactly- what is going to be in the SDK.  This is great if you want
> to limit your SDK to specific libraries for your application developers.
>
> * implied / image based SDK -- This type of SDK bases off of what is
> in the image to generate an SDK that contains all of the libraries
> that are runnable inside of the image.  This is a very simple way to
> generate an SDK for application developers that -will- match the
> run-time image.
>
> Both of the above have their place, depending on the level of command
> and control people want.
>
> The basic meta-toolchain is just the cross compile toolchain and I
> believe the libc.  meta-toolchain-gmae is an example Gnome Mobile
> Application Environment.
Thanks. This a good info.  I need to do the targeted SDK.  But why is it
re-creating the cross-compile toolchain with the new prefix and a libc? 
I also have cases where I want to deliver an external toolchain within
the SDK.





