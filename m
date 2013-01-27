Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hchapman-oecore@3gfp.com>) id 1TzbsR-0001QS-FU
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 00:43:07 +0100
X-Authority-Analysis: v=2.0 cv=QcjkT7nv c=1 sm=0 a=0BEmelG+NCIkmYz4MtfDKA==:17
	a=KAMKcUAUZugA:10 a=QyJNhWbWBEYA:10 a=h1JwTc6auzgA:10
	a=wPDyFdB5xvgA:10 a=kj9zAlcOel0A:10 a=cL4bF6sHAAAA:8
	a=hQ3ypW5fEB4A:10 a=HihYlcsHAAAA:8 a=FodKlLf_cRywyy13S4EA:9
	a=CjuIK1q_8ugA:10 a=0BEmelG+NCIkmYz4MtfDKA==:117
X-Cloudmark-Score: 0
X-Authenticated-User: 
X-Originating-IP: 65.34.9.19
Received: from [65.34.9.19] ([65.34.9.19:39458] helo=blue.3gfp.com)
	by hrndva-oedge03.mail.rr.com (envelope-from
	<hchapman-oecore@3gfp.com>) (ecelerity 2.2.3.46 r()) with ESMTP
	id 46/A6-06396-2E7B5015; Sun, 27 Jan 2013 23:27:31 +0000
Received: from localhost (localhost [127.0.0.1])
	by blue.3gfp.com (Postfix) with ESMTP id 46F4010804B2;
	Sun, 27 Jan 2013 18:27:29 -0500 (EST)
X-Virus-Scanned: by amavisd-new-2.6.4 (20090625) (Debian) at 3gfp.com
Received: from blue.3gfp.com ([127.0.0.1])
	by localhost (blue.3gfp.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 230IGdrksx+W; Sun, 27 Jan 2013 18:27:23 -0500 (EST)
Received: from [192.168.1.26] (65349hfc19.tampabay.res.rr.com [65.34.9.19])
	by blue.3gfp.com (Postfix) with ESMTPSA id 073D31080071;
	Sun, 27 Jan 2013 18:27:22 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Harvey Chapman <hchapman-oecore@3gfp.com>
In-Reply-To: <alpine.DEB.2.02.1301271811470.1315@oneiric>
Date: Sun, 27 Jan 2013 18:27:22 -0500
Message-Id: <F6FB1DB4-C1BE-47A8-93D2-1DF3CE465DAA@3gfp.com>
References: <alpine.DEB.2.02.1301271622090.24073@oneiric>
	<F9201BC4-B773-4B6F-B404-7C5ECCC66BE6@3gfp.com>
	<alpine.DEB.2.02.1301271811470.1315@oneiric>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.1499)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to tweak a kernel recipe file to point at a local git repo?
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
X-List-Received-Date: Sun, 27 Jan 2013 23:43:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Jan 27, 2013, at 6:12 PM, "Robert P. J. Day" <rpjday@crashcourse.ca> =
wrote:

> On Sun, 27 Jan 2013, Harvey Chapman wrote:
>=20
>> On Jan 27, 2013, at 4:26 PM, "Robert P. J. Day" =
<rpjday@crashcourse.ca> wrote:
>>=20
>>> SRC_URI +=3D =
"git://arago-project.org/git/projects/linux-davinci.git;protocol=3Dgit;bra=
nch=3D${BRANCH} \
>>>       file://defconfig"
>>> =3D=3D=3D=3D=3D snip =3D=3D=3D=3D=3D
>>>=20
>>> now i already *have* that repo cloned on my local hard drive, so
>>> what would i change in the recipe file (just temporarily) to point =
the
>>> fetcher there?  i would only need to do that once since i've set up =
my
>>=20
>> Something like this:
>>=20
>> SRC_URI =3D =
"git:///home/hchapman/kernel.git;branch=3Domap-3.5;protocol=3Dfile"
>=20
>  that's exactly what i tried, and i still had a fetcher failure.
> i'll test it again later.

Try running the failing command from the fetch log yourself. Also, look =
at bitbake/lib/bb/fetch2/git.py. It might just be "fetch" without the =
"2" depending on your bitbake version.



