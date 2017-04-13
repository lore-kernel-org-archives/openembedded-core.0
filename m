Return-Path: <thilo.cestonaro@ts.fujitsu.com>
X-Greylist: delayed 418 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Apr 2017 07:33:48 UTC
Received: from mail1.bemta5.messagelabs.com (mail1.bemta5.messagelabs.com
	[195.245.231.139])
	by mail.openembedded.org (Postfix) with ESMTP id D556577BE9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 07:33:48 +0000 (UTC)
Received: from [85.158.136.83] by server-3.bemta-5.messagelabs.com id
	C6/05-01936-9382FE85; Thu, 13 Apr 2017 07:26:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBKsWRWlGSWpSXmKPExsViZ8MRqmuh8T7
	C4GevkcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtE9/TtrwT3binsn17M3MM606mLk4hAS2MIk
	8ejnQxYI5xijxJU5p5ggnIuMEu2PjwFlODnYBNwltt67zwRiiwhESdzc9YwdxBYWsJXomdENF
	OcAittJHPxeDlHiJNH7/jUbiM0ioCrR8+sNM4jNK2AisfRHIzPE/NmMEsfP7AQr4hTwlNja/R
	5svpCAt8Tpj7PBGhgFVCR23d3CCGIzC4hL3HoyH6xGQkBE4uHF02wQtqjEy8f/WCFsFYnnOxc
	wQtg6EmevP4GyDSS2Lt3HAmErSrxo+cwMMbNK4tXDxawQxwlKnJz5hGUCo/gsJOtmISmbhaQM
	Iq4p0br9NzuErS2xbOFrZgjbVmL/1ZVQtqnE66MfGSFsRYkp3Q/ZFzByrGLUKE4tKkst0jU01
	0sqykzPKMlNzMzRNTQw1ctNLS5OTE/NSUwq1kvOz93ECIxhBiDYwXjxtOchRkkOJiVR3lMK7y
	OE+JLyUyozEosz4otKc1KLDzHKcHAoSfD6qQPlBItS01Mr0jJzgMkEJi3BwaMkwrsfJM1bXJC
	YW5yZDpE6xagoJc5rCpIQAElklObBtcES2CVGWSlhXkagQ4R4ClKLcjNLUOVfMYpzMCoJ83qD
	TOHJzCuBm/4KaDET0OK1e9+CLC5JREhJNTCusxR/HTKZp2eqkntskVenzKd/J09d/rrrhsPH5
	alcj1rX71ordGGuwVfPfNnA+9wMp1xFP3/fGhx17Tzf+9hVz76xB3h4Tqm0YzuXrCDWwRoi0H
	3vxkXmWVxbu8rvLOUM4P77YTbnwz5WyXP1P/18UrJSps5LTO3btpFrm8om//DAQ2kzZuQpsRR
	nJBpqMRcVJwIA77NapFsDAAA=
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-5.tower-36.messagelabs.com!1492068408!92412516!1
X-Originating-IP: [62.60.8.85]
X-StarScan-Received: 
X-StarScan-Version: 9.4.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29409 invoked from network); 13 Apr 2017 07:26:48 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
	by server-5.tower-36.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 13 Apr 2017 07:26:48 -0000
Received: from R01UKEXCASM125.r01.fujitsu.local (ex2k13_125.fs.fujitsu.com
	[10.183.43.177])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	v3D7QGLe016976
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 08:26:22 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) by
	R01UKEXCASM125.r01.fujitsu.local (10.183.43.177) with Microsoft SMTP
	Server (TLS) id 15.0.1263.5; Thu, 13 Apr 2017 08:26:41 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c])
	by R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c%22])
	with mapi id 15.00.1263.000; Thu, 13 Apr 2017 08:26:41 +0100
From: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Using boost-program-options and native
Thread-Index: AQHSs5NkEE3odvezyk6hi2hDkT5kJaHCx/qAgAAFXgCAAAlSgA==
Date: Thu, 13 Apr 2017 07:26:40 +0000
Message-ID: <1492068399.4511.1.camel@ts.fujitsu.com>
References: <1492004877.5507.2.camel@ts.fujitsu.com>
	<1492065245.27604.45.camel@intel.com>
	<1f6dd187-6d8a-d266-e3fb-620c1f723485@advancedtelematic.com>
In-Reply-To: <1f6dd187-6d8a-d266-e3fb-620c1f723485@advancedtelematic.com>
Reply-To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Accept-Language: de-DE, en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.22.6-1ubuntu1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.183.43.206]
MIME-Version: 1.0
Subject: Re: Using boost-program-options and native
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
X-List-Received-Date: Thu, 13 Apr 2017 07:33:50 -0000
X-Groupsio-MsgNum: 96248
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature";
	boundary="=-QPXFxuYzqvZ+RB5/KQJ7"

--=-QPXFxuYzqvZ+RB5/KQJ7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 13.04.2017, 08:53 +0200 schrieb Phil Wise:
> On 13.04.2017 08:34, Patrick Ohly wrote:
> > On Wed, 2017-04-12 at 13:47 +0000, thilo.cestonaro@ts.fujitsu.com wrote=
:
> > > I want to build a tool which makes use of boost-program-options lib. =
As long as I compile for the target, all is fine, but when I add
> > > > BBCLASSEXTEND +=3D "native"
> > >=20
> > > to my recipe, I a bitbake error "Nothing Provides" ... :(
> > >=20
> > > > ERROR: Required build target 'mytool-native' has no buildable provi=
ders.
> > > > Missing or unbuildable dependency chain was: ['mytool-native', 'boo=
st-program-options-native']
> > >=20
> > > In the recipe I just depend on boost and RDEPEND on boost-program-opt=
ions:
> > > > DEPENDS =3D "boost"
> > > > RDEPENDS_${PN} =3D "boost-program-options"
> > >=20
> > > Is something wrong with this? Why is there a package
> > > boost-program-options but no boost-program-options-native, altough
> > > boost-native exists and the libboost-program-options.so is installed
> > > into the
> > > native sysroot. (I can compile flawlessly without the RDEPENDS line.)
> >=20
> > Native and nativesdk flavors don't have packages, so RDEPENDS only work=
s
> > when depending on ${PN}-native (but not for ${PN}-native-some-package).=
=C2=A0
> >=20
> > Try:
> >=20
> > DEPENDS =3D "boost"
> > RDEPENDS_${PN}_class-target =3D "boost-program-options"
> >=20
> > "boost" already is a dependency via DEPENDS, so you shouldn't need an
> > RDEPENDS for it in the native case.
>=20
> The following worked for me when building a native recipe that depends
> on Boost Program Options:libboost-program-options1.60.0
>=20
> https://github.com/advancedtelematic/meta-updater/blob/morty/recipes-sota=
/sota-tools/sota-tools_git.bb
>=20
> =C2=A0 inherit cmake
> =C2=A0 DEPENDS =3D "boost ..."
> =C2=A0 BBCLASSEXTEND =3D "native"
>=20

Thanks for your answers!

The problem is, that boost_program_options is a library which needs to be i=
nstalled on the target. This isn't done with DEPENDS boost only.

But the answer of Patrick Ohly worked for me. Now my package has a dependen=
cy to libboost-program-options1.60.0 in the control file!

Cheers,
Thilo

--=-QPXFxuYzqvZ+RB5/KQJ7
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIINgjCCA9Qw
ggK8oAMCAQICEDTNElfINoNG4L/3PTADbgUwDQYJKoZIhvcNAQEFBQAwLzEtMCsGA1UEAxMkRnVq
aXRzdSBUZWNobm9sb2d5IFNvbHV0aW9ucyBSb290IENBMB4XDTA5MDMxMjEyMjQ1OVoXDTE5MDMx
MTEyMjQ1OVowLzEtMCsGA1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0aW9ucyBVc2VyIENB
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsBtNf0fN8EkW9y6QqoQGS6LUwezenV2B
nDzORdGanukRtpGzYMAPdyiwtlp0/zONa+jCJGzkX4iYCjTsiJvx01SPRNZ24fHaFGXpJBX599q6
ZF0isu+h1aIas1tfyCBalAbKKLvNgIuQjnXhdffVk4vSuBytO3OGcULtJ2+lYVSEvxzGt9iTSwT5
RnEvKpR0iOC+9/UNVOiPK9XCz5u7bg3iehP5gD+v5uu3YIRwV/5gyd7AZPcckTfYP/GZcybcAXfE
l5nb/bZiSLHeZEjxMMM8YZqFKhH9xymIdjkcRK7NJ2j8OD708QFv4b4bme1mHGfTjSbxb1nOoUTs
NtshZwIDAQABo4HrMIHoMB0GA1UdDgQWBBQI9chqv4Dje1DEOfQHmEbobX6XqDALBgNVHQ8EBAMC
AYYwHwYDVR0jBBgwFoAUFHXiV7YVNxWAKpflUUhlrM+GkMswEgYDVR0TAQH/BAgwBgEB/wIBADBH
BggrBgEFBQcBAQQ7MDkwNwYIKwYBBQUHMAKGK2h0dHA6Ly9haWEudHMuZnVqaXRzdS5jb20vYWlh
L2Z0czAxcm9vdC5jZXIwPAYDVR0fBDUwMzAxoC+gLYYraHR0cDovL2NkcC50cy5mdWppdHN1LmNv
bS9jZHAvZnRzMDFyb290LmNybDANBgkqhkiG9w0BAQUFAAOCAQEAQ7pQP9Lw9bcnt1DhvV5UWb1z
mnACSo6n6x+bupckQzlrf3aJ7HQZigZuaCak+dexL18I86iNDDOJBBsrz0DcD4XPszcLTUezqqGl
AyIbviBq5mwDHAWBA9F11GRx6LdrHMKNdHPwAWyC3r6qv4GO6A+z16KUZFSP4kvuaN5YHI481T7F
FxEmntkylphndX+6mQ1NABApMMhX0aN5dVhPAMAP8nENJ1hGk81IG8gzkoHDPSoLCtffAnNhYAqh
vrDO2ybXb/9x+Sf3DQuzBg3hpB1yJM3K8foQaS3uTpFITfdMprcQyrIdl4Jw26s/6vpIs0siLVTp
3yAwgNaqQSgxSTCCBNEwggO5oAMCAQICCiTQamwAAAACT/cwDQYJKoZIhvcNAQEFBQAwLzEtMCsG
A1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0aW9ucyBVc2VyIENBMB4XDTE3MDMyMDE0MTQz
MFoXDTE5MDMxMTEyMjQ1OVowQjEZMBcGA1UEAwwQQ2VzdG9uYXJvLCBUaGlsbzElMCMGA1UECgwc
RnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0aW9uczCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA
0uWjAFi30uLWA8njAv5ZpcxymMThzpeEkPuGP6pYi1hAc8+vDCsUMpJJSOYbMv32mb8VCMv+pa/+
by8QeaSrDF4WgwQizpQEHyPraGfUoVLL353fb2aHCrO5SKiR2B+//0hDI3TIepXHKRGeo2ID9bNs
CbLCoP8iLORcxe0aIAkCAwEAAaOCAl4wggJaMAsGA1UdDwQEAwIFoDCBvgYDVR0RBIG2MIGzgR50
aGlsby5jZXN0b25hcm9AdHMuZnVqaXRzdS5jb22BKHRoaWxvLmNlc3RvbmFyb0BlbWVpYWNlbWVh
LmZ1aml0c3UubG9jYWyBHnRoaWxvLmNlc3RvbmFyb0BjZW1haWwuZnNjLm5ldIEjVGhpbG8uQ2Vz
dG9uYXJvQGZ1aml0c3Utc2llbWVucy5jb22BIis0OTgyMTgwNDgyMzI4QGluY29taW5nZmF4LmZz
Yy5uZXQwHQYDVR0OBBYEFB2XNYjbZi/EOqY+MAYnp8hD2/FfMB8GA1UdIwQYMBaAFAj1yGq/gON7
UMQ59AeYRuhtfpeoMDwGA1UdHwQ1MDMwMaAvoC2GK2h0dHA6Ly9jZHAudHMuZnVqaXRzdS5jb20v
Y2RwL2Z0czAxdXNlci5jcmwwRwYIKwYBBQUHAQEEOzA5MDcGCCsGAQUFBzAChitodHRwOi8vYWlh
LnRzLmZ1aml0c3UuY29tL2FpYS9mdHMwMXVzZXIuY2VyMAwGA1UdEwEB/wQCMAAwPQYJKwYBBAGC
NxUHBDAwLgYmKwYBBAGCNxUIhYXEMoGH/2GBhYEEhuyCIIHHgRp5g4igcYfS8S8CAWQCAQgwEwYD
VR0lBAwwCgYIKwYBBQUHAwQwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDBEBgkqhkiG9w0B
CQ8ENzA1MA4GCCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAIAwBwYFKw4DAgcwCgYIKoZIhvcN
AwcwDQYJKoZIhvcNAQEFBQADggEBADjeHSO7IhVtZ/iqxhi/wxHob0WlSv3JgSUQycQTZksmAyif
jPzT09faFxjY8m/ar4bTqFoug99dwQKh15YFtIZG4TdxUJTbsMuJB7xp0j2/yTBBnKeqK8UHd2+4
oc015/9Amq3E1sC1NAm2brCnIXnKO+t9r9jEUsDhcPsYfdgtzC3AZ/+hs5mcJjiVqCW+Wi/Nu8KE
NcFjz60vhXhiz/tYLyfMBfNkjeOjkvNWuE2g12jH+waJPnMl5uu2ATyJMpL37CCnM5h55GpoMsOJ
5n2uTFVpnLlsR53sPsKmCdMuRQNaBZS9hfxynMAQamguIVowqmvSpR5ji0dI8S99u3cwggTRMIID
uaADAgECAgok0GpsAAAAAk/3MA0GCSqGSIb3DQEBBQUAMC8xLTArBgNVBAMTJEZ1aml0c3UgVGVj
aG5vbG9neSBTb2x1dGlvbnMgVXNlciBDQTAeFw0xNzAzMjAxNDE0MzBaFw0xOTAzMTExMjI0NTla
MEIxGTAXBgNVBAMMEENlc3RvbmFybywgVGhpbG8xJTAjBgNVBAoMHEZ1aml0c3UgVGVjaG5vbG9n
eSBTb2x1dGlvbnMwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANLlowBYt9Li1gPJ4wL+WaXM
cpjE4c6XhJD7hj+qWItYQHPPrwwrFDKSSUjmGzL99pm/FQjL/qWv/m8vEHmkqwxeFoMEIs6UBB8j
62hn1KFSy9+d329mhwqzuUiokdgfv/9IQyN0yHqVxykRnqNiA/WzbAmywqD/IizkXMXtGiAJAgMB
AAGjggJeMIICWjALBgNVHQ8EBAMCBaAwgb4GA1UdEQSBtjCBs4EedGhpbG8uY2VzdG9uYXJvQHRz
LmZ1aml0c3UuY29tgSh0aGlsby5jZXN0b25hcm9AZW1laWFjZW1lYS5mdWppdHN1LmxvY2FsgR50
aGlsby5jZXN0b25hcm9AY2VtYWlsLmZzYy5uZXSBI1RoaWxvLkNlc3RvbmFyb0BmdWppdHN1LXNp
ZW1lbnMuY29tgSIrNDk4MjE4MDQ4MjMyOEBpbmNvbWluZ2ZheC5mc2MubmV0MB0GA1UdDgQWBBQd
lzWI22YvxDqmPjAGJ6fIQ9vxXzAfBgNVHSMEGDAWgBQI9chqv4Dje1DEOfQHmEbobX6XqDA8BgNV
HR8ENTAzMDGgL6AthitodHRwOi8vY2RwLnRzLmZ1aml0c3UuY29tL2NkcC9mdHMwMXVzZXIuY3Js
MEcGCCsGAQUFBwEBBDswOTA3BggrBgEFBQcwAoYraHR0cDovL2FpYS50cy5mdWppdHN1LmNvbS9h
aWEvZnRzMDF1c2VyLmNlcjAMBgNVHRMBAf8EAjAAMD0GCSsGAQQBgjcVBwQwMC4GJisGAQQBgjcV
CIWFxDKBh/9hgYWBBIbsgiCBx4EaeYOIoHGH0vEvAgFkAgEIMBMGA1UdJQQMMAoGCCsGAQUFBwME
MBsGCSsGAQQBgjcVCgQOMAwwCgYIKwYBBQUHAwQwRAYJKoZIhvcNAQkPBDcwNTAOBggqhkiG9w0D
AgICAIAwDgYIKoZIhvcNAwQCAgCAMAcGBSsOAwIHMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBBQUA
A4IBAQA43h0juyIVbWf4qsYYv8MR6G9FpUr9yYElEMnEE2ZLJgMon4z809PX2hcY2PJv2q+G06ha
LoPfXcECodeWBbSGRuE3cVCU27DLiQe8adI9v8kwQZynqivFB3dvuKHNNef/QJqtxNbAtTQJtm6w
pyF5yjvrfa/YxFLA4XD7GH3YLcwtwGf/obOZnCY4laglvlovzbvChDXBY8+tL4V4Ys/7WC8nzAXz
ZI3jo5LzVrhNoNdox/sGiT5zJebrtgE8iTKS9+wgpzOYeeRqaDLDieZ9rkxVaZy5bEed7D7CpgnT
LkUDWgWUvYX8cpzAEGpoLiFaMKpr0qUeY4tHSPEvfbt3MYIB4TCCAd0CAQEwPTAvMS0wKwYDVQQD
EyRGdWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zIFVzZXIgQ0ECCiTQamwAAAACT/cwCQYFKw4D
AhoFAKCB+zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xNzA0MTMw
NzI2MzlaMCMGCSqGSIb3DQEJBDEWBBQy22j6T68y/PGBVu9JmBYLU7vd/DBMBgkrBgEEAYI3EAQx
PzA9MC8xLTArBgNVBAMTJEZ1aml0c3UgVGVjaG5vbG9neSBTb2x1dGlvbnMgVXNlciBDQQIKJNBq
bAAAAAJP9zBOBgsqhkiG9w0BCRACCzE/oD0wLzEtMCsGA1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5
IFNvbHV0aW9ucyBVc2VyIENBAgok0GpsAAAAAk/3MA0GCSqGSIb3DQEBAQUABIGAS7QxUEQsUnNA
JDeC+MdNHA5uHl0Pg7o3Ib/MQreqvuE7USgV0E92yS7Z9bXAWjgfhhHCBh5SwD32VEtmQKdMiQV4
0alTgmB4FusqyGegJRB0Vz1l0JIEZp9e8Y7wJsfXoijyEYM4hVV3y4Buo9mOD0onvqLHRG9zfXiF
PCrKd30AAAAAAAA=

--=-QPXFxuYzqvZ+RB5/KQJ7--
