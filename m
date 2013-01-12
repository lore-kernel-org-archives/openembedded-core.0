Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tu117-0003jV-Be for openembedded-core@lists.openembedded.org;
	Sat, 12 Jan 2013 14:20:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0CD5agx027732;
	Sat, 12 Jan 2013 13:05:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17527-05; Sat, 12 Jan 2013 13:05:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0CD5RDZ027726
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 12 Jan 2013 13:05:29 GMT
Message-ID: <1357995930.4072.134.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sat, 12 Jan 2013 13:05:30 +0000
In-Reply-To: <alpine.DEB.2.02.1301120618220.15410@oneiric>
References: <alpine.DEB.2.02.1301120618220.15410@oneiric>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: image_types.bbclass: what's with "elf" and "cpio.gz"?
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
X-List-Received-Date: Sat, 12 Jan 2013 13:20:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-01-12 at 06:22 -0500, Robert P. J. Day wrote:
> this snippet from image_types.bbclass:
> 
>     if "elf" in alltypes:
>         alltypes.remove("elf")
>         if "cpio.gz" not in alltypes:
>                 alltypes.append("cpio.gz")
>         alltypes.append("elf")
> 
>     # Filter out all the compressed images from types
>     for type in alltypes:
>     ... snip ...
> 
> i was going to trivially fix that comment (it's now "alltypes", not
> "types"), but i was distracted by the code above that -- what the heck
> is going on there?  what's the rationale for removing elf, then adding
> cpio.gz and elf back on at the end?  if someone can clarify that, i
> can add that as more comment, as well as a few other tweaks in that
> file for more documentation for anyone reading TFS.  thanks.

Order is important. The elf image depends on the cpio.gz image already
having been created so a) it must be created and b) it must happen
before elf.

Cheers,

Richard





