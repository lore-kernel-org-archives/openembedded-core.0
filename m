Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QBuWe-0000lc-Vp
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 21:54:25 +0200
Received: by pvc30 with SMTP id 30so2483054pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 12:51:55 -0700 (PDT)
Received: by 10.68.49.166 with SMTP id v6mr7777794pbn.322.1303156315392;
	Mon, 18 Apr 2011 12:51:55 -0700 (PDT)
Received: from [192.168.1.17] (c-67-187-204-11.hsd1.ca.comcast.net
	[67.187.204.11])
	by mx.google.com with ESMTPS id g3sm1802094pbl.92.2011.04.18.12.51.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 12:51:54 -0700 (PDT)
Message-ID: <4DAC965A.7010402@mvista.com>
Date: Mon, 18 Apr 2011 12:51:54 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
	ThunderBrowse/3.3.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1303107421.5518.45.camel@rex>
In-Reply-To: <1303107421.5518.45.camel@rex>
X-Enigmail-Version: 1.1.1
Subject: Re: RFC: Layer tooling brainstorming
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
X-List-Received-Date: Mon, 18 Apr 2011 19:54:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

So we(montavista) basically have run through this process before, though
using collections implementation. Difference in overall implementation
aside, the issues are largely the same.

> * This layer tooling probably belongs at a higher level on the stack 
>   than bitbake itself

This is most definately true, and has worked well for us. We have a set
of content tools that describes the distribution of each of the
collections and prebuilt componets that get shipped to the end user.

> * Maybe need to split into "bootstrap" steps (e.g where pseduo is 
>   established, layers downloaded etc)

Internally we extended collections to act upon remote collections of
with any kind fetching bitbake supports. The collections implementation
has a "built-in" bootstrap step. The actual nice thing about the layers
implimentation, is you could implement the remote fetching with out
having the re-execution of bitbake. That being said there is a clear
need for a method of adding bootstrap steps to address things like
pseudo. I think trying to put something extensible here would probably
be good.




