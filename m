Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCB860809
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 08:15:23 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Mon, 30 Jun 2014 10:15:22 +0200
Date: Mon, 30 Jun 2014 10:15:07 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20140630081507.GA5083@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <CAAHuHfzRzh2LhFoc0VrdA+MqJiUOVwv_tNe9y48nOrk13ERHug@mail.gmail.com>
	<53B0DD86.4030402@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53B0DD86.4030402@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Subject: Re: Cape Manager
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
X-List-Received-Date: Mon, 30 Jun 2014 08:15:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Robert Yang <liezhi.yang@windriver.com> [140630 05:47]:


> On 06/30/2014 12:24 AM, Life Life wrote:
> > Hello,

> > I'm trying build yocto based linux, My hardware is beaglebone black I
> > successfull build system image. But I can't see capemanager. Beacuse my lcd is
> > not work.

> Hello,

> The cape manager is in meta-ti layer:

> http://layers.openembedded.org/layerindex/branch/master/layer/meta-ti/

> Seems that we'd better add it to meta-yoco-bsp ?

Unless something has changed since I last looked at this, I don't think
so. 

If I remember correctly, capemgr basically consists of a number of
patches not in the mainline kernel (and also not in TI's staging
kernel). I haven't checked it, by I doubt that we have them in the
linux-yocto kernel. (Especially as the last time I checked it, you had
to revert to a 3.8 (if I rember correctly, it might have been an even
earlier kernel) kernel to get full capemgr support.

If this has changed, then it'd be interesting to know!

Cheers,
Anders

> Add Saul in the loop.


-- 
Anders Darander
ChargeStorm AB / eStorm AB

