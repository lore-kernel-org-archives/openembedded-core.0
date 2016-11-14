Return-Path: <thilo.cestonaro@ts.fujitsu.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 14 Nov 2016 13:40:59 UTC
Received: from mail1.bemta6.messagelabs.com (mail1.bemta6.messagelabs.com
	[193.109.254.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4162E606B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 13:40:59 +0000 (UTC)
Received: from [193.109.254.3] by server-6.bemta-6.messagelabs.com id
	A3/4B-12520-D3DB9285; Mon, 14 Nov 2016 13:33:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFKsWRWlGSWpSXmKPExsViZ8MxVddmr2a
	EwZSTxhZ3fr5jt5i3w96ByWPxnpdMHuc2rmAMYIpizcxLyq9IYM3Y8PcmU0GHacXRCV+YGhhv
	GnUxcnEICTQzSbxddIQVwjnGKPFp23UmCOcio0Rn+wbGLkZODjYBd4mt9+4DJTg4RASMJXbOY
	gEJMwtESUya/QrMFhZQkuh9/gXMFhFQllj/fg4ThG0lsXvtQWaQVhYBVYnZVxRBTF4BE4mmVY
	UgFUIC1RJHVn4D6+QUCJToebOYGSLuLXH642wwm1FARWLX3S2MEFvFJW49mQ82XUJAROLhxdN
	sELaoxMvH/1ghbBWJLes+sEPYOhJnrz9hhLANJLYu3ccCYStJTGlayAwxs0ri5NNbYDavgKDE
	yZlPWCYwSsxCsm4WkrJZSMog4poSrdt/s0PY2hLLFr5mhrBtJfZfXQllm0q8PvqREcJWlJjS/
	ZB9ASPHKkaN4tSistQiXSMDvaSizPSMktzEzBxdQwMzvdzU4uLE9NScxKRiveT83E2MwDhnAI
	IdjL+WBRxilORgUhLlPbJRM0KILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG/vbqCcYFFqempFWmY
	OMOHApCU4eJREeP1B0rzFBYm5xZnpEKlTjIpS4rzNIAkBkERGaR5cGyzJXWKUlRLmZQQ6RIin
	ILUoN7MEVf4VozgHo5Iw71uQKTyZeSVw018BLWYCWrzLXANkcUkiQkqqgbG4/MDctHPcmRZXb
	pi111jbLBUP/Xf6z7cXWstdG65c/a3GO5OVT+NB7Js7i8t3ZARvTp+bNeG6b8xU51Onz980cu
	Gb2yPI7Rni9i9437JDWZ/rH98xt/q28Knbud1Xb/r371tapvfFk0FQfgJ7jDOLtO/SE2YSq1I
	0HpbGly/7Lpg+e4fzhjdKLMUZiYZazEXFiQDmtTrYbQMAAA==
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-12.tower-184.messagelabs.com!1479130428!78770326!1
X-Originating-IP: [62.60.8.149]
X-StarScan-Received: 
X-StarScan-Version: 9.0.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30096 invoked from network); 14 Nov 2016 13:33:48 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
	by server-12.tower-184.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 14 Nov 2016 13:33:48 -0000
Received: from R01UKEXCASM122.r01.fujitsu.local (ex2k13_122.fs.fujitsu.com
	[10.183.43.174])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	uAEDXuMm011219
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 14 Nov 2016 13:33:56 GMT
Received: from R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) by
	R01UKEXCASM122.r01.fujitsu.local (10.183.43.174) with Microsoft SMTP
	Server (TLS) id 15.0.1178.4; Mon, 14 Nov 2016 13:33:28 +0000
Received: from R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c])
	by R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c%22])
	with mapi id 15.00.1178.000; Mon, 14 Nov 2016 13:33:28 +0000
From: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
To: "ross.burton@intel.com" <ross.burton@intel.com>
Thread-Topic: [OE-core] libdbus-c++
Thread-Index: AQHSPmKPAk8NurXD20y1oo1p9CiCIqDYTfaAgAAsiAA=
Date: Mon, 14 Nov 2016 13:33:27 +0000
Message-ID: <1479130386.8647.5.camel@ts.fujitsu.com>
References: <1479119619.8647.1.camel@ts.fujitsu.com>
	<CAJTo0LZ68DbpCMpHy=5AKuxsHNCjzw2vJMJBd1WC27VTga=fqg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ68DbpCMpHy=5AKuxsHNCjzw2vJMJBd1WC27VTga=fqg@mail.gmail.com>
Reply-To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Accept-Language: de-DE, en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.22.2-1ubuntu1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.182.185.150]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libdbus-c++
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
X-List-Received-Date: Mon, 14 Nov 2016 13:41:00 -0000
X-Groupsio-MsgNum: 89327
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature";
	boundary="=-Cq/I4bCcorUYu2h7d+wn"

--=-Cq/I4bCcorUYu2h7d+wn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 14.11.2016, 10:53 +0000 schrieb Burton, Ross:
>=20
> On 14 November 2016 at 10:33, thilo.cestonaro@ts.fujitsu.com <thilo.cesto=
naro@ts.fujitsu.com> wrote:
> > I wanted to build an executable using libdbus-c++ but OE-Core has no re=
cipe providing libdbus-c++, please correct me if I'm wrong here!
> >=20
> > Is there a reason, other than no one wanted a recipe for libdbus-c++=C2=
=A0yet, against the usage of dbus-c++ implementation or why isn't there a r=
ecipe for libdbus-c++?
> >=20
>=20
> There isn't a recipe in oe-core because nothing in oe-core needs it, and =
it isn't considered fundamental enough.=C2=A0 It seems that every six month=
s someone writes a recipe for dbus-c++ (because they
> have problems and ask for help on the lists) but nobody yet has actually =
submitted a recipe to meta-oe.=C2=A0 You can be that person!
>=20
Yeah I propably can and will be if I need to write my own. But the funny th=
ing is, that there ones was a meta-oe dbus-c++ recipe and this was removed =
with the comment, that it didn't work and it's
better to use the one from oe-core :)
http://lists.openembedded.org/pipermail/openembedded-devel/2011-August/0798=
34.html

So I just wanted to make sure, that none exists.

Thanks for that approval!

Cheers,
Thilo

--=-Cq/I4bCcorUYu2h7d+wn
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
hvcNAQkFMQ8XDTE2MTExNDEzMzMwNlowIwYJKoZIhvcNAQkEMRYEFFyRc21Rn0YSiyz5SpJfHnGo
IdKpMEwGCSsGAQQBgjcQBDE/MD0wLzEtMCsGA1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0
aW9ucyBVc2VyIENBAgollJSAAAAAAiR9ME4GCyqGSIb3DQEJEAILMT+gPTAvMS0wKwYDVQQDEyRG
dWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zIFVzZXIgQ0ECCiWUlIAAAAACJH0wDQYJKoZIhvcN
AQEBBQAEgYA/6rIh/jmfCIiBbixehM2NyhdwTsaK5BgQmTOZKSpI6aK1f7tglOXousftdNJ5vP7N
VqGmBtj+VOAwiaXQxy6l3Vl5AUp44ihgyTwQNLc1HpSBbtkySHcxxEO3Tjh5pxQ8M/IgV0UYnNss
bnPwX78q+BCx4am4eaDHcoDfzI78ogAAAAAAAA==

--=-Cq/I4bCcorUYu2h7d+wn--
