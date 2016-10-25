Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from mail1.bemta5.messagelabs.com (mail1.bemta5.messagelabs.com
	[195.245.231.145])
	by mail.openembedded.org (Postfix) with ESMTP id 739A7607A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 11:03:40 +0000 (UTC)
Received: from [85.158.136.83] by server-9.bemta-5.messagelabs.com id
	4C/B9-18451-C0C3F085; Tue, 25 Oct 2016 11:03:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDKsWRWlGSWpSXmKPExsViZ8MxRZfbhj/
	C4PhKeYtznTOZLO78fMfuwOSxeM9LJo9zG1cwBjBFsWbmJeVXJLBmXG57w1jQr1NxdaJwA+NS
	7S5GLg4hgVYmiTl/vrFAOMcYJU6e3ccK4VxklHi27xx7FyMnB5uAu8TWe/eZQGwRAUuJu2u2M
	4PYzAJREpNmv2IBsYUF/CRubnjPDFETILHx1k12CNtKYuazJlYQm0VAVWLa9nNg9bwCphIPfr
	aAzRQSqJFY3nsIrIZTIFDixM1rjBBxb4nTH2eDzWQUUJHYdXcLI8RecYlbT+aD9UoIiEg8vHi
	aDcIWlXj5+B8rhK0i8XJmM5StI3H2+hNGCNtAYuvSfSwQtqLEi5bPUL9USXxbcY4V4jZBiZMz
	n7BMYJSYhWTdLCRls5CUQcQ1JVq3/2aHsLUlli18zQxh20rsv7oSyjaVeH30IyOErSgxpfsh+
	wJGjlWM6sWpRWWpRbpGeklFmekZJbmJmTm6hgamermpxcWJ6ak5iUnFesn5uZsYgbHOAAQ7GL
	//cTrEKMnBpCTK2/iZL0KILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO8HK/4IIcGi1PTUirTMHGD
	SgUlLcPAoifDuBEnzFhck5hZnpkOkTjEqSonzslgDJQRAEhmleXBtsER3iVFWSpiXEegQIZ6C
	1KLczBJU+VeM4hyMSsK8h0HG82TmlcBNfwW0mAlosWA8D8jikkSElFQD45bgV+6hx3k4l6Xrv
	rKtX7V8i7BkhOGGWbueM0xgPZ3y4DoTi1t+wyazhpjHWvcEt3XXaX55Mc/YRObv2TNXZBMXCM
	2ZyPbve77+kecKH840CyTGrprQMU1ugiOzZv6jb61XFQWzFjF3PA2XPiC7ZWb6wgT19klcvJ9
	+S98s5DG3f6Lgbj/bR4mlOCPRUIu5qDgRAEtKJqxvAwAA
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-14.tower-36.messagelabs.com!1477393419!64279592!1
X-Originating-IP: [62.60.8.148]
X-StarScan-Received: 
X-StarScan-Version: 9.0.13; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16415 invoked from network); 25 Oct 2016 11:03:39 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
	by server-14.tower-36.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 25 Oct 2016 11:03:39 -0000
Received: from R01UKEXCASM125.r01.fujitsu.local (ex2k13_125.fs.fujitsu.com
	[10.183.43.177])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	u9PB3F1S030754
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 25 Oct 2016 12:03:15 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) by
	R01UKEXCASM125.r01.fujitsu.local (10.183.43.177) with Microsoft SMTP
	Server (TLS) id 15.0.1178.4; Tue, 25 Oct 2016 12:03:28 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c])
	by R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c%22])
	with mapi id 15.00.1178.000; Tue, 25 Oct 2016 12:03:28 +0100
From: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
To: "jussi.kukkonen@intel.com" <jussi.kukkonen@intel.com>
Thread-Topic: [OE-core] Howto find the providing recipe for a specific package?
Thread-Index: AQHSLqKlCBV/HiX230uCkasUP6n2V6C4344AgAARPIA=
Date: Tue, 25 Oct 2016 11:03:28 +0000
Message-ID: <1477393407.20929.2.camel@ts.fujitsu.com>
References: <1477387924.20929.1.camel@ts.fujitsu.com>
	<CAHiDW_HLiPEOXC6FgaenUr1s0sByoG6Zn1X-u6Q2D439A8rOXg@mail.gmail.com>
In-Reply-To: <CAHiDW_HLiPEOXC6FgaenUr1s0sByoG6Zn1X-u6Q2D439A8rOXg@mail.gmail.com>
Reply-To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Accept-Language: de-DE, en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.22.1-0ubuntu2 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.183.43.206]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Howto find the providing recipe for a specific package?
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
X-List-Received-Date: Tue, 25 Oct 2016 11:03:41 -0000
X-Groupsio-MsgNum: 88577
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature";
	boundary="=-9aH/ap5e1y9Tv+fPhDaL"

--=-9aH/ap5e1y9Tv+fPhDaL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


> $ oe-pkgdata-util lookup-recipe kernel-module-xfrm6-mode-transport
>=20
Thanks! That is what I was looking for!

Cheers,
Thilo

--=-9aH/ap5e1y9Tv+fPhDaL
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
hvcNAQkFMQ8XDTE2MTAyNTExMDMyN1owIwYJKoZIhvcNAQkEMRYEFLuDfxiJyfdYFfVPfBlclxY0
vTqGMEwGCSsGAQQBgjcQBDE/MD0wLzEtMCsGA1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5IFNvbHV0
aW9ucyBVc2VyIENBAgollJSAAAAAAiR9ME4GCyqGSIb3DQEJEAILMT+gPTAvMS0wKwYDVQQDEyRG
dWppdHN1IFRlY2hub2xvZ3kgU29sdXRpb25zIFVzZXIgQ0ECCiWUlIAAAAACJH0wDQYJKoZIhvcN
AQEBBQAEgYByKpMd6grlQZh59niOTRxiaE2MJFgWuCEFCFPg+Cjc3pXXB1iNSNRn/5g0gSguijz8
vZWIB2c7VHU8WjjVSD5wPPAg2cp0MG5AaJ/4aE4vtrrcHd3aJnXoY1UCa+DYYHAnjp+8D01LGTMQ
wF5w3XpbhaeNpjnCcZoxyvZ5Bf9AhgAAAAAAAA==

--=-9aH/ap5e1y9Tv+fPhDaL--
