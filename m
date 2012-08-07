Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyrKw-00010A-VC for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 23:29:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77LHQoV016031
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 22:17:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14392-08 for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2012 22:17:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77LHJp7016024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 22:17:20 +0100
Message-ID: <1344374241.9756.302.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 22:17:21 +0100
In-Reply-To: <007BD92917A2324FA403BCF9A464CF841FFA4167@ALA-MBA.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF841FFA4167@ALA-MBA.corp.ad.wrs.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: "Best" way to determine is building for target?
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
X-List-Received-Date: Tue, 07 Aug 2012 21:29:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-07 at 21:12 +0000, Slater, Joseph wrote:
> To change the installation for popt but not popt-native, I said
>  
> do_install_append_pn-popt {
>   ...
> }
>  
> which seems to work, but is there a better way, like some
> ${@building_for_host("yes text","no text",d)}
> construct?
>  

There is the new class-target override:

do_install_append_class-target {
 ...
}


(along with class-native, class-cross and class-nativesdk)

These are due to replace the virtclass-xxxx variants but we've not
gotten around to that yet. Its a relatively new addition to the system
but should be a useful one and allow some cleanup.

Cheers,

Richard



