Return-Path: <thilo.cestonaro@ts.fujitsu.com>
X-Greylist: delayed 391 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Jul 2016 12:21:00 UTC
Received: from mail1.bemta14.messagelabs.com (mail1.bemta14.messagelabs.com
	[193.109.254.114])
	by mail.openembedded.org (Postfix) with ESMTP id 3572E606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 12:21:00 +0000 (UTC)
Received: from [193.109.254.3] by server-10.bemta-14.messagelabs.com id
	D0/39-03469-5A5A8975; Wed, 27 Jul 2016 12:14:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRWlGSWpSXmKPExsViZ8MxVXfJ0hn
	hBou38Fjc+fmO3aLt+ixGByaPnbPusnuc27iCMYApijUzLym/IoE1Y9LZdWwFHwwqbj3dw97A
	2KzfxcjFISTQyiSx9eEKFgjnGKPElfdz2SCci4wSpxfdBcpwcrAJuEtsvXefCcQWEdCVeP75L
	1icWSBKYtLsV2C2sICXxLbTD5kharwlVm99wgJhh0lM+fmLEcRmEVCVOHzhD1icV8BU4ubJKY
	wQy84ySZx/3A/WzClgK/H75y6wZUJAg05/nA0WZxRQkdh1dwsjxGJxiVtP5oPVSAiISDy8eJo
	NwhaVePn4HyuEbSCxdek+FghbSWJK00JmiN4qifcbHzNCHCEocXLmE5YJjGKzkIydhaRsFpIy
	iLimROv23+wQtrbEsoWvmSFsW4n9V1dC2aYSr49+ZISwFSWmdD9kX8DIsYpRozi1qCy1SNfQR
	C+pKDM9oyQ3MTNH1xDIzU0tLk5MT81JTCrWS87P3cQIjOB6BgbGHYzfT3seYpTkYFIS5V3kOC
	NciC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvwiVAOcGi1PTUirTMHGAqgUlLcPAoifBqLgZK8xY
	XJOYWZ6ZDpE4x6nJ8mX5tLZMQS15+XqqUOK8FyAwBkKKM0jy4EbC0dolRVkqYl5GBgUGIpyC1
	KDezBFX+FaM4B6OSMG83yBSezLwSuE2vgI5gAjqiOBbsiJJEhJRUA2NEtFBT6tWVPysuaLIaF
	t05m/h7wg3lZf6TZ36tTFX9wRp+aJvE5LPyXX9VDwW7zXeLWczj8u7bvz7/IDmLL5rVHk8v7I
	sqT+s4Yjlh+6EVHx5WGG1ebNy64dAv+aqNX0t3BDtfvabAuaey01lGaMWXR2mBJ4/MOe15O1Z
	i3ZnZ5+y3KT7WqrymxFKckWioxVxUnAgAZ+sLJmYDAAA=
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-13.tower-184.messagelabs.com!1469621668!62098654!1
X-Originating-IP: [62.60.8.149]
X-StarScan-Received: 
X-StarScan-Version: 8.77; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25749 invoked from network); 27 Jul 2016 12:14:28 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
	by server-13.tower-184.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 27 Jul 2016 12:14:28 -0000
Received: from R01UKEXCASM122.r01.fujitsu.local (ex2k13_122.fs.fujitsu.com
	[10.183.43.174])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	u6RCGU3h006978
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 27 Jul 2016 13:16:30 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) by
	R01UKEXCASM122.r01.fujitsu.local (10.183.43.174) with Microsoft SMTP
	Server (TLS) id 15.0.1178.4; Wed, 27 Jul 2016 13:14:27 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c])
	by R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c%22])
	with mapi id 15.00.1178.000; Wed, 27 Jul 2016 13:14:27 +0100
From: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] Building for armv7athf-neon but toolchain is softfp
Thread-Index: AQHR5B58h/TNj18cYUuHrBoFZFSdxKAkbLqAgAS04oCAAAM7gIABRI6AgAGYNoCAACVjAA==
Date: Wed, 27 Jul 2016 12:14:27 +0000
Message-ID: <1469621486.18503.9.camel@ts.fujitsu.com>
References: <1469194596.6594.13.camel@ts.fujitsu.com>
	<CAMKF1srBan-tupS7qGb3kDnAn-2-u8dox3vFk5ssGwQLzeGaHw@mail.gmail.com>
	<1469455403.6896.29.camel@ts.fujitsu.com>
	<CAMKF1soyDLFePf+JqwQeyqCeig=CeZqHADwJJ7yZ=Nz9PcW0Hg@mail.gmail.com>
	<1469525795.6937.1.camel@ts.fujitsu.com>
	<AA7383CF-888C-4605-97BB-BB016A5EB450@gmail.com>
In-Reply-To: <AA7383CF-888C-4605-97BB-BB016A5EB450@gmail.com>
Reply-To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Accept-Language: de-DE, en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.182.185.150]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building for armv7athf-neon but toolchain is softfp
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
X-List-Received-Date: Wed, 27 Jul 2016 12:21:04 -0000
X-Groupsio-MsgNum: 84976
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature";
	boundary="=-HnXcb4aKvkxBKW3sGZpf"

--=-HnXcb4aKvkxBKW3sGZpf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Khem,

I figured, when I do the compile in 2 steps, so compile then link and chang=
e the link command to use the ubuntu arm-linux-gnueabihf-gcc instead of the=
 gcc from the sdk, the binary is useable.

I hope that helps a bit!

Cheers,
Thilo


On Mi, 2016-07-27 at 02:57 -0700, Khem Raj wrote:
> >=20
> > On Jul 26, 2016, at 2:39 AM, thilo.cestonaro@ts.fujitsu.com wrote:
> >=20
> > Hey Khem,
> >=20
> > >=20
> > > Seems steps are all ok. Can you upload your hello world somewhere.
> > http://thilo.cestona.ro/~ephraim/public/helloworld.zip
> >=20
> > Hope you can find out whats going on here :).
> >=20
> This seems to contain C++ it seems. Can you try a simple C hello.c and se=
e if that works.
>=20
> >=20
> > Cheers,
> > Thilo

--=-HnXcb4aKvkxBKW3sGZpf
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
hvcNAQkFMQ8XDTE2MDcyNzEyMTEyNlowIwYJKoZIhvcNAQkEMRYEFH96ErYzdkAeiZs0e7W7xqvV
egVPMEwGCSsGAQQBgjcQBDE/MD0wLzEtMCsGA1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0
aW9ucyBVc2VyIENBAgollJSAAAAAAiR9ME4GCyqGSIb3DQEJEAILMT+gPTAvMS0wKwYDVQQDEyRG
dWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zIFVzZXIgQ0ECCiWUlIAAAAACJH0wDQYJKoZIhvcN
AQEBBQAEgYA/YKd/MnCBVIWNdh+n2RgKQ25RSxzI/srAEDx3UNqVZBYQ7JGpclrDgm4G9dU1uND1
DyHib0mhcG1t/1/0dpKM7l1UaMFuEQyIvjksNLPrzhTVYwb2gELxQf4e1MHqs/phqk6da7z6THqK
brC9889wVflGqHxs3cd7mBWoGQAJoQAAAAAAAA==

--=-HnXcb4aKvkxBKW3sGZpf--
