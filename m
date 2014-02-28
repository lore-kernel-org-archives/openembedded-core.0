Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 39F956E8E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 11:47:21 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 28 Feb 2014 12:47:20 +0100
Message-ID: <53107740.2080508@enea.com>
Date: Fri, 28 Feb 2014 12:47:12 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1393587200-16322-1-git-send-email-david.nystrom@enea.com>
	<CAJTo0LbhW_UfQkXXgNzf2H+xN4=ygaNQbih4=6mjY0Mp26OK0g@mail.gmail.com>
In-Reply-To: <CAJTo0LbhW_UfQkXXgNzf2H+xN4=ygaNQbih4=6mjY0Mp26OK0g@mail.gmail.com>
X-Originating-IP: [172.16.141.133]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: Add util-linux-libuuid to DEPENDS
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
X-List-Received-Date: Fri, 28 Feb 2014 11:47:24 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2014-02-28 12:44, Burton, Ross wrote:
> On 28 February 2014 11:33, David Nystr=C3=B6m <david.c.nystrom@gmail.com>=
 wrote:
>> -DEPENDS =3D "util-linux"
>> +DEPENDS =3D "util-linux util-linux-libuuid"
>
> That makes no sense: the value of DEPENDS is a list of recipes, and
> util-linux is the recipe.
>
> Ross
>

Correct, scrap this patch.

//DD


