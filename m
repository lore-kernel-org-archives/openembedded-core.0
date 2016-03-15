Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE416FFC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 11:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2FBmtke007091; Tue, 15 Mar 2016 11:48:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bdkSLBFmiGTe; Tue, 15 Mar 2016 11:48:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2FBmovg007087
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 15 Mar 2016 11:48:51 GMT
Message-ID: <1458042530.2804.310.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Tue, 15 Mar 2016 11:48:50 +0000
In-Reply-To: <CAP9ODKoNSWrsjo5=dKX863+=5YKfjnUv-ic1_Q3MzQA-y9pUcg@mail.gmail.com>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
	<CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
	<CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
	<CAJTo0LYfwrc+wteB+ez6gqZbXgM8dJO6PKrB+vf0S6+ANC7ggQ@mail.gmail.com>
	<CAP9ODKopJb0SusuYNubJz9oEMjJUDLyRBjNWDjeFD+tw0iYS3g@mail.gmail.com>
	<CAJTo0Lbx5YajNU5fcRkn1sk43LW1tCLm7p1WxCM=fQqTYo=zWA@mail.gmail.com>
	<CAP9ODKp=+6F6dMDryHOtNcMsmBL3VqHpNwioxpi3AtoxQ3ji9A@mail.gmail.com>
	<CAJTo0LY=BQxpH0Eq=86OnLB7M_bAR5+HhrWg7YqfhVPZgQ6=ng@mail.gmail.com>
	<CAP9ODKqoummpnrf_-4mZgY94u3kRTdmB0AhNX=0LGFAz0yBpVA@mail.gmail.com>
	<CABcZAN=_-oVgP+8OOggYaGox6GkDLeyhtS5+=dCvgapaKZ0TDw@mail.gmail.com>
	<CAP9ODKprS3P41A_fCApFSTmm=s9MvTDtD5J87d9fOdRm=cS0Zg@mail.gmail.com>
	<CAJTo0Lb5ehLTcYu5=twZOqJQULCX1qywXz=p1K7=E5ExWDVM2g@mail.gmail.com>
	<CAP9ODKoNSWrsjo5=dKX863+=5YKfjnUv-ic1_Q3MzQA-y9pUcg@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Tue, 15 Mar 2016 11:49:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-03-15 at 08:01 -0300, Otavio Salvador wrote:
> On Mon, Mar 14, 2016 at 6:26 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > 
> > On 14 March 2016 at 21:23, Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > > 
> > > Do you mind to explain to me why?
> > > 
> > > I would like to try to see your view on this.
> > 
> > 
> > libsdl is a good example to be honest.  Why does your choice of
> > target
> > distro features decide what libraries the native sdl should use? 
> >  Respecting
> > them means in this case that you can't have a graphical qemu. 
> >  Taking it to
> > hypotheticals, just because my target is pure Wayland doesn't mean
> > I expect
> > sdl to build for Wayland without X11, especially if my desktop is
> > X11 based.
> 
> I agree with the overall goal here however this means we ought to
> have
> a HOST_DISTRO_FEATURES setting and not ignore it at all.

I think right now there isn't a pressing need for the extra
complications this brings in. Obviously we should watch the situation
carefully though.

Cheers,

Richard

