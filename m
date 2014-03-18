Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 34C4D6F933
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 23:08:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2IN7VCr021385; Tue, 18 Mar 2014 23:08:22 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2e0hPPMP2qrT; Tue, 18 Mar 2014 23:08:22 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2IN8J3R021608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 18 Mar 2014 23:08:20 GMT
Message-ID: <1395184093.3808.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Mar 2014 23:08:13 +0000
In-Reply-To: <CAMKF1srprf=54e_nh2+j5fCCRCkrTGxNxM7DgVVgqRxSDMRNCA@mail.gmail.com>
References: <1394559360-27718-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LY4_XK3-KCTON_tnzhqTnOgH4UfKVTBcBfzYGrXy-wi3A@mail.gmail.com>
	<CAMKF1srprf=54e_nh2+j5fCCRCkrTGxNxM7DgVVgqRxSDMRNCA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: Upgrade 4.0 -> 5.0
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
X-List-Received-Date: Tue, 18 Mar 2014 23:08:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-03-18 at 10:07 -0700, Khem Raj wrote:
> On Tue, Mar 18, 2014 at 8:51 AM, Burton, Ross <ross.burton@intel.com> wrote:
> > On 11 March 2014 17:36, Khem Raj <raj.khem@gmail.com> wrote:
> >> bluetooth-proximity has been removed in 5.0
> >
> > This brings in a new QA warning:
> >
> > WARNING: QA Issue: pulseaudio: configure was passed unrecognised
> > options: --enable-bluez
> 
> yeah now it differentiates between bluez4 and bluez5 so the options
> are also renamed
> accordingly. I have sent a v2

Did you sent the right patch?

Cheers,

Richard


