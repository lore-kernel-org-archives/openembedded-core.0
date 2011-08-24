Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+7dv/D/5qE2MvdLMeWnd4M79kKnO4JS4U=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QwI9E-0004Vf-OO
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 20:25:58 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7OIL3ZZ008459;
	Wed, 24 Aug 2011 13:21:04 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E55204E.1030907@gmail.com>
Date: Wed, 24 Aug 2011 13:21:06 -0500
Message-Id: <601CAF99-349A-487A-9877-699920D9C167@kernel.crashing.org>
References: <1314162530-4606-1-git-send-email-galak@kernel.crashing.org>
	<4E55204E.1030907@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gcc-4.6: Drop gcc-poison-parameters.patch as its not need
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
X-List-Received-Date: Wed, 24 Aug 2011 18:25:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 24, 2011, at 11:01 AM, Khem Raj wrote:

> On 8/23/2011 10:08 PM, Kumar Gala wrote:
>> The gcc-poison-parameters was added specifically to deal with an =
issue
>> on ppc targets and a bug when we build with -Os -frename-registers.
>>=20
>> This bug below reports the issue and is fixed in gcc-4.6.x:
>>=20
>> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D44618
>=20
> Someone IIRC reported that Os generated gcc-runtime and root file =
system did not boot even with gcc 4.6 thats why that patch was still in =
there. Can you confirm thats not the case anymore ?

Yes, things work perfectly fine w/gcc-4.6.x.  I'm able to boot on PPC =
w/o any issue.

- k=


