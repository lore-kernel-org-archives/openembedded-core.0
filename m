Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3B18B6057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 22:39:40 +0000 (UTC)
Received: by iouu10 with SMTP id u10so68875977iou.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 14:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WbupGBYkvEI2xjSpxLFSInZU5PyljSuY/ubS0ZtQUkQ=;
	b=kzyKyeVOfYOXRy8+aZLYqKZDmERYVluOHDuC0yLAGzcbLVfvUXGzMt2LFh5yZOBkIC
	UBYcpGM+9V4lTKbcQFuigwL9kyIBRPOOmjW/yK/GrYqHBmfOtmZxT3I8fWO3EcglmONV
	//ytiXicYmabpTC6coYXhwBesVnXreg3aummi2RO3t7CiStqRhGABM1SvUmKQRujmffR
	pKCM48vA1vLuveADaBl/HEPYYjKDBjbraTkOmcLnYEJVdv8l8LCgsDWmMw+x6bkhMNBi
	aWIZRabmzSCNZKaqXtl5XGORfMBBmzRbUE5Y+mQsVM1QT8YfhxMNONhlHxqZzvp9zPMz
	LvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WbupGBYkvEI2xjSpxLFSInZU5PyljSuY/ubS0ZtQUkQ=;
	b=MLUXiHBJ+cxWdPzgbCzv1s3i0J3xBysjQMJJfRqP8+4s1nSmDGB7tbwPQvXfdG34R6
	lZENWLRV2pCA2CPW8bdQxrlThBcpU0iK5jrrdCz6EcdQZUT262vrMsuBCOlyMECuOmyz
	U4YU/kxCI7JoPot061Yx4fA6BGWF8pLFiphOEuwxIxBgmMuojlFR+Um6TIhuvmfPRJBL
	DjvkoU/j/dwas8CptgX4mDbAVRr7cHOjpUUffUttrrWCOVyje2QCYkFNWcBfQQLxY9dx
	xS3IMNuN2T8sejcJkBPIQXIOeose2lzXEV+RmRBB23D20yS/E6ear9AdX8IAfUt+GyuG
	QUyg==
X-Gm-Message-State: ALoCoQm4gLD0Peg4sCncY2zGwafu128P5kdk8ZkQsD5rQu4apI1ngwu2olB5FwzQNyDHdM2c+lFw
X-Received: by 10.107.3.144 with SMTP id e16mr35381739ioi.99.1448491181522;
	Wed, 25 Nov 2015 14:39:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 25 Nov 2015 14:39:22 -0800 (PST)
In-Reply-To: <CAJ86T=UWW0ZZYHSUR46TsFcFqVYr89TRRhJso1_x10DnaLr-8Q@mail.gmail.com>
References: <CAJ86T=VBh-TsnaSyNVSxmbEJz7TbFcDmNBVP4_4PhXB=YMrm5w@mail.gmail.com>
	<CAMKF1spXxarTUskBgB6ABdL-yn4wSm1cOZSBKdCpyxQzDg_a8g@mail.gmail.com>
	<CAJ86T=X_r_OU1RfN8nYJAJSYXwqEgvK17Hn87_+AfoGQAn2ocw@mail.gmail.com>
	<CAJTo0LbLQ51w5+MDkXKyFvDzzz=8UFjDi-s=JyHy2WoFFx2y2Q@mail.gmail.com>
	<CAJ86T=UWW0ZZYHSUR46TsFcFqVYr89TRRhJso1_x10DnaLr-8Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Nov 2015 22:39:22 +0000
Message-ID: <CAJTo0LZ9zz-i0QYy227m1H+GV33fE5-EqHH4emv6T62GmWC0_A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: vmdk images with musl libc
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
X-List-Received-Date: Wed, 25 Nov 2015 22:39:41 -0000
Content-Type: multipart/alternative; boundary=001a113ecf4055d4790525652279

--001a113ecf4055d4790525652279
Content-Type: text/plain; charset=UTF-8

On 25 November 2015 at 22:31, Andre McCurdy <armccurdy@gmail.com> wrote:

> Potential solution 1:
>
>   RDEPENDS_${PN} = "glibc-gconv-ibm850"
>   RDEPENDS_${PN}_libc-musl = ""
>
> Potential solution 2:
>
>   RDEPENDS_${PN}_libc-glibc = "glibc-gconv-ibm850"
>
> Which one is correct?
>

Or RDEPENDS_${PN}_append_libc-glibc = " glibc-gconv-ibm850".

(which is what libxml2 and guile do)

Ross

--001a113ecf4055d4790525652279
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 November 2015 at 22:31, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":bi4" class=
=3D"a3s" style=3D"overflow:hidden">Potential solution 1:<br>
<br>
=C2=A0 RDEPENDS_${PN} =3D &quot;glibc-gconv-ibm850&quot;<br>
=C2=A0 RDEPENDS_${PN}_libc-musl =3D &quot;&quot;<br>
<br>
Potential solution 2:<br>
<br>
=C2=A0 RDEPENDS_${PN}_libc-glibc =3D &quot;glibc-gconv-ibm850&quot;<br>
<br>
Which one is correct?</div></blockquote></div><br>Or RDEPENDS_${PN}_append_=
libc-glibc =3D &quot; glibc-gconv-ibm850&quot;.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">(which is what libxml2 and guile =
do)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a113ecf4055d4790525652279--
