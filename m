Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RvqqY-00018C-3f for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 14:49:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1ADf02e031240
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 13:41:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29766-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 13:40:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1ADekmO031219
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 13:40:47 GMT
Message-ID: <1328881254.13434.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 10 Feb 2012 13:40:54 +0000
In-Reply-To: <CAMKF1soksEad4TP5upRjW2vG6_OjeQjyYTAL88PH_qgy9yyiug@mail.gmail.com>
References: <1328832372.10451.47.camel@ted>
	<CAMKF1soksEad4TP5upRjW2vG6_OjeQjyYTAL88PH_qgy9yyiug@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gcc-4.6: Some small performance tweaks
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
X-List-Received-Date: Fri, 10 Feb 2012 13:49:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-09 at 16:39 -0800, Khem Raj wrote:
> On Thu, Feb 9, 2012 at 4:06 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
> 
> 
> note that we will need to ship zlib-nativesdk as well if we do this
> so hopefully that case is covered by this.

Yes, zlib has a BBCLASSEXTEND on zlib-nativesdk so this should be fine.

Cheers,

Richard



