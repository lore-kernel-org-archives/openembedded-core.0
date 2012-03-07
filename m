Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S56XN-00063U-DL
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 03:23:33 +0100
Received: by obqv19 with SMTP id v19so7214640obq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 18:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=8Gg1PmTL2pGaWTHCrDlBcXbDArX7V6bMHE1Dpk29tVk=;
	b=RttTiJbfuhipzY9NuCT3jqdcwZJKIVwmo5BgycYZMpFoqQaxLEoI76gHLH6tUP7/wv
	EJwPFxXu4KKOICIGpBtRvGjPKkiWGmUublJiUYWl5Dgd4cRHkCBIyya4n6SibRi3o5XT
	DA3RrUHE3HfE+UWus1hxlfar9XqqeuGHxbYrDCXfaRSHjRL+i80ZxXOWljcQmolgF3R0
	jHOIXGhveH5sI0hOTUwqRdBUIFdDnYqn4p8u5CXo35XX6s1cPsQ3CnqblxX4PYfRdrIa
	t7aWX9RtGkYJccJsqXluSPFmq1iz5gZF2LW/ePm6aNIYlEmxWc/3aG1liC59Hc4S87l0
	fGWg==
Received: by 10.60.4.10 with SMTP id g10mr118589oeg.18.1331086496578;
	Tue, 06 Mar 2012 18:14:56 -0800 (PST)
Received: from [192.168.1.78] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id il8sm19834713obc.18.2012.03.06.18.14.54
	(version=SSLv3 cipher=OTHER); Tue, 06 Mar 2012 18:14:55 -0800 (PST)
Message-ID: <4F56C49C.4000504@gmail.com>
Date: Tue, 06 Mar 2012 18:14:52 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120302 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1331078069.git.paul.eggleton@linux.intel.com>
	<50d2b32b6d5367e5822c396d28a78ea54cb4ea40.1331078069.git.paul.eggleton@linux.intel.com>
In-Reply-To: <50d2b32b6d5367e5822c396d28a78ea54cb4ea40.1331078069.git.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] formfactor: use full path to fbset
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
X-List-Received-Date: Wed, 07 Mar 2012 02:23:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2012 03:55 PM, Paul Eggleton wrote:
> When using rootless X, /usr/sbin is not in PATH and thus running "fbset"
> will fail; so specify /usr/sbin/fbset instead.
>

just curious why is /usr/sbin omitted from PATH ?


