Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1Qciko-0003rz-H2
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 20:47:50 +0200
Received: by iym10 with SMTP id 10so3311788iym.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 11:44:05 -0700 (PDT)
Received: by 10.231.65.3 with SMTP id g3mr3206440ibi.55.1309545844907;
	Fri, 01 Jul 2011 11:44:04 -0700 (PDT)
Received: from [192.168.1.174] (c-67-187-204-11.hsd1.ca.comcast.net
	[67.187.204.11])
	by mx.google.com with ESMTPS id e23sm2007803ibe.23.2011.07.01.11.44.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 11:44:04 -0700 (PDT)
Message-ID: <4E0E156E.5050301@mvista.com>
Date: Fri, 01 Jul 2011 11:43:58 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.18) Gecko/20110616 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <RFC: Layer tooling brainstorming>
	<201105201745.29497.paul.eggleton@linux.intel.com>
	<4DD6A817.6050701@mvista.com>
	<201107011424.27821.paul.eggleton@linux.intel.com>
In-Reply-To: <201107011424.27821.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.1.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add support for remote layering.
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
X-List-Received-Date: Fri, 01 Jul 2011 18:47:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul,

> 
> 2) Fetching/updating layers should be (able to be) a conscious action rather 
> than something that happens implicitly as part of the build process
> 

Just a quick follow up, the part of this statement that to me is wrong,
is it appears you are dictating work flow. While, imho, the layer
management code which is above this level, is the place to dicate
workflow. The patch is to core bitbake and isolated at that. This patch
adds an additional work flow, and can be used in either state(the
results of a current BBLAYERS setting is exactly the same today as it as
after the patch).  More or less the patch is useful in a scope larger
then just layer-tooling.

-- 
Jeremy Puhlman
Montavista Sofware, LLC.


