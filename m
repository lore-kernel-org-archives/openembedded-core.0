Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9646E808
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 00:54:44 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id uo5so13989087pbc.27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 16:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1MpWi3MYJFGBwqybmc8Jgm8SsaSzhrZZXcILTzrAtZQ=;
	b=LkFPSqdxtlskd72Ma1sw5aTfS17y8fjrVyvj4/69jVtfuGeii5omh/6DxacjjqSolK
	2UWO+3DTLM3M+uc5VHAdImj19xCQAbrK97cMv6E/IXgSajXnADpGieXsuSGMTL2qpRh0
	pEochW2zuzyiLUE7cmXRMCgJWb6vuvj13f0Wr0Zp1q7yQo0tmzRLiLi3dSMAxc52l5Pc
	J86h4KVBe0V76e0qCjy8zq+OEiiSJrd0Q356X5NkU0N3Ji2qEuhLfOzlnVhNEVGN1P9s
	6lRm1r3WIPRegUtdfOrBk0GSA9Osj1Ax2aaJ5J6acFcbJaqxElUhGCffJUHZ1VyuvRTH
	0C5A==
X-Received: by 10.66.189.193 with SMTP id gk1mr17928406pac.105.1392512085685; 
	Sat, 15 Feb 2014 16:54:45 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	iq10sm31150782pbc.14.2014.02.15.16.54.44 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Feb 2014 16:54:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANP1U1z1d5CDar_NLDmnVX+EZJYfMnxbATip1_ejfe4E18pFVQ@mail.gmail.com>
Date: Sat, 15 Feb 2014 16:54:42 -0800
Message-Id: <17C2FD1E-6342-4B44-B597-9960E0E4A20D@gmail.com>
References: <CANP1U1xG6AkomoUcvm=chpQ=G7HY7ruFQRgYA5We6UsoFxvBLQ@mail.gmail.com>
	<A0921DE9-1EB3-4D7D-9D96-9092A7579041@gmail.com>
	<CANP1U1z1d5CDar_NLDmnVX+EZJYfMnxbATip1_ejfe4E18pFVQ@mail.gmail.com>
To: Jay Cady <jcady92@gmail.com>
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with libicudata.so in OE master
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
X-List-Received-Date: Sun, 16 Feb 2014 00:54:44 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_5686BB6D-6DF1-4149-A1EA-25274387D7CA"

--Apple-Mail=_5686BB6D-6DF1-4149-A1EA-25274387D7CA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On Feb 15, 2014, at 4:52 PM, Jay Cady <jcady92@gmail.com> wrote:

> Hey, thanks for the reply!
>=20
> I tried it out and wasn't able to boot the image.  Here is the output =
of the boot when it failed:
>=20

Its not the patch. your image seems corrupt.=20

> [    3.230529] Freeing init memory: 180K
> INIT: version 2.88 booting
> INIT: Entering runlevel: 5
> INIT: cannot execute "/etc/init.d/rc"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT:
> cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT:
> cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: Id "mxc0" respawning too fast: disabled for 5 minutes
> INIT: cannot execute "/sbin/getty"
> INIT: cannot execute "/sbin/getty"
> INIT: Id "1" respawning too fast: disabled for 5 minutes
> INIT: no more processes left in this runlevel
>=20
> Any ideas why this is happening?  Perhaps I installed the patch =
incorrectly?
>=20
>=20
> On Sat, Feb 15, 2014 at 5:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>=20
> can you try this patch
>=20
> =
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/icu=
&id=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63
>=20
> and report back
>=20
> -Khem
>=20
>=20
>=20
> On Feb 15, 2014, at 9:57 AM, Jay Cady <jcady92@gmail.com> wrote:
>=20
>> I'm having the exact same problem.
>>=20
>> Latest master branch of Yocto 1.5 2/13/14.  Built with the master =
branch of meta-qt5.  Wandboard-dual.
>>=20
>> When running the Qt5_CinematicExperience app, I'm getting this error:
>>=20
>> shared libraries: /usr/lib/libicudata.so.51: internal error
>>=20
>> Any ideas how to fix this?
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20


--Apple-Mail=_5686BB6D-6DF1-4149-A1EA-25274387D7CA
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv="Content-Type" content="text/html charset=iso-8859-1"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;"><br><div><div>On Feb 15, 2014, at 4:52 PM, Jay Cady &lt;<a href="mailto:jcady92@gmail.com">jcady92@gmail.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><blockquote type="cite"><div dir="ltr"><div>Hey, thanks for the reply!</div><div><br></div>I tried it out and wasn't able to boot the image. &nbsp;Here is the output of the boot when it failed:<div><br></div></div></blockquote><div><br></div><div>Its not the patch. your image seems corrupt.&nbsp;</div><br><blockquote type="cite"><div dir="ltr"><div><div>[ &nbsp; &nbsp;3.230529] Freeing init memory: 180K</div>


<div>INIT: version 2.88 booting</div><div>INIT: Entering runlevel: 5</div><div>INIT: cannot execute "/etc/init.d/rc"</div><div>INIT: cannot execute "/sbin/getty"</div><div>INIT: cannot execute "/sbin/getty"</div>


<div>INIT:</div><div>cannot execute "/sbin/getty"</div><div>INIT: cannot execute "/sbin/getty"</div><div>INIT: cannot execute "/sbin/getty"</div><div>INIT: cannot execute "/sbin/getty"</div>


<div>INIT: cannot execute "/sbin/getty"</div><div>INIT:</div><div>cannot execute "/sbin/getty"</div><div>INIT: cannot execute "/sbin/getty"</div><div>INIT: cannot execute "/sbin/getty"</div>


<div>INIT: cannot execute "/sbin/getty"</div><div>INIT: cannot execute "/sbin/getty"</div><div>INIT: cannot execute "/sbin/getty"</div><div>INIT: Id "mxc0" respawning too fast: disabled for 5 minutes</div>


<div>INIT: cannot execute "/sbin/getty"</div><div>INIT: cannot execute "/sbin/getty"</div><div>INIT: Id "1" respawning too fast: disabled for 5 minutes</div><div>INIT: no more processes left in this runlevel</div>


</div><div><br></div><div>Any ideas why this is happening? &nbsp;Perhaps I installed the patch incorrectly?</div><div class="gmail_extra"><br><br><div class="gmail_quote">On Sat, Feb 15, 2014 at 5:14 PM, Khem Raj <span dir="ltr">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>


<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style="word-wrap:break-word">Hi<div><br></div><div>can you try this patch</div><div><br></div><div><a href="http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/icu&amp;id=07ff1b539a62053c6d41cd2814e8d0bca1991a63" target="_blank">http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/icu&amp;id=07ff1b539a62053c6d41cd2814e8d0bca1991a63</a></div>


<div><br></div><div>and report back</div><div><br></div><div>-Khem</div><div><br></div><div><br></div><div><br><div><div><div>On Feb 15, 2014, at 9:57 AM, Jay Cady &lt;<a href="mailto:jcady92@gmail.com" target="_blank">jcady92@gmail.com</a>&gt; wrote:</div>


<br></div><blockquote type="cite"><div><div dir="ltr">I'm having the exact same problem.<div><br></div><div>Latest master branch of Yocto 1.5 2/13/14. &nbsp;Built with the master branch of meta-qt5. &nbsp;Wandboard-dual.</div>


<div><br></div><div>When running the Qt5_CinematicExperience app, I'm getting this error:</div>

<div><br></div><div>shared libraries: /usr/lib/libicudata.so.51: internal error</div><div><br></div><div>Any ideas how to fix this?</div></div></div>
_______________________________________________<br>Openembedded-core mailing list<br><a href="mailto:Openembedded-core@lists.openembedded.org" target="_blank">Openembedded-core@lists.openembedded.org</a><br><a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>


</blockquote></div><br></div></div></blockquote></div><br></div></div>
</blockquote></div><br></body></html>

--Apple-Mail=_5686BB6D-6DF1-4149-A1EA-25274387D7CA--
