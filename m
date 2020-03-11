Return-Path: <rp@stacktrust.org>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Mar 2020 00:29:37 UTC
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
	by mail.openembedded.org (Postfix) with ESMTP id 3760A605E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 00:29:37 +0000 (UTC)
Received: from [100.64.72.37] ([173.245.215.240]) by mrelay.perfora.net
	(mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id
	0LdHBn-1jcbDh2pST-00iQt0; Wed, 11 Mar 2020 01:24:36 +0100
From: Rich Persaud <rp@stacktrust.org>
Mime-Version: 1.0 (1.0)
Date: Tue, 10 Mar 2020 20:24:35 -0400
Message-Id: <BC783B56-5CA3-461A-99B9-240904E8F5CF@stacktrust.org>
References: <435df8e7-f4b2-65b7-0a5f-ba8b228a4c7e@gmail.com>
In-Reply-To: <435df8e7-f4b2-65b7-0a5f-ba8b228a4c7e@gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
X-Mailer: iPad Mail (17D50)
X-Provags-ID: V03:K1:rWN8+N2G7Fux85nZQqPEtXWhTO6hXR8zsqBCLIkpXosgy6SyalL
	zJ+I5e93nVJf4b+EBnYKy7VxwYJCm+GrgTHPWf1qSxEuy1/MSaE/2R3SRzSMQPN7RuTUDlJ
	K9Va0TKhPWFkEgZMvvwq1/Agr5NO5rOyK8+6U6gy6hIzcVSFNHaANXYJ6yPTLlvU8IVrl5z
	+xoqflQVM+w5gU2TzxemA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RVQ+uCv9WNA=:EGJu36if736mqhhNjnnR11
	RHQ7JhhZdP1cNHdN5drdoQfMF4BH+ZtkVNdWmuGXM4Ra6tO3lRBOvdbxqwb5O3IwpSBh3Ni7H
	gVLPDXQjSMoTT050dSq1Q/1i8ElLhVPna/naMqkbn3Pa4QjqW0QE5FmFppEKsYMlSKYcZs10M
	HqOTkWzNtTc3lMPQ9ZQFlST6xxAiHSBqC/GTyaprg4XjAMZ75pjsukot+cyGHJRrg0oGVyeC5
	hyjsXSOeYuCm8VB8Q65w66hJ7iHCcbsk3eKnXlZREQtqcRmzmW58zANFAMz+3PCg7GVHRD8sE
	4E8HOmKS7n/g7hfZMKoVRDPhlHg+Ebnx48YsV5zuVntmN3bvUB5abusr/SJi4HTf+slVhwQf8
	SMWYR6U+xqQrFP84S0l9YlUZL3fv2uTubw1wfjgs6Hu8hh9wrVUS8a4wBS7VLga9n79iYaC7w
	eA/xWNSgllFBTPcj4ipW3GMwDXijKfuvwt9eEldxGhAmak2Zl49TcKv+YGGlKZXyk0hYhq55y
	TU8dibmO9PShh3H2nL+DHnXlnhajgwM6MxaFELZbJW4y/tETBr4mqSjXPnKsC/5NKVfk8piCU
	8Pn9DrhAgEsY60Z/2l9plgkXRzrMTaI4blf9nxp9DJIe8r7WcrOwCeDVmFxGxhfheK6X3+1Yl
	jNb6VvyWAxGY5Yj9xWprCf20t4Im/DZmuTKZCLh/oHiR+XauL9Ny3TJlQ0Uc6dXeWSkc4Zjo+
	n8J7kv9ZGw+ygQ1GqE3xBZAt1xpw9zM7U7focGLIjIyu0Lzitk0ifMf5P9XzFIybWdXybPnFe
	Ok0SCaGeltemyrSVXCHUf8baCv+pjAcCNpab4tyMWe+qQBb/uJ+sKDFP1i1rMJy0dQoxFAj
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image-live: multiconfig ISO generation
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
X-List-Received-Date: Wed, 11 Mar 2020 00:29:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mar 10, 2020, at 17:29, Joshua Watt <jpewhacker@gmail.com> wrote:
> =EF=BB=BF
>> On 3/9/20 5:55 PM, Rich Persaud wrote:
>> When a target is specified for INITRD_IMAGE_LIVE, a task dependency is
>> added for do_image_complete. At present, image-live initrd will not
>> accept multiconfig dependency targets.
>=20
> Can you give an example? That might help with understanding what this is s=
upposed to do.

Any initrd with a machine type that is different from the "machine type" of t=
he ISO image, which may itself be a composite image of multiple machine type=
s, e.g. virtual machines with logical property variances rather than physica=
l architecture changes.  The traditional notion of ISO "machine type" is alr=
eady suspect in a multiconfig scenario, and need not imply that the initrd h=
as an identical machine type.

For the purpose of this patch, let's assume an ISO could be built with diffe=
rent initramfs versions for testing, each with a different machine type.  Mo=
re generally, image-live translates the presence of an initrd to a recipe de=
pendency which assumes a singleconfig target.  This capability can be extend=
ed to multiconfig targets, if they are to be first-class targets throughout b=
itbake.  If not, we can document a whitelist of bitbake features where multi=
config targets are permitted.


>> If BBMULTICONFIG is non-empty and INITRD_IMAGE_LIVE is a multiconfig
>> target, use mcdepends instead of depends. The packaging recipe must
>> also override machine-specific path construction of INITRD_LIVE.
>>=20
>> Required to build an ISO with mixed machine types, a primary use case
>> for multiconfig. This is a minimal fix to make multiconfig ISOs
>> possible.
>>=20
>> Signed-off-by: Rich Persaud <rp@stacktrust.org>
>> ---
>>  meta/classes/image-live.bbclass | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bb=
class
>> index 54058b350d..1afd48005a 100644
>> --- a/meta/classes/image-live.bbclass
>> +++ b/meta/classes/image-live.bbclass
>> @@ -50,11 +50,14 @@ IMAGE_TYPES_MASKED +=3D "live hddimg iso"
>>  python() {
>>      image_b =3D d.getVar('IMAGE_BASENAME')
>>      initrd_i =3D d.getVar('INITRD_IMAGE_LIVE')
>> +    depends_type =3D ('mcdepends' if (d.getVar('BBMULTICONFIG')
>> +                                    and initrd_i.count(':') =3D=3D 3)
>> +                                else 'depends')
>=20
> Potentially, this could be simplified:
>=20
>  depends_type =3D 'mcdepends' if initrd_i.startswith('mc:') else 'depends'=

>=20
> ?

Yes, if this is the agreed-upon standard definition of a multiconfig target,=
 which should perhaps be a reusable validation function?  If a singleconfig t=
arget is specified for mcdepends, bitbake prints an error message which cite=
s three colons in the target definition, as the minimum requirement for a mu=
lticonfig target.  I haven't traced the code which generates that error, or t=
ested an mcdepends target which has three colons but does not begin with 'mc=
'.  There must be several places which need to perform this validation, it w=
ould be good to share a common function/snippet.

>=20
>>      if image_b =3D=3D initrd_i:
>>          bb.error('INITRD_IMAGE_LIVE %s cannot use image live, hddimg or i=
so.' % initrd_i)
>>          bb.fatal('Check IMAGE_FSTYPES and INITRAMFS_FSTYPES settings.')
>>      elif initrd_i:
>> -        d.appendVarFlag('do_bootimg', 'depends', ' %s:do_image_complete'=
 % initrd_i)
>> +        d.appendVarFlag('do_bootimg', depends_type, ' %s:do_image_comple=
te' % initrd_i)
>>  }
>>    HDDDIR =3D "${S}/hddimg"
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


