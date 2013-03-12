Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UFIpL-0004sJ-80 for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 07:36:49 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2C6SL57014498; Tue, 12 Mar 2013 06:28:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2fNOKc8hPVSG; Tue, 12 Mar 2013 06:28:35 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2C6SGiq014493
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Mar 2013 06:28:26 GMT
Message-ID: <1363069177.9859.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 12 Mar 2013 06:19:37 +0000
In-Reply-To: <CAP9ODKog6e+3BbDT+pLy1a8GsEuKtyZmuuoHGoc3tOX20OvLpg@mail.gmail.com>
References: <1362765064-27663-1-git-send-email-Chase.Maupin@ti.com>
	<CAP9ODKphM_vr-CgBbpm60tQixxepsCcMN60yGwofnhSRhrm-kA@mail.gmail.com>
	<20130308200628.GB15481@denix.org>
	<CAP9ODKreEY23jZvHhQGPa27EJdH85JzH9_QmWMNU+w7aQ9u_+A@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015944E4E0@DLEE12.ent.ti.com>
	<CAP9ODKrnp4VHmvOyq-D=k1oy62VT0R18Xk1KS80kAD+4JfqLJQ@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED101594532C3@DLEE12.ent.ti.com>
	<CAP9ODKog6e+3BbDT+pLy1a8GsEuKtyZmuuoHGoc3tOX20OvLpg@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: the oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH] soc-family: fix SOC_FAMILY override order
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
X-List-Received-Date: Tue, 12 Mar 2013 06:37:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-11 at 13:24 -0300, Otavio Salvador wrote:
> On Mon, Mar 11, 2013 at 11:49 AM, Maupin, Chase <chase.maupin@ti.com> wrote:
> >> On Fri, Mar 8, 2013 at 7:16 PM, Maupin, Chase
> >> We can have more generic to more specific combinations.
> >>
> >> > Or are you trying to build something like omap3->am35xx->am3517
> >> where you can use omap3 as a more generic setting but still use
> >> am35xx for a slightly more restrictive group that is still
> >> grouping like parts, and finally you use am3517 for the exact
> >> part?
> >>
> >> Exactly so we avoid duplication stuff to boards or SoCs. Another
> >> example of use: imx -> mx6q -> mx6.
> >
> > I see.  This could be of some use and I'll play with it.  This
> should not be required though for this patch since right now I want to
> fix the order issue.  Any objection to the patch as is?
> 
> No; not really. I just wanted to ask if you could look at it as well
> so we can have it working. It does make things much easier for all us.

As pointed out this already merged.

I'd also point out that you can use MACHINEOVERRIDES directly to specify
additional machine overrides so I'm not sure there is much extra
complexity here that is really needed.

Cheers,

Richard





