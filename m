Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RLP7l-0004PT-W4
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 01:56:14 +0100
Received: from mail35-ch1-R.bigfish.com (10.43.68.251) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.22; Wed, 2 Nov 2011 00:49:52 +0000
Received: from mail35-ch1 (localhost.localdomain [127.0.0.1])	by
	mail35-ch1-R.bigfish.com (Postfix) with ESMTP id B04485E00BF	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 00:50:00 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail35-ch1 (localhost.localdomain [127.0.0.1]) by mail35-ch1
	(MessageSwitch) id 1320194998574770_25334;
	Wed,  2 Nov 2011 00:49:58 +0000 (UTC)
Received: from CH1EHSMHS004.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.253])	by mail35-ch1.bigfish.com (Postfix) with ESMTP id
	7EBF332804C for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 00:49:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS004.bigfish.com
	(10.43.70.4) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 2 Nov 2011 00:50:04 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Tue, 1 Nov 2011 19:50:03 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Add new IMAGE_CLASSES variable for classes
	for image generation
Thread-Index: AQHMmPbOspSkoZVEsEev/ZH2YkccWZWZFH4A
Date: Wed, 2 Nov 2011 00:50:03 +0000
Message-ID: <CAEsOVNdaEPihB8ecoMuxzSw-TR-CsK1ZKsCgcj5nktjtHmA32Q@mail.gmail.com>
References: <1319786807-9015-1-git-send-email-msm@freescale.com>
	<4EB08F6B.5080009@intel.com>
In-Reply-To: <4EB08F6B.5080009@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Wed, 02 Nov 2011 00:56:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4122CFC76A52ED4EA9A9D74B8185F0CA@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 1, 2011 at 7:31 PM, Saul Wold <saul.wold@intel.com> wrote:
>> +# Additional image generation features
>> +#
>> +# The following is a list of classes to import to use in the generation
>> of images
>> +# currently an example class is image_types_uboot
>> +# IMAGE_CLASSES ?=3D "image_types_uboot"
>> +
>> =A0#
>> =A0# Runtime testing of images
>> =A0#
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 05f4331..e932879 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -111,7 +111,8 @@ def get_devtable_list(d):
>> =A0 =A0 =A0 =A0 =A0str +=3D " %s" % bb.which(bb.data.getVar('BBPATH', d,=
 1), devtable)
>> =A0 =A0 =A0return str
>>
>> -inherit image_types
>> +IMAGE_CLASSES =3D "image_types"
>> +inherit ${IMAGE_CLASSES}
>>
> Does this really work with =3D, should it not be ?=3D here?

Ugh. No. This was an attempt to fix this:

+IMAGE_CLASSES ??=3D ""
+inherit image_types ${IMAGE_CLASSES}

which gives the following bitbake error:

ERROR: classes/.bbclass is not a BitBake file
ERROR: Command execution failed: Exited with 1

when IMAGE_CLASSES is left as "". It's trying to inherit a ".bbclass"
file. There is no good alternative because I have to enforce
IMAGE_CLASSES is only modified by appending to it. So the only
solution is to modifed the local.conf.sample to say

IMAGE_CLASSES +=3D "image_types_uboot" and leave the other bit as is...

-M=



