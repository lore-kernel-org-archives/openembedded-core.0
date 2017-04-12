Return-Path: <thilo.cestonaro@ts.fujitsu.com>
X-Greylist: delayed 403 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Apr 2017 13:54:42 UTC
Received: from mail1.bemta6.messagelabs.com (mail1.bemta6.messagelabs.com
	[193.109.254.113])
	by mail.openembedded.org (Postfix) with ESMTP id C1C1171BEE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 13:54:42 +0000 (UTC)
Received: from [193.109.254.3] by server-9.bemta-6.messagelabs.com id
	64/90-03420-F003EE85; Wed, 12 Apr 2017 13:47:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRWlGSWpSXmKPExsViZ8MxRZfP4F2
	EwbwdZhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8al0x3sBRuMKy5MusDewHjJsIuRi0NIYAuT
	xI1DbawQzjFGiVsHrkA5FxklDv5+xdLFyMnBJuAusfXefSYQW0QgSuLmrmfsXYwcHMIC+hIv1
	wRBhE0k7m57ygph60m8OnobzGYRUJWY9H8zmM0LVLNgF0SNkIC3xOmPs5lBbEYBFYldd7cwgt
	jMAuISt57MB1slISAi8fDiaTYIW1Ti5eN/rBC2isTznQsYIWwdibPXn0DZBhJbl+5jgbAVJV6
	0fGaGmFklse7be0aIGwQlTs58wjKBUXQWknWzkJTNQlIGEdeUaN3+mx3C1pZYtvA1M4RtK7H/
	6koo21Ti9dGPjBC2osSU7ofsCxg5VjGqF6cWlaUW6RrqJRVlpmeU5CZm5ugaGpjp5aYWFyemp
	+YkJhXrJefnbmIExiMDEOxg3Pnc6RCjJAeTkijvZYW3EUJ8SfkplRmJxRnxRaU5qcWHGGU4OJ
	QkeDfqvYsQEixKTU+tSMvMASYGmLQEB4+SCK+QPlCat7ggMbc4Mx0idYpRUUqcdz9InwBIIqM
	0D64NlowuMcpKCfMyAh0ixFOQWpSbWYIq/4pRnINRSZhXDWQ8T2ZeCdz0V0CLmYAWr937FmRx
	SSJCSqqB0S155nX2zrR/YtG5tYw73ta8sxdw+VWX7LeC8dCSTxLHIluZ6zcFq61piP4TL6hdp
	9916I6P23O/Cr8l+1bpywu2z4t5OP3O9eUZ1sf6Jpo98eyeI+Q4ZVLdl+93Lk38dS6ZWX2Wx3
	M17yLX0ifLLk7mnPBw4/R3hyOMqs79Nu85GLEtr+6bghJLcUaioRZzUXEiALPOoMFBAwAA
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-15.tower-184.messagelabs.com!1492004878!110044300!1
X-Originating-IP: [62.60.8.148]
X-StarScan-Received: 
X-StarScan-Version: 9.4.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22571 invoked from network); 12 Apr 2017 13:47:58 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
	by server-15.tower-184.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 12 Apr 2017 13:47:58 -0000
Received: from R01UKEXCASM123.r01.fujitsu.local (ex2k13_123.fs.fujitsu.com
	[10.183.43.175])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	v3CDlD5R022296
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 14:47:13 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) by
	R01UKEXCASM123.r01.fujitsu.local (10.183.43.175) with Microsoft SMTP
	Server (TLS) id 15.0.1263.5; Wed, 12 Apr 2017 14:47:58 +0100
Received: from R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c])
	by R01UKEXCASM121.r01.fujitsu.local ([fe80::48eb:6503:a1bb:c29c%22])
	with mapi id 15.00.1263.000; Wed, 12 Apr 2017 14:47:58 +0100
From: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Using boost-program-options and native
Thread-Index: AQHSs5NkEE3odvezyk6hi2hDkT5kJQ==
Date: Wed, 12 Apr 2017 13:47:57 +0000
Message-ID: <1492004877.5507.2.camel@ts.fujitsu.com>
Reply-To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Accept-Language: de-DE, en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.22.6-1ubuntu1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.183.43.206]
MIME-Version: 1.0
Subject: Using boost-program-options and native
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
X-List-Received-Date: Wed, 12 Apr 2017 13:54:43 -0000
X-Groupsio-MsgNum: 96207
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature";
	boundary="=-EtgijxnXVp2tSsBeoK43"

--=-EtgijxnXVp2tSsBeoK43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey all!

I want to build a tool which makes use of boost-program-options lib. As lon=
g as I compile for the target, all is fine, but when I add
> BBCLASSEXTEND +=3D "native"
to my recipe, I a bitbake error "Nothing Provides" ... :(

> ERROR: Required build target 'mytool-native' has no buildable providers.
> Missing or unbuildable dependency chain was: ['mytool-native', 'boost-pro=
gram-options-native']

In the recipe I just depend on boost and RDEPEND on boost-program-options:
> DEPENDS =3D "boost"
> RDEPENDS_${PN} =3D "boost-program-options"

Is something wrong with this? Why is there a package boost-program-options =
but no boost-program-options-native, altough boost-native exists and the li=
bboost-program-options.so is installed into the
native sysroot. (I can compile flawlessly without the RDEPENDS line.)

Any hints?

Cheers,
Thilo

--=-EtgijxnXVp2tSsBeoK43
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
AhoFAKCB+zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xNzA0MTIx
MzQ3NTdaMCMGCSqGSIb3DQEJBDEWBBQ1mq+GN8UmPFa/jXp1sWem6H7rSzBMBgkrBgEEAYI3EAQx
PzA9MC8xLTArBgNVBAMTJEZ1aml0c3UgVGVjaG5vbG9neSBTb2x1dGlvbnMgVXNlciBDQQIKJNBq
bAAAAAJP9zBOBgsqhkiG9w0BCRACCzE/oD0wLzEtMCsGA1UEAxMkRnVqaXRzdSBUZWNobm9sb2d5
IFNvbHV0aW9ucyBVc2VyIENBAgok0GpsAAAAAk/3MA0GCSqGSIb3DQEBAQUABIGAzTNw6+BGH2Sk
Lt4DcVmKjb5DVYCl+PZtLjHQ3cGAClvyaE3bMarpUxd9NPt+Xh8EoLrFHlT0LY4iRm+4j2BaGXD8
OnQ4thgiLhFr5dKGgGJj0x3e8qT2HTrug3IDf1dDLA0G2IKdBMlJWBnY8LkityFHG2Ny8Su+4mfT
+wO9cfYAAAAAAAA=

--=-EtgijxnXVp2tSsBeoK43--
