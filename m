Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBA3703B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 10:16:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s68AFnfd007865; Tue, 8 Jul 2014 11:15:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VJmlDf9oIO8a; Tue,  8 Jul 2014 11:15:49 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s68AFiU3007862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 8 Jul 2014 11:15:46 +0100
Message-ID: <1404814538.1458.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 08 Jul 2014 11:15:38 +0100
In-Reply-To: <alpine.LFD.2.11.1407070925320.9468@localhost>
References: <alpine.LFD.2.11.1407070925320.9468@localhost>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what's the rationale for libpcre_8.35 "PROVIDING" pcre?
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
X-List-Received-Date: Tue, 08 Jul 2014 10:16:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-07-07 at 09:31 -0400, Robert P. J. Day wrote:
>   i might be overthinking this, but ive noticed a number of "lib*"
> recipe files that "PROVIDE" the shorter name. case in point -- in the
> current oe-core, the recipe file libpcre_8.35.bb explicitly does this:
> 
> PROVIDES += "pcre"
> 
> is there a reason for this, other than the obvious allowing to use the
> shorter name?
> 
>   i did notice that, although the name "libpcre" suggests a shared
> library, the recipe file clearly creates a number of packages,
> including some that provide command-line utilities:
> 
> PACKAGES =+ "libpcrecpp libpcreposix pcregrep pcregrep-doc pcretest pcretest-doc"
> 
>   so is there anything to this occasional "lib*" renaming, other than
> brevity? thanks.

I suspect the recipe was once called "pcre" but was renamed and the
PROVIDES was for compatibility. There might be something in the history
about that.

Cheers,

Richard


