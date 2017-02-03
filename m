Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 02E86606CA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 14:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v13EIIgl015297; Fri, 3 Feb 2017 14:18:18 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ll5Q4EHAujdt; Fri,  3 Feb 2017 14:18:18 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v13EICRM015293
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Feb 2017 14:18:14 GMT
Message-ID: <1486131492.14144.70.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Fri, 03 Feb 2017 14:18:12 +0000
In-Reply-To: <alpine.LFD.2.20.1702030641310.2549@localhost.localdomain>
References: <alpine.LFD.2.20.1702030641310.2549@localhost.localdomain>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: whatever happened to a proposal for "read-only" sstate?
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
X-List-Received-Date: Fri, 03 Feb 2017 14:18:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-02-03 at 06:45 -0500, Robert P. J. Day wrote:
>   for purposes of teaching, i wanted to check into the feasibility of
> having students take advantage of a single shared state cache, but
> still have the option of building whatever source they needed in
> their
> own *personal* sstate cache.
> 
>   i found this reference from 2014:
> 
> http://lists.openembedded.org/pipermail/openembedded-core/2014-August
> /096486.html
> 
> but it seems clear nothing became of it; there's certainly no
> .bbclass
> file that matches that.
> 
>   what are the options for setting up something like this? or is that
> already supported and i'm just not seeing it?

It was never merged as its not really necessary, you can do this with
existing functionality.

Just point SSTATE_MIRRORS at the common shared directory and SSTATE_DIR
at the directory you want to be the personal one.

Cheers,

Richard


