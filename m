Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T1jQv-0006uJ-Nn
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 21:39:14 +0200
Received: from mail169-co1-R.bigfish.com (10.243.78.245) by
	CO1EHSOBE012.bigfish.com (10.243.66.75) with Microsoft SMTP Server id
	14.1.225.23; Wed, 15 Aug 2012 19:27:16 +0000
Received: from mail169-co1 (localhost [127.0.0.1])	by
	mail169-co1-R.bigfish.com (Postfix) with ESMTP id 6AB1A8003C1	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 19:27:16 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail169-co1 (localhost.localdomain [127.0.0.1]) by mail169-co1
	(MessageSwitch) id 1345058834833809_1922;
	Wed, 15 Aug 2012 19:27:14 +0000 (UTC)
Received: from CO1EHSMHS015.bigfish.com (unknown [10.243.78.227])	by
	mail169-co1.bigfish.com (Postfix) with ESMTP id C040560004E	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 19:27:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS015.bigfish.com
	(10.243.66.25) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 15 Aug 2012 19:27:14 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0298.005;
	Wed, 15 Aug 2012 14:27:13 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] kmod: Handle undefined O_CLOEXEC
Thread-Index: AQHNexUI88Rs34hczU2LmLXRR16nOpdbkQaAgAAEdQA=
Date: Wed, 15 Aug 2012 19:27:13 +0000
Message-ID: <CAEsOVNd1DB0M5pNndxMLt4bdMwRCADPBLv9pw9pC_TELPwXAVA@mail.gmail.com>
References: <1343052252-4154-1-git-send-email-radu.moisan@intel.com>
	<lywr1uzguj.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<500E50C5.8000403@intel.com>
	<CABcZANkJhW+yER52vnbXSywxd-mhpNTPrFixL6R27thmMRmhMg@mail.gmail.com>
	<CAJTo0LYT5Jup6SXnmA62+Wy8sua94BdB_VwuHJ8erK1gshaYFw@mail.gmail.com>
	<CAEsOVNcVB5zp7rhN4LP7ANx3hDq51kFQt_0L=O5=YLU6Qp_D-Q@mail.gmail.com>
	<CABcZANkfFMgTxeQWzpKe2d2NqhMYaz27q-dnfW5m7-BJO2yygQ@mail.gmail.com>
In-Reply-To: <CABcZANkfFMgTxeQWzpKe2d2NqhMYaz27q-dnfW5m7-BJO2yygQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
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
X-List-Received-Date: Wed, 15 Aug 2012 19:39:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E5F9F3739C83E64A9FC180CED082909E@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 2:10 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Aug 15, 2012 at 11:37 AM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>> On Tue, Jul 24, 2012 at 8:40 AM, Burton, Ross <ross.burton@intel.com> wr=
ote:
>>> On 24 July 2012 14:27, Chris Larson <clarson@kergoth.com> wrote:
>>>> On Tue, Jul 24, 2012 at 12:37 AM, Radu Moisan <radu.moisan@intel.com> =
wrote:
>>>>> I have not tested on CentOS 5.8 if the applications are not broken in=
 some
>>>>> way, but that's not in the scope of this patch. If something does ind=
eed
>>>>> break, then a totally different patch is required, targeting a backpo=
rt of
>>>>> kmod for kernel older than 2.6.23.
>>>>
>>>> Personally, I'd rather see the build fail than have the tools behave
>>>> incorrectly in some inexplicable way. If you haven't tested it, the
>>>> patch shouldn't go in.
>>>
>>> I was curious...
>>>
>>> There are two commits in kmod where the cloexec changes were made:
>>>
>>> http://git.profusion.mobi/cgit.cgi/kmod.git/log/?qt=3Dgrep&q=3Dcloexec
>>>
>>> The changes were a simple addition of the O_CLOEXEC flag, so this
>>> patch is simply the union of those two commits.  A release of kmod
>>> that doesn't require O_CLOEXEC has the same behaviour as this patch.
>>> The problem O_CLOEXEC is solving isn't possible to solve cleanly
>>> without it.  Using an older version of kmod instead of patching kmod
>>> to work on older systems would result in more bugs and less features
>>> for no win.
>>
>> Was there any conclusion on this? I'm seeing the same problems. This
>> would only effect kmod-native (unless the target was using the older
>> stuff as well which is uncommon at this point).
>
> For what it's worth, we applied this in our layer and things do seem
> to work fine with this applied. It was either this or what we did
> before (reverted the switch to kmod-native and retained
> module-init-tools-cross), as we require CentOS5/RHEL5 support still.

I've been doing something similar and it's been working OK. -  I think
we should apply Ross's patch.

-M

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb
b/meta/recipes-kernel/kmod/kmod-native_git.bb
index 96de8b8..054a842 100644
--- a/meta/recipes-kernel/kmod/kmod-native_git.bb
+++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
@@ -4,7 +4,9 @@
 require kmod.inc
 inherit native

-PR =3D "${INC_PR}.0"
+PR =3D "${INC_PR}.1"
+
+CFLAGS +=3D "-D O_CLOEXEC=3D0"

 do_install_append (){
        for tool in depmod insmod lsmod modinfo modprobe rmmod

-M=



