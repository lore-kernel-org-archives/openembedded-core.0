Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5244A6067D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 17:31:32 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id z14so12574873igp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 09:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CkO5p72RE2eFGdZcC9Z1UVHrC01s7nAvuffbgF+e66k=;
	b=2LwNKLI1heL7vJczE4RY/Wv65V4jQZzMOcoB8R/VOh/cSlpleDFLlI6FTfxWjMat6X
	btiw66oxjpVQ0WJxwB0WgL9cYL/+eWV0uGUxpix2EQPEjyuX+4pMSeuMmYUsBp43PYTh
	LFJ+X3SginvTPDYAQzGMVRvIha9LEmcDK46uBpe/gj4Ve4wDZYrJT62wbK7oS3LwvRmS
	GTrUCx14X9yJc2vlHnxeBHdywqLVSMW1hbv5Sv2y9iB4faSkv7022Iy6Dz0k7e8UAsVG
	JXHcoHcZv9Ce4I1QAbsMOhvp3k05o45h9sARCdDt18XEQazX57yVWM0j41iKaG9TkXXB
	BtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CkO5p72RE2eFGdZcC9Z1UVHrC01s7nAvuffbgF+e66k=;
	b=ixSpDC7IuvO0k1FYPMStBoLtV0Ah4n+1RCsxSDj1WV0l6VaZmuvZNq6atJniPCipSx
	KYYTKisWgCZDx7EMGAVbFm/5MwJ/LM2CgI0KSptEy0QEmfGe/o67k39J/RhOSBzlNkgK
	XGMqrpCW5+1CST2ZYUnUc2Bk5nMjUQQf7tD5Pq7MpLVCxv3lRWvEphhGKKwtb9OicIal
	jg1KZBrTuENu03GURbQzKHWRovXrJTZZThhsx9XPF3N1vCnwdgSyRXFidAxxZoenmtY2
	eoqUD6Vww6ibDU7ixasDK2IxCCaO6qUWHgVRfUtkl60Qt0sOCS11MKbFD/p6Jj4rg/ET
	/vlA==
X-Gm-Message-State: ALoCoQkI3/e7Oco7Y4DNQITlkH3clH/5JwmugEbRWe9Ry/ef98YccwHAhazon4nK2ykt2FY+Wrfh/u25+nyo0gLGDxGOBl2UEcZQz+DLvF8qzJ+sV4L2/9A=
X-Received: by 10.50.30.69 with SMTP id q5mr5106366igh.78.1452015093629; Tue,
	05 Jan 2016 09:31:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 5 Jan 2016 09:31:14 -0800 (PST)
In-Reply-To: <1451986361-10021-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1450352712-31476-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1451986361-10021-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1451986361-10021-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jan 2016 17:31:14 +0000
Message-ID: <CAJTo0LZrgzjXXWTzyRDU9=FquvUW16ynw1W26hj-MVVRnqZDEQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] boost: update to 1.60.0
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
X-List-Received-Date: Tue, 05 Jan 2016 17:31:33 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0cdd504b0528999bc1

--047d7bdc1c0cdd504b0528999bc1
Content-Type: text/plain; charset=UTF-8

On 5 January 2016 at 09:32, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
wrote:

> Due to the version update to 1.59.0, the two patches previously
> backported in this recipe are now dropped. The actual status of
> the arm-intrinsics.patch (reported with Upstream-Status: Backport)
> is unknown to the committer, and hence, that patch is kept in the
> recipe, even if it is possibly not required anymore. A deeper
> analysis is required to determine need and status of that patch.
> Furthermore, boost 1.59.0 provides a new library, called timer,
> which is packaged as further library in the boost recipe. The
> update to boost 1.60.0 required no further changes beyond
> changing the checksum hashes.
>

This is breaking on mpc8315e-rdb (the reference PPC in meta-yocto-bsp):

| gcc.compile.c++
bin.v2/libs/test/build/aca09349fdb84d131321425f6c3a38ed/execution_monitor.o
| In file included from
/data/poky-master/tmp/sysroots/mpc8315e-rdb/usr/include/fenv.h:114:0,
|                  from
/data/poky-master/tmp/sysroots/mpc8315e-rdb/usr/include/c++/5.3.0/fenv.h:36,
|                  from ./boost/detail/fenv.hpp:97,
|                  from ./boost/test/execution_monitor.hpp:64,
|                  from ./boost/test/impl/execution_monitor.ipp:31,
|                  from libs/test/src/execution_monitor.cpp:16:
| ./boost/test/impl/execution_monitor.ipp: In function 'unsigned int
boost::fpe::enable(unsigned int)':
| ./boost/test/impl/execution_monitor.ipp:1383:7: error: expected
id-expression before '(' token
|      ::feclearexcept(BOOST_FPE_ALL);
|        ^
| ./boost/test/impl/execution_monitor.ipp: In function 'unsigned int
boost::fpe::disable(unsigned int)':
| ./boost/test/impl/execution_monitor.ipp:1420:7: error: expected
id-expression before '(' token
|      ::feclearexcept(BOOST_FPE_ALL);
|        ^

Any idea?

Ross

--047d7bdc1c0cdd504b0528999bc1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 5 January 2016 at 09:32, Luk=
as Bulwahn <span dir=3D"ltr">&lt;<a href=3D"mailto:lukas.bulwahn@oss.bmw-ca=
rit.de" target=3D"_blank">lukas.bulwahn@oss.bmw-carit.de</a>&gt;</span> wro=
te:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":2m2" class=
=3D"" style=3D"overflow:hidden">Due to the version update to 1.59.0, the tw=
o patches previously<br>
backported in this recipe are now dropped. The actual status of<br>
the arm-intrinsics.patch (reported with Upstream-Status: Backport)<br>
is unknown to the committer, and hence, that patch is kept in the<br>
recipe, even if it is possibly not required anymore. A deeper<br>
analysis is required to determine need and status of that patch.<br>
Furthermore, <span class=3D"">boost</span> 1.59.0 provides a new library, c=
alled timer,<br>
which is packaged as further library in the <span class=3D"">boost</span> r=
ecipe. The<br>
update to <span class=3D"">boost</span> 1.60.0 required no further changes =
beyond<br>
changing the checksum hashes.</div></blockquote></div><br>This is breaking =
on=C2=A0mpc8315e-rdb (the reference PPC in meta-yocto-bsp):</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_e=
xtra">| gcc.compile.c++ bin.v2/libs/test/build/aca09349fdb84d131321425f6c3a=
38ed/execution_monitor.o</div><div class=3D"gmail_extra">| In file included=
 from /data/poky-master/tmp/sysroots/mpc8315e-rdb/usr/include/fenv.h:114:0,=
</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from /data/poky-master/tmp/sysroots/mpc8315e-rdb/us=
r/include/c++/5.3.0/fenv.h:36,</div><div class=3D"gmail_extra">| =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ./boost/detail/fen=
v.hpp:97,</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ./boost/test/execution_monitor.hpp:64,<=
/div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from ./boost/test/impl/execution_monitor.ipp:31,</div>=
<div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from libs/test/src/execution_monitor.cpp:16:</div><div cla=
ss=3D"gmail_extra">| ./boost/test/impl/execution_monitor.ipp: In function &=
#39;unsigned int boost::fpe::enable(unsigned int)&#39;:</div><div class=3D"=
gmail_extra">| ./boost/test/impl/execution_monitor.ipp:1383:7: error: expec=
ted id-expression before &#39;(&#39; token</div><div class=3D"gmail_extra">=
| =C2=A0 =C2=A0 =C2=A0::feclearexcept(BOOST_FPE_ALL);</div><div class=3D"gm=
ail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div class=3D"gmail_extra">|=
 ./boost/test/impl/execution_monitor.ipp: In function &#39;unsigned int boo=
st::fpe::disable(unsigned int)&#39;:</div><div class=3D"gmail_extra">| ./bo=
ost/test/impl/execution_monitor.ipp:1420:7: error: expected id-expression b=
efore &#39;(&#39; token</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=
=A0::feclearexcept(BOOST_FPE_ALL);</div><div class=3D"gmail_extra">| =C2=A0=
 =C2=A0 =C2=A0 =C2=A0^</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Any idea?</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div></div>

--047d7bdc1c0cdd504b0528999bc1--
