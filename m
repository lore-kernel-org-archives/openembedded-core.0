Received: from smtp.knology.net ([64.8.71.112])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyle@farnsworthtech.com>) id 1UZnvU-00029h-M6
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 21:51:53 +0200
X_CMAE_Category: 0,0 Undefined,Undefined
X-CNFS-Analysis: v=2.0 cv=fYgvOjsF c=1 sm=0 a=gvO/T8MMVPT0XnXDMvgFBA==:17
	a=-TtDL2fbfKMA:10 a=dWUxHrtDoX8A:10 a=8nJEP1OIZ-IA:10
	a=4Du6mIFzAAAA:8 a=sHfyraJjmcgA:10 a=eXpRujbwhtYI1ULSOloA:9
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
Received: from [216.186.251.41] ([216.186.251.41:38026]
	helo=host.farnsworthtech.com)
	by smtp.knlogy.net (envelope-from <kyle@farnsworthtech.com>)
	(ecelerity 2.2.3.47 r(39787)) with ESMTPA
	id 48/38-22204-E1759815; Tue, 07 May 2013 15:33:50 -0400
Received: from [192.168.1.18] (unknown [192.168.1.18])
	by host.farnsworthtech.com (Postfix) with ESMTP id 102EB81365
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2013 14:33:50 -0500 (CDT)
Message-ID: <5189571D.3030909@farnsworthtech.com>
Date: Tue, 07 May 2013 14:33:49 -0500
From: Kyle Farnsworth <kyle@farnsworthtech.com>
Organization: Farnsworth Technology, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <51892728.3090609@farnsworthtech.com>
	<51892D8A.5030806@windriver.com>
	<51893B46.3090205@farnsworthtech.com>
	<51893CB4.9070304@windriver.com>
	<CAHUNapRP6SbJVhQey907pHg+X+tosP-86D_5gBs=Vkt4MPBN+w@mail.gmail.com>
	<51894960.6070406@windriver.com>
In-Reply-To: <51894960.6070406@windriver.com>
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
X-List-Received-Date: Tue, 07 May 2013 19:52:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/07/2013 01:35 PM, Mark Hatle wrote:
>>> - nativesdk -- runs on the 'sdkhost' (variant called 'crosssdk')
>>
>> Is this related to the SDKMACHINE setting?
>>
>
> Yes that's the variable I was thinking of.  You can build an SDK for
> 'i586' on your x86_64 host for instance.
>

So in my case, since I did not specify SDKMACHINE, it is creating a
toolchain that compiles source into x86_64 executables so it can build
the host tools (i.e automake) on the targeted SDK machine.  And it has
nothing to do with the targeted device cross-compile toolchain?


