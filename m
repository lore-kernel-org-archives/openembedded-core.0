Received: from mail-pd0-f179.google.com ([209.85.192.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UQf6q-00038H-N7
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 16:38:05 +0200
Received: by mail-pd0-f179.google.com with SMTP id x11so1431894pdj.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=RBa4DBma8Ijmdi9uJwgtOWFnbijEBq4jSHtp6gZT8so=;
	b=lCjTf+lOZrmhCQJAoJaHaKIaObBESCuFO+yBVwUrl1MJu52aSv0yuZQGsx1z6MVISP
	i937Cirgs0FSlNX98U1rjVYUAJXIGYomOlAAeI79FAt/e5+5v6C0KUgTAV/wDyYeYF1w
	CJStJpD2+gEr2ViUQeFkodyDMP4GjtTZRWHkkkqgPfFtuyWXAeoZbOBObiBuNFg9ECea
	4ZpQW5QIYht0mRZ4vefVbHZROBTLf7PP8ouyK99vB94L6WH/UmW7riNZm9Sei+9TQtpO
	+kOwzUBbREfnPntoIsUksZcDPW6Qjtdd2aTTd0Vwcmkd1Ish5MCNcr6Nt7btIhiCa8hl
	aXfw==
X-Received: by 10.68.229.163 with SMTP id sr3mr14995338pbc.54.1365776423377;
	Fri, 12 Apr 2013 07:20:23 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id t1sm9749191pab.12.2013.04.12.07.20.21
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 07:20:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0Lb1G6XTUMdXFsiEo9dgvbyTj-h1F+1FJ4sB83va2frfHQ@mail.gmail.com>
Date: Fri, 12 Apr 2013 07:20:20 -0700
Message-Id: <317BEB9F-B534-4162-B2FB-7C4E6816F0FE@gmail.com>
References: <51675A40.6080600@intel.com>
	<CAJTo0Lb0GK3+TBpsytc=-atsz6DYo3Obw_Ezz4c9qpUHcwpdcg@mail.gmail.com>
	<CAJTo0Lb1G6XTUMdXFsiEo9dgvbyTj-h1F+1FJ4sB83va2frfHQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: Master under test with gcc-4.8
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
X-List-Received-Date: Fri, 12 Apr 2013 14:38:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Thanks Ross

On Apr 12, 2013, at 3:02 AM, "Burton, Ross" <ross.burton@intel.com> =
wrote:

> On 12 April 2013 10:18, Burton, Ross <ross.burton@intel.com> wrote:
>> On 12 April 2013 01:50, Saul Wold <saul.wold@intel.com> wrote:
>>> I have seen a couple of failures with an initial build in xmodmap =
and
>>> matchbox-panel (when building a sato image for x86).
>>=20
>> xmodmap is probably fixed by integrating this commit upstream:
>>=20
>> =
http://cgit.freedesktop.org/xorg/app/xmodmap/commit/?id=3D42f99a7a7b836f6f=
9704a7b1747eb722c93446ec
>=20
> Patch sent to oe-core.
>=20
> Ross



