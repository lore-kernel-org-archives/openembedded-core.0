Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 34B0360123
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:22:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 02 Feb 2016 13:22:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; 
	d="asc'?scan'208";a="739395747"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by orsmga003.jf.intel.com with ESMTP; 02 Feb 2016 13:22:00 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<caa6b2241883567d2453ac7fcc18cdef38bf6c3a.1454424743.git.anibal.limon@linux.intel.com>
	<35476879.65FcALFN4F@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B11E6A.6080005@linux.intel.com>
Date: Tue, 2 Feb 2016 15:23:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <35476879.65FcALFN4F@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org, benjamin.esquivel@intel.com,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 15/20] classes/populate_sdk_ext: Add OE_SDK_EXT_SILENT env variable
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
X-List-Received-Date: Tue, 02 Feb 2016 21:22:02 -0000
X-Groupsio-MsgNum: 77361
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="XMMnW3267PO4CV3v0I2ofB6AiiKGisE79"

--XMMnW3267PO4CV3v0I2ofB6AiiKGisE79
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Because this is disabled when SDK tests (compatibility) ran using eSDK
so sometimes needs to SILENT it when automatic process is working
another times don't like when user uses it.

In this case the SDK tests fails because it looks to stdout and found
devtool msg.

	alimon


On 02/02/2016 03:19 PM, Paul Eggleton wrote:
> On Tue, 02 Feb 2016 09:14:18 An=EDbal Lim=F3n wrote:
>> From: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>>
>> Sometimes we need to load environment without show help information
>> only useful when user is interacting with the SDK.
>>
>> For example: For test extensible SDK.
>>
>> Signed-off-by: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>> ---
>>  meta/classes/populate_sdk_ext.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/populate_sdk_ext.bbclass
>> b/meta/classes/populate_sdk_ext.bbclass index 76308ec..fc96a4b 100644
>> --- a/meta/classes/populate_sdk_ext.bbclass
>> +++ b/meta/classes/populate_sdk_ext.bbclass
>> @@ -291,7 +291,7 @@ sdk_ext_postinst() {
>>  	# so put it at the end of $PATH.
>>  	echo "export
>> PATH=3D\$PATH:$target_sdk_dir/sysroots/${SDK_SYS}/${bindir_nativesdk}"=
 >>
>> $env_setup_script
>>
>> -	echo "printf 'SDK environment now set up; additionally you may now r=
un
>> devtool to perform development tasks.\nRun devtool --help for further
>> details.\n'" >> $env_setup_script +	echo "[ -z \$OE_SDK_EXT_SILENT ] &=
&
>> printf 'SDK environment now set up; additionally you may now run devto=
ol to
>> perform development tasks.\nRun devtool --help for further details.\n'=
" >>
>> $env_setup_script
>>
>>  	# Warn if trying to use external bitbake and the ext SDK together
>>  	echo "(which bitbake > /dev/null 2>&1 && echo 'WARNING: attempting t=
o use
>> the extensible SDK in an environment set up to run bitbake - this may =
lead
>> to unexpected results. Please source this script in a new shell sessio=
n
>> instead.') || true" >> $env_setup_script
>=20
> Rather than adding another variable for this why not just redirect the =
output=20
> to /dev/null ?
>=20
> Cheers,
> Paul
>=20


--XMMnW3267PO4CV3v0I2ofB6AiiKGisE79
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWsR5wAAoJEGJqcE9h3glguNQP/R/aBjrX2stIevZ/i97PSpTT
GI/5jcN9cQEtqGTi3Nf8jZXrlTBCINoH/eixr75heyKVXY/ecivngeceOQXANpaj
weOnDhl7985Fwg35DU5Q8VlsY/GuNQiWPDm/esMDM2OC70ns+PfX2tUutfMSd/2s
P/FeCnOZvl+Z3nogsEf7y33jjNPRXUVglA98X62vvWsHnPX6AYsC5kUAvyMn+iFm
T6mWJSxqJ1StesZKYHdo9JKUJek62h39ySoj/ijxhI4l/Ca/Z1AACIjnsT6dJyJz
VrvL5ILBQE08gYXEXkB8q1a5GVb3QxkKhPpYE8WzGEiPMBcPil1J5SgvOZeOWor3
CHzFBNczn2JLHN2+ICvv7UPy4+Hx4SKzJQI0Qn/JMIITD+pWe1rPdGPRvy/u1rT3
VQhSGID5kH13m165gMB2dE4udop+voe771w9aueI4W8hk6uezK8+y2XmKmZATr5q
C9ItobCKPj/bOmt3UdMtkKh1LWTyRv9iQVmZ+LO8EnSIo60ooraNEhYBl7X6Us3j
2u+Wd7BI/ktVVq9FYbmXInD/b4ZhHLgRJoP/7cqiADvCwNyUU/sr3C42M9d3zxCb
js5fQaWXnxd9jDqDY1VrxqLh1bBjYLScEdiKoke3PbIrrt9ssrAcAhWONkRmiZYL
8Zp1ZXuUWNlK3ntjF4wh
=UJr6
-----END PGP SIGNATURE-----

--XMMnW3267PO4CV3v0I2ofB6AiiKGisE79--
