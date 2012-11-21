Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TbEPk-0006Op-N6 for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 18:48:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qALHYdWm017682;
	Wed, 21 Nov 2012 17:34:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17532-01; Wed, 21 Nov 2012 17:34:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qALHYTI3017676
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 21 Nov 2012 17:34:31 GMT
Message-ID: <1353519268.10459.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 21 Nov 2012 17:34:28 +0000
In-Reply-To: <CAP9ODKoae1cD-qkN=VfSpLDRZO=yrcCXyhEmE+5+ZQbjahpU5w@mail.gmail.com>
References: <cover.1353490311.git.kai.kang@windriver.com>
	<bbf45c7739e8d08864c771446b487a5169e1f488.1353490311.git.kai.kang@windriver.com>
	<CAP9ODKoae1cD-qkN=VfSpLDRZO=yrcCXyhEmE+5+ZQbjahpU5w@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] msmtp: add link to ${libdir}/sendmail
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
X-List-Received-Date: Wed, 21 Nov 2012 17:48:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-21 at 09:28 -0200, Otavio Salvador wrote:
> On Wed, Nov 21, 2012 at 7:38 AM, Kang Kai <kai.kang@windriver.com> wrote:
> > LSB tests check file ${libdir}/sendmail, and the file was created by
> > package lsbsetup. Because lsbsetup is dropped, create the link in msmtp.
> >
> > Signed-off-by: Kang Kai <kai.kang@windriver.com>
> 
> I think it is wrong. You should to use alternatives for it.

Not necessarily, its not a file conflict problem, it just needs to exist
at all...

Cheers,

Richard




