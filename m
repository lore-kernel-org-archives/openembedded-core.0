Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T1ieu-0005cU-7m
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 20:49:36 +0200
Received: from mail114-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.23; Wed, 15 Aug 2012 18:37:38 +0000
Received: from mail114-tx2 (localhost [127.0.0.1])	by
	mail114-tx2-R.bigfish.com (Postfix) with ESMTP id 7E0F62A0093	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 18:37:38 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I1432Izz1202hzz8275ch122ac1I8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail114-tx2 (localhost.localdomain [127.0.0.1]) by mail114-tx2
	(MessageSwitch) id 1345055856826799_30039;
	Wed, 15 Aug 2012 18:37:36 +0000 (UTC)
Received: from TX2EHSMHS036.bigfish.com (unknown [10.9.14.250])	by
	mail114-tx2.bigfish.com (Postfix) with ESMTP id C6D4AC0044	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 18:37:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS036.bigfish.com
	(10.9.99.136) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 15 Aug 2012 18:37:33 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Wed, 15 Aug 2012 13:37:32 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] kmod: Handle undefined O_CLOEXEC
Thread-Index: AQHNexUI88Rs34hczU2LmLXRR16nOg==
Date: Wed, 15 Aug 2012 18:37:32 +0000
Message-ID: <CAEsOVNcVB5zp7rhN4LP7ANx3hDq51kFQt_0L=O5=YLU6Qp_D-Q@mail.gmail.com>
References: <1343052252-4154-1-git-send-email-radu.moisan@intel.com>
	<lywr1uzguj.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<500E50C5.8000403@intel.com>
	<CABcZANkJhW+yER52vnbXSywxd-mhpNTPrFixL6R27thmMRmhMg@mail.gmail.com>
	<CAJTo0LYT5Jup6SXnmA62+Wy8sua94BdB_VwuHJ8erK1gshaYFw@mail.gmail.com>
In-Reply-To: <CAJTo0LYT5Jup6SXnmA62+Wy8sua94BdB_VwuHJ8erK1gshaYFw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2] kmod: Handle undefined O_CLOEXEC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 15 Aug 2012 18:49:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <03B81D1053AAF24ABB2FAD8F2A529950@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2012 at 8:40 AM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 24 July 2012 14:27, Chris Larson <clarson@kergoth.com> wrote:
>> On Tue, Jul 24, 2012 at 12:37 AM, Radu Moisan <radu.moisan@intel.com> wr=
ote:
>>> I have not tested on CentOS 5.8 if the applications are not broken in s=
ome
>>> way, but that's not in the scope of this patch. If something does indee=
d
>>> break, then a totally different patch is required, targeting a backport=
 of
>>> kmod for kernel older than 2.6.23.
>>
>> Personally, I'd rather see the build fail than have the tools behave
>> incorrectly in some inexplicable way. If you haven't tested it, the
>> patch shouldn't go in.
>
> I was curious...
>
> There are two commits in kmod where the cloexec changes were made:
>
> http://git.profusion.mobi/cgit.cgi/kmod.git/log/?qt=3Dgrep&q=3Dcloexec
>
> The changes were a simple addition of the O_CLOEXEC flag, so this
> patch is simply the union of those two commits.  A release of kmod
> that doesn't require O_CLOEXEC has the same behaviour as this patch.
> The problem O_CLOEXEC is solving isn't possible to solve cleanly
> without it.  Using an older version of kmod instead of patching kmod
> to work on older systems would result in more bugs and less features
> for no win.

Was there any conclusion on this? I'm seeing the same problems. This
would only effect kmod-native (unless the target was using the older
stuff as well which is uncommon at this point).

Looking the commit that adds this as a dep:

commit f22cf1bedf2aa7fb41f98d6165401eb8a8bad17d
Author: Khem Raj <raj.khem@gmail.com>
Date:   Tue Jan 31 00:35:02 2012 -0800

    image.bbclass,kernel.bbclass: Use kmod-native instead of
module-init-tools-cross

We are just using depmod from this recipe for the kernel build, which
is a non-threaded user of this libraries built within kmod - therefore
we should not encounter any issues [1](after reading what O_CLOEXEC
does) with this patch except that it should only be applied to -native
builds. Also, if issues do present themselves they will be during the
build and not later at runtime so we can identify any issues that
arise.

So in summary, the patch should (IMO) be:

SRC_URI_append_virtclass-native =3D
"file://Handle-unsupported-close-on-exec-flag.patch"

Thoughts?

[1] http://lwn.net/Articles/249006/

-M=



