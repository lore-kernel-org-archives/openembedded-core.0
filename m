Received: from mail-pd0-f170.google.com ([209.85.192.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UXamc-0002YT-8I
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 19:25:36 +0200
Received: by mail-pd0-f170.google.com with SMTP id 15so906886pdi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=uiyF0XvmOLamOFUZqHDVzhGIQUF1SL8qka+b/Baq0lU=;
	b=0tRs3e5gtcncAugYJGgM4fIE+OAAudBAKKnyekcelUgDI4fVh38CPKwpfU+nI5HzFi
	2niWdS6WwSq8zNDTFjeh6lzaHrIq8WEtn4ET5H7HxaEVH50l1TBDS2t4EiTLuPyxNGLb
	qvxfpxB6FB5zn6jjBDvEe1sSxbgnm4nylIihhUYIF//7CyQl46r0F6dymJt8R7nuCvE2
	Dh3Whi/4XpRsC1q+KPXqhIM8RhIdhdbia27lRYMcNOP3c2WJDakA1sBC4yjcBGWmR2Ff
	YP/ufxrNbjL+K9fEZpk+yRWKF/sp8zBON93RaFpLjACdBXMDph/AGjUemcjo3/YePYg4
	51ow==
X-Received: by 10.68.26.6 with SMTP id h6mr5020231pbg.149.1367428061273;
	Wed, 01 May 2013 10:07:41 -0700 (PDT)
Received: from [172.23.8.173] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id qi1sm4359369pac.21.2013.05.01.10.07.38
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 May 2013 10:07:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1427152.sXvBYQKc3Y@helios>
Date: Wed, 1 May 2013 10:07:38 -0700
Message-Id: <E1339436-3FE5-4771-9331-CA52EA6C1E2E@gmail.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
	<c4a83801dc67074b524dd33c56ba9eed819def6f.1367340369.git.paul.eggleton@linux.intel.com>
	<91BED47F-18E9-4E12-AED1-0137D93E9251@gmail.com>
	<1427152.sXvBYQKc3Y@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] bitbake.conf: set SERIAL_CONSOLES from SERIAL_CONSOLE by default
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
X-List-Received-Date: Wed, 01 May 2013 17:25:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 30, 2013, at 11:51 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Tuesday 30 April 2013 14:42:46 Khem Raj wrote:
>> On Apr 30, 2013, at 9:52 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com>=20
> wrote:
>>> This is the first step in deprecating SERIAL_CONSOLE without =
affecting
>>> machine configurations that still use it.
>>=20
>> Did you mean deprecating SERIAL_CONSOLES or SERIAL_CONSOLE
>=20
> I mean deprecating SERIAL_CONSOLE. SERIAL_CONSOLES is the newer =
replacement,=20
> supporting multiple consoles e.g.
>=20
> SERIAL_CONSOLES =3D "115200;ttyS0 38400;ttyS1"
>=20


yes thanks



