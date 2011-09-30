Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R9h1M-0007od-BU
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:37:12 +0200
Received: by ywf7 with SMTP id 7so1698166ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 10:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=XyLY/zReb51oWA7HlP4f3tTw7nubvUOxC/VvkfHpAa0=;
	b=wIIyN/KfdRb70/vbtfnFDke+HeOKds0wdquEq+idFHw3rmAYEm87abpVoEag/VoXUX
	7j2MkkvwJJAGJezbMtxIY56qdoc8/CVMpMWF74AWIdK7ui88I5gIAYZjZrL/tCOBQySo
	HpEKDeSlBeZHlmdmoCualEkWtlfzh+cwUTYiU=
Received: by 10.236.185.164 with SMTP id u24mr20946389yhm.94.1317403902569;
	Fri, 30 Sep 2011 10:31:42 -0700 (PDT)
Received: from [172.23.2.133] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id r16sm15591772anh.8.2011.09.30.10.31.40
	(version=SSLv3 cipher=OTHER); Fri, 30 Sep 2011 10:31:41 -0700 (PDT)
Message-ID: <4E85FCF7.6030208@gmail.com>
Date: Fri, 30 Sep 2011 10:31:35 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:7.0) Gecko/20110922 Thunderbird/7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5755C992-C736-4714-9DE3-761E3E74C6F8@kernel.crashing.org>
In-Reply-To: <5755C992-C736-4714-9DE3-761E3E74C6F8@kernel.crashing.org>
Subject: Re: Adding TARGET_VECTOR
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
X-List-Received-Date: Fri, 30 Sep 2011 17:37:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/25/2011 7:35 AM, Kumar Gala wrote:
> We have some packages like flac that are aware of vectorization that may or may not exist on a given processor.  I was wondering if adding something like TARGET_VECTOR similar to TARGET_FPU made sense as a way for recipes to decide on how to set various vectorization flags if needed.
>
> I was looking at this mostly from the PPC side in which we have:
>
> TARGET_VECTOR = "" /* processor has no vector hw */
> TARGET_VECTOR = "altivec" /* processor has AltiVec support */
> TARGET_VECTOR = "spe" /* processor has signal processing engine support */
> TARGET_VECTOR = "vsx" /* processor has Vector-Scalar Extension */
>

is target vector a property of FPU itself or is it a separate processing 
unit in hardware.?


> Not sure what makes sense for x86, ARM, or MIPS.

>
> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



