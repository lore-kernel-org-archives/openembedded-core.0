Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QjIyG-0002vz-GT
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 00:40:56 +0200
Received: (qmail invoked by alias); 19 Jul 2011 22:36:50 -0000
Received: from p5B0A2ECF.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.46.207]
	by mail.gmx.net (mp047) with SMTP; 20 Jul 2011 00:36:50 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18GwfMdSZQGQUV+6AMIE/azTV2ot3ckgh0XnW+Bz2
	N0QOFn4C9CES+v
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2011 00:38:54 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <201107182310.56104.schnitzeltony@gmx.de>
	<201107182319.01358.schnitzeltony@gmx.de>
In-Reply-To: <201107182319.01358.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201107200038.55362.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-oe] Problems on downloading sources (was Problems downloading xfwm4 4.8.1)
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
X-List-Received-Date: Tue, 19 Jul 2011 22:40:56 -0000
X-Groupsio-MsgNum: 6183
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_/dgJO0CPYI3zr/w"

--Boundary-00=_/dgJO0CPYI3zr/w
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday, July 18, 2011 11:19:01 PM Andreas Mueller wrote:
> On Monday, July 18, 2011 11:10:55 PM you wrote:
> > Ciao
> > 
> > currently I am porting my local oe recipes for xfce-4.8 to oe-core.
> > Everything seems fine so far - except xfwm4. This one drives me totally
> > insane: If you check the fetch log attched and copy the first url into a
> > browser it starts downloading without problems but oe complains.
> > 
> > Could somebody please point me onto what is going wrong - if you need
> > further information I'll send...
> 
> I found a hook on what is going wrong - forget my prevoius mail - sorry fo
> the noise..
Sorry but my 'hook' was some late night crap. 

I attached what I did up to now. It is meta-xfce which should live in meta-
openembedded. I checked on fresh tmp and without downloaded sources. For (at 
least) xfwm4 and xfce4-appfinder build fails when downloading sources. For xfce4-
appfinder I get:

ERROR: Function 'Fetcher failure for URL: 
'http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-
appfinder-4.8.0.tar.bz2'. Unable to fetch URL 
http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-appfinder-4.8.0.tar.bz2 
from any source.' failed
ERROR: Logfile of failure stored in: /home/Superandy/tmp/oe-core-
eglibc/work/armv7a-angstrom-linux-gnueabi/xfce4-appfinder-4.8.0-
r0/temp/log.do_fetch.30009
Log data follows:
| NOTE: fetch http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-
appfinder-4.8.0.tar.bz2
| NOTE: fetch http://www.angstrom-distribution.org/unstable/sources/xfce4-
appfinder-4.8.0.tar.bz2
| ERROR: Function 'Fetcher failure for URL: 
'http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-
appfinder-4.8.0.tar.bz2'. Unable to fetch URL 
http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-appfinder-4.8.0.tar.bz2 
from any source.' failed
NOTE: package xfce4-appfinder-4.8.0-r0: task do_fetch: Failed

If I enter http://archive.xfce.org/src/xfce/xfce4-appfinder/4.8/xfce4-
appfinder-4.8.0.tar.bz2 in my browser or perform wget manually, the source file is 
downloaded properly!!

Could somebody please spend some time with the attachment and tell me what's 
going on here??

Thanks

Andreas

--Boundary-00=_/dgJO0CPYI3zr/w
Content-Type: application/x-compressed-tar;
  name="meta-xfce.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="meta-xfce.tar.gz"

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
o9m2ckX7Ky8d0Fs6nstbbYh6yyZhHHJoLaXUao0p41QggjnKKXX9Sq+ybKbaZkgwpjkzmmjEJLEE
CmQhFlBSjAlBSFMitSIGpzIXrv8igzJDuXTav0/L5urx33X0/a7/8ss/KWTQx//juP53P7K+/cvN
bqt9l2Uj/y/j/z3pd1MBFNZ/YRbxfx9SE/8FfJt3LseVP0sL03Mbd+tgvMozeL9FAVmeYSi1xZhm
uUS5YVgToWVuc0uzDK0C+ilSz6G794UlZTS+j62fnjoP05ujvmceAb0e3yr3XmGGXxwiF63B8LJc
cPYxnN2sDtQDErRpanRqFGM8V5kiClulmNISK5QTuAqQjJs46yzLOUKY2zxnguaptURKyI3FuSGK
UykcFilLc+nwjkoFlRZap5JnOgDS9Pl/wAF/Qbb1/2RukMDYr/8lJPp/9iML7d8Vt2bY9LsPWMem
8T9ban+KaZz/7UUegw8GXIkvxs30wtzGj/OqKwo3CQCTta23z4GPHXVHRgPw009+tc1huQFNNxCd
PPn367NP4YWL/wlzmKnKilTMadKVmjAAH1bbagi+03NHR0oyLyVYd7C8Old3qa19/vb16xKgfq/W
UimThL79aFLEXb1fEtSeHgInruSfs9VMC1dLhmZL+yCJ75PTR4kSJUqUKFGiRIkSJUqUKFGiRIkS
JUqUKFGiRIkS5f9T/gu8CEfsAPAAAA==

--Boundary-00=_/dgJO0CPYI3zr/w--
