Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1TdzwH-0000Zb-Rz
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 09:57:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAT8hTCv025345
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Nov 2012 00:43:29 -0800 (PST)
Received: from [128.224.162.143] (128.224.162.143) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 29 Nov 2012 00:43:28 -0800
Message-ID: <50B72032.8060905@windriver.com>
Date: Thu, 29 Nov 2012 16:43:30 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <cover.1354170824.git.rongqing.li@windriver.com>
	<cb54673a133a17e2be78912491a696de62c6e431.1354170824.git.rongqing.li@windriver.com>
	<8CEBF7D0731E4F6A92279327C7C8C74D@intel.com>
In-Reply-To: <8CEBF7D0731E4F6A92279327C7C8C74D@intel.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	qAT8hTCv025345
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] apr: set flag of inheriting O_NONBLOCK as no
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
X-List-Received-Date: Thu, 29 Nov 2012 08:57:54 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 2012=E5=B9=B411=E6=9C=8829=E6=97=A5 15:08, Ross Burton wrote:
> On Thursday, 29 November 2012 at 06:36, rongqing.li@windriver.com wrote=
:
>> The flag ac_cv_o_nonblock_inherited is always set to yes in cross comp=
iling
>> environment. This flag is intended to think the socket, returned from
>> accept(), inherit file status flags such as O_NONBLOCK from the listen=
ing
>> socket, but socket never inherits file status from the listening socke=
t on
>> Linux (more information to man accept).
>
> meta/site/powerpc32-linux already sets this to no, so if this Linux-wid=
e behaviour it should be moved to site/common-linux instead of being spec=
ific to apr.
>
> Ross

You reminds me, powerpc does not have this bug, but other arch have.

 From man accept(), this is a Linux-wide behaviour, and it should be
put to sit/common-linux.

-Roy

>
>

--=20
Best Reagrds,
Roy | RongQing Li




