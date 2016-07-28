Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from mail1.bemta3.messagelabs.com (mail1.bemta3.messagelabs.com
	[195.245.230.162])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6FB60722
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 07:11:33 +0000 (UTC)
Received: from [85.158.138.179] by server-2.bemta-3.messagelabs.com id
	67/99-01945-520B9975; Thu, 28 Jul 2016 07:11:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRWlGSWpSXmKPExsViZ8MRoqu6YWa
	4wdp9zBZ3fr5jt2i7PovRgclj56y77B7nNq5gDGCKYs3MS8qvSGDNWLXmBHvBLoOKd8t+Mzcw
	PtDrYuTiEBJoZZKYdaCdFcI5xigx+dQOdgjnIqPEnhebmLsYOTnYBNwltt67zwRiiwjoSjz//
	JcFxGYWiJKYNPsVmC0s4CWx7fRDZogab4nVW58AxTmA7CSJlgVZIGEWAVWJnv8gyzg5eAVMJE
	7Nec0MsWsNs8T+Z92MIAlOAVuJed8gbCGgOac/zgabySigIrHr7hZGiL3iEreezAe7R0JAROL
	hxdNsELaoxMvH/1ghbDWJVVffsEPYBhJbl+5jgbCVJKY0LWQGuY1ZoEri02Y2iHsEJU7OfMIy
	gVF8FpINsxCqZiGpgijRlGjd/psdwtaWWLbwNTOEbSux/+pKKNtU4vXRj4wQtqLElO6H7AsYO
	VYxahSnFpWlFukaGeklFWWmZ5TkJmbm6BoaGOvlphYXJ6an5iQmFesl5+duYgTGdD0DA+MOxq
	kn/A4xSnIwKYnyhoXODBfiS8pPqcxILM6ILyrNSS0+xCjDwaEkwZu9HignWJSanlqRlpkDTC4
	waQkOHiUR3mqQNG9xQWJucWY6ROoUo6KUOK8lSEIAJJFRmgfXBktolxhlpYR5GRkYGIR4ClKL
	cjNLUOVfMYpzMCoJ87aCTOHJzCuBm/4KaDET0OLi2Bkgi0sSEVJSDYyid3dfEnwqm5ayyHZdi
	dClnXPUVwkmm9zOq4+Iv3JJjifLNjtPuUmu26Vk29fQBd099bM/nv8hcSvweUm6UfDR6acPvH
	F5xPy+S+HG/rmBMeqnHjqZqe0Oe7548cx9SULme8LVYmwM/+epvjR7M73pd8S3flt3h/1LVr/
	q7d3dnZ+T8l5tr5ISS3FGoqEWc1FxIgACK31eYwMAAA==
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-2.tower-169.messagelabs.com!1469689892!53228583!1
X-Originating-IP: [62.60.8.84]
X-StarScan-Received: 
X-StarScan-Version: 8.77; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31373 invoked from network); 28 Jul 2016 07:11:33 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
	by server-2.tower-169.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 28 Jul 2016 07:11:33 -0000
Received: from R01UKEXCASM123.r01.fujitsu.local (ex2k13_123.fs.fujitsu.com
	[10.183.43.175])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	u6S73XJA005281
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 28 Jul 2016 08:03:33 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) by
	R01UKEXCASM123.r01.fujitsu.local (10.183.43.175) with Microsoft SMTP
	Server (TLS) id 15.0.1178.4; Thu, 28 Jul 2016 08:11:18 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c])
	by R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c%22])
	with mapi id 15.00.1178.000; Thu, 28 Jul 2016 08:11:18 +0100
From: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] Building for armv7athf-neon but toolchain is softfp
Thread-Index: AQHR5B58h/TNj18cYUuHrBoFZFSdxKAkbLqAgAS04oCAAAM7gIABRI6AgAGYNoCAACVjAIAAND6AgAEJYwA=
Date: Thu, 28 Jul 2016 07:11:17 +0000
Message-ID: <1469689696.6948.1.camel@ts.fujitsu.com>
References: <1469194596.6594.13.camel@ts.fujitsu.com>
	<CAMKF1srBan-tupS7qGb3kDnAn-2-u8dox3vFk5ssGwQLzeGaHw@mail.gmail.com>
	<1469455403.6896.29.camel@ts.fujitsu.com>
	<CAMKF1soyDLFePf+JqwQeyqCeig=CeZqHADwJJ7yZ=Nz9PcW0Hg@mail.gmail.com>
	<1469525795.6937.1.camel@ts.fujitsu.com>
	<AA7383CF-888C-4605-97BB-BB016A5EB450@gmail.com>
	<1469621486.18503.9.camel@ts.fujitsu.com>
	<0AFF0F4F-BAA0-43F7-ABE3-32ABEC5D924C@gmail.com>
In-Reply-To: <0AFF0F4F-BAA0-43F7-ABE3-32ABEC5D924C@gmail.com>
Reply-To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Accept-Language: de-DE, en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu4 
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
X-List-Received-Date: Thu, 28 Jul 2016 07:11:36 -0000
X-Groupsio-MsgNum: 85041
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature";
	boundary="=-XlrEU9TcsisFrOwcsOBR"

--=-XlrEU9TcsisFrOwcsOBR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mi, 2016-07-27 at 08:18 -0700, Khem Raj wrote:
> >=20
> > On Jul 27, 2016, at 5:14 AM, thilo.cestonaro@ts.fujitsu.com wrote:
> >=20
> > Hey Khem,
> >=20
> > I figured, when I do the compile in 2 steps, so compile then link and c=
hange the link command to use the ubuntu arm-linux-gnueabihf-gcc instead of=
 the gcc from the sdk, the binary is useable.
> this could be a gnu_hash issue then. Can you add -Wl,--hash-style=3Dgnu t=
o compiler cmd when linking using OE SDK
>=20
No success :( ... I tested it, altough it was already included in LDFLAGS f=
rom sdk env. Added it the the compile command and the link command. Doesn't=
 change anything :(.
Any other idea?

Cheers,
Thilo

--=-XlrEU9TcsisFrOwcsOBR
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
hvcNAQkFMQ8XDTE2MDcyODA3MDgxNlowIwYJKoZIhvcNAQkEMRYEFMX5v0wUKyT1+oXd6HVXRGay
g6hBMEwGCSsGAQQBgjcQBDE/MD0wLzEtMCsGA1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0
aW9ucyBVc2VyIENBAgollJSAAAAAAiR9ME4GCyqGSIb3DQEJEAILMT+gPTAvMS0wKwYDVQQDEyRG
dWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zIFVzZXIgQ0ECCiWUlIAAAAACJH0wDQYJKoZIhvcN
AQEBBQAEgYA1MOgc5UAEG+Vus0JhOITiMZW0drW9pXiXylewnLJ4B9ISrUgJAmVi8VI+pfCtIs7N
uhGhn4n8+nqt+21y281fGM7VNJIerB80oJrsDPsVRo687xPFBUVON/G0ny32w1/xViKKKWBDA4uj
qEllc/oviBf9bWGT/wNsfY+19/xtdgAAAAAAAA==

--=-XlrEU9TcsisFrOwcsOBR--
