Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from mail1.bemta3.messagelabs.com (mail1.bemta3.messagelabs.com
	[195.245.230.168])
	by mail.openembedded.org (Postfix) with ESMTP id 3689060103
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 15:27:05 +0000 (UTC)
Received: from [85.158.138.179] by server-8.bemta-3.messagelabs.com id
	AD/0F-26755-A492B285; Tue, 15 Nov 2016 15:27:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDKsWRWlGSWpSXmKPExsViZ8MxVddLUzv
	C4N8nIYs7P9+xW8zbYe/A5LF4z0smj3MbVzAGMEWxZuYl5VcksGZ8mrCZpeCzacXW5pXsDYxr
	jbsYuTiEBJqZJGbdeM8K4RxjlPj09yY7hHORUaJx9yXGLkZODjYBd4mt9+4zdTFycIgIGEvsn
	MUCEmYWiJKYNPsVmC0sYC2xYedJZhBbRMBGov3eGSjbSmL//xtsIDaLgKrE6ZaFTCA2r4CJxL
	xJD5khdnUxSsxqbAJLcAoESkxq6gHbKyTgLXH642ywQYwCKhK77m5hhFgsLnHryXywegkBEYm
	HF0+zQdiiEi8f/2OFsFUktqz7wA5h60icvf6EEcI2kNi6dB8LhK0o8aLlMzPEzCqJI7d7WSCO
	E5Q4OfMJywSgs5Csm4WkbBaSMoi4pkTr9t/sELa2xLKFr5khbFuJ/VdXQtmmEq+PfmSEsBUlp
	nQ/ZF/AyLGKUb04tagstUjXXC+pKDM9oyQ3MTNH19DAWC83tbg4MT01JzGpWC85P3cTIzDWGY
	BgB2Pjd6dDjJIcTEqivNnK2hFCfEn5KZUZicUZ8UWlOanFhxhlODiUJHh5NIBygkWp6akVaZk
	5wKQDk5bg4FES4bUBSfMWFyTmFmemQ6ROMSpKifOygCQEQBIZpXlwbbBEd4lRVkqYlxHoECGe
	gtSi3MwSVPlXjOIcjErCvLwgU3gy80rgpr8CWswEtHiXuQbI4pJEhJRUA6Nm/hGHmf9bDpcdj
	i0SCXII7C5OKY9Yuk9S5prA2XR3G3MLEcYuF5kSqeCrB3Mf1F2/1Zf8YnHxzqYUS0djc5XLy0
	x21fCrHdFbPddCK/DpnlenzOf+Kmb2aZ1594/g84yiwDqhSi2G028zw05ZBJ2fJ1Ep3Hnje2h
	vKX+oiOq6qPOvVi3fo8RSnJFoqMVcVJwIAFgL4ehvAwAA
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-13.tower-169.messagelabs.com!1479223626!77513064!1
X-Originating-IP: [62.60.8.149]
X-StarScan-Received: 
X-StarScan-Version: 9.0.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10891 invoked from network); 15 Nov 2016 15:27:06 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
	by server-13.tower-169.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 15 Nov 2016 15:27:06 -0000
Received: from R01UKEXCASM121.r01.fujitsu.local (ex2k13_121.fs.fujitsu.com
	[10.183.43.173])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	uAFFRVhb004140
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 15 Nov 2016 15:27:31 GMT
Received: from R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) by
	R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP
	Server (TLS) id 15.0.1178.4; Tue, 15 Nov 2016 15:27:05 +0000
Received: from R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c])
	by R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c%22])
	with mapi id 15.00.1178.000; Tue, 15 Nov 2016 15:27:05 +0000
From: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
To: "ross.burton@intel.com" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] added recipe for libdbus-c++
Thread-Index: AQHSP0copeIY+KWsuk6OtY6bEmmG2qDaGQQAgAAQ1YA=
Date: Tue, 15 Nov 2016 15:27:05 +0000
Message-ID: <1479223403.5380.6.camel@ts.fujitsu.com>
References: <20161115134607.13337-1-thilo.cestonaro@ts.fujitsu.com>
	<CAJTo0LY0_hUiFhYJKA3B+qouLoBhXd4W_ab=3T-gYDMPFUj7tw@mail.gmail.com>
In-Reply-To: <CAJTo0LY0_hUiFhYJKA3B+qouLoBhXd4W_ab=3T-gYDMPFUj7tw@mail.gmail.com>
Reply-To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Accept-Language: de-DE, en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.22.2-1ubuntu1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.183.43.206]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] added recipe for libdbus-c++
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
X-List-Received-Date: Tue, 15 Nov 2016 15:27:06 -0000
X-Groupsio-MsgNum: 89418
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature";
	boundary="=-FC5BNJjKuUa4Ww6IvaHw"

--=-FC5BNJjKuUa4Ww6IvaHw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 15.11.2016, 14:23 +0000 schrieb Burton, Ross:
>=20
> On 15 November 2016 at 13:46, Thilo Cestonaro <thilo.cestonaro@ts.fujitsu=
.com> wrote:
> > Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
> >=20
>=20
> As Alex said, please submit this to meta-oe as there's no strong rational=
e to keep it in oe-core, especially considering it's abandoned.
>=20
> The remove_CXX_FOR_BUILD-stuff patch can be trimmed to just modify config=
ure.ac and tools/Makefile.am, the other files will be regenerated at do_con=
figure and patching them can cause conflicts if
> upstream ever makes a new release.
>=20
> Also please explain clearly why that has to be removed in the patch heade=
r because usually we need to patch *in* the _FOR_BUILD macros: I was curiou=
s and ended up looking at the build to understand
> why. AFAICT it's because upstream if cross-compiling it refuses to build =
target tools and will only build host tools so the test suite can run, but =
disabling the tests and patching out CXX_FOR_BUILD
> we can build target tools.=C2=A0 The downside is that we have no test sui=
te, which is useful (see the ptest class).

Perhaps I will add ptest in another patch later. Will need to look into it.
Thanks for your comments!

>=20
> Thank you for being the first person in a long time to actually submit th=
e recipe to the community!
>=20
> Ross

--=-FC5BNJjKuUa4Ww6IvaHw
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIM6DCCA9Qw
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
3yAwgNaqQSgxSTCCBIQwggNsoAMCAQICCiWUlIAAAAACJH0wDQYJKoZIhvcNAQEFBQAwLzEtMCsG
A1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0aW9ucyBVc2VyIENBMB4XDTE0MDMyMTEyMTM1
M1oXDTE3MDMyMDEyMTM1M1owQjEZMBcGA1UEAwwQQ2VzdG9uYXJvLCBUaGlsbzElMCMGA1UECgwc
RnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0aW9uczCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA
qP3ld/ylkJOTj2rXQ+VrRf/+YMgZS5CGDnMWk+sMoS5f6JqtwfGcfBU/DhfnLsePut2q+ex/RDZF
M6yCraPS0vdnTKm2O3Q7/UhhAV1Mi4XzzGeY1Y0qm+85EgMBISPwB5mThLYPsun5UIFs6e8tvlwZ
Rzp/jrv/AzAfsSbHGXcCAwEAAaOCAhEwggINMAsGA1UdDwQEAwIFoDByBgNVHREEazBpgR50aGls
by5jZXN0b25hcm9AdHMuZnVqaXRzdS5jb22BI1RoaWxvLkNlc3RvbmFyb0BmdWppdHN1LXNpZW1l
bnMuY29tgSIrNDk4MjE4MDQ4MjMyOEBpbmNvbWluZ2ZheC5mc2MubmV0MB0GA1UdDgQWBBSiHLgI
jjo+7KxLJ4t1+YZxgBSn8TAfBgNVHSMEGDAWgBQI9chqv4Dje1DEOfQHmEbobX6XqDA8BgNVHR8E
NTAzMDGgL6AthitodHRwOi8vY2RwLnRzLmZ1aml0c3UuY29tL2NkcC9mdHMwMXVzZXIuY3JsMEcG
CCsGAQUFBwEBBDswOTA3BggrBgEFBQcwAoYraHR0cDovL2FpYS50cy5mdWppdHN1LmNvbS9haWEv
ZnRzMDF1c2VyLmNlcjAMBgNVHRMBAf8EAjAAMD0GCSsGAQQBgjcVBwQwMC4GJisGAQQBgjcVCIWF
xDKBh/9hgYWBBIbsgiCBx4EaeYOIoHGH0vEvAgFkAgEIMBMGA1UdJQQMMAoGCCsGAQUFBwMEMBsG
CSsGAQQBgjcVCgQOMAwwCgYIKwYBBQUHAwQwRAYJKoZIhvcNAQkPBDcwNTAOBggqhkiG9w0DAgIC
AIAwDgYIKoZIhvcNAwQCAgCAMAcGBSsOAwIHMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBBQUAA4IB
AQAEGTAyHPmTyCR029H+P/u9xRezlfA2OVvV97Ls/oLCXGGr6EkMvpHodTc6n4EWSb2ul3VPSRQf
uSmBgIcHQJykHdSChisaqkeOpHG0rjM9GXh2eQ7ECovpQIfdIbRZKNxlJihSDsDWHyZldBlPVbDh
xMeT6xJ/ylF8UQ8FXKUir6W/BSPZF5kLdsmCeOpWC4jOGNPEMUAcuiHZPyqAhjlWk750I4oJJKvD
bwO8/mkxmzOjpOsk8O3CdljCjYPoYtJPI/oNVsYdmiokzne4FusPYKDzv5i0dN74KLR48maXvi3/
WsTFqwks45QeBJT/z+1sYy+dYWpv9XGN+jR1o4ImMIIEhDCCA2ygAwIBAgIKJZSUgAAAAAIkfTAN
BgkqhkiG9w0BAQUFADAvMS0wKwYDVQQDEyRGdWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zIFVz
ZXIgQ0EwHhcNMTQwMzIxMTIxMzUzWhcNMTcwMzIwMTIxMzUzWjBCMRkwFwYDVQQDDBBDZXN0b25h
cm8sIFRoaWxvMSUwIwYDVQQKDBxGdWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zMIGfMA0GCSqG
SIb3DQEBAQUAA4GNADCBiQKBgQCo/eV3/KWQk5OPatdD5WtF//5gyBlLkIYOcxaT6wyhLl/omq3B
8Zx8FT8OF+cux4+63ar57H9ENkUzrIKto9LS92dMqbY7dDv9SGEBXUyLhfPMZ5jVjSqb7zkSAwEh
I/AHmZOEtg+y6flQgWzp7y2+XBlHOn+Ou/8DMB+xJscZdwIDAQABo4ICETCCAg0wCwYDVR0PBAQD
AgWgMHIGA1UdEQRrMGmBHnRoaWxvLmNlc3RvbmFyb0B0cy5mdWppdHN1LmNvbYEjVGhpbG8uQ2Vz
dG9uYXJvQGZ1aml0c3Utc2llbWVucy5jb22BIis0OTgyMTgwNDgyMzI4QGluY29taW5nZmF4LmZz
Yy5uZXQwHQYDVR0OBBYEFKIcuAiOOj7srEsni3X5hnGAFKfxMB8GA1UdIwQYMBaAFAj1yGq/gON7
UMQ59AeYRuhtfpeoMDwGA1UdHwQ1MDMwMaAvoC2GK2h0dHA6Ly9jZHAudHMuZnVqaXRzdS5jb20v
Y2RwL2Z0czAxdXNlci5jcmwwRwYIKwYBBQUHAQEEOzA5MDcGCCsGAQUFBzAChitodHRwOi8vYWlh
LnRzLmZ1aml0c3UuY29tL2FpYS9mdHMwMXVzZXIuY2VyMAwGA1UdEwEB/wQCMAAwPQYJKwYBBAGC
NxUHBDAwLgYmKwYBBAGCNxUIhYXEMoGH/2GBhYEEhuyCIIHHgRp5g4igcYfS8S8CAWQCAQgwEwYD
VR0lBAwwCgYIKwYBBQUHAwQwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDBEBgkqhkiG9w0B
CQ8ENzA1MA4GCCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAIAwBwYFKw4DAgcwCgYIKoZIhvcN
AwcwDQYJKoZIhvcNAQEFBQADggEBAAQZMDIc+ZPIJHTb0f4/+73FF7OV8DY5W9X3suz+gsJcYavo
SQy+keh1NzqfgRZJva6XdU9JFB+5KYGAhwdAnKQd1IKGKxqqR46kcbSuMz0ZeHZ5DsQKi+lAh90h
tFko3GUmKFIOwNYfJmV0GU9VsOHEx5PrEn/KUXxRDwVcpSKvpb8FI9kXmQt2yYJ46lYLiM4Y08Qx
QBy6Idk/KoCGOVaTvnQjigkkq8NvA7z+aTGbM6Ok6yTw7cJ2WMKNg+hi0k8j+g1Wxh2aKiTOd7gW
6w9goPO/mLR03vgotHjyZpe+Lf9axMWrCSzjlB4ElP/P7WxjL51ham/1cY36NHWjgiYxggHhMIIB
3QIBATA9MC8xLTArBgNVBAMTJEZ1aml0c3UgVGVjaG5vbG9neSBTb2x1dGlvbnMgVXNlciBDQQIK
JZSUgAAAAAIkfTAJBgUrDgMCGgUAoIH7MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTE2MTExNTE1MjMyM1owIwYJKoZIhvcNAQkEMRYEFLOGBUFqSX8tWVa2rcBKEWz/
Cz0DMEwGCSsGAQQBgjcQBDE/MD0wLzEtMCsGA1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0
aW9ucyBVc2VyIENBAgollJSAAAAAAiR9ME4GCyqGSIb3DQEJEAILMT+gPTAvMS0wKwYDVQQDEyRG
dWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zIFVzZXIgQ0ECCiWUlIAAAAACJH0wDQYJKoZIhvcN
AQEBBQAEgYAGyXvZb/ksvri6iMVTkHo+lwR94092llf1KxMosNQ7XI3y/jyISSvR17QD4KBLFWHZ
KvOdBGt3x+hmffLt9934abcQRiAz/Qie1iRXwrioa58e3eGChD/5gefogf1v+P5kl+mU+SQB9z79
O6DURuIyXx58+Rp3HrNFq+0IdvfCawAAAAAAAA==

--=-FC5BNJjKuUa4Ww6IvaHw--
