Return-Path: <Stefan_Seefeld@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 058A260071
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 18:00:16 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VJoiA-0003cn-5D from Stefan_Seefeld@mentor.com ;
	Wed, 11 Sep 2013 11:00:18 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 11 Sep 2013 11:00:17 -0700
Received: from [0.0.0.0] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.2.247.3;
	Wed, 11 Sep 2013 11:00:17 -0700
Message-ID: <5230AFB0.7010008@mentor.com>
Date: Wed, 11 Sep 2013 14:00:16 -0400
From: Stefan Seefeld <stefan_seefeld@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <5230AAB4.2060005@mentor.com>
	<CAJTo0LZMNna84CTpC3QTr6X+kMMcFXCERgsx=8kaqL3PpRr_hw@mail.gmail.com>
In-Reply-To: <CAJTo0LZMNna84CTpC3QTr6X+kMMcFXCERgsx=8kaqL3PpRr_hw@mail.gmail.com>
X-OriginalArrivalTime: 11 Sep 2013 18:00:17.0991 (UTC)
	FILETIME=[C6374570:01CEAF18]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: build errors after upgrading
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
X-List-Received-Date: Wed, 11 Sep 2013 18:00:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 09/11/2013 01:52 PM, Burton, Ross wrote:

> So the X vmware driver has a hard dependency on DRI if your X server
> is recent, instead of having a configure option. Now that Mesa is
> refusing to build in distros where you haven't asked for any OpenGL,
> this is being discovered.  It should be fairly simple to add a
> configure option to enable/disable the graphics module of
> xf86-video-vmware.

But meanwhile, what is the appropriate fix on OE trunk, to get back to a
working state ?

	Stefan


-- 
Stefan Seefeld
CodeSourcery / Mentor Graphics
http://www.mentor.com/embedded-software/

