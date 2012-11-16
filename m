Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TZP2X-000431-Uw for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 17:45:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAGGVFqa001338;
	Fri, 16 Nov 2012 16:31:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01084-03; Fri, 16 Nov 2012 16:31:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAGGV7rh001332
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 16 Nov 2012 16:31:09 GMT
Message-ID: <1353083468.3709.110.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 16 Nov 2012 16:31:08 +0000
In-Reply-To: <CAP9ODKoL-=qQ0gSBiHdWnU9OZB4p2ruPraRCkYXLMYX1cAfgCw@mail.gmail.com>
References: <1353079960.3709.93.camel@ted>
	<CAP9ODKrfu8CMJ+ZWqkwQUCP+56WU_4sLf0Js9j_fYYGfDr7a0w@mail.gmail.com>
	<1353082360.3709.108.camel@ted>
	<CAP9ODKoL-=qQ0gSBiHdWnU9OZB4p2ruPraRCkYXLMYX1cAfgCw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Implement a setscene dependency validation routine to allow skipping of some sstate installation
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
X-List-Received-Date: Fri, 16 Nov 2012 16:45:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-16 at 14:22 -0200, Otavio Salvador wrote:
> On Fri, Nov 16, 2012 at 2:12 PM, Richard Purdie 
>         >         +        # do_package_write_* and do_package doesn't
>         need
>         >         do_package
>         >         +        if taskdependees[task][1] == "do_package"
>         and
>         >         taskdependees[dep][1] in ['do_package',
>         >         'do_package_write_deb', 'do_package_write_ipk',
>         >         'do_package_write_rpm']:
>         >         +            continue
>         >
>         > I understand why you does this but it would be better if we
>         had a
>         > central place to have the do_package_write_$pkg recorded or
>         when
>         > adding new type this could be forgotten.
>
>         Its a nice idea but I can't see any practical way to do this
>         at the
>         moment.
>
> We might hava a variable that provide all package backends names?
> Like:
>
> PACKAGE_BACKENDS = "ipk deb rpm"

That works for some usages but not where the expressions are in calls to
things like addtask.

I think there are other problems worth spending time on rather that this
which at best will probably cover 50% of the usages.

Cheers,

Richard





